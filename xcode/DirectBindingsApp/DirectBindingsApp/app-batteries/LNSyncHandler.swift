import Foundation

import PromiseKit

class LNSyncHandler: ObservableObject {
    
    @Published internal var syncState = LNSyncState.idle
    
    var network: NetworkGraph!
    
    enum LNSyncError: Error {
        case badHTTPResponseStatus
        case badHTTPResponseType
        case missingBinary
        case prefixParseError
        case versionParseError
        case messageParseError(DecodeError)
        case tlvParseError
    }
    
    public enum LNSyncState: String {
        case idle = "idle"
        case downloading = "downloading"
        case parsing = "parsing"
        case updating = "updating"
    }
    
    enum GossipMessage {
        case channelAnnouncement(ChannelAnnouncement)
        case siglessChannelAnnouncement(UnsignedChannelAnnouncement)
        case nodeAnnouncement(NodeAnnouncement)
        case siglessNodeAnnouncement(UnsignedNodeAnnouncement)
        case channelUpdate(ChannelUpdate)
        case siglessChannelUpdate(UnsignedChannelUpdate)
    }
    
    init(networkGraph: NetworkGraph? = nil) {
        if let network = networkGraph {
            self.network = network
        } else {
            self.network = NetworkGraph(genesis_hash: [111, 226, 140, 10, 182, 241, 179, 114, 193, 166, 162, 70, 174, 99, 247, 79, 147, 30, 131, 101, 225, 90, 8, 156, 104, 214, 25, 0, 0, 0, 0, 0], logger: Logger())
        }
    }
    
    func updateAndPrintNetworkGraph() {
        
//        let timeInterval = TimeInterval(-15 * 60) // negative fifteen minutes
        let timeInterval = TimeInterval(-2 * 3600) // negative two hours
//        let timeInterval = TimeInterval(-24 * 3600) // negative 24  hours
        
        firstly {
            return self.downloadRawLNSyncData(timeInterval: timeInterval, ignoreCache: true, storeToCache: false)
        }.done { syncData in
            let networkSerialization = self.network.write()
            let byteCountFormatter = ByteCountFormatter()
            print("initial network graph serialization: \(byteCountFormatter.string(fromByteCount: Int64(networkSerialization.count)))")
            print("gossip data: \(byteCountFormatter.string(fromByteCount: Int64(syncData.count)))")
            
            let gossipMessages = try! self.parseSyncData(data: syncData)
            print("fast-forwarding through \(gossipMessages.count) gossip messages")
            
            DispatchQueue.main.async {
                self.syncState = .updating
                self.objectWillChange.send()
            }
            
            var errorCount = 0
            
            for currentMessage in gossipMessages {
                
                var updateResult: Result_NoneLightningErrorZ!
                
                switch currentMessage {
                case let .siglessChannelAnnouncement(channelAnnouncement):
                    updateResult = self.network.update_channel_from_unsigned_announcement(msg: channelAnnouncement, chain_access: Option_AccessZ.none())
                    // print("channel announcement")
                case let .siglessNodeAnnouncement(nodeAnnouncement):
                    updateResult = self.network.update_node_from_unsigned_announcement(msg: nodeAnnouncement)
                    // print("node announcement")
                case let .siglessChannelUpdate(channelUpdate):
                    updateResult = self.network.update_channel_unsigned(msg: channelUpdate)
                    // print("channel update")
                default:
                    print("we ignore signatures")
                    continue
                }
                
                if let lightningError = updateResult.getError() {
                    errorCount += 1
                    print("update error: \(lightningError.get_err())")
                }else{
                    // print("success")
                }
            }
            
            print("completed fast-forward with \(errorCount) errors")
            
            let cachedNetworkGraph = self.network.write()
            let defaults = UserDefaults.standard
            defaults.setValue(cachedNetworkGraph, forKey: "cachedNetworkGraph")
            
            self.syncState = .idle
            self.objectWillChange.send()
            
            print("updated network graph serialization: \(byteCountFormatter.string(fromByteCount: Int64(cachedNetworkGraph.count)))")
        }
        
        print("sync complete")
        
    }
    
    func parseSyncData(data: Data) throws -> [GossipMessage] {
        
        DispatchQueue.main.async {
            self.syncState = .parsing
            self.objectWillChange.send()
        }
        
        let syncBytes = [UInt8](data)
        let referencePrefix: [UInt8] = Array("GSP".utf8)
        let arikPrefix: [UInt8] = Array("LDK".utf8)
        
        var isPreStripped = false
        
        guard syncBytes.starts(with: referencePrefix) || syncBytes.starts(with: arikPrefix) else {
            throw LNSyncError.prefixParseError
        }
        
        let versionByte: UInt8 = syncBytes[3]
        guard syncBytes[3] == 1 || versionByte == 2 else { throw LNSyncError.versionParseError }
        
        if syncBytes.starts(with: arikPrefix) && versionByte == 2 {
            isPreStripped = true
        }
        
        var relevantBytes = syncBytes
        relevantBytes.removeSubrange(0...3)
        
        var messages = [GossipMessage]()
        
        var i = 0
        while i < relevantBytes.count {
            
            let currentByte = relevantBytes[i]
            
            var messageLength = UInt(currentByte)
            var messageStartIndex = i+1
            
            if currentByte > 252 {
                var sizeLength = 0
                if currentByte == 253 {
                    sizeLength = 2
                } else if currentByte == 254 {
                    sizeLength = 4
                } else if currentByte == 255 {
                    sizeLength = 8
                }
                let sizeBytes: [UInt8] = Array(relevantBytes[i+1 ... i+sizeLength])
                messageLength = 0
                messageStartIndex += sizeLength
                for currentSizeByte in sizeBytes {
                    messageLength = messageLength << 8
                    messageLength += UInt(currentSizeByte)
                }
            }
            
            let messageEndIndex = messageStartIndex + Int(messageLength)
            let currentMessage: [UInt8] = Array(relevantBytes[messageStartIndex..<messageEndIndex])
            i = messageEndIndex
            if i > relevantBytes.count {
                throw LNSyncError.tlvParseError
            }
                    
            let currentMessageType = UInt(currentMessage[0]) << 8 + UInt(currentMessage[1])
            
            let extractedMessage: [UInt8] = Array(currentMessage[2...])
            
            if currentMessageType == 256 {
                var strippedChannelAnnouncementBytes = extractedMessage
                if !isPreStripped {
                    strippedChannelAnnouncementBytes = Array(extractedMessage[(64*4)...])
                }
                let channelAnnouncementParseResult = UnsignedChannelAnnouncement.read(ser: strippedChannelAnnouncementBytes)
                if let channelAnnouncement = channelAnnouncementParseResult.getValue() {
                    messages.append(GossipMessage.siglessChannelAnnouncement(channelAnnouncement))
                } else {
                    print("parse fail: channel announcement, \(currentMessage.count) bytes")
                    let decodeError = channelAnnouncementParseResult.getError()
                    throw LNSyncError.messageParseError(decodeError!)
                }
            } else if currentMessageType == 257 {
                var strippedNodeAnnouncementBytes = extractedMessage
                if !isPreStripped{
                    strippedNodeAnnouncementBytes = Array(extractedMessage[(64)...])
                }
                let nodeAnnouncementParseResult = UnsignedNodeAnnouncement.read(ser: strippedNodeAnnouncementBytes)
                if let nodeAnnouncement = nodeAnnouncementParseResult.getValue() {
                    messages.append(GossipMessage.siglessNodeAnnouncement(nodeAnnouncement))
                } else {
                    print("parse fail: node announcement, \(currentMessage.count) bytes")
                    let decodeError = nodeAnnouncementParseResult.getError()
                    throw LNSyncError.messageParseError(decodeError!)
                }
            } else if currentMessageType == 258 {
                var strippedChannelUpdateBytes = extractedMessage
                if !isPreStripped {
                    strippedChannelUpdateBytes = Array(extractedMessage[(64)...])
                }
                let channelUpdateParseResult = UnsignedChannelUpdate.read(ser: strippedChannelUpdateBytes)
                if let channelUpdate = channelUpdateParseResult.getValue() {
                    messages.append(GossipMessage.siglessChannelUpdate(channelUpdate))
                } else {
                    print("parse fail: channel update, \(currentMessage.count) bytes")
                    let decodeError = channelUpdateParseResult.getError()
                    throw LNSyncError.messageParseError(decodeError!)
                }
            }
                    
        }
        
        // print("parsing sanity: \(parseResultIsSane)")
        return messages
        
    }
    
    func downloadRawLNSyncData(timeInterval: TimeInterval, ignoreCache: Bool = false, storeToCache: Bool = true) -> Promise<Data> {
        
        DispatchQueue.main.async {
            self.syncState = .downloading
            self.objectWillChange.send()
        }
        
        let currentTime = NSDate()
        let referenceTime = currentTime.addingTimeInterval(timeInterval)
        let referenceTimestamp = UInt(referenceTime.timeIntervalSince1970.rounded())
        print("currentTime (\(currentTime.timeIntervalSince1970)) - delta (\(timeInterval)) = reference (\(referenceTimestamp))")
        
        let userDefaults = UserDefaults.standard
        
        let absoluteInterval = UInt(abs(timeInterval.rounded()))
        
        let urlString = "https://lnsync.blockstream.com/gossip/delta/\(referenceTimestamp)"
        let localUrlString = "http://localhost:3000/since/\(referenceTimestamp)"
        let herokuUrlString = "https://gossip.arik.io/delta/\(absoluteInterval)"
        let binaryPromise = Promise { (resolver: Resolver<Data>) in
                
            if !ignoreCache {
                if let cachedData = userDefaults.data(forKey: "cachedSyncData"){
                    resolver.fulfill(cachedData)
                    return
                }
            }
            
            // let url = URL(string: urlString)!
            let url = URL(string: herokuUrlString)!
            let session = URLSession.shared
            let task = session.dataTask(with: url, completionHandler: { data, response, error in
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    return resolver.reject(LNSyncError.badHTTPResponseStatus)
                }
                guard let mime = httpResponse.mimeType, (mime == "application/ln.gossip" || mime == "application/octet-stream") else {
                    return resolver.reject(LNSyncError.badHTTPResponseType)
                }
                guard let blockData = data else {
                    return resolver.reject(LNSyncError.missingBinary)
                }
                if storeToCache {
                    userDefaults.setValue(blockData, forKey: "cachedSyncData")
                }
                resolver.fulfill(blockData)
            })
            task.resume()
        }
        return binaryPromise
    }
    
}
