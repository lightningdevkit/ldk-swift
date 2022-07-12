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
    public private(set) var net_graph: NetworkGraph?
    fileprivate var graph_msg_handler: GossipSync?
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


    public init(channel_manager_serialized: [UInt8], channel_monitors_serialized: [[UInt8]], keys_interface: KeysInterface, fee_estimator: FeeEstimator, chain_monitor: ChainMonitor, filter: Filter?, net_graph_serialized: [UInt8]?, tx_broadcaster: BroadcasterInterface, logger: Logger, enableP2PGossip: Bool = false) throws {

        var monitors: [LDKChannelMonitor] = []
        self.channel_monitors = []

        var monitorFundingSet = Set<String>()

        for currentSerializedChannelMonitor in channel_monitors_serialized {
            let channelMonitorResult: Result_C2Tuple_BlockHashChannelMonitorZDecodeErrorZ = UtilMethods.constructor_BlockHashChannelMonitorZ_read(ser: currentSerializedChannelMonitor, arg: keys_interface)
            if channelMonitorResult.cOpaqueStruct?.result_ok != true {
                throw InvalidSerializedDataError.invalidSerializedChannelMonitor
            }

            let value: LDKCResult_C2Tuple_BlockHashChannelMonitorZDecodeErrorZPtr = channelMonitorResult.cOpaqueStruct!.contents
            let a: LDKThirtyTwoBytes = value.result!.pointee.a
            let b: LDKChannelMonitor = value.result!.pointee.b

            let blockHash = Bindings.LDKThirtyTwoBytes_to_array(nativeType: a);
            let clonedChannelMonitor = ChannelMonitor(pointer: b).dangle().clone()
            
            if let channelFundingOutpoint = clonedChannelMonitor.get_funding_txo().getA() {
                let fundingOutpointHash = "\(channelFundingOutpoint.get_txid()):\(channelFundingOutpoint.get_index())"
                if monitorFundingSet.contains(fundingOutpointHash) {
                    Bindings.print("Duplicate channel monitor funding txo: \(fundingOutpointHash)", severity: .ERROR)
                    throw InvalidSerializedDataError.duplicateSerializedChannelMonitor
                }
                monitorFundingSet.insert(fundingOutpointHash)
            }
            
            clonedChannelMonitor.cOpaqueStruct?.is_owned = false // is_owned should never have to be modified

            monitors.append(clonedChannelMonitor.cOpaqueStruct!)
            self.channel_monitors.append((clonedChannelMonitor, blockHash))
        }

        print("Collected channel monitors, reading channel manager")
        let channelManagerResult: Result_C2Tuple_BlockHashChannelManagerZDecodeErrorZ = UtilMethods.constructor_BlockHashChannelManagerZ_read(ser: channel_manager_serialized, arg_keys_manager: keys_interface, arg_fee_estimator: fee_estimator, arg_chain_monitor: chain_monitor.as_Watch(), arg_tx_broadcaster: tx_broadcaster, arg_logger: logger, arg_default_config: UserConfig(), arg_channel_monitors: monitors)
        if channelManagerResult.isOk() != true {
            throw InvalidSerializedDataError.invalidSerializedChannelManager
        }

        for clonedChannelMonitor in self.channel_monitors {
            clonedChannelMonitor.0.cOpaqueStruct!.is_owned = true
        }

        let latestBlockHash = Bindings.LDKThirtyTwoBytes_to_array(nativeType: channelManagerResult.cOpaqueStruct!.contents.result.pointee.a)
        let channelManager = ChannelManager(pointer: channelManagerResult.cOpaqueStruct!.contents.result.pointee.b)
        try! channelManager.dangle().addAnchor(anchor: channelManagerResult)


        self.channelManager = channelManager
        self.channel_manager_latest_block_hash = latestBlockHash
        self.chain_monitor = chain_monitor
        self.keysInterface = keys_interface
        self.logger = logger

        let random_data = keys_interface.get_secure_random_bytes();

        if let serializedNetworkGraph = net_graph_serialized {
            let netGraphResult = NetworkGraph.read(ser: serializedNetworkGraph, arg: self.logger)
            if !netGraphResult.isOk(){
                throw InvalidSerializedDataError.invalidSerializedNetworkGraph
            }
            self.net_graph = netGraphResult.getValue()
        }

        let noCustomMessages = IgnoringMessageHandler()
        var messageHandler: MessageHandler!
        if let netGraph = net_graph, enableP2PGossip {
            let noneOption = Option_AccessZ.none()
            let p2pGossipSync = P2PGossipSync(network_graph: netGraph, chain_access: Option_AccessZ.none(), logger: logger)
            self.graph_msg_handler = GossipSync.p2_p(a: p2pGossipSync)
            messageHandler = MessageHandler(chan_handler_arg: channelManager.as_ChannelMessageHandler(), route_handler_arg: p2pGossipSync.as_RoutingMessageHandler())
        } else {
            messageHandler = MessageHandler(chan_handler_arg: channelManager.as_ChannelMessageHandler(), route_handler_arg: noCustomMessages.as_RoutingMessageHandler())
        }
        guard let nodeSecret = keys_interface.get_node_secret(recipient: LDKRecipient_Node).getValue() else {
            throw InvalidSerializedDataError.badNodeSecret
        }
        self.peerManager = PeerManager(message_handler: messageHandler.dangle(), our_node_secret: nodeSecret, ephemeral_random_data: random_data, logger: self.logger, custom_message_handler: IgnoringMessageHandler().as_CustomMessageHandler())

        if let filter = filter {
            for (currentMonitor, _) in self.channel_monitors {
                currentMonitor.load_outputs_to_watch(filter: filter)
            }
        }

        super.init(conflictAvoidingVariableName: 0)
        // try! self.peerManager.addAnchor(anchor: self)
        // try! self.channelManager.addAnchor(anchor: self)

    }



    /**
     * Constructs a channel manager from the given interface implementations
     */
    public init(network: LDKNetwork, config: UserConfig, current_blockchain_tip_hash: [UInt8], current_blockchain_tip_height: UInt32, keys_interface: KeysInterface, fee_estimator: FeeEstimator, chain_monitor: ChainMonitor, net_graph: NetworkGraph?, tx_broadcaster: BroadcasterInterface, logger: Logger, enableP2PGossip: Bool = false) {

        self.channel_monitors = []
        self.channel_manager_latest_block_hash = nil
        self.chain_monitor = chain_monitor
        let block = BestBlock(block_hash: current_blockchain_tip_hash, height: current_blockchain_tip_height)
        let chainParameters = ChainParameters(network_arg: network, best_block_arg: block)
        self.channelManager = ChannelManager(fee_est: fee_estimator, chain_monitor: chain_monitor.as_Watch(), tx_broadcaster: tx_broadcaster, logger: logger, keys_manager: keys_interface, config: config, params: chainParameters)
        self.logger = logger

        self.keysInterface = keys_interface
        let random_data = keys_interface.get_secure_random_bytes();

        self.net_graph = net_graph
        let noCustomMessages = IgnoringMessageHandler()
        var messageHandler: MessageHandler!
        if let netGraph = net_graph, enableP2PGossip {
            let noneOption = Option_AccessZ.none()
            let p2pGossipSync = P2PGossipSync(network_graph: netGraph, chain_access: Option_AccessZ.none(), logger: logger)
            self.graph_msg_handler = GossipSync.p2_p(a: p2pGossipSync)
            messageHandler = MessageHandler(chan_handler_arg: channelManager.as_ChannelMessageHandler(), route_handler_arg: p2pGossipSync.as_RoutingMessageHandler())
        } else {
            messageHandler = MessageHandler(chan_handler_arg: channelManager.as_ChannelMessageHandler(), route_handler_arg: noCustomMessages.as_RoutingMessageHandler())
        }
        let nodeSecret = keys_interface.get_node_secret(recipient: LDKRecipient_Node).getValue()!
        self.peerManager = PeerManager(message_handler: messageHandler.dangle(), our_node_secret: nodeSecret, ephemeral_random_data: random_data, logger: logger, custom_message_handler: noCustomMessages.as_CustomMessageHandler())


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
    public func chain_sync_completed(persister: ExtendedChannelManagerPersister, scorer: MultiThreadedLockableScore?) {

        if self.backgroundProcessor != nil {
            return
        }

        for (currentChannelMonitor, _) in self.channel_monitors {
            let chainMonitorWatch = self.chain_monitor.as_Watch()
            let monitorClone = currentChannelMonitor.clone()
            monitorClone.cOpaqueStruct?.is_owned = false
            let fundingTxo = monitorClone.get_funding_txo()
            let outPoint = OutPoint(pointer: fundingTxo.cOpaqueStruct!.a).dangle()
            print("watching channel")
            let monitorWatchResult = chainMonitorWatch.watch_channel(funding_txo: outPoint, monitor: monitorClone)
            if !monitorWatchResult.isOk() {
                print("Some error occurred with a chainMonitorWatch.watch_channel call")
            }
            monitorClone.cOpaqueStruct?.is_owned = true
        }

        self.customPersister = CustomChannelManagerPersister(handler: persister)
        self.customEventHandler = CustomEventHandler(handler: persister)
        self.scorer = scorer

        if let netGraph = self.net_graph, let scorer = self.scorer {
            let router = DefaultRouter(network_graph: netGraph, logger: self.logger, random_seed_bytes: self.keysInterface.get_secure_random_bytes())
            // either dangle router, or set is_owned to false
            scorer.cOpaqueStruct!.is_owned = false
            router.cOpaqueStruct!.is_owned = false
            self.payer = InvoicePayer(payer: self.channelManager.as_Payer(), router: router.as_Router(), scorer: scorer, logger: self.logger, event_handler: self.customEventHandler!, retry: Retry.attempts(a: 3))
            router.cOpaqueStruct!.is_owned = true
            self.customEventHandler = self.payer!.as_EventHandler()
        }

        // if there is a graph msg handler, set its is_owned to false
        // self.graph_msg_handler?.cOpaqueStruct?.is_owned = false

        self.backgroundProcessor = BackgroundProcessor(persister: self.customPersister!, event_handler: self.customEventHandler!, chain_monitor: self.chain_monitor, channel_manager: self.channelManager, gossip_sync: self.graph_msg_handler ?? GossipSync.none(), peer_manager: self.peerManager, logger: self.logger, scorer: self.scorer)

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
        self.backgroundProcessor?.dangle().stop()
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

    override func persist_manager(channel_manager: ChannelManager) -> Result_NoneErrorZ {
        return self.handler.persist_manager(channel_manager: channel_manager)
    }

    override func persist_graph(network_graph: NetworkGraph) -> Result_NoneErrorZ {
        return self.handler.persist_graph(network_graph: network_graph)
    }
}

fileprivate class CustomEventHandler: EventHandler {

    let handler: ExtendedChannelManagerPersister

    init(handler: ExtendedChannelManagerPersister) {
        self.handler = handler
        super.init()
    }

    override func handle_event(event: Event) {
        self.handler.handle_event(event: event.clone())
    }

}

public protocol ExtendedChannelManagerPersister: Persister {
    func handle_event(event: Event) -> Void;
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



        let peerManagerPointer: UnsafeRawPointer = UnsafeRawPointer(&self.peerManager.cOpaqueStruct)
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
        let publicKey = Bindings.new_LDKPublicKey(array: theirNodeId)

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
