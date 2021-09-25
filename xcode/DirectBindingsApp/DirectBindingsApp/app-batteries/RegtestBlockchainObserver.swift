//
// Created by Arik Sosman on 5/28/20.
// Copyright (c) 2020 Arik Sosman. All rights reserved.
//

import Foundation
import PromiseKit

struct BlockInfo {
    var height: UInt
    var hash: String
    var previousHash: String?
    var rawData: Data?
    var header: Data?
}

struct ReorgPath {
    var orphanChain: Block? // 1) disconnect from tail (typically empty)
    var newChain: Block // 2) connect from head (typically just one block)
}

class Block {
    var info: BlockInfo
    var previous: Block?
    var next: Block?
    
    class func hexStringToBytes(hexString: String) -> [UInt8]? {
        let hexStr = hexString.dropFirst(hexString.hasPrefix("0x") ? 2 : 0)

        guard hexStr.count % 2 == 0 else { return nil }

        var newData = [UInt8]()

        var indexIsEven = true
        for i in hexStr.indices {
            if indexIsEven {
                let byteRange = i...hexStr.index(after: i)
                guard let byte = UInt8(hexStr[byteRange], radix: 16) else { return nil }
                newData.append(byte)
            }
            indexIsEven.toggle()
        }
        return newData
    }
    
    class func bytesToHexString(bytes: [UInt8]) -> String {
        let format = "%02hhx" // "%02hhX" (uppercase)
        return bytes.map { String(format: format, $0) }.joined()
    }

    init(info: BlockInfo, previous: Block?, next: Block?) {
        self.info = info
        self.previous = previous
        self.next = next
    }

    enum SequencingError: Error {
        case appendixHasPrevious
        case prependixHasNext
    }

    func insertAfter(newNext: Block) throws -> Block {
        if (newNext.previous != nil) {
            throw SequencingError.appendixHasPrevious
        }
        if let oldNext = self.next {
            newNext.next = oldNext
            oldNext.previous = newNext
        }
        newNext.previous = self
        self.next = newNext
        return newNext
    }

    func insertBefore(newPrevious: Block) throws -> Block {
        if (newPrevious.next != nil) {
            throw SequencingError.prependixHasNext
        }
        if let oldPrevious = self.previous {
            newPrevious.previous = oldPrevious
            oldPrevious.next = newPrevious
        }
        newPrevious.next = self
        self.previous = newPrevious
        return newPrevious
    }

    func earliestBlock() -> Block {
        guard let previous = self.previous else {
            return self
        }
        return previous.earliestBlock()
    }

    func latestBlock() -> Block {
        guard let next = self.next else {
            return self
        }
        return next.latestBlock()
    }

    func seekBlockHashBackwards(hash: String) -> Bool {
        if (self.info.hash == hash) {
            return true
        }
        guard let previous = self.previous else {
            return false
        }
        return previous.seekBlockHashBackwards(hash: hash)
    }

    func getOrphanChain(lastKeptHash: String, trailingChain: Block?) -> Block? {
        if (self.info.hash == lastKeptHash) {
            if let chain = trailingChain {
                chain.previous = self
            }
            return trailingChain
        }

        let chain = Block(info: self.info, previous: nil, next: trailingChain)
        trailingChain?.previous = chain // double-link it

        return self.previous!.getOrphanChain(lastKeptHash: lastKeptHash, trailingChain: chain)
    }

    func toChainString(trailingInfo: String?) -> String {
        var currentInfo = "\(self.info.height): \(self.info.hash)"
        if let trailingInfo = trailingInfo {
            currentInfo = "\(trailingInfo)\n↘️ \(currentInfo)"
        }
        if let previous = self.previous {
            return previous.toChainString(trailingInfo: currentInfo)
        }
        return currentInfo
    };

    // Insert
    func reconcile(newChain: Block) -> ReorgPath {
        if (self.next != nil) {
            return self.latestBlock().reconcile(newChain: newChain)
        }
        if (newChain.previous != nil) {
            return self.reconcile(newChain: newChain.earliestBlock())
        }
        // gotta make sure reconciliation is tip against head
        let orphanChain = self.getOrphanChain(lastKeptHash: newChain.info.previousHash!, trailingChain: nil)
        if let chain = orphanChain {
            let anchor = chain.previous!
            chain.previous = nil // cut off the orphan chain
            anchor.next = nil // cut off the anchor
            try! anchor.insertAfter(newNext: newChain)
        } else {
            try! self.insertAfter(newNext: newChain)
        }
        return ReorgPath(orphanChain: orphanChain, newChain: newChain)
    }
}

class RegtestBlockchainObserver {

    private var earliestBlockHeight: UInt? = nil
    private var latestBlockHeight: UInt = 0
    private var chainTip: Block?
    public var listeners: [Listen];
    private var syncComplete: (() -> Void)?;

    init(listeners: [Listen], chainTip: Block?, syncComplete: (() -> Void)?) {

        self.listeners = listeners
        
        
        // let chainMonitor = LDKChainWatchInterface()
        // let blockNotifier = BlockNotifier_new(T##chain_monitor: LDKChainWatchInterface##LDKChainWatchInterface)
        // self.earliestBlockHeight = earliestKnownHeight
        
        
        self.chainTip = chainTip
        self.earliestBlockHeight = self.chainTip?.info.height
        self.syncComplete = syncComplete
    }
    
    var chainTipHash: [UInt8] {
        get {
            return Block.hexStringToBytes(hexString: self.chainTip!.info.hash)!
        }
    }
    
    var chainTipHeight: UInt32 {
        get {
            return UInt32(self.chainTip!.info.height)
        }
    }

    enum MonitoringError: Error {
        case invalidJSON
        case invalidHeight
        case invalidHash
        case startHashTooEarly
        case badHTTPResponseStatus
        case badHTTPResponseType
        case missingBinary
    }

    
    
    func getLatestBlockInfo() -> Promise<BlockInfo> {
        firstly {
            getChainInfo()
        }.then { chainInfo in
            when(fulfilled: self.getBlockInfo(blockHash: chainInfo.hash), self.getBlockBinary(blockHash: chainInfo.hash))
        }.map { (blockInfo: BlockInfo, blockData: Data) in
            var richBlockInfo = blockInfo
            richBlockInfo.rawData = blockData
            richBlockInfo.header = blockData.subdata(in: 4..<84)
            let headerHex = Block.bytesToHexString(bytes: [UInt8](richBlockInfo.header!))
            return richBlockInfo
        }
    }

    func getChainInfo() -> Promise<BlockInfo> {
        // let url = "http://cloudflare.testnet.deanonymizingseed.com/rest/chaininfo.json"
        let urlString = "http://localhost:3000/api/lab/chaininfo"
        let infoPromise = Promise { (resolver: Resolver<BlockInfo>) in
            let url = URL(string: urlString)!
            let session = URLSession.shared
            let task = session.dataTask(with: url, completionHandler: { data, response, error in
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    return resolver.reject(MonitoringError.badHTTPResponseStatus)
                }
                guard let mime = httpResponse.mimeType, mime == "application/json" else {
                    return resolver.reject(MonitoringError.badHTTPResponseType)
                }
                guard let json = try? JSONSerialization.jsonObject(with: data!, options: []) else {
                    return resolver.reject(MonitoringError.invalidJSON)
                }
                guard let chainInfo = json as? [String: Any] else {
                    return resolver.reject(MonitoringError.invalidJSON)
                }
                guard let height = chainInfo["blocks"] as? UInt else {
                    return resolver.reject(MonitoringError.invalidHeight)
                }
                guard let hash = chainInfo["bestblockhash"] as? String else {
                    return resolver.reject(MonitoringError.invalidHash)
                }
                resolver.fulfill(BlockInfo(height: height, hash: hash))
            })
            task.resume()
        }
        return infoPromise
    }

    func getBlockInfo(blockHash: String) -> Promise<BlockInfo> {
        // let url = "http://cloudflare.testnet.deanonymizingseed.com/rest/block/\(blockHash).json"
        let urlString = "http://localhost:3000/api/lab/block/\(blockHash)/info"
        let infoPromise = Promise { (resolver: Resolver<BlockInfo>) in
            let url = URL(string: urlString)!
            let session = URLSession.shared
            let task = session.dataTask(with: url, completionHandler: { data, response, error in
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    return resolver.reject(MonitoringError.badHTTPResponseStatus)
                }
                guard let mime = httpResponse.mimeType, mime == "application/json" else {
                    return resolver.reject(MonitoringError.badHTTPResponseType)
                }
                guard let json = try? JSONSerialization.jsonObject(with: data!, options: []) else {
                    return resolver.reject(MonitoringError.invalidJSON)
                }
                guard let chainInfo = json as? [String: Any] else {
                    return resolver.reject(MonitoringError.invalidJSON)
                }
                guard let height = chainInfo["height"] as? UInt else {
                    return resolver.reject(MonitoringError.invalidHeight)
                }
                guard let previousHash = chainInfo["previousblockhash"] as? String else {
                    return resolver.reject(MonitoringError.invalidHash)
                }
                resolver.fulfill(BlockInfo(height: height, hash: blockHash, previousHash: previousHash))
            })
            task.resume()
        }
        return infoPromise
    }

    // fetches a sequence of blocks starting at the given hash, working its way backwards until a known previous block hash
    func getBlockSequenceUntilKnown(startHash: String, trailingChain: Block?) -> Promise<Block> {
        firstly {
            when(fulfilled: self.getBlockInfo(blockHash: startHash), self.getBlockBinary(blockHash: startHash))
        }.then { (blockInfo: BlockInfo, blockData: Data) -> Promise<Block> in
            if (blockInfo.height < self.earliestBlockHeight! + 1) {
                // we need to be able to keep the first block we started out with
                // TODO: fix this such that the first block, too, can be reorged
                throw MonitoringError.startHashTooEarly
            }

            var richBlock = blockInfo
            richBlock.rawData = blockData
            richBlock.header = blockData.subdata(in: 4..<84)

            let chain = Block(info: richBlock, previous: nil, next: trailingChain)
            let isPreviousKnown = self.chainTip!.seekBlockHashBackwards(hash: richBlock.previousHash!)

            if isPreviousKnown {
                return Promise.value(chain)
            } else {
                return self.getBlockSequenceUntilKnown(startHash: richBlock.previousHash!, trailingChain: chain)
            }
        }
    }

    func getBlockBinary(blockHash: String) -> Promise<Data> {
        // let url = "http://cloudflare.testnet.deanonymizingseed.com/rest/block/\(blockHash).bin"
        let urlString = "http://localhost:3000/api/lab/block/\(blockHash)/bin"
        let binaryPromise = Promise { (resolver: Resolver<Data>) in
            let url = URL(string: urlString)!
            let session = URLSession.shared
            let task = session.dataTask(with: url, completionHandler: { data, response, error in
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    return resolver.reject(MonitoringError.badHTTPResponseStatus)
                }
                guard let mime = httpResponse.mimeType, mime == "application/octet-stream" else {
                    return resolver.reject(MonitoringError.badHTTPResponseType)
                }
                guard let blockData = data else {
                    return resolver.reject(MonitoringError.missingBinary)
                }
                resolver.fulfill(blockData)
            })
            task.resume()
        }
        return binaryPromise
    }

    func monitor() {
        let backgroundQueue = DispatchQueue.global(qos: .background);
        firstly {
            getLatestBlockInfo()
        }.then { blockInfo in
            self.reconcileBlock(blockInfo: blockInfo)
        }.then(on: backgroundQueue) {
            after(seconds: 5) // wait half a minute
        }.done {
            self.monitor()
        }
    }

    func reconcileBlock(blockInfo: BlockInfo) -> Promise<Void> {
        //print(blockInfo.rawData)

        guard let chainTip = self.chainTip else {
            self.chainTip = Block(info: blockInfo, previous: nil, next: nil)
            self.earliestBlockHeight = self.earliestBlockHeight ?? blockInfo.height
            self.latestBlockHeight = blockInfo.height
            if self.earliestBlockHeight == self.latestBlockHeight {
                for listener in self.listeners {
                    // listener.connectBlock(block: blockInfo)
                    listener.block_connected(block: [UInt8](blockInfo.rawData!), height: UInt32(blockInfo.height))
                }
            }
            print("Fast-forwarded to chain tip: \(self.chainTip!.toChainString(trailingInfo: nil))\n")
            if let completionHandler = self.syncComplete {
                self.syncComplete = nil
                completionHandler()
            }
            return Promise.value(())
        }

        if (blockInfo.hash == chainTip.info.hash) {
            print("Already at chain tip: \(self.chainTip!.toChainString(trailingInfo: nil))\n")
            if let completionHandler = self.syncComplete {
                self.syncComplete = nil
                completionHandler()
            }
            return Promise.value(()) // nothing to do here
        }

        print("\nReconciling block! \nBlock height: \(blockInfo.height) \nHash: \(blockInfo.hash) \nPrevious hash: \(blockInfo.previousHash)")
        return firstly {
            self.getBlockSequenceUntilKnown(startHash: blockInfo.hash, trailingChain: nil)
        }.map { newBlockSequence in
            print("New block sequence: \(newBlockSequence.toChainString(trailingInfo: nil))\n")
            let reorgPath = chainTip.reconcile(newChain: newBlockSequence)
            if let orphans = reorgPath.orphanChain {
                print("Orphaned: \(orphans.latestBlock().toChainString(trailingInfo: nil))\n")
            }
            if let orphans = reorgPath.orphanChain {
                var currentOrphan: Block? = orphans.latestBlock();
                while (currentOrphan != nil) {
                    // listener.disconnectBlock(block: currentOrphan!.info)
                    // listener.block_disconnected(header: currentOrphan!.info.hash, height: <#T##UInt32#>)
                    currentOrphan = currentOrphan!.previous
                }
            }
            var currentAddition: Block? = reorgPath.newChain;
            while (currentAddition != nil) {
                for listener in self.listeners {
                    // listener.connectBlock(block: currentAddition!.info)
                    listener.block_connected(block: [UInt8](currentAddition!.info.rawData!), height: UInt32(currentAddition!.info.height))
                }
                currentAddition = currentAddition!.next
            }
            
            self.chainTip = reorgPath.newChain.latestBlock() // set chain tip to the latest block in the new chain
            
            let defaults = UserDefaults.standard
            defaults.set(self.chainTip!.info.hash, forKey: "chainTipHash")
            defaults.set(self.chainTip!.info.height, forKey: "chainTipHeight")
            
            print("Updated chain path: \(self.chainTip!.toChainString(trailingInfo: nil))\n")
            if let completionHandler = self.syncComplete {
                self.syncComplete = nil
                completionHandler()
            }
        }
    }
    
    

}
