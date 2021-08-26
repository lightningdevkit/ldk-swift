//
//  HumanObjectPeerTestInstance.swift
//  LDKConsumerExperiment
//
//  Created by Arik Sosman on 7/22/21.
//

import XCTest
import LDKSwift
import LDKHeaders

public class HumanObjectPeerTestInstance {

    private let nice_close: Bool;
    private let use_km_wrapper: Bool;
    private let use_manual_watch: Bool;
    private let reload_peers: Bool;
    private let break_cross_peer_refs: Bool;
    private let use_nio_peer_handler: Bool;
    private let use_filter: Bool;
    private let use_chan_manager_constructor: Bool;


    public init(nice_close: Bool, use_km_wrapper: Bool, use_manual_watch: Bool, reload_peers: Bool, break_cross_peer_refs: Bool, use_nio_peer_handler: Bool, use_filter: Bool, use_chan_manager_constructor: Bool) {
        self.nice_close = nice_close
        self.use_km_wrapper = use_km_wrapper
        self.use_manual_watch = use_manual_watch
        self.reload_peers = reload_peers
        self.break_cross_peer_refs = break_cross_peer_refs
        self.use_nio_peer_handler = use_nio_peer_handler
        self.use_filter = use_filter
        self.use_chan_manager_constructor = use_chan_manager_constructor
    }

    fileprivate class Peer {

        private(set) var txBroadcaster: BroadcasterInterface!
        let master: HumanObjectPeerTestInstance
        let logger: Logger
        let feeEstimator: FeeEstimator
        let seed: UInt8
        var filterAdditions: Set<String>
        let monitors: [String: ChannelMonitor]
        private(set) var filter: Filter!
        private(set) var keysInterface: KeysInterface!
        private(set) var explicitKeysManager: KeysManager?
        private(set) var router: NetGraphMsgHandler!
        private(set) var channelManager: ChannelManager!
        private(set) var peerManager: PeerManager!


        private(set) var constructor: ChannelManagerConstructor?
        private(set) var tcpSocketHandler: TCPPeerHandler?
        private(set) var tcpPort: UInt16?

        private(set) var pendingManagerEvents: [Event] = []
        private(set) var nodeId: [UInt8]?

        var chainWatch: Watch?
        var chainMonitor: ChainMonitor?

        fileprivate class TestBroadcaster: BroadcasterInterface {
            let master: Peer
            fileprivate init(master: Peer){
                self.master  = master
                super.init()
            }
        }

        fileprivate class TestFilter: Filter {

            let master: Peer

            fileprivate init(master: Peer) {
                self.master = master
                super.init()
            }
            override func register_output(output: WatchedOutput) -> Option_C2Tuple_usizeTransactionZZ {
                self.master.filterAdditions.insert("\(output.get_outpoint().get_txid()):\(output.get_outpoint().get_index())")
                return Option_C2Tuple_usizeTransactionZZ(value: nil)
            }
            override func register_tx(txid: [UInt8]?, script_pubkey: [UInt8]) {
                self.master.filterAdditions.insert("\(txid)")
            }
        }

        fileprivate class TestKeysInterface: KeysInterface {

            let master: Peer
            let interface: KeysInterface

            fileprivate init(master: Peer, underlyingInterface: KeysInterface){
                self.master = master
                self.interface = underlyingInterface
                super.init()
            }

            override func get_channel_signer(inbound: Bool, channel_value_satoshis: UInt64) -> Sign {
                let ck = self.interface.get_channel_signer(inbound: inbound, channel_value_satoshis: channel_value_satoshis)
                // add to must free objects
                return ck
            }
        }

        fileprivate class TestChannelManagerPersister: ChannelManagerPersister, ExtendedChannelManagerPersister {

            let master: Peer

            fileprivate init(master: Peer) {
                self.master = master
                super.init()
            }

            func handle_event(event: Event) {
                master.pendingManagerEvents.append(event)
            }

        }

        fileprivate class TestPersister: Persist {
            override func persist_new_channel(id: OutPoint, data: ChannelMonitor) -> Result_NoneChannelMonitorUpdateErrZ {
                return Result_NoneChannelMonitorUpdateErrZ.ok()
            }
            override func update_persisted_channel(id: OutPoint, update: ChannelMonitorUpdate, data: ChannelMonitor) -> Result_NoneChannelMonitorUpdateErrZ {
                return Result_NoneChannelMonitorUpdateErrZ.ok()
            }
        }

        fileprivate init(master: HumanObjectPeerTestInstance, _dummy: Any, seed: UInt8) {

            self.master = master
            self.logger = TestLogger()
            self.feeEstimator = TestFeeEstimator()
            self.monitors = [String: ChannelMonitor]()
            self.seed = seed
            let persister = TestPersister()
            self.filterAdditions = Set<String>()

            self.txBroadcaster = TestBroadcaster(master: self)

            if master.use_filter {
                self.filter = TestFilter(master: self)
            }

            if master.use_manual_watch || false { // don't support manual watch yet
                // self.chainMonitor
            }else{
                self.chainMonitor = ChainMonitor(chain_source: self.filter, broadcaster: self.txBroadcaster, logger: self.logger, feeest: self.feeEstimator, persister: persister)
                self.chainWatch = self.chainMonitor!.as_Watch()
            }

            var keySeed = [UInt8](repeating: 0, count: 32)
            for i in 0..<32 {
                keySeed[i] = UInt8(i) ^ seed
            }

            let timestamp_seconds = UInt64(NSDate().timeIntervalSince1970)
            let timestamp_nanos = UInt32(truncating: NSNumber(value: timestamp_seconds * 1000 * 1000))
            let keysManager = KeysManager(seed: keySeed, starting_time_secs: timestamp_seconds, starting_time_nanos: timestamp_nanos)

            if master.use_km_wrapper {
                // self.keysInterface = manual_
            }else {
                self.keysInterface = keysManager.as_KeysInterface()
                self.explicitKeysManager = keysManager
            }

            self.router = NetGraphMsgHandler(chain_access: nil, logger: self.logger, network_graph: NetworkGraph(genesis_hash: [UInt8](repeating: 0, count: 32)))

        }

        fileprivate convenience init (master: HumanObjectPeerTestInstance, seed: UInt8) {
            self.init(master: master, _dummy: (), seed: seed)

            if master.use_chan_manager_constructor {
                self.constructor = ChannelManagerConstructor(network: LDKNetwork_Bitcoin, config: UserConfig(), current_blockchain_tip_hash: [UInt8](repeating: 0, count: 32), current_blockchain_tip_height: 0, keys_interface: self.keysInterface, fee_estimator: self.feeEstimator, chain_monitor: self.chainMonitor!, router: self.router, tx_broadcaster: self.txBroadcaster, logger: self.logger)
                self.constructor?.chain_sync_completed(persister: TestChannelManagerPersister(master: self))
                self.channelManager = self.constructor!.channelManager
                self.peerManager = self.constructor!.peerManager
            } else {
                let chainParameters = ChainParameters(network_arg: LDKNetwork_Bitcoin, best_block_arg: BestBlock(block_hash: [UInt8](repeating: 0, count: 32), height: 0))
                self.channelManager = ChannelManager(fee_est: self.feeEstimator, chain_monitor: self.chainWatch!, tx_broadcaster: self.txBroadcaster, logger: self.logger, keys_manager: self.keysInterface, config: UserConfig(), params: chainParameters)
                let randomData = self.keysInterface.get_secure_random_bytes()
                let messageHandler = MessageHandler(chan_handler_arg: self.channelManager.as_ChannelMessageHandler(), route_handler_arg: self.router.as_RoutingMessageHandler())
                PeerManager(message_handler: messageHandler, our_node_secret: self.keysInterface.get_node_secret(), ephemeral_random_data: randomData, logger: self.logger)
            }
            self.nodeId = self.channelManager.get_our_node_id()
            self.bindSocketHandler()
        }

        fileprivate convenience init (original: Peer) {
            self.init(master: original.master, _dummy: (), seed: original.seed)

            if master.use_chan_manager_constructor {
                self.constructor = ChannelManagerConstructor(network: LDKNetwork_Bitcoin, config: UserConfig(), current_blockchain_tip_hash: [UInt8](repeating: 0, count: 32), current_blockchain_tip_height: 0, keys_interface: self.keysInterface, fee_estimator: self.feeEstimator, chain_monitor: self.chainMonitor!, router: self.router, tx_broadcaster: self.txBroadcaster, logger: self.logger)
                self.constructor?.chain_sync_completed(persister: TestChannelManagerPersister(master: self))
                self.channelManager = self.constructor!.channelManager
                self.peerManager = self.constructor!.peerManager
                self.pendingManagerEvents.append(contentsOf: original.pendingManagerEvents)
            } else {
                var monitors: [ChannelMonitor] = []
                var nativeMonitors: [LDKChannelMonitor] = []
                // let serialized = original.monitors[0].wr
                let serializedManager = original.channelManager.write()
                let managerResult = UtilMethods.constructor_BlockHashChannelManagerZ_read(ser: serializedManager, arg_keys_manager: self.keysInterface, arg_fee_estimator: self.feeEstimator, arg_chain_monitor: self.chainWatch!, arg_tx_broadcaster: self.txBroadcaster, arg_logger: self.logger, arg_default_config: UserConfig(), arg_channel_monitors: nativeMonitors)
                assert(managerResult.isOk())
                managerResult.getValue()!
            }
            self.nodeId = self.channelManager.get_our_node_id()
            self.bindSocketHandler()
        }

        private func bindSocketHandler() {
            if !self.master.use_nio_peer_handler {
                return
            }
            self.tcpSocketHandler = TCPPeerHandler(peerManager: self.peerManager)
            for i in 1...10000 {
                let port = UInt16(i)
                let bound = self.tcpSocketHandler!.bind(address: "127.0.0.1", port: port)
                if bound {
                    self.tcpPort = port
                    return
                }
            }
        }

        fileprivate func getManualWatch() {

        }

    }

    func do_read_event(pm: PeerManager, descriptor: SocketDescriptor, data: [UInt8]) {
        let res = pm.read_event(peer_descriptor: descriptor, data: data)
        assert(res.isOk())
    }


    fileprivate func connectPeers(peerA: Peer, peerB: Peer) {
        if self.use_nio_peer_handler {
            let connectionResult = peerA.tcpSocketHandler?.connect(address: "127.0.0.1", port: peerB.tcpPort!, theirNodeId: peerB.nodeId!)
            print("connection result: \(connectionResult)")
        }else{
            // not currently relevant; we need the TCP connection simulation
        }
    }

    func do_test_message_handler() {
        let peer1 = Peer(master: self, seed: 1)
        let peer2 = Peer(master: self, seed: 2)

        connectPeers(peerA: peer1, peerB: peer2)

        let semaphore = DispatchSemaphore(value: 0)
        DispatchQueue.global(qos: .background).async {
            print("waiting five seconds")
            sleep(5)
            semaphore.signal()
            print("finished waiting five seconds")
        }
        semaphore.wait()
        peer1.constructor?.interrupt()
        peer2.constructor?.interrupt()
    }

}

