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

enum RouterUnavailableError: Error {
    case channelManagerInitializationMissingScorerOrNetworkGraph
}

public struct ChannelManagerConstructionParameters {
    public var config: UserConfig
    public var entropySource: EntropySource
    public var nodeSigner: NodeSigner
    public var signerProvider: SignerProvider
    public var feeEstimator: FeeEstimator
    public var chainMonitor: ChainMonitor
    public var txBroadcaster: BroadcasterInterface
    public var enableP2PGossip: Bool = false
    public var scorer: MultiThreadedLockableScore?
    public var payerRetries: Retry = Retry.initWithAttempts(a: UInt(3))
    public var logger: Logger
    
    public init (config: UserConfig, entropySource: EntropySource, nodeSigner: NodeSigner, signerProvider: SignerProvider, feeEstimator: FeeEstimator, chainMonitor: ChainMonitor, txBroadcaster: BroadcasterInterface, logger: Logger, enableP2PGossip: Bool = false, scorer: MultiThreadedLockableScore? = nil, payerRetries: Retry = Retry.initWithAttempts(a: UInt(3))) {
        self.config = config
        self.entropySource = entropySource
        self.nodeSigner = nodeSigner
        self.signerProvider = signerProvider
        self.feeEstimator = feeEstimator
        self.chainMonitor = chainMonitor
        self.txBroadcaster = txBroadcaster
        self.logger = logger
        
        self.enableP2PGossip = enableP2PGossip
        self.scorer = scorer
        self.payerRetries = payerRetries
    }
    
    private class CMCRouter: Router {
        override func findRoute(payer: [UInt8], routeParams: Bindings.RouteParameters, firstHops: [Bindings.ChannelDetails]?, inflightHtlcs: Bindings.InFlightHtlcs) -> Bindings.Result_RouteLightningErrorZ {
            let errorString = "Error: Router unavailable: ChannelManagerConstructor initialized without Scorer or NetworkGraph."
            Bindings.print(errorString, severity: .ERROR)
            return .initWithErr(e: LightningError(errArg: errorString, actionArg: ErrorAction.initWithIgnoreAndLog(a: .Error)))
        }
        override func findRouteWithId(payer: [UInt8], routeParams: Bindings.RouteParameters, firstHops: [Bindings.ChannelDetails]?, inflightHtlcs: Bindings.InFlightHtlcs, paymentHash PaymentHash: [UInt8], paymentId PaymentId: [UInt8]) -> Bindings.Result_RouteLightningErrorZ {
            let errorString = "Error: Router unavailable: ChannelManagerConstructor initialized without Scorer or NetworkGraph."
            Bindings.print(errorString, severity: .ERROR)
            return .initWithErr(e: LightningError(errArg: errorString, actionArg: ErrorAction.initWithIgnoreAndLog(a: .Error)))
        }
    }
    
    fileprivate func router(networkGraph: NetworkGraph?) -> Router {
        if let netGraph = networkGraph, let scorer = self.scorer {
            return DefaultRouter(networkGraph: netGraph, logger: self.logger, randomSeedBytes: self.entropySource.getSecureRandomBytes(), scorer: scorer.asLockableScore()).asRouter()
        }
        return CMCRouter()
    }
}

public class ChannelManagerConstructor: NativeTypeWrapper {


    public let channelManager: ChannelManager

    /**
     * The latest block has the channel manager saw. If this is non-null it is a 32-byte block hash.
     * You should sync the blockchain starting with the block that builds on this block.
     */


    public let channel_manager_latest_block_hash: [UInt8]?

    private let constructionParameters: ChannelManagerConstructionParameters
    
    fileprivate var customPersister: CustomChannelManagerPersister?
    fileprivate var customEventHandler: EventHandler?
    public private(set) var netGraph: NetworkGraph?
    fileprivate var graphMessageHandler: GossipSync?
    
    
    
    
    // public private(set) var payer: InvoicePayer?
    
    public let peerManager: PeerManager
    private var tcpPeerHandler: TCPPeerHandler?

    /**
     * A list of ChannelMonitors and the last block they each saw. You should sync the blockchain on each individually
     * starting with the block that builds on the hash given.
     * After doing so (and syncing the blockchain on the channel manager as well), you should call chain_sync_completed()
     * and then continue to normal application operation.
     */
    public private(set) var channel_monitors: [(ChannelMonitor, [UInt8])]


    public init(channelManagerSerialized: [UInt8], channelMonitorsSerialized: [[UInt8]], netGraphSerialized: [UInt8]?, filter: Filter?, params: ChannelManagerConstructionParameters) throws {

        self.constructionParameters = params
        
        var monitors: [ChannelMonitor] = []
        self.channel_monitors = []

        var monitorFundingSet = Set<String>()

        for currentSerializedChannelMonitor in channelMonitorsSerialized {
            let channelMonitorResult: Result_C2Tuple_BlockHashChannelMonitorZDecodeErrorZ = Bindings.readBlockHashChannelMonitor(ser: currentSerializedChannelMonitor, argA: params.entropySource, argB: params.signerProvider)

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
        
        if let serializedNetworkGraph = netGraphSerialized {
            let netGraphResult = NetworkGraph.read(ser: serializedNetworkGraph, arg: params.logger)
            if !netGraphResult.isOk(){
                throw InvalidSerializedDataError.invalidSerializedNetworkGraph
            }
            self.netGraph = netGraphResult.getValue()
        }
        
        // TODO: figure out better way to obtain a router
        let router = params.router(networkGraph: self.netGraph)
        let channelManagerReadArgs = ChannelManagerReadArgs(entropySource: params.entropySource, nodeSigner: params.nodeSigner, signerProvider: params.signerProvider, feeEstimator: params.feeEstimator, chainMonitor: params.chainMonitor.asWatch(), txBroadcaster: params.txBroadcaster, router: router, logger: params.logger, defaultConfig: params.config, channelMonitors: monitors)

        guard let (latestBlockHash, channelManager) = Bindings.readBlockHashChannelManager(ser: channelManagerSerialized, arg: channelManagerReadArgs).getValue() else {
            throw InvalidSerializedDataError.invalidSerializedChannelManager
        }

        /* for clonedChannelMonitor in self.channel_monitors {
            clonedChannelMonitor.0.cType!.is_owned = true
        } */


        self.channelManager = channelManager
        self.channel_manager_latest_block_hash = latestBlockHash

        let random_data = params.entropySource.getSecureRandomBytes();


        let noCustomMessages = IgnoringMessageHandler()
        var messageHandler: MessageHandler!
        if let netGraph = netGraph, params.enableP2PGossip {
            let p2pGossipSync = P2PGossipSync(networkGraph: netGraph, utxoLookup: nil, logger: params.logger)
            self.graphMessageHandler = GossipSync.initWithP2P(a: p2pGossipSync)
            messageHandler = MessageHandler(chanHandlerArg: channelManager.asChannelMessageHandler(), routeHandlerArg: p2pGossipSync.asRoutingMessageHandler(), onionMessageHandlerArg: noCustomMessages.asOnionMessageHandler())
        } else {
            messageHandler = MessageHandler(chanHandlerArg: channelManager.asChannelMessageHandler(), routeHandlerArg: noCustomMessages.asRoutingMessageHandler(), onionMessageHandlerArg: noCustomMessages.asOnionMessageHandler())
        }
        let timestampSeconds = UInt32(NSDate().timeIntervalSince1970)
        self.peerManager = PeerManager(messageHandler: messageHandler, currentTime: timestampSeconds, ephemeralRandomData: random_data, logger: params.logger, customMessageHandler: IgnoringMessageHandler().asCustomMessageHandler(), nodeSigner: params.nodeSigner)

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
    public init(network: Network, currentBlockchainTipHash: [UInt8], currentBlockchainTipHeight: UInt32, netGraph: NetworkGraph?, params: ChannelManagerConstructionParameters) {

        self.constructionParameters = params
        
        self.channel_monitors = []
        self.channel_manager_latest_block_hash = nil
        let block = BestBlock(blockHash: currentBlockchainTipHash, height: currentBlockchainTipHeight)
        let chainParameters = ChainParameters(networkArg: network, bestBlockArg: block)
        
        self.netGraph = netGraph
        let router = params.router(networkGraph: self.netGraph)
        self.channelManager = ChannelManager(feeEst: params.feeEstimator, chainMonitor: params.chainMonitor.asWatch(), txBroadcaster: params.txBroadcaster, router: router, logger: params.logger, entropySource: params.entropySource, nodeSigner: params.nodeSigner, signerProvider: params.signerProvider, config: params.config, params: chainParameters)
        
        let noCustomMessages = IgnoringMessageHandler()
        var messageHandler: MessageHandler!
        if let netGraph = netGraph, params.enableP2PGossip {
            let p2pGossipSync = P2PGossipSync(networkGraph: netGraph, utxoLookup: nil, logger: params.logger)
            self.graphMessageHandler = GossipSync.initWithP2P(a: p2pGossipSync)
            messageHandler = MessageHandler(chanHandlerArg: channelManager.asChannelMessageHandler(), routeHandlerArg: p2pGossipSync.asRoutingMessageHandler(), onionMessageHandlerArg: noCustomMessages.asOnionMessageHandler())
        } else {
            messageHandler = MessageHandler(chanHandlerArg: channelManager.asChannelMessageHandler(), routeHandlerArg: noCustomMessages.asRoutingMessageHandler(), onionMessageHandlerArg: noCustomMessages.asOnionMessageHandler())
        }
        
        let random_data = params.entropySource.getSecureRandomBytes();

        let timestampSeconds = UInt32(NSDate().timeIntervalSince1970)
        self.peerManager = PeerManager(messageHandler: messageHandler, currentTime: timestampSeconds, ephemeralRandomData: random_data, logger: params.logger, customMessageHandler: noCustomMessages.asCustomMessageHandler(), nodeSigner: params.nodeSigner)

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
    public func chainSyncCompleted(persister: ExtendedChannelManagerPersister) {

        if self.backgroundProcessor != nil {
            return
        }

        for (currentChannelMonitor, _) in self.channel_monitors {
            let chainMonitorWatch = self.constructionParameters.chainMonitor.asWatch()
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

        // if there is a graph msg handler, set its is_owned to false
        // self.graph_msg_handler?.cOpaqueStruct?.is_owned = false

        self.backgroundProcessor = BackgroundProcessor.start(persister: self.customPersister!, eventHandler: self.customEventHandler!, chainMonitor: self.constructionParameters.chainMonitor, channelManager: self.channelManager, gossipSync: self.graphMessageHandler ?? GossipSync.none(), peerManager: self.peerManager, logger: self.constructionParameters.logger, scorer: self.constructionParameters.scorer?.asWriteableScore())

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
