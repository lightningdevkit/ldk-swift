//
//  ChannelManagerConstructor.swift
//  LDKSwiftARC
//
//  Created by Arik Sosman on 5/19/21.
//

#if SWIFT_PACKAGE
import LDKHeaders
#endif

import Foundation

enum InvalidSerializedDataError: Error {
    case invalidSerializedChannelMonitor
    case invalidSerializedChannelManager
    case invalidSerializedNetworkGraph
    case duplicateSerializedChannelMonitor
    case badNodeSecret
}

public class ChannelManagerConstructor: NativeTypeWrapper {


    public let channelManager: ChannelManager

    /**
     * The latest block has the channel manager saw. If this is non-null it is a 32-byte block hash.
     * You should sync the blockchain starting with the block that builds on this block.
     */


    public let channel_manager_latest_block_hash: [UInt8]?

    let logger: Logger
    fileprivate var customPersister: CustomChannelManagerPersister?
    fileprivate var customEventHandler: EventHandler?
    public private(set) var netGraph: NetworkGraph?
    fileprivate var graphMessageHandler: GossipSync?
    fileprivate var scorer: MultiThreadedLockableScore?
    fileprivate let keysInterface: KeysInterface!
    public private(set) var payer: InvoicePayer?
    public let peerManager: PeerManager
    private var tcpPeerHandler: TCPPeerHandler?

    /**
     * A list of ChannelMonitors and the last block they each saw. You should sync the blockchain on each individually
     * starting with the block that builds on the hash given.
     * After doing so (and syncing the blockchain on the channel manager as well), you should call chain_sync_completed()
     * and then continue to normal application operation.
     */
    public private(set) var channel_monitors: [(ChannelMonitor, [UInt8])]

    private let chain_monitor: ChainMonitor


    public init(channelManagerSerialized: [UInt8], channelMonitorsSerialized: [[UInt8]], keysInterface: KeysInterface, feeEstimator: FeeEstimator, chainMonitor: ChainMonitor, filter: Filter?, netGraphSerialized: [UInt8]?, txBroadcaster: BroadcasterInterface, logger: Logger, enableP2PGossip: Bool = false) throws {

        var monitors: [ChannelMonitor] = []
        self.channel_monitors = []

        var monitorFundingSet = Set<String>()

        for currentSerializedChannelMonitor in channelMonitorsSerialized {
            let channelMonitorResult: Result_C2Tuple_BlockHashChannelMonitorZDecodeErrorZ = Bindings.readBlockHashChannelMonitor(ser: currentSerializedChannelMonitor, arg: keysInterface)

            guard let (blockHash, channelMonitor) = channelMonitorResult.getValue() else {
                throw InvalidSerializedDataError.invalidSerializedChannelMonitor
            }

            let (channelFundingOutpoint, _) = channelMonitor.getFundingTxo()

            // TODO: figure out what to do with txid nullability
            let fundingOutpointHash = "\(channelFundingOutpoint.getTxid()):\(channelFundingOutpoint.getIndex())"
            if monitorFundingSet.contains(fundingOutpointHash) {
                Bindings.print("Duplicate channel monitor funding txo: \(fundingOutpointHash)", severity: .ERROR)
                throw InvalidSerializedDataError.duplicateSerializedChannelMonitor
            }
            monitorFundingSet.insert(fundingOutpointHash)

            monitors.append(channelMonitor)
            self.channel_monitors.append((channelMonitor, blockHash))
        }

        print("Collected channel monitors, reading channel manager")
        let channelManagerReadArgs = ChannelManagerReadArgs(keysManager: keysInterface, feeEstimator: feeEstimator, chainMonitor: chainMonitor.asWatch(), txBroadcaster: txBroadcaster, logger: logger, defaultConfig: UserConfig.initWithDefault(), channelMonitors: monitors)


        guard let (latestBlockHash, channelManager) = Bindings.readBlockHashChannelManager(ser: channelManagerSerialized, arg: channelManagerReadArgs).getValue() else {
            throw InvalidSerializedDataError.invalidSerializedChannelManager
        }

        /* for clonedChannelMonitor in self.channel_monitors {
            clonedChannelMonitor.0.cType!.is_owned = true
        } */


        self.channelManager = channelManager
        self.channel_manager_latest_block_hash = latestBlockHash
        self.chain_monitor = chainMonitor
        self.keysInterface = keysInterface
        self.logger = logger

        let random_data = keysInterface.getSecureRandomBytes();

        if let serializedNetworkGraph = netGraphSerialized {
            let netGraphResult = NetworkGraph.read(ser: serializedNetworkGraph, arg: self.logger)
            if !netGraphResult.isOk(){
                throw InvalidSerializedDataError.invalidSerializedNetworkGraph
            }
            self.netGraph = netGraphResult.getValue()
        }

        let noCustomMessages = IgnoringMessageHandler()
        var messageHandler: MessageHandler!
        if let netGraph = netGraph, enableP2PGossip {
            let p2pGossipSync = P2PGossipSync(networkGraph: netGraph, chainAccess: nil, logger: logger)
            self.graphMessageHandler = GossipSync.initWithP2P(a: p2pGossipSync)
            messageHandler = MessageHandler(chanHandlerArg: channelManager.asChannelMessageHandler(), routeHandlerArg: p2pGossipSync.asRoutingMessageHandler(), onionMessageHandlerArg: noCustomMessages.asOnionMessageHandler())
        } else {
            messageHandler = MessageHandler(chanHandlerArg: channelManager.asChannelMessageHandler(), routeHandlerArg: noCustomMessages.asRoutingMessageHandler(), onionMessageHandlerArg: noCustomMessages.asOnionMessageHandler())
        }
        guard let nodeSecret = keysInterface.getNodeSecret(recipient: .Node).getValue() else {
            throw InvalidSerializedDataError.badNodeSecret
        }
        let timestampSeconds = UInt32(NSDate().timeIntervalSince1970)
        self.peerManager = PeerManager(messageHandler: messageHandler, ourNodeSecret: nodeSecret, currentTime: timestampSeconds, ephemeralRandomData: random_data, logger: logger, customMessageHandler: IgnoringMessageHandler().asCustomMessageHandler())

        if let filter = filter {
            for (currentMonitor, _) in self.channel_monitors {
                currentMonitor.loadOutputsToWatch(filter: filter)
            }
        }

        super.init(conflictAvoidingVariableName: 0)
        // try! self.peerManager.addAnchor(anchor: self)
        // try! self.channelManager.addAnchor(anchor: self)

    }



    /**
     * Constructs a channel manager from the given interface implementations
     */
    public init(network: Network, config: UserConfig, currentBlockchainTipHash: [UInt8], currentBlockchainTipHeight: UInt32, keysInterface: KeysInterface, feeEstimator: FeeEstimator, chainMonitor: ChainMonitor, netGraph: NetworkGraph?, txBroadcaster: BroadcasterInterface, logger: Logger, enableP2PGossip: Bool = false) {

        self.channel_monitors = []
        self.channel_manager_latest_block_hash = nil
        self.chain_monitor = chainMonitor
        let block = BestBlock(blockHash: currentBlockchainTipHash, height: currentBlockchainTipHeight)
        let chainParameters = ChainParameters(networkArg: network, bestBlockArg: block)
        self.channelManager = ChannelManager(feeEst: feeEstimator, chainMonitor: chainMonitor.asWatch(), txBroadcaster: txBroadcaster, logger: logger, keysManager: keysInterface, config: config, params: chainParameters)
        self.logger = logger

        self.keysInterface = keysInterface
        let random_data = keysInterface.getSecureRandomBytes();

        self.netGraph = netGraph
        let noCustomMessages = IgnoringMessageHandler()
        var messageHandler: MessageHandler!
        if let netGraph = netGraph, enableP2PGossip {
            let p2pGossipSync = P2PGossipSync(networkGraph: netGraph, chainAccess: nil, logger: logger)
            self.graphMessageHandler = GossipSync.initWithP2P(a: p2pGossipSync)
            messageHandler = MessageHandler(chanHandlerArg: channelManager.asChannelMessageHandler(), routeHandlerArg: p2pGossipSync.asRoutingMessageHandler(), onionMessageHandlerArg: noCustomMessages.asOnionMessageHandler())
        } else {
            messageHandler = MessageHandler(chanHandlerArg: channelManager.asChannelMessageHandler(), routeHandlerArg: noCustomMessages.asRoutingMessageHandler(), onionMessageHandlerArg: noCustomMessages.asOnionMessageHandler())
        }
        let nodeSecret = keysInterface.getNodeSecret(recipient: .Node).getValue()!
        let timestampSeconds = UInt32(NSDate().timeIntervalSince1970)
        self.peerManager = PeerManager(messageHandler: messageHandler, ourNodeSecret: nodeSecret, currentTime: timestampSeconds, ephemeralRandomData: random_data, logger: logger, customMessageHandler: noCustomMessages.asCustomMessageHandler())

        super.init(conflictAvoidingVariableName: 0)
        // try! self.peerManager.addAnchor(anchor: self)
        // try! self.channelManager.addAnchor(anchor: self)
    }


    var persisterWorkItem: DispatchWorkItem?
    var backgroundProcessor: BackgroundProcessor?
    var shutdown = false

    /**
     * Utility which adds all of the deserialized ChannelMonitors to the chain watch so that further updates from the
     * ChannelManager are processed as normal.
     *
     * This also spawns a background thread which will call the appropriate methods on the provided
     * ChannelManagerPersister as required.
     */
    public func chainSyncCompleted(persister: ExtendedChannelManagerPersister, scorer: MultiThreadedLockableScore?) {

        if self.backgroundProcessor != nil {
            return
        }

        for (currentChannelMonitor, _) in self.channel_monitors {
            let chainMonitorWatch = self.chain_monitor.asWatch()
            // let monitorClone = currentChannelMonitor.dynamicallyDangledClone()
            // monitorClone.cType?.is_owned = false
            let (outPoint, _) = currentChannelMonitor.getFundingTxo()
            print("watching channel")
            let monitorWatchResult = chainMonitorWatch.watchChannel(fundingTxo: outPoint, monitor: currentChannelMonitor)
            if monitorWatchResult != .Completed {
                Bindings.print("Some issue occurred with a chainMonitorWatch.watch_channel call: \(monitorWatchResult)", severity: .WARNING)
            }
            // monitorClone.cType?.is_owned = true
        }

        self.customPersister = CustomChannelManagerPersister(handler: persister)
        self.customEventHandler = CustomEventHandler(handler: persister)
        self.scorer = scorer

        if let netGraph = self.netGraph, let scorer = self.scorer {
            let router = DefaultRouter(networkGraph: netGraph, logger: self.logger, randomSeedBytes: self.keysInterface.getSecureRandomBytes(), scorer: scorer.asLockableScore())
            // either dangle router, or set is_owned to false
            // scorer.cType!.is_owned = false
            // router.cType!.is_owned = false
            self.payer = InvoicePayer(payer: self.channelManager.asPayer(), router: router.asRouter(), logger: self.logger, eventHandler: self.customEventHandler!, retry: Retry.initWithAttempts(a: UInt(3)))
            // router.cType!.is_owned = true
            self.customEventHandler = self.payer!.asEventHandler()
        }

        // if there is a graph msg handler, set its is_owned to false
        // self.graph_msg_handler?.cOpaqueStruct?.is_owned = false

        self.backgroundProcessor = BackgroundProcessor.start(persister: self.customPersister!, eventHandler: self.customEventHandler!, chainMonitor: self.chain_monitor, channelManager: self.channelManager, gossipSync: self.graphMessageHandler ?? GossipSync.none(), peerManager: self.peerManager, logger: self.logger, scorer: self.scorer?.asWriteableScore())

        // restore it back to true
        // self.graph_msg_handler?.cOpaqueStruct?.is_owned = true

        try? self.backgroundProcessor!.addAnchor(anchor: self.peerManager)
        try? self.backgroundProcessor!.addAnchor(anchor: persister)
        try? self.backgroundProcessor!.addAnchor(anchor: self.customEventHandler!)
        try? self.backgroundProcessor!.addAnchor(anchor: self.customPersister!)

    }

    public func interrupt() {
        if self.shutdown {
            Bindings.print("ChannelManagerConstructor previously interrupted, nothing to do.")
            return
        }

        self.shutdown = true
        if let tcpHandler = self.tcpPeerHandler {
            print("stopping TCP peer handler")
            tcpHandler.interrupt()
            print("stopped TCP peer handler")
        }
        print("stopping background processor")
        self.backgroundProcessor?.stop()
        print("stopped background processor")
        /*
        if let processor = self.backgroundProcessor {
            for currentAnchor in processor.anchors {
                if currentAnchor is NativeTraitWrapper {
                    let traitAnchor = currentAnchor as! NativeTraitWrapper
                    Bindings.removeInstancePointer(instance: traitAnchor)
                }
            }
            print("removed background processor anchors")
        }
        */
        self.payer = nil
        self.scorer = nil
        self.backgroundProcessor = nil
        print("unset background processor")
    }

    public func getTCPPeerHandler() -> TCPPeerHandler {
        if let handler = self.tcpPeerHandler {
            return handler
        }
        let handler = TCPPeerHandler(peerManager: self.peerManager)
        self.tcpPeerHandler = handler
        return handler
    }

    deinit {
        Bindings.print("Freeing and interrupting ChannelManagerConstructor")
        self.interrupt()
    }


}

fileprivate class CustomChannelManagerPersister: Persister {

    let handler: ExtendedChannelManagerPersister

    init(handler: ExtendedChannelManagerPersister) {
        self.handler = handler
        super.init()
    }

    override func persistManager(channelManager: Bindings.ChannelManager) -> Bindings.Result_NoneErrorZ {
        return self.handler.persistManager(channelManager: channelManager)
    }

    override func persistGraph(networkGraph: Bindings.NetworkGraph) -> Bindings.Result_NoneErrorZ {
        return self.handler.persistGraph(networkGraph: networkGraph)
    }

    override func persistScorer(scorer: Bindings.WriteableScore) -> Bindings.Result_NoneErrorZ {
        return self.handler.persistScorer(scorer: scorer)
    }
}

fileprivate class CustomEventHandler: EventHandler {

    let handler: ExtendedChannelManagerPersister

    init(handler: ExtendedChannelManagerPersister) {
        self.handler = handler
        super.init()
    }

    override func handleEvent(event: Bindings.Event) {
        // self.handler.handle_event(event: event.clone())
        self.handler.handleEvent(event: event)
    }

}

public protocol ExtendedChannelManagerPersister: Persister {
    func handleEvent(event: Event) -> Void;
}

public class TCPPeerHandler {

    private let peerManager: PeerManager
    private let socketHandler: UnsafeMutableRawPointer?
    private var isBound = false
    private var isInterrupted = false

    fileprivate init(peerManager: PeerManager) {
        self.peerManager = peerManager

        /*
        let socketHandler = withUnsafePointer(to: self.peerManager.cOpaqueStruct!) { (pointer: UnsafePointer<LDKPeerManager>) -> UnsafeMutableRawPointer? in
            let socketHandler = init_socket_handling(pointer)
            return socketHandler
        }
        self.socketHandler = socketHandler
		*/


        // self.socketHandler = UnsafeMutableRawPointer(bitPattern: 0)



        let peerManagerPointer: UnsafeRawPointer = UnsafeRawPointer(&self.peerManager.cType!)
        Bindings.print("TCPPeerHandler peer manager pointer address: \(peerManagerPointer)")
        let memoryReboundPeerManagerPointer: UnsafePointer<LDKPeerManager> = peerManagerPointer.assumingMemoryBound(to: LDKPeerManager.self)
        Bindings.print("TCPPeerHandler peer manager rebound memory address: \(memoryReboundPeerManagerPointer)")
        self.socketHandler = init_socket_handling(memoryReboundPeerManagerPointer)
        print("TCPPeerHandler self address: \(Unmanaged<TCPPeerHandler>.passUnretained(self).toOpaque())")
    }

    public func bind(address: String, port: UInt16) -> Bool {
        if(self.isBound){
            // already bound
            return false
        }
        self.isBound = true
        var addressObject = sockaddr_in()
        addressObject.sin_family = sa_family_t(AF_INET)
        addressObject.sin_port = port.bigEndian

        addressObject.sin_addr.s_addr = inet_addr(address)

        let sin_length = UInt8(MemoryLayout.size(ofValue: addressObject))

        let result = withUnsafePointer(to: &addressObject, { addressPointer in

            addressPointer.withMemoryRebound(to: sockaddr.self, capacity: 1) { addressSecondPointer -> Int32 in
                let addressMutablePointer = UnsafeMutablePointer(mutating: addressSecondPointer)
                let result = socket_bind(self.socketHandler, addressMutablePointer, socklen_t(sin_length))
                return result
            }
        })
        if result != 0 {
            // something failed
            print("TCP socket_bind error code: \(result)")
            let errorDetails = strerror(result)
            if let errorDetails = errorDetails {
                let errorString = String(cString: errorDetails)
                print("TCP socket_bind error: \(errorString)")
            }
            self.isBound = false
            return false
        }
        return true

    }

    public func connect(address: String, port: UInt16, theirNodeId: [UInt8]) -> Bool {

        var addressObject = sockaddr_in()
        addressObject.sin_family = sa_family_t(AF_INET)
        addressObject.sin_port = port.bigEndian

        addressObject.sin_addr.s_addr = inet_addr(address)

        let sin_length = UInt8(MemoryLayout.size(ofValue: addressObject))
        let publicKey = PublicKey(value: theirNodeId).cType!

        let result = withUnsafePointer(to: &addressObject, { addressPointer in

            addressPointer.withMemoryRebound(to: sockaddr.self, capacity: 1) { addressSecondPointer -> Int32 in
                let addressMutablePointer = UnsafeMutablePointer(mutating: addressSecondPointer)
                let result = socket_connect(self.socketHandler, publicKey, addressMutablePointer, Int(socklen_t(sin_length)))
                return result
            }
        })

        if result != 0 {
            // something failed
            return false
        }
        return true

    }

    fileprivate func interrupt() {
        if self.isInterrupted {
            Bindings.print("TCPPeerHandler previously interrupted, nothing to do.")
            return
        }
        self.isInterrupted = true
        interrupt_socket_handling(self.socketHandler)
        Bindings.print("TCPPeerHandler successfully interrupted.")
    }

    deinit {
        Bindings.print("Freeing and interrupting TCPPeerHandler.")
        self.interrupt()
    }

}
