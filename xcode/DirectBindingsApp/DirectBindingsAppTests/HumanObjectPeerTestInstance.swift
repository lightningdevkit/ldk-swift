//
//  HumanObjectPeerTestInstance.swift
//  LDKConsumerExperiment
//
//  Created by Arik Sosman on 7/22/21.
//

import Foundation
import XCTest

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
        weak var master: HumanObjectPeerTestInstance!
        let logger: Logger
        let feeEstimator: FeeEstimator
        let seed: UInt8
        var filterAdditions: Set<String>
        let monitors: [String: ChannelMonitor]
        private(set) var filter: Option_FilterZ!
        private(set) var keysInterface: KeysInterface!
        private(set) var explicitKeysManager: KeysManager?
        private(set) var router: NetGraphMsgHandler!
        private(set) var channelManager: ChannelManager!
        private(set) var peerManager: PeerManager!
        
        
        private(set) var constructor: ChannelManagerConstructor?
        private(set) var tcpSocketHandler: TCPPeerHandler?
        private(set) var tcpPort: UInt16?
        
        fileprivate actor PendingEventTracker {
            
            private(set) var pendingManagerEvents: [Event] = []
            private(set) var continuations: [CheckedContinuation<Void, Never>] = []
            
            private func triggerContinuations(){
                let continuations = self.continuations
                self.continuations.removeAll()
                for currentContinuation in continuations {
                    currentContinuation.resume()
                }
            }
            
            func addEvent(event: Event) {
                self.pendingManagerEvents.append(event)
                self.triggerContinuations()
            }
            
            func addEvents(events: [Event]) {
                self.pendingManagerEvents.append(contentsOf: events)
                self.triggerContinuations()
            }
            
            func getCount() -> Int {
                return self.pendingManagerEvents.count
            }
            
            func getEvents() -> [Event] {
                return self.pendingManagerEvents
            }
            
            func getAndClearEvents() -> [Event]{
                let events = self.pendingManagerEvents
                self.pendingManagerEvents.removeAll()
                return events
            }
            
            func awaitAddition() async {
                await withCheckedContinuation({ continuation in
                    self.continuations.append(continuation)
                })
            }
        }
        private(set) var pendingEventTracker = PendingEventTracker()
        
        fileprivate actor PendingBroadcastTracker {
            private(set) var pendingBroadcastSet: Set<[UInt8]> = Set()
            private(set) var continuations: [CheckedContinuation<Void, Never>] = []
            
            func addTransaction(tx: [UInt8]) {
                self.pendingBroadcastSet.insert(tx)
                self.triggerContinuations()
            }
            
            func getCount() -> Int {
                return self.pendingBroadcastSet.count
            }
            
            func getTransactions() -> Set<[UInt8]> {
                return self.pendingBroadcastSet
            }
            
            func getAndClearTransactions() -> Set<[UInt8]> {
                let txs = self.pendingBroadcastSet
                self.pendingBroadcastSet.removeAll()
                return txs
            }
            
            private func triggerContinuations(){
                let continuations = self.continuations
                self.continuations.removeAll()
                for currentContinuation in continuations {
                    currentContinuation.resume()
                }
            }
            
            func awaitAddition() async {
                await withCheckedContinuation({ continuation in
                    self.continuations.append(continuation)
                })
            }
        }
        private(set) var pendingBroadcastTracker = PendingBroadcastTracker()
        
        private(set) var nodeId: [UInt8]?
        
        var chainWatch: Watch?
        var chainMonitor: ChainMonitor?
        
        fileprivate class TestBroadcaster: BroadcasterInterface {
            weak var master: Peer!
            
            fileprivate init(master: Peer) {
                self.master = master
                super.init()
            }
            
            override func broadcast_transaction(tx: [UInt8]) {
                Task {
                    await self.master.pendingBroadcastTracker.addTransaction(tx: tx)
                }
            }
        }
        
        fileprivate class TestFilter: Filter {
            
            weak var master: Peer!
            
            fileprivate init(master: Peer) {
                self.master = master
                super.init()
            }
            
            override func register_output(output: WatchedOutput) -> Option_C2Tuple_usizeTransactionZZ {
                if let outpoint = output.get_outpoint() {
                    self.master.filterAdditions.insert("\(outpoint.get_txid()):\(outpoint.get_index())")
                }
                return Option_C2Tuple_usizeTransactionZZ(value: nil)
            }
            
            override func register_tx(txid: [UInt8]?, script_pubkey: [UInt8]) {
                self.master.filterAdditions.insert("\(txid)")
            }
        }
        
        fileprivate class TestKeysInterface: KeysInterface {
            
            weak var master: Peer!
            let interface: KeysInterface
            
            fileprivate init(master: Peer, underlyingInterface: KeysInterface) {
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
        
        fileprivate class TestChannelManagerPersister: Persister, ExtendedChannelManagerPersister {
            
            weak var master: Peer!
            
            fileprivate init(master: Peer) {
                self.master = master
                super.init()
            }
            
            func handle_event(event: Event) {
                // let eventClone = event.clone()
                print("peer \(self.master.seed) received event: \(event.getValueType())")
                Task {
                    // clone to avoid deallocation-related issues
                    await master.pendingEventTracker.addEvent(event: event)
                }
            }
            
        }
        
        fileprivate class TestPersister: Persist {
            override func persist_new_channel(channel_id: OutPoint, data: ChannelMonitor, update_id: MonitorUpdateId) -> Result_NoneChannelMonitorUpdateErrZ {
                return Result_NoneChannelMonitorUpdateErrZ.ok()
            }
            
            override func update_persisted_channel(channel_id: OutPoint, update: ChannelMonitorUpdate, data: ChannelMonitor, update_id: MonitorUpdateId) -> Result_NoneChannelMonitorUpdateErrZ {
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
                self.filter = Option_FilterZ(value: TestFilter(master: self))
            } else {
                self.filter = Option_FilterZ(value: nil)
            }
            
            if master.use_manual_watch || false { // don't support manual watch yet
                // self.chainMonitor
            } else {
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
            } else {
                self.keysInterface = keysManager.as_KeysInterface()
                self.explicitKeysManager = keysManager
            }
            
            self.router = NetGraphMsgHandlerConstructor.initNetGraphMsgHandler(networkGraph: NetworkGraph(genesis_hash: [UInt8](repeating: 0, count: 32)), chainAccess: nil, logger: self.logger)
        }
        
        fileprivate convenience init(master: HumanObjectPeerTestInstance, seed: UInt8) {
            self.init(master: master, _dummy: (), seed: seed)
            
            if master.use_chan_manager_constructor {
                
                let graph = NetworkGraph(genesis_hash: [UInt8](repeating: 0, count: 32))
                
                self.constructor = ChannelManagerConstructor(network: LDKNetwork_Bitcoin, config: UserConfig(), current_blockchain_tip_hash: [UInt8](repeating: 0, count: 32), current_blockchain_tip_height: 0, keys_interface: self.keysInterface, fee_estimator: self.feeEstimator, chain_monitor: self.chainMonitor!, net_graph: graph, tx_broadcaster: self.txBroadcaster, logger: self.logger)
                
                //                self.constructor = ChannelManagerConstructor(network: LDKNetwork_Bitcoin, config: UserConfig(), current_blockchain_tip_hash: [UInt8](repeating: 0, count: 32), current_blockchain_tip_height: 0, keys_interface: self.keysInterface, fee_estimator: self.feeEstimator, chain_monitor: self.chainMonitor!, net_graph: nil, tx_broadcaster: self.txBroadcaster, logger: self.logger)
                
                let scoringParams = ProbabilisticScoringParameters()
                let probabalisticScorer = ProbabilisticScorer(params: scoringParams, network_graph: graph)
                let score = probabalisticScorer.as_Score()
                let multiThreadedScorer = MultiThreadedLockableScore(score: score)
                
                self.constructor?.chain_sync_completed(persister: TestChannelManagerPersister(master: self), scorer: multiThreadedScorer)
                self.channelManager = self.constructor!.channelManager
                self.peerManager = self.constructor!.peerManager
            } else {
                let chainParameters = ChainParameters(network_arg: LDKNetwork_Bitcoin, best_block_arg: BestBlock(block_hash: [UInt8](repeating: 0, count: 32), height: 0))
                self.channelManager = ChannelManager(fee_est: self.feeEstimator, chain_monitor: self.chainWatch!, tx_broadcaster: self.txBroadcaster, logger: self.logger, keys_manager: self.keysInterface, config: UserConfig(), params: chainParameters)
                let randomData = self.keysInterface.get_secure_random_bytes()
                let messageHandler = MessageHandler(chan_handler_arg: self.channelManager.as_ChannelMessageHandler(), route_handler_arg: self.router.as_RoutingMessageHandler())
                let nodeSecret = self.keysInterface.get_node_secret(recipient: LDKRecipient_Node).getValue()!
                self.peerManager = PeerManager(message_handler: messageHandler, our_node_secret: nodeSecret, ephemeral_random_data: randomData, logger: self.logger, custom_message_handler: IgnoringMessageHandler().as_CustomMessageHandler())
            }
            self.nodeId = self.channelManager.get_our_node_id()
            self.bindSocketHandler()
        }
        
        fileprivate convenience init(original: Peer) {
            self.init(master: original.master, _dummy: (), seed: original.seed)
            
            if master.use_chan_manager_constructor {
                let graph = NetworkGraph(genesis_hash: [UInt8](repeating: 0, count: 32))
                self.constructor = ChannelManagerConstructor(network: LDKNetwork_Bitcoin, config: UserConfig(), current_blockchain_tip_hash: [UInt8](repeating: 0, count: 32), current_blockchain_tip_height: 0, keys_interface: self.keysInterface, fee_estimator: self.feeEstimator, chain_monitor: self.chainMonitor!, net_graph: graph, tx_broadcaster: self.txBroadcaster, logger: self.logger)
                self.constructor?.chain_sync_completed(persister: TestChannelManagerPersister(master: self), scorer: nil)
                self.channelManager = self.constructor!.channelManager
                Task {
                    let events = await original.pendingEventTracker.getEvents()
                    await self.pendingEventTracker.addEvents(events: events)
                }
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
        
        fileprivate func payInvoice() {
            
        }
        
        fileprivate func getManualWatch() {
            
        }
        
        fileprivate func getManagerEvents(expectedCount: UInt) async -> [Event] {
            var response = [Event]();
            if self.master.use_chan_manager_constructor {
                while true {
                    if await self.pendingEventTracker.getCount() >= expectedCount {
                        return await self.pendingEventTracker.getAndClearEvents()
                    }
                    await self.pendingEventTracker.awaitAddition()
                }
            }
            return response
        }
        
        fileprivate func getPendingBroadcasts(expectedCount: UInt) async -> Set<[UInt8]> {
            while true {
                if await self.pendingBroadcastTracker.getCount() >= expectedCount {
                    return await self.pendingBroadcastTracker.getAndClearTransactions()
                }
                await self.pendingBroadcastTracker.awaitAddition()
            }
        }
        
        fileprivate func connectBlock(block: BTCBlock, height: UInt32, expectedMonitorUpdateLength: Int) {
            let blockSerialization = block.serialize()
            var transactionTuples: [C2Tuple_usizeTransactionZ] = []
            
            if block.transactions.count > 0 {
                XCTAssertEqual(block.transactions.count, 1)
                transactionTuples.append(C2Tuple_usizeTransactionZ.new(a: 0, b: block.transactions[0].serialize()))
            }
            
            if let chainMonitor = self.chainMonitor {
                self.channelManager.as_Listen().block_connected(block: blockSerialization, height: height)
                chainMonitor.as_Listen().block_connected(block: blockSerialization, height: height)
            } else {
                let blockHeader = block.calculateHeader()
                self.channelManager.as_Confirm().transactions_confirmed(header: blockHeader, txdata: transactionTuples, height: height)
                self.channelManager.as_Confirm().best_block_updated(header: blockHeader, height: height)
                for (_, monitor) in self.monitors {
                    let connectionResult = monitor.block_connected(header: blockHeader, txdata: transactionTuples, height: height, broadcaster: self.txBroadcaster, fee_estimator: self.feeEstimator, logger: self.logger)
                    XCTAssertEqual(connectionResult.count, expectedMonitorUpdateLength)
                }
            }
            
        }
        
        deinit {
            print("deiniting Peer")
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
        } else {
            // not currently relevant; we need the TCP connection simulation
        }
    }
    
    func do_test_message_handler() async {
        
        let FUNDING_SATOSHI_AMOUNT: UInt64 = 100_000 // 100k satoshis
        let SEND_MSAT_AMOUNT_A_TO_B: UInt64 = 10_000_000 // 10k satoshis
        let SEND_MSAT_AMOUNT_B_TO_A: UInt64 = 3_000_000 // 3k satoshis
        
        let peer1 = Peer(master: self, seed: 1)
        let peer2 = Peer(master: self, seed: 2)
        
        do {
            // connect the nodes
            let originalPeersA = peer1.peerManager.get_peer_node_ids()
            let originalPeersB = peer2.peerManager.get_peer_node_ids()
            XCTAssertEqual(originalPeersA.count, 0)
            XCTAssertEqual(originalPeersB.count, 0)
            
            connectPeers(peerA: peer1, peerB: peer2)
            
            // sleep for one second
            try! await Task.sleep(nanoseconds: 1_000_000_000)
            
            let connectedPeersA = peer1.peerManager.get_peer_node_ids()
            let connectedPeersB = peer2.peerManager.get_peer_node_ids()
            XCTAssertEqual(connectedPeersA.count, 1)
            XCTAssertEqual(connectedPeersB.count, 1)
        }
        
        do {
            // initiate channel opening
            let config = UserConfig()
            let theirNodeId = peer2.channelManager.get_our_node_id()
            let channelOpenResult = peer1.channelManager.create_channel(their_network_key: theirNodeId, channel_value_satoshis: FUNDING_SATOSHI_AMOUNT, push_msat: 1000, user_channel_id: 42, override_config: config)
            
            XCTAssertTrue(channelOpenResult.isOk())
            let channels = peer1.channelManager.list_channels()
            let firstChannel = channels[0]
            let fundingTxo = firstChannel.get_funding_txo()
            XCTAssertNil(fundingTxo)
        }
        
        let managerEvents = await peer1.getManagerEvents(expectedCount: 1)
        XCTAssertEqual(managerEvents.count, 1)
        
        let managerEvent = managerEvents[0]
        XCTAssertEqual(managerEvent.getValueType(), .FundingGenerationReady)
        
        let fundingReadyEvent = managerEvent.getValueAsFundingGenerationReady()!
        XCTAssertEqual(fundingReadyEvent.getChannel_value_satoshis(), FUNDING_SATOSHI_AMOUNT)
        XCTAssertEqual(fundingReadyEvent.getUser_channel_id(), 42)
        
        let fundingOutputScript = fundingReadyEvent.getOutput_script();
        let temporaryChannelId = fundingReadyEvent.getTemporary_channel_id();
        
        XCTAssertEqual(fundingOutputScript.count, 34)
        XCTAssertEqual(fundingOutputScript[0], 0)
        XCTAssertEqual(fundingOutputScript[1], 32)
        
        let fundingTransaction = BTCTransaction()
        fundingTransaction.version = 1
        let input = BTCTransaction.Input(
            previousTransactionHash: BTCHashing.SHA_ZERO_HASH,
            previousOutputIndex: 0xffffffff, // coinbase transaction has a u32::MAX prev output index
            script: []
        )
        fundingTransaction.inputs = [input]
        fundingTransaction.setWitnessForInput(inputIndex: 0, witness: BTCTransaction.Witness(stackElements: [[1]]))
        
        let output = BTCTransaction.Output(value: FUNDING_SATOSHI_AMOUNT, script: fundingOutputScript)
        fundingTransaction.outputs = [output]
        let serializedFundingTx = fundingTransaction.serialize()
        let fundingResult = peer1.channelManager.funding_transaction_generated(temporary_channel_id: temporaryChannelId, funding_transaction: serializedFundingTx)
        XCTAssertTrue(fundingResult.isOk())
        
        let pendingBroadcasts = await peer1.getPendingBroadcasts(expectedCount: 1)
        
        XCTAssertEqual(pendingBroadcasts.count, 1)
        XCTAssertEqual(pendingBroadcasts.first!, serializedFundingTx)
        
        let fundingBlock = BTCBlock()
        fundingBlock.version = 2
        fundingBlock.previousBlockHash = BTCHashing.SHA_ZERO_HASH
        fundingBlock.merkleRoot = BTCHashing.SHA_ZERO_HASH
        fundingBlock.timestamp = 42
        fundingBlock.difficultyTarget = 0
        fundingBlock.nonce = 0
        fundingBlock.transactions = [fundingTransaction]
        
        peer1.connectBlock(block: fundingBlock, height: 1, expectedMonitorUpdateLength: 0)
        peer2.connectBlock(block: fundingBlock, height: 1, expectedMonitorUpdateLength: 0)
        
        var previousBlock = fundingBlock
        for height in 2..<10 {
            let currentBlock = BTCBlock()
            currentBlock.version = 2
            currentBlock.previousBlockHash = previousBlock.calculateHash()
            currentBlock.merkleRoot = BTCHashing.SHA_ZERO_HASH
            currentBlock.timestamp = UInt32(42 + height)
            currentBlock.difficultyTarget = 0
            currentBlock.nonce = 0
            
            peer1.connectBlock(block: currentBlock, height: UInt32(height), expectedMonitorUpdateLength: 0)
            peer2.connectBlock(block: currentBlock, height: UInt32(height), expectedMonitorUpdateLength: 0)
            previousBlock = currentBlock
        }
        
        var usableChannelsA = [ChannelDetails]()
        var usableChannelsB = [ChannelDetails]()
        while (usableChannelsA.isEmpty || usableChannelsB.isEmpty) {
            usableChannelsA = peer1.channelManager.list_usable_channels()
            usableChannelsB = peer2.channelManager.list_usable_channels()
            // sleep for 100ms
            try! await Task.sleep(nanoseconds: 0_100_000_000)
        }
        
        XCTAssertEqual(usableChannelsA.count, 1)
        XCTAssertEqual(usableChannelsB.count, 1)
        
        let channelAToB = usableChannelsA[0]
        let channelBToA = usableChannelsB[0]
        XCTAssertEqual(channelAToB.get_channel_value_satoshis(), FUNDING_SATOSHI_AMOUNT)
        let shortChannelId = channelAToB.get_short_channel_id().getValue()!
        
        let fundingTxId = fundingTransaction.calculateId()
        XCTAssertEqual(usableChannelsA[0].get_channel_id(), fundingTxId)
        XCTAssertEqual(usableChannelsB[0].get_channel_id(), fundingTxId)
        
        let originalChannelBalanceAToB = channelAToB.get_balance_msat()
        let originalChannelBalanceBToA = channelBToA.get_balance_msat()
        print("original balance A->B mSats: \(originalChannelBalanceAToB)")
        print("original balance B->A mSats: \(originalChannelBalanceBToA)")
        
        do {
            // create invoice for 10k satoshis to pay to peer2
            
            let invoiceResult = Bindings.createInvoiceFromChannelManager(channelManager: peer2.channelManager, keysManager: peer2.keysInterface, network: LDKCurrency_Bitcoin, amountMsat: SEND_MSAT_AMOUNT_A_TO_B, description: "Invoice description")
            let invoice = invoiceResult.getValue()!
            print("Invoice: \(invoice.to_str())")
            
            let recreatedInvoice = Invoice.from_str(s: invoice.to_str())
            XCTAssertTrue(recreatedInvoice.isOk())
            
            let invoicePaymentResult = peer1.constructor!.payer!.pay_invoice(invoice: invoice)
            XCTAssertTrue(invoicePaymentResult.isOk())
            
            do {
                // process HTLCs
                let peer2Event = await peer2.getManagerEvents(expectedCount: 1)[0]
                XCTAssertEqual(peer2Event.getValueType(), .PendingHTLCsForwardable)
                let pendingHTLCsForwardable = peer2Event.getValueAsPendingHTLCsForwardable()!
                print("forwardable time: \(pendingHTLCsForwardable.getTime_forwardable())")
                peer2.channelManager.process_pending_htlc_forwards()
                print("processed pending HTLC forwards")
            }
            
            do {
                // process payment
                let peer2Event = await peer2.getManagerEvents(expectedCount: 1)[0]
                XCTAssertEqual(peer2Event.getValueType(), .PaymentReceived)
                let paymentReceived = peer2Event.getValueAsPaymentReceived()!
                let paymentHash = paymentReceived.getPayment_hash()
                print("received payment of \(paymentReceived.getAmt()) with hash \(paymentHash)")
                let paymentPurpose = paymentReceived.getPurpose()
                XCTAssertEqual(paymentPurpose.getValueType(), .InvoicePayment)
                let invoicePayment = paymentPurpose.getValueAsInvoicePayment()!
                let preimage = invoicePayment.getPayment_preimage()
                let secret = invoicePayment.getPayment_secret()
                let claimResult = peer2.channelManager.claim_funds(payment_preimage: preimage)
                XCTAssertTrue(claimResult)
                print("claimed payment with secret \(secret) using preimage \(preimage)")
            }
            
            do {
                // process payment
                let peer1Events = await peer1.getManagerEvents(expectedCount: 2)
                let paymentSentEvent = peer1Events[0]
                let paymentPathSuccessfulEvent = peer1Events[1]
                XCTAssertEqual(paymentSentEvent.getValueType(), .PaymentSent)
                XCTAssertEqual(paymentPathSuccessfulEvent.getValueType(), .PaymentPathSuccessful)
                let paymentSent = paymentSentEvent.getValueAsPaymentSent()!
                let paymentPathSuccessful = paymentPathSuccessfulEvent.getValueAsPaymentPathSuccessful()!
                print("sent payment \(paymentSent.getPayment_id()) with fee \(paymentSent.getFee_paid_msat().getValue()) via \(paymentPathSuccessful.getPath().map { h in h.get_short_channel_id() })")
            }
            
            var currentChannelABalance = originalChannelBalanceAToB
            var currentChannelBBalance = originalChannelBalanceBToA
            while true {
                let channelA = peer1.channelManager.list_usable_channels()[0]
                let channelB = peer2.channelManager.list_usable_channels()[0]
                currentChannelABalance = channelA.get_balance_msat()
                currentChannelBBalance = channelB.get_balance_msat()
                if currentChannelABalance != originalChannelBalanceAToB && currentChannelBBalance != originalChannelBalanceBToA {
                    break
                }
                // sleep for 100ms
                try! await Task.sleep(nanoseconds: 0_100_000_000)
            }
            
            let invoicePayment = invoicePaymentResult.getValue()!
            XCTAssertEqual(currentChannelABalance, originalChannelBalanceAToB - SEND_MSAT_AMOUNT_A_TO_B)
            XCTAssertEqual(currentChannelBBalance, originalChannelBalanceBToA + SEND_MSAT_AMOUNT_A_TO_B)
        }
        
        do {
            // send some money back
            // create invoice for 10k satoshis to pay to peer2
            let prePaymentBalanceAToB = peer1.channelManager.list_usable_channels()[0].get_balance_msat()
            let prePaymentBalanceBToA = peer2.channelManager.list_usable_channels()[0].get_balance_msat()
            print("pre-payment balance A->B mSats: \(prePaymentBalanceAToB)")
            print("pre-payment balance B->A mSats: \(prePaymentBalanceBToA)")
            
            let invoiceResult = Bindings.createInvoiceFromChannelManager(channelManager: peer1.channelManager, keysManager: peer1.keysInterface, network: LDKCurrency_Bitcoin, amountMsat: nil, description: "Second invoice description")
            let invoice = invoiceResult.getValue()!
            print("Implicit amount invoice: \(invoice.to_str())")
            
            let recreatedInvoice = Invoice.from_str(s: invoice.to_str())
            XCTAssertTrue(recreatedInvoice.isOk())
            
            let invoicePaymentResult = peer2.constructor!.payer!.pay_zero_value_invoice(invoice: invoice, amount_msats: SEND_MSAT_AMOUNT_B_TO_A)
            if let error = invoicePaymentResult.getError() {
                print("value type: \(error.getValueType())")
                if let routingError = error.getValueAsRouting() {
                    print("routing error: \(routingError.get_err())")
                }
            }
            XCTAssertTrue(invoicePaymentResult.isOk())
            
            do {
                // process HTLCs
                let peer1Event = await peer1.getManagerEvents(expectedCount: 1)[0]
                XCTAssertEqual(peer1Event.getValueType(), .PendingHTLCsForwardable)
                let pendingHTLCsForwardable = peer1Event.getValueAsPendingHTLCsForwardable()!
                print("forwardable time: \(pendingHTLCsForwardable.getTime_forwardable())")
                peer1.channelManager.process_pending_htlc_forwards()
                print("processed pending HTLC forwards")
            }
            
            do {
                // process payment
                let peer1Event = await peer1.getManagerEvents(expectedCount: 1)[0]
                XCTAssertEqual(peer1Event.getValueType(), .PaymentReceived)
                let paymentReceived = peer1Event.getValueAsPaymentReceived()!
                let paymentHash = paymentReceived.getPayment_hash()
                print("received payment of \(paymentReceived.getAmt()) with hash \(paymentHash)")
                let paymentPurpose = paymentReceived.getPurpose()
                XCTAssertEqual(paymentPurpose.getValueType(), .InvoicePayment)
                let invoicePayment = paymentPurpose.getValueAsInvoicePayment()!
                let preimage = invoicePayment.getPayment_preimage()
                let secret = invoicePayment.getPayment_secret()
                let claimResult = peer1.channelManager.claim_funds(payment_preimage: preimage)
                XCTAssertTrue(claimResult)
                print("claimed payment with secret \(secret) using preimage \(preimage)")
            }
            
            do {
                // process payment
                let peer2Events = await peer2.getManagerEvents(expectedCount: 2)
                let paymentSentEvent = peer2Events[0]
                let paymentPathSuccessfulEvent = peer2Events[1]
                XCTAssertEqual(paymentSentEvent.getValueType(), .PaymentSent)
                XCTAssertEqual(paymentPathSuccessfulEvent.getValueType(), .PaymentPathSuccessful)
                let paymentSent = paymentSentEvent.getValueAsPaymentSent()!
                let paymentPathSuccessful = paymentPathSuccessfulEvent.getValueAsPaymentPathSuccessful()!
                print("sent payment \(paymentSent.getPayment_id()) with fee \(paymentSent.getFee_paid_msat().getValue()) via \(paymentPathSuccessful.getPath().map { h in h.get_short_channel_id() })")
            }
            
            var currentChannelABalance = prePaymentBalanceAToB
            var currentChannelBBalance = prePaymentBalanceBToA
            while true {
                let channelA = peer1.channelManager.list_usable_channels()[0]
                let channelB = peer2.channelManager.list_usable_channels()[0]
                currentChannelABalance = channelA.get_balance_msat()
                currentChannelBBalance = channelB.get_balance_msat()
                if currentChannelABalance != prePaymentBalanceAToB && currentChannelBBalance != prePaymentBalanceBToA {
                    break
                }
                // sleep for 100ms
                try! await Task.sleep(nanoseconds: 0_100_000_000)
            }
            
            let invoicePayment = invoicePaymentResult.getValue()!
            XCTAssertEqual(currentChannelABalance, prePaymentBalanceAToB + SEND_MSAT_AMOUNT_B_TO_A)
            XCTAssertEqual(currentChannelBBalance, prePaymentBalanceBToA - SEND_MSAT_AMOUNT_B_TO_A)
            XCTAssertEqual(currentChannelABalance, originalChannelBalanceAToB - SEND_MSAT_AMOUNT_A_TO_B + SEND_MSAT_AMOUNT_B_TO_A)
            XCTAssertEqual(currentChannelBBalance, originalChannelBalanceBToA + SEND_MSAT_AMOUNT_A_TO_B - SEND_MSAT_AMOUNT_B_TO_A)
        }
        
        
        do {
            // sleep for 5 seconds to ensure sanity
            try! await Task.sleep(nanoseconds: 5_000_000_000)
            
            peer1.constructor?.interrupt(tcpPeerHandler: peer1.tcpSocketHandler)
            peer2.constructor?.interrupt(tcpPeerHandler: peer2.tcpSocketHandler)
        }
        
    }
    
}
