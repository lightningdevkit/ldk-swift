//
//  HumanObjectPeerTestInstance.swift
//  LDKConsumerExperiment
//
//  Created by Arik Sosman on 7/22/21.
//

#if SWIFT_PACKAGE
import LDKSwift
import LDKHeaders
#endif
import XCTest

public class HumanObjectPeerTestInstance {
    
    private let configuration: Configuration
    
    public class Configuration {
//
        public var useFilter: Bool = false;
        public var useRouter: Bool = false;
        public var shouldRecipientRejectPayment: Bool = false;
        
        // public var nice_close: Bool = false;
        // public var use_km_wrapper: Bool = false;
        // public var use_manual_watch: Bool = false;
        // public var reload_peers: Bool = false;
        // public var break_cross_peer_refs: Bool = false;
        // public var use_nio_peer_handler: Bool = false;
        
        private class func listCustomizeableProperties() -> [String] {
            return ["useFilter", "useRouter", "shouldRecipientRejectPayment"]
        }
        
        public class func combinationCount() -> UInt {
            return 1 << self.listCustomizeableProperties().count
        }
        
    }
    
    
    
    public init(configuration: Configuration) {
        self.configuration = configuration
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
        private(set) var router: GossipSync!
        private(set) var channelManager: ChannelManager!
        private(set) var peerManager: PeerManager!


        private(set) var constructor: ChannelManagerConstructor?
        private(set) var tcpSocketHandler: TCPPeerHandler?
        private(set) var tcpPort: UInt16?

        fileprivate enum SocketBindError: Error {
            case failedToBindSocket
        }

        fileprivate enum ChannelManagerEventError: Error {
            case notUsingChannelManagerConstructor
        }

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

            override func register_output(output: WatchedOutput) {
                if let outpoint = output.get_outpoint() {
                    self.master.filterAdditions.insert("\(outpoint.get_txid()):\(outpoint.get_index())")
                }
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

            override func persist_manager(channel_manager: Bindings.ChannelManager) -> Bindings.Result_NoneErrorZ {
                Result_NoneErrorZ()
            }

            override func persist_scorer(scorer: Bindings.WriteableScore) -> Bindings.Result_NoneErrorZ {
                Result_NoneErrorZ()
            }

            override func persist_graph(network_graph: Bindings.NetworkGraph) -> Bindings.Result_NoneErrorZ {
                Result_NoneErrorZ()
            }

        }

        fileprivate class TestPersister: Persist {
            override func persist_new_channel(channel_id: OutPoint, data: ChannelMonitor, update_id: MonitorUpdateId) -> LDKChannelMonitorUpdateStatus {
                return LDKChannelMonitorUpdateStatus_Completed
            }

            override func update_persisted_channel(channel_id: OutPoint, update: ChannelMonitorUpdate, data: ChannelMonitor, update_id: MonitorUpdateId) -> LDKChannelMonitorUpdateStatus {
                return LDKChannelMonitorUpdateStatus_Completed
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

            if master.configuration.useFilter {
                self.filter = Option_FilterZ(value: TestFilter(master: self))
            } else {
                self.filter = Option_FilterZ(value: nil)
            }

            // never use manual watch
            do {
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
            
            self.keysInterface = keysManager.as_KeysInterface()
            self.explicitKeysManager = keysManager

            if master.configuration.useRouter {
                let networkGraph = NetworkGraph(genesis_hash: [UInt8](repeating: 0, count: 32), logger: self.logger)
                self.router = GossipSync.p2_p(a: P2PGossipSync(network_graph: networkGraph, chain_access: Option_AccessZ.none(), logger: self.logger))
            }else{
                self.router = GossipSync.none()
            }
        }

        fileprivate convenience init(master: HumanObjectPeerTestInstance, seed: UInt8) {
            self.init(master: master, _dummy: (), seed: seed)

            do {
                // channel manager constructor is mandatory

                let graph = NetworkGraph(genesis_hash: [UInt8](repeating: 0, count: 32), logger: self.logger)

                self.constructor = ChannelManagerConstructor(network: LDKNetwork_Bitcoin, config: UserConfig(), current_blockchain_tip_hash: [UInt8](repeating: 0, count: 32), current_blockchain_tip_height: 0, keys_interface: self.keysInterface, fee_estimator: self.feeEstimator, chain_monitor: self.chainMonitor!, net_graph: graph, tx_broadcaster: self.txBroadcaster, logger: self.logger)

                let scoringParams = ProbabilisticScoringParameters()
                let probabalisticScorer = ProbabilisticScorer(params: scoringParams, network_graph: graph, logger: self.logger)
                let score = probabalisticScorer.as_Score()
                let multiThreadedScorer = MultiThreadedLockableScore(score: score)

                self.constructor?.chain_sync_completed(persister: TestChannelManagerPersister(master: self), scorer: multiThreadedScorer)
                self.channelManager = self.constructor!.channelManager
                self.peerManager = self.constructor!.peerManager
            }
            self.nodeId = self.channelManager.get_our_node_id()
            try! self.bindSocketHandler()
        }

        fileprivate convenience init(original: Peer) {
            self.init(master: original.master, _dummy: (), seed: original.seed)

            do {
                // channel manager constructor is mandatory
                let graph = NetworkGraph(genesis_hash: [UInt8](repeating: 0, count: 32), logger: self.logger)
                self.constructor = ChannelManagerConstructor(network: LDKNetwork_Bitcoin, config: UserConfig(), current_blockchain_tip_hash: [UInt8](repeating: 0, count: 32), current_blockchain_tip_height: 0, keys_interface: self.keysInterface, fee_estimator: self.feeEstimator, chain_monitor: self.chainMonitor!, net_graph: graph, tx_broadcaster: self.txBroadcaster, logger: self.logger)
                self.constructor?.chain_sync_completed(persister: TestChannelManagerPersister(master: self), scorer: nil)
                self.channelManager = self.constructor!.channelManager
                Task {
                    let events = await original.pendingEventTracker.getEvents()
                    await self.pendingEventTracker.addEvents(events: events)
                }
            }
            self.nodeId = self.channelManager.get_our_node_id()
            try! self.bindSocketHandler()
        }

        private func bindSocketHandler() throws {
            self.tcpSocketHandler = self.constructor!.getTCPPeerHandler()
            print("Attempting to bind socket…")
            for i in 10000...65535 {
                let port = UInt16(i)
                let bound = self.tcpSocketHandler!.bind(address: "127.0.0.1", port: port)
                if bound {
                    print("Bound socket to port \(port) on attempt \(i)")
                    self.tcpPort = port
                    return
                }
            }
            print("Failed to bind on any port")
            throw SocketBindError.failedToBindSocket
        }

        fileprivate func payInvoice() {

        }

        fileprivate func getManualWatch() {

        }

        fileprivate func getManagerEvents(expectedCount: UInt) async throws -> [Event] {
            while true {
                if await self.pendingEventTracker.getCount() >= expectedCount {
                    print("Found enough events for expected count of \(expectedCount)")
                    let events = await self.pendingEventTracker.getAndClearEvents()
                    print("Found event count: \(events.count)")
                    return events
                }
                // sleep for 0.1 seconds
                // try await Task.sleep(nanoseconds: 0_100_000_000)
                await self.pendingEventTracker.awaitAddition()
            }
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
        
        let connectionResult = peerA.tcpSocketHandler?.connect(address: "127.0.0.1", port: peerB.tcpPort!, theirNodeId: peerB.nodeId!)
        print("connection result: \(connectionResult)")
        
    }

    func test_multiple_peer_connections() async {
        let peerA = Peer(master: self, seed: 1)
        let peerB = Peer(master: self, seed: 2)
        let peerC = Peer(master: self, seed: 3)

        let originalPeersA = peerA.peerManager.get_peer_node_ids()
        let originalPeersB = peerB.peerManager.get_peer_node_ids()
        let originalPeersC = peerC.peerManager.get_peer_node_ids()
        XCTAssertEqual(originalPeersA.count, 0)
        XCTAssertEqual(originalPeersB.count, 0)
        XCTAssertEqual(originalPeersC.count, 0)

        do {
            connectPeers(peerA: peerA, peerB: peerB)

            // sleep for one second
            try! await Task.sleep(nanoseconds: 1_000_000_000)
            let connectedPeersA = peerA.peerManager.get_peer_node_ids()
            let connectedPeersB = peerB.peerManager.get_peer_node_ids()
            XCTAssertEqual(connectedPeersA.count, 1)
            XCTAssertEqual(connectedPeersB.count, 1)
        }

        do {
            connectPeers(peerA: peerA, peerB: peerC)

            // sleep for one second
            try! await Task.sleep(nanoseconds: 1_000_000_000)
            let connectedPeersA = peerA.peerManager.get_peer_node_ids()
            let connectedPeersC = peerC.peerManager.get_peer_node_ids()
            XCTAssertEqual(connectedPeersA.count, 2)
            XCTAssertEqual(connectedPeersC.count, 1)
        }

        do {
            // sleep for a total of 10 seconds
            for i in 0..<100 {
                // sleep for 100ms
                try! await Task.sleep(nanoseconds: 0_100_000_000)
            }

            peerA.constructor?.interrupt()
            peerB.constructor?.interrupt()
            peerC.constructor?.interrupt()
        }
    }

    func testMessageHandling() async {

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

        let managerEvents = try! await peer1.getManagerEvents(expectedCount: 1)
        XCTAssertEqual(managerEvents.count, 1)

        let managerEvent = managerEvents[0]
        guard case .FundingGenerationReady = managerEvent.getValueType() else {
            return XCTAssert(false, "Expected .FundingGenerationReady, got \(managerEvent.getValueType())")
        }

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
        let fundingResult = peer1.channelManager.funding_transaction_generated(temporary_channel_id: temporaryChannelId, counterparty_node_id: peer2.channelManager.get_our_node_id(), funding_transaction: serializedFundingTx)
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
        
        let logger = TestLogger()

        do {
            // create invoice for 10k satoshis to pay to peer2

            let invoiceResult = Bindings.swift_create_invoice_from_channelmanager(channelmanager: peer2.channelManager, keys_manager: peer2.keysInterface, logger: logger, network: LDKCurrency_Bitcoin, amt_msat: Option_u64Z.some(o: SEND_MSAT_AMOUNT_A_TO_B), description: "Invoice description", invoice_expiry_delta_secs: 60)
            let invoice = invoiceResult.getValue()!
            print("Invoice: \(invoice.to_str())")

            let recreatedInvoice = Invoice.from_str(s: invoice.to_str())
            XCTAssertTrue(recreatedInvoice.isOk())

            let channelManagerConstructor = peer1.constructor!
            let invoicePayer = channelManagerConstructor.payer!
            let invoicePaymentResult = invoicePayer.pay_invoice(invoice: invoice)
            XCTAssertTrue(invoicePaymentResult.isOk())

            do {
                // process HTLCs
                let peer2Event = try! await peer2.getManagerEvents(expectedCount: 1)[0]
                guard case .PendingHTLCsForwardable = peer2Event.getValueType() else {
                    return XCTAssert(false, "Expected .PendingHTLCsForwardable, got \(peer2Event.getValueType())")
                }
                let pendingHTLCsForwardable = peer2Event.getValueAsPendingHTLCsForwardable()!
                print("forwardable time: \(pendingHTLCsForwardable.getTime_forwardable())")
                peer2.channelManager.process_pending_htlc_forwards()
                print("processed pending HTLC forwards")
            }

            do {
                // process payment
                let peer2Event = try! await peer2.getManagerEvents(expectedCount: 1)[0]
                guard case .PaymentReceived = peer2Event.getValueType() else {
                    return XCTAssert(false, "Expected .PaymentReceived, got \(peer2Event.getValueType())")
                }
                let paymentReceived = peer2Event.getValueAsPaymentReceived()!
                let paymentHash = paymentReceived.getPayment_hash()
                print("received payment of \(paymentReceived.getAmount_msat()) with hash \(paymentHash)")
                let paymentPurpose = paymentReceived.getPurpose()
                guard case .InvoicePayment = paymentPurpose.getValueType() else {
                    return XCTAssert(false, "Expected .InvoicePayment, got \(paymentPurpose.getValueType())")
                }
                let invoicePayment = paymentPurpose.getValueAsInvoicePayment()!
                let preimage = invoicePayment.getPayment_preimage()
                let secret = invoicePayment.getPayment_secret()
                if self.configuration.shouldRecipientRejectPayment {
                    print("about to fail payment because shouldRecipientRejectPayment flag is set")
                    peer2.channelManager.fail_htlc_backwards(payment_hash: paymentHash)
                    print("deliberately failed payment with hash \(paymentHash)")
                    for _ in 0..<10{
                        // this may have a random delay, run it repeatedly
                        peer2.channelManager.process_pending_htlc_forwards()
                        try! await Task.sleep(nanoseconds: 0_100_000_000)
                    }
                } else {
                    peer2.channelManager.claim_funds(payment_preimage: preimage)
                    print("claimed payment with secret \(secret) using preimage \(preimage)")
                }
            }

            if self.configuration.shouldRecipientRejectPayment {
                let peer1Events = try! await peer1.getManagerEvents(expectedCount: 1)
                let paymentPathFailedEvent = peer1Events[0]
                guard case .PaymentPathFailed = paymentPathFailedEvent.getValueType() else {
                    return XCTAssert(false, "Expected .PaymentPathFailed, got \(paymentPathFailedEvent.getValueType())")
                }
                let paymentPathFailed = paymentPathFailedEvent.getValueAsPaymentPathFailed()!
                let failureDescriptor: [String: Any] = [
                    "payment_id": paymentPathFailed.getPayment_id(),
                    "payment_hash": paymentPathFailed.getPayment_hash(),
                    "payment_failed_permanently": paymentPathFailed.getPayment_failed_permanently(),
                    "short_channel_id": paymentPathFailed.getShort_channel_id(),
                    "path": paymentPathFailed.getPath().map { $0.get_short_channel_id() },
                    "network_update": paymentPathFailed.getNetwork_update().getValue().debugDescription
                ]
                
                print("payent path failure: \(failureDescriptor)")
                print("here")
                return
                
            } else {
                // process payment
                let peer1Events = try! await peer1.getManagerEvents(expectedCount: 2)
                let paymentSentEvent = peer1Events[0]
                let paymentPathSuccessfulEvent = peer1Events[1]
                guard case .PaymentSent = paymentSentEvent.getValueType() else {
                    return XCTAssert(false, "Expected .PaymentSent, got \(paymentSentEvent.getValueType())")
                }
                guard case .PaymentPathSuccessful = paymentPathSuccessfulEvent.getValueType() else {
                    return XCTAssert(false, "Expected .PaymentPathSuccessful, got \(paymentPathSuccessfulEvent.getValueType())")
                }
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

            let invoiceResult = Bindings.swift_create_invoice_from_channelmanager(channelmanager: peer1.channelManager, keys_manager: peer1.keysInterface, logger: logger, network: LDKCurrency_Bitcoin, amt_msat: Option_u64Z.none(), description: "Second invoice description", invoice_expiry_delta_secs: 60)
            let invoice = invoiceResult.getValue()!
            print("Implicit amount invoice: \(invoice.to_str())")

			let invoiceString = invoice.to_str()
            let recreatedInvoice = Invoice.from_str(s: invoiceString)
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
                let peer1Event = try! await peer1.getManagerEvents(expectedCount: 1)[0]
                guard case .PendingHTLCsForwardable = peer1Event.getValueType() else {
                    return XCTAssert(false, "Expected .PendingHTLCsForwardable, got \(peer1Event.getValueType())")
                }
                let pendingHTLCsForwardable = peer1Event.getValueAsPendingHTLCsForwardable()!
                print("forwardable time: \(pendingHTLCsForwardable.getTime_forwardable())")
                peer1.channelManager.process_pending_htlc_forwards()
                print("processed pending HTLC forwards")
            }

            do {
                // process payment
                let peer1Event = try! await peer1.getManagerEvents(expectedCount: 1)[0]
                guard case .PaymentReceived = peer1Event.getValueType() else {
                    return XCTAssert(false, "Expected .PaymentReceived, got \(peer1Event.getValueType())")
                }
                let paymentReceived = peer1Event.getValueAsPaymentReceived()!
                let paymentHash = paymentReceived.getPayment_hash()
                print("received payment of \(paymentReceived.getAmount_msat()) with hash \(paymentHash)")
                let paymentPurpose = paymentReceived.getPurpose()
                guard case .InvoicePayment = paymentPurpose.getValueType() else {
                    return XCTAssert(false, "Expected .InvoicePayment, got \(paymentPurpose.getValueType())")
                }
                let invoicePayment = paymentPurpose.getValueAsInvoicePayment()!
                let preimage = invoicePayment.getPayment_preimage()
                let secret = invoicePayment.getPayment_secret()
                peer1.channelManager.claim_funds(payment_preimage: preimage)
                print("claimed payment with secret \(secret) using preimage \(preimage)")
            }

            do {
                // process payment
                let peer2Events = try! await peer2.getManagerEvents(expectedCount: 3)
                print("received event count: \(peer2Events.count)")
                let paymentClaimedEvent = peer2Events[0]
                let paymentSentEvent = peer2Events[1]
                let paymentPathSuccessfulEvent = peer2Events[2]
                guard case .PaymentClaimed = paymentClaimedEvent.getValueType() else {
                    return XCTAssert(false, "Expected .PaymentClaimed, got \(paymentClaimedEvent.getValueType())")
                }
                guard case .PaymentSent = paymentSentEvent.getValueType() else {
                    return XCTAssert(false, "Expected .PaymentSent, got \(paymentSentEvent.getValueType())")
                }
                guard case .PaymentPathSuccessful = paymentPathSuccessfulEvent.getValueType() else {
                    return XCTAssert(false, "Expected .PaymentPathSuccessful, got \(paymentPathSuccessfulEvent.getValueType())")
                }
                let paymentClaimed = paymentClaimedEvent.getValueAsPaymentClaimed()!
                let paymentSent = paymentSentEvent.getValueAsPaymentSent()!
                let paymentPathSuccessful = paymentPathSuccessfulEvent.getValueAsPaymentPathSuccessful()!
                print("sent payment \(paymentSent.getPayment_id()) worth \(paymentClaimed.getAmount_msat()) with fee \(paymentSent.getFee_paid_msat().getValue()) via \(paymentPathSuccessful.getPath().map { h in h.get_short_channel_id() })")
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

            peer1.constructor?.interrupt()
			peer2.constructor?.interrupt()
        }

    }

}
