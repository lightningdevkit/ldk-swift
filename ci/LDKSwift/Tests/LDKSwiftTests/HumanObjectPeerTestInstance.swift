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
        public var useFilter: Bool = false
        public var useRouter: Bool = false
        public var useWrappedSignerProvider: Bool = false
        public var shouldRecipientRejectPayment: Bool = false
        public var ephemeralNetworkGraphForScorer: Bool = false
        public var reserializedProbabilisticScorer: Bool = false

        // public var nice_close: Bool = false;
        // public var use_km_wrapper: Bool = false;
        // public var use_manual_watch: Bool = false;
        // public var reload_peers: Bool = false;
        // public var break_cross_peer_refs: Bool = false;
        // public var use_nio_peer_handler: Bool = false;

        private class func listCustomizeableProperties() -> [String] {
            return ["useFilter", "useRouter", "useWrappedSignerProvider", "shouldRecipientRejectPayment", "ephemeralNetworkGraphForScorer", "reserializedProbabilisticScorer"]
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
        private(set) var filter: Filter?
        private(set) var explicitKeysManager: KeysManager!
        private(set) var wrappedKeysManager: WrappedSignerProviderTests.MyKeysManager?
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

            override func broadcastTransactions(txs: [[UInt8]]) {
                for tx in txs {
                    Task {
                        await self.master.pendingBroadcastTracker.addTransaction(tx: tx)
                    }
                }
            }
        }

        fileprivate class TestFilter: Filter {

            weak var master: Peer!

            fileprivate init(master: Peer) {
                self.master = master
                super.init()
            }

            override func registerOutput(output: WatchedOutput) {
                let outpoint = output.getOutpoint()
                self.master.filterAdditions.insert("\(outpoint.getTxid()):\(outpoint.getIndex())")
            }

            override func registerTx(txid: [UInt8]?, scriptPubkey: [UInt8]) {
                self.master.filterAdditions.insert("\(txid)")
            }
        }

        fileprivate class TestKeysInterface: SignerProvider {

            weak var master: Peer!
            let interface: SignerProvider

            fileprivate init(master: Peer, underlyingInterface: SignerProvider) {
                self.master = master
                self.interface = underlyingInterface
                super.init()
            }

			override func deriveChannelSigner(channelValueSatoshis: UInt64, channelKeysId: [UInt8]) -> Bindings.WriteableEcdsaChannelSigner {
                let ck = self.interface.deriveChannelSigner(channelValueSatoshis: channelValueSatoshis, channelKeysId: channelKeysId)
                return ck
            }
        }

        fileprivate class TestChannelManagerPersister: Persister, ExtendedChannelManagerPersister {

            weak var master: Peer!

            fileprivate init(master: Peer) {
                self.master = master
                super.init()
            }

            func handleEvent(event: Event) {
                // let eventClone = event.clone()
                print("peer \(self.master.seed) received event: \(event.getValueType())")
                Task {
                    // clone to avoid deallocation-related issues
                    await master.pendingEventTracker.addEvent(event: event)
                }
            }

            override func persistScorer(scorer: Bindings.WriteableScore) -> Bindings.Result_NoneIOErrorZ {
                .initWithOk()
            }

            override func persistGraph(networkGraph: Bindings.NetworkGraph) -> Bindings.Result_NoneIOErrorZ {
                let writtenGraph = networkGraph.write();
                return .initWithOk()
            }

            override func persistManager(channelManager: Bindings.ChannelManager) -> Bindings.Result_NoneIOErrorZ {
                .initWithOk()
            }

        }

        fileprivate class TestPersister: Persist {
            override func persistNewChannel(channelId: Bindings.OutPoint, data: Bindings.ChannelMonitor, updateId: Bindings.MonitorUpdateId) -> Bindings.ChannelMonitorUpdateStatus {
                .Completed
            }
            override func updatePersistedChannel(channelId: Bindings.OutPoint, update: Bindings.ChannelMonitorUpdate, data: Bindings.ChannelMonitor, updateId: Bindings.MonitorUpdateId) -> Bindings.ChannelMonitorUpdateStatus {
                .Completed
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
                self.filter = TestFilter(master: self)
            }

            // never use manual watch
            do {
                self.chainMonitor = ChainMonitor(chainSource: self.filter, broadcaster: self.txBroadcaster, logger: self.logger, feeest: self.feeEstimator, persister: persister)
                self.chainWatch = self.chainMonitor!.asWatch()
            }

            var keySeed = [UInt8](repeating: 0, count: 32)
            for i in 0..<32 {
                keySeed[i] = UInt8(i) ^ seed
            }

            let timestamp_seconds = UInt64(NSDate().timeIntervalSince1970)
            let timestamp_nanos = UInt32(truncating: NSNumber(value: timestamp_seconds * 1000 * 1000))
            let keysManager = KeysManager(seed: keySeed, startingTimeSecs: timestamp_seconds, startingTimeNanos: timestamp_nanos)
            self.explicitKeysManager = keysManager

            if master.configuration.useWrappedSignerProvider {
                self.wrappedKeysManager = WrappedSignerProviderTests.MyKeysManager(seed: keySeed, startingTimeSecs: timestamp_seconds, startingTimeNanos: timestamp_nanos)
            }

            if master.configuration.useRouter {
                let networkGraph = NetworkGraph(network: .Regtest, logger: self.logger)
                self.router = GossipSync.initWithP2P(a: P2PGossipSync(networkGraph: networkGraph, utxoLookup: nil, logger: self.logger))
            } else {
                self.router = GossipSync.none()
            }
        }

        fileprivate convenience init(master: HumanObjectPeerTestInstance, seed: UInt8) {
            self.init(master: master, _dummy: (), seed: seed)

            do {
                // channel manager constructor is mandatory

                let graph = NetworkGraph(network: .Regtest, logger: self.logger)
                var scorerGraph = graph
                if master.configuration.ephemeralNetworkGraphForScorer {
                    scorerGraph = NetworkGraph(network: .Regtest, logger: self.logger)
                }

                let decayParams = ProbabilisticScoringDecayParameters.initWithDefault()
                var probabalisticScorer = ProbabilisticScorer(decayParams: decayParams, networkGraph: scorerGraph, logger: self.logger)
                if master.configuration.reserializedProbabilisticScorer {
                    let serializedScorer = probabalisticScorer.write()
                    let probabalisticScorerResult = ProbabilisticScorer.read(ser: serializedScorer, argA: decayParams, argB: scorerGraph, argC: self.logger)
                    probabalisticScorer = probabalisticScorerResult.getValue()!
                }
                let score = probabalisticScorer.asScore()
                let multiThreadedScorer = MultiThreadedLockableScore(score: score)

                let signerProvider = master.configuration.useWrappedSignerProvider ? self.wrappedKeysManager!.signerProvider : self.explicitKeysManager.asSignerProvider()
                let constructionParameters = ChannelManagerConstructionParameters(
                    config: UserConfig.initWithDefault(),
                    entropySource: self.explicitKeysManager.asEntropySource(),
                    nodeSigner: self.explicitKeysManager.asNodeSigner(),
                    signerProvider: signerProvider,
                    feeEstimator: self.feeEstimator,
                    chainMonitor: self.chainMonitor!,
                    txBroadcaster: self.txBroadcaster,
                    logger: self.logger,
                    scorer: multiThreadedScorer
                )

                self.constructor = ChannelManagerConstructor(network: .Bitcoin, currentBlockchainTipHash: [UInt8](repeating: 0, count: 32), currentBlockchainTipHeight: 0, netGraph: graph, params: constructionParameters)

                self.constructor?.chainSyncCompleted(persister: TestChannelManagerPersister(master: self))
                self.channelManager = self.constructor!.channelManager
                self.peerManager = self.constructor!.peerManager
            }
            self.nodeId = self.channelManager.getOurNodeId()
            try! self.bindSocketHandler()
        }

        fileprivate convenience init(original: Peer) {
            self.init(master: original.master, _dummy: (), seed: original.seed)

            do {
                // channel manager constructor is mandatory
                let graph = NetworkGraph(network: .Bitcoin, logger: self.logger)

                let constructionParameters = ChannelManagerConstructionParameters(
                    config: UserConfig.initWithDefault(),
                    entropySource: self.explicitKeysManager.asEntropySource(),
                    nodeSigner: self.explicitKeysManager.asNodeSigner(),
                    signerProvider: self.explicitKeysManager.asSignerProvider(),
                    feeEstimator: self.feeEstimator,
                    chainMonitor: self.chainMonitor!,
                    txBroadcaster: self.txBroadcaster,
                    logger: self.logger
                )
                self.constructor = ChannelManagerConstructor(network: .Bitcoin, currentBlockchainTipHash: [UInt8](repeating: 0, count: 32), currentBlockchainTipHeight: 0, netGraph: graph, params: constructionParameters)
                self.constructor?.chainSyncCompleted(persister: TestChannelManagerPersister(master: self))
                self.channelManager = self.constructor!.channelManager
                Task {
                    let events = await original.pendingEventTracker.getEvents()
                    await self.pendingEventTracker.addEvents(events: events)
                }
            }
            self.nodeId = self.channelManager.getOurNodeId()
            try! self.bindSocketHandler()
        }

        private func bindSocketHandler() throws {
            self.tcpSocketHandler = self.constructor!.getTCPPeerHandler()
            print("Attempting to bind socket…")
            for i in 10000...65535 {
                let port = UInt16(i)
                let bound = self.tcpSocketHandler!.bind(address: "127.0.0.1", port: port)
                if bound {
                    print("Bound socket to port \(port) on attempt \(i-9999)")
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
            print("Awaiting \(expectedCount) manager events…")
            while true {
                if await self.pendingEventTracker.getCount() >= expectedCount {
                    print("Found enough manager events for expected count of \(expectedCount)")
                    let events = await self.pendingEventTracker.getAndClearEvents()
                    print("Found manager event count: \(events.count)")
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
            var transactionTuples: [(UInt, [UInt8])] = []

            if block.transactions.count > 0 {
                XCTAssertEqual(block.transactions.count, 1)
                transactionTuples.append((0, block.transactions[0].serialize()))
            }

            if let chainMonitor = self.chainMonitor {
                self.channelManager.asListen().blockConnected(block: blockSerialization, height: height)
                chainMonitor.asListen().blockConnected(block: blockSerialization, height: height)
            } else {
                let blockHeader = block.calculateHeader()
                self.channelManager.asConfirm().transactionsConfirmed(header: blockHeader, txdata: transactionTuples, height: height)
                self.channelManager.asConfirm().bestBlockUpdated(header: blockHeader, height: height)

                for (_, monitor) in self.monitors {
                    let connectionResult = monitor.blockConnected(header: blockHeader, txdata: transactionTuples, height: height, broadcaster: self.txBroadcaster, feeEstimator: self.feeEstimator, logger: self.logger)
                    XCTAssertEqual(connectionResult.count, expectedMonitorUpdateLength)
                }
            }

        }

        deinit {
            print("deiniting Peer")
        }

    }

    func do_read_event(pm: PeerManager, descriptor: SocketDescriptor, data: [UInt8]) {
        let res = pm.readEvent(peerDescriptor: descriptor, data: data)
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

        let originalPeersA = peerA.peerManager.getPeerNodeIds()
        let originalPeersB = peerB.peerManager.getPeerNodeIds()
        let originalPeersC = peerC.peerManager.getPeerNodeIds()
        XCTAssertEqual(originalPeersA.count, 0)
        XCTAssertEqual(originalPeersB.count, 0)
        XCTAssertEqual(originalPeersC.count, 0)

        do {
            connectPeers(peerA: peerA, peerB: peerB)

            // sleep for one second
            try! await Task.sleep(nanoseconds: 1_000_000_000)
            let connectedPeersA = peerA.peerManager.getPeerNodeIds()
            let connectedPeersB = peerB.peerManager.getPeerNodeIds()
            XCTAssertEqual(connectedPeersA.count, 1)
            XCTAssertEqual(connectedPeersB.count, 1)
        }

        do {
            connectPeers(peerA: peerA, peerB: peerC)

            // sleep for one second
            try! await Task.sleep(nanoseconds: 1_000_000_000)
            let connectedPeersA = peerA.peerManager.getPeerNodeIds()
            let connectedPeersC = peerC.peerManager.getPeerNodeIds()
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
    
    fileprivate class func openChannel(peerA: Peer, peerB: Peer, fundingAmount: UInt64, latestBlock: BTCBlock? = nil, otherPeers: [Peer] = []) async -> BTCBlock? {
        do {
            // initiate channel opening
            let config = UserConfig.initWithDefault()
            let theirNodeId = peerB.channelManager.getOurNodeId()
            let userChannelId: [UInt8] = [UInt8](repeating: 42, count: 16);
            let channelOpenResult = peerA.channelManager.createChannel(theirNetworkKey: theirNodeId, channelValueSatoshis: fundingAmount, pushMsat: 1000, userChannelId: userChannelId, overrideConfig: config)

            XCTAssertTrue(channelOpenResult.isOk())
            let channels = peerA.channelManager.listChannels()
            let firstChannel = channels[0]
            let fundingTxo = firstChannel.getFundingTxo()
            XCTAssertNil(fundingTxo)
        }

        let channelsA = peerA.channelManager.listChannels()
        XCTAssertEqual(channelsA.count, 1)

        let managerEvents = try! await peerA.getManagerEvents(expectedCount: 1)
        XCTAssertEqual(managerEvents.count, 1)

        let managerEvent = managerEvents[0]
        guard case .FundingGenerationReady = managerEvent.getValueType() else {
            XCTAssert(false, "Expected .FundingGenerationReady, got \(managerEvent.getValueType())")
            return nil
        }

        let fundingReadyEvent = managerEvent.getValueAsFundingGenerationReady()!
        XCTAssertEqual(fundingReadyEvent.getChannelValueSatoshis(), fundingAmount)
        let expectedUserChannelId: [UInt8] = [UInt8](repeating: 42, count: 16);
        XCTAssertEqual(fundingReadyEvent.getUserChannelId(), expectedUserChannelId)

        let fundingOutputScript = fundingReadyEvent.getOutputScript();
        let temporaryChannelId = fundingReadyEvent.getTemporaryChannelId();

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

        let output = BTCTransaction.Output(value: fundingAmount, script: fundingOutputScript)
        fundingTransaction.outputs = [output]
        let serializedFundingTx = fundingTransaction.serialize()
        let fundingResult = peerA.channelManager.fundingTransactionGenerated(temporaryChannelId: temporaryChannelId, counterpartyNodeId: peerB.channelManager.getOurNodeId(), fundingTransaction: serializedFundingTx)
        XCTAssertTrue(fundingResult.isOk())

        let pendingBroadcasts = await peerA.getPendingBroadcasts(expectedCount: 1)

        XCTAssertEqual(pendingBroadcasts.count, 1)
        XCTAssertEqual(pendingBroadcasts.first!, serializedFundingTx)

        let fundingBlock = BTCBlock()
        fundingBlock.version = 2
        fundingBlock.previousBlockHash = latestBlock?.calculateHash() ?? BTCHashing.SHA_ZERO_HASH
        fundingBlock.merkleRoot = BTCHashing.SHA_ZERO_HASH
        fundingBlock.timestamp = 42
        fundingBlock.difficultyTarget = 0
        fundingBlock.nonce = 0
        fundingBlock.height = (latestBlock?.height ?? 0) + 1;
        fundingBlock.transactions = [fundingTransaction]

        print("Connecting funding block…")
        peerA.connectBlock(block: fundingBlock, height: fundingBlock.height, expectedMonitorUpdateLength: 0)
        peerB.connectBlock(block: fundingBlock, height: fundingBlock.height, expectedMonitorUpdateLength: 0)
        for currentPeer in otherPeers {
            currentPeer.connectBlock(block: fundingBlock, height: fundingBlock.height, expectedMonitorUpdateLength: 0)
        }

        print("Connecting confirmation blocks…")
        var previousBlock = fundingBlock
        for height in (fundingBlock.height+1)..<(fundingBlock.height+100) {
            let currentBlock = BTCBlock()
            currentBlock.version = 2
            currentBlock.previousBlockHash = previousBlock.calculateHash()
            currentBlock.merkleRoot = BTCHashing.SHA_ZERO_HASH
            currentBlock.timestamp = UInt32(42 + height)
            currentBlock.difficultyTarget = 0
            currentBlock.nonce = 0
            currentBlock.height = height

            peerA.connectBlock(block: currentBlock, height: UInt32(height), expectedMonitorUpdateLength: 0)
            peerB.connectBlock(block: currentBlock, height: UInt32(height), expectedMonitorUpdateLength: 0)
            for currentPeer in otherPeers {
                currentPeer.connectBlock(block: currentBlock, height: UInt32(height), expectedMonitorUpdateLength: 0)
            }
            previousBlock = currentBlock
        }

        let peer1Events = try! await peerA.getManagerEvents(expectedCount: 2)
        let peer1ReadyEvent = peer1Events[1]
        guard case .ChannelReady = peer1ReadyEvent.getValueType() else {
            XCTAssert(false, "Expected .ChannelReady, got \(peer1ReadyEvent.getValueType())")
            return nil
        }

        let peer2Events = try! await peerB.getManagerEvents(expectedCount: 2)
        let peer2ReadyEvent = peer2Events[1]
        guard case .ChannelReady = peer2ReadyEvent.getValueType() else {
            XCTAssert(false, "Expected .ChannelReady, got \(peer2ReadyEvent.getValueType())")
            return nil
        }

        var usableChannelsA = [ChannelDetails]()
        var usableChannelsB = [ChannelDetails]()
        print("Awaiting usable channels to populate…")
        while (usableChannelsA.isEmpty || usableChannelsB.isEmpty) {
            usableChannelsA = peerA.channelManager.listUsableChannels()
            usableChannelsB = peerB.channelManager.listUsableChannels()
            // sleep for 100ms
            try! await Task.sleep(nanoseconds: 0_100_000_000)
        }
        print("Usable channels have been populated")

        XCTAssertEqual(usableChannelsA.count, 1)
        XCTAssertEqual(usableChannelsB.count, 1)

        let channelAToB = usableChannelsA[0]
        let channelBToA = usableChannelsB[0]
        XCTAssertEqual(channelAToB.getChannelValueSatoshis(), fundingAmount)
        let shortChannelId = channelAToB.getShortChannelId()!

        let fundingTxId = fundingTransaction.calculateId()
        XCTAssertEqual(usableChannelsA[0].getChannelId(), fundingTxId)
        XCTAssertEqual(usableChannelsB[0].getChannelId(), fundingTxId)

        let originalChannelBalanceAToB = channelAToB.getBalanceMsat()
        let originalChannelBalanceBToA = channelBToA.getBalanceMsat()
        print("original balance A->B mSats: \(originalChannelBalanceAToB)")
        print("original balance B->A mSats: \(originalChannelBalanceBToA)")
        
        // return the latest block after activating the channel
        return previousBlock
    }

    func testMessageHandling() async {

        let FUNDING_SATOSHI_AMOUNT: UInt64 = 100_000 // 100k satoshis
        let SEND_MSAT_AMOUNT_A_TO_B: UInt64 = 10_000_000 // 10k satoshis
        let SEND_MSAT_AMOUNT_B_TO_A: UInt64 = 3_000_000 // 3k satoshis
        let SEND_MSAT_AMOUNT_A_TO_C: UInt64 = 5_000_000 // 5k satoshis, with intermediate hop

        let peer1 = Peer(master: self, seed: 1)
        let peer2 = Peer(master: self, seed: 2)
        let peer3 = Peer(master: self, seed: 3)

        do {
            // connect the nodes
            let originalPeersA = peer1.peerManager.getPeerNodeIds()
            let originalPeersB = peer2.peerManager.getPeerNodeIds()
            XCTAssertEqual(originalPeersA.count, 0)
            XCTAssertEqual(originalPeersB.count, 0)

            connectPeers(peerA: peer1, peerB: peer2)
            connectPeers(peerA: peer2, peerB: peer3)

            // sleep for one second
            try! await Task.sleep(nanoseconds: 1_000_000_000)

            let connectedPeersA = peer1.peerManager.getPeerNodeIds()
            let connectedPeersB = peer2.peerManager.getPeerNodeIds()
            let connectedPeersC = peer3.peerManager.getPeerNodeIds()
            XCTAssertEqual(connectedPeersA.count, 1)
            XCTAssertEqual(connectedPeersB.count, 2)
            XCTAssertEqual(connectedPeersC.count, 1)
        }

        var confirmedChannelBlock = await HumanObjectPeerTestInstance.openChannel(peerA: peer1, peerB: peer2, fundingAmount: FUNDING_SATOSHI_AMOUNT, otherPeers: [peer3])
        
        let usableChannelsA = peer1.channelManager.listUsableChannels()
        let usableChannelsB = peer2.channelManager.listUsableChannels()
        let channelAToB = usableChannelsA[0]
        let channelBToA = usableChannelsB[0]
        
        // confirmedChannelBlock = await HumanObjectPeerTestInstance.openChannel(peerA: peer2, peerB: peer3, fundingAmount: FUNDING_SATOSHI_AMOUNT, latestBlock: confirmedChannelBlock, otherPeers: [peer1])
        
        let originalChannelBalanceAToB = channelAToB.getBalanceMsat()
        let originalChannelBalanceBToA = channelBToA.getBalanceMsat()
        
        let secondChannelBalanceAToB = channelAToB.getBalanceMsat()
        let secondChannelBalanceBToA = channelBToA.getBalanceMsat()
        
        let logger = TestLogger()

        do {
            // create invoice for 10k satoshis to pay to peer2

            let invoiceResult = Bindings.createInvoiceFromChannelmanager(channelmanager: peer2.channelManager, nodeSigner: peer2.explicitKeysManager.asNodeSigner(), logger: logger, network: .Bitcoin, amtMsat: SEND_MSAT_AMOUNT_A_TO_B, description: "Invoice description", invoiceExpiryDeltaSecs: 60, minFinalCltvExpiryDelta: 24)
            if let invoiceError = invoiceResult.getError(){
                let creationError = invoiceError.getValueAsCreationError()
                print("creation error: \(creationError)")
            }
            let invoice = invoiceResult.getValue()!
            print("Invoice: \(invoice.toStr())")

            let recreatedInvoice = Bolt11Invoice.fromStr(s: invoice.toStr())
            XCTAssertTrue(recreatedInvoice.isOk())

            // find route

            do {
                let payerPubkey = peer1.channelManager.getOurNodeId()
                let payeePubkey = peer2.channelManager.getOurNodeId()
                let paymentParameters = PaymentParameters.initForKeysend(payeePubkey: payeePubkey, finalCltvExpiryDelta: 3, allowMpp: false)

                let amount = invoice.amountMilliSatoshis()!
                let routeParameters = RouteParameters(paymentParamsArg: paymentParameters, finalValueMsatArg: amount, maxTotalRoutingFeeMsatArg: nil)
                let randomSeedBytes: [UInt8] = [UInt8](repeating: 0, count: 32)
                let scoringParams = ProbabilisticScoringDecayParameters.initWithDefault()
                let networkGraph = peer1.constructor!.netGraph!
                let scorer = ProbabilisticScorer(decayParams: scoringParams, networkGraph: networkGraph, logger: logger)
                let score = scorer.asScoreLookUp()

                let scoreParams = ProbabilisticScoringFeeParameters.initWithDefault()

                let foundRoute = Bindings.findRoute(
                    ourNodePubkey: payerPubkey,
                    routeParams: routeParameters,
                    networkGraph: networkGraph,
                    firstHops: usableChannelsA,
                    logger: logger,
                    scorer: score,
                    scoreParams: scoreParams,
                    randomSeedBytes: randomSeedBytes
                )

                let route = foundRoute.getValue()!
                let fees = route.getTotalFees()
                print("found route fees: \(fees)")
            }

            let channelManagerConstructor = peer1.constructor!
            let invoicePaymentResult = Bindings.payInvoice(invoice: invoice, retryStrategy: Bindings.Retry.initWithAttempts(a: 3), channelmanager: channelManagerConstructor.channelManager)
            XCTAssertTrue(invoicePaymentResult.isOk())

            do {
                // process HTLCs
                let peer2Event = try! await peer2.getManagerEvents(expectedCount: 1)[0]
                guard case .PendingHTLCsForwardable = peer2Event.getValueType() else {
                    return XCTAssert(false, "Expected .PendingHTLCsForwardable, got \(peer2Event.getValueType())")
                }
                let pendingHTLCsForwardable = peer2Event.getValueAsPendingHtlcsForwardable()!
                print("forwardable time: \(pendingHTLCsForwardable.getTimeForwardable())")
                peer2.channelManager.processPendingHtlcForwards()
                print("processed pending HTLC forwards")
            }

            do {
                // process payment
                let peer2Event = try! await peer2.getManagerEvents(expectedCount: 1)[0]
                guard case .PaymentClaimable = peer2Event.getValueType() else {
                    return XCTAssert(false, "Expected .PaymentReceived, got \(peer2Event.getValueType())")
                }
                let paymentClaimable = peer2Event.getValueAsPaymentClaimable()!
                let paymentHash = paymentClaimable.getPaymentHash()
                print("received payment of \(paymentClaimable.getAmountMsat()) with hash \(paymentHash)")
                let paymentPurpose = paymentClaimable.getPurpose()
                guard case .InvoicePayment = paymentPurpose.getValueType() else {
                    return XCTAssert(false, "Expected .InvoicePayment, got \(paymentPurpose.getValueType())")
                }
                let invoicePayment = paymentPurpose.getValueAsInvoicePayment()!
                let preimage = invoicePayment.getPaymentPreimage()!
                let secret = invoicePayment.getPaymentSecret()
                if self.configuration.shouldRecipientRejectPayment {
                    print("about to fail payment because shouldRecipientRejectPayment flag is set")
                    peer2.channelManager.failHtlcBackwards(paymentHash: paymentHash)
                    print("deliberately failed payment with hash \(paymentHash)")
                    for _ in 0..<10{
                        // this may have a random delay, run it repeatedly
                        peer2.channelManager.processPendingHtlcForwards()
                        try! await Task.sleep(nanoseconds: 0_100_000_000)
                    }
                } else {
                    peer2.channelManager.claimFunds(paymentPreimage: preimage)
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
                    "payment_id": paymentPathFailed.getPaymentId(),
                    "payment_hash": paymentPathFailed.getPaymentHash(),
                    "payment_failed_permanently": paymentPathFailed.getPaymentFailedPermanently(),
                    "short_channel_id": paymentPathFailed.getShortChannelId(),
                    "path": paymentPathFailed.getPath().getHops().map { $0.getShortChannelId() },
                    "failure": paymentPathFailed.getFailure()
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
                print("sent payment \(paymentSent.getPaymentId()) with fee \(paymentSent.getFeePaidMsat()) via \(paymentPathSuccessful.getPath().getHops().map { h in h.getShortChannelId() })")
            }

            var currentChannelABalance = secondChannelBalanceAToB
            var currentChannelBBalance = secondChannelBalanceBToA
            while true {
                let channelA = peer1.channelManager.listUsableChannels()[0]
                let channelB = peer2.channelManager.listUsableChannels()[0]
                currentChannelABalance = channelA.getBalanceMsat()
                currentChannelBBalance = channelB.getBalanceMsat()
                if currentChannelABalance != secondChannelBalanceAToB && currentChannelBBalance != secondChannelBalanceBToA {
                    break
                }
                // sleep for 100ms
                try! await Task.sleep(nanoseconds: 0_100_000_000)
            }

            let invoicePayment = invoicePaymentResult.getValue()!
            XCTAssertEqual(currentChannelABalance, secondChannelBalanceAToB - SEND_MSAT_AMOUNT_A_TO_B)
            XCTAssertEqual(currentChannelBBalance, secondChannelBalanceBToA + SEND_MSAT_AMOUNT_A_TO_B)
        }

        do {
            // send some money back
            // create invoice for 10k satoshis to pay to peer2
            let prePaymentBalanceAToB = peer1.channelManager.listUsableChannels()[0].getBalanceMsat()
            let prePaymentBalanceBToA = peer2.channelManager.listUsableChannels()[0].getBalanceMsat()
            print("pre-payment balance A->B mSats: \(prePaymentBalanceAToB)")
            print("pre-payment balance B->A mSats: \(prePaymentBalanceBToA)")

            let invoiceResult = Bindings.createInvoiceFromChannelmanager(channelmanager: peer1.channelManager, nodeSigner: peer1.explicitKeysManager.asNodeSigner(), logger: logger, network: .Bitcoin, amtMsat: nil, description: "Second invoice description", invoiceExpiryDeltaSecs: 60, minFinalCltvExpiryDelta: 24)
            let invoice = invoiceResult.getValue()!
            print("Implicit amount invoice: \(invoice.toStr())")

			let invoiceString = invoice.toStr()
            let recreatedInvoice = Bolt11Invoice.fromStr(s: invoiceString)
            XCTAssertTrue(recreatedInvoice.isOk())

            let invoicePaymentResult = Bindings.payZeroValueInvoice(invoice: invoice, amountMsats: SEND_MSAT_AMOUNT_B_TO_A, retryStrategy: Retry.initWithAttempts(a: 3), channelmanager: peer2.channelManager)
            if let error = invoicePaymentResult.getError() {
                print("value type: \(error.getValueType())")
                if let routingError = error.getValueAsSending() {
                    print("sending error: \(routingError)")
                }
            }
            XCTAssertTrue(invoicePaymentResult.isOk())

            do {
                // process HTLCs
                let peer1Event = try! await peer1.getManagerEvents(expectedCount: 1)[0]
                guard case .PendingHTLCsForwardable = peer1Event.getValueType() else {
                    return XCTAssert(false, "Expected .PendingHTLCsForwardable, got \(peer1Event.getValueType())")
                }
                let pendingHTLCsForwardable = peer1Event.getValueAsPendingHtlcsForwardable()!
                print("forwardable time: \(pendingHTLCsForwardable.getTimeForwardable())")
                peer1.channelManager.processPendingHtlcForwards()
                print("processed pending HTLC forwards")
            }

            do {
                // process payment
                let peer1Event = try! await peer1.getManagerEvents(expectedCount: 1)[0]
                guard case .PaymentClaimable = peer1Event.getValueType() else {
                    return XCTAssert(false, "Expected .PaymentReceived, got \(peer1Event.getValueType())")
                }
                let paymentClaimable = peer1Event.getValueAsPaymentClaimable()!
                let paymentHash = paymentClaimable.getPaymentHash()
                print("received payment of \(paymentClaimable.getAmountMsat()) with hash \(paymentHash)")
                let paymentPurpose = paymentClaimable.getPurpose()
                guard case .InvoicePayment = paymentPurpose.getValueType() else {
                    return XCTAssert(false, "Expected .InvoicePayment, got \(paymentPurpose.getValueType())")
                }
                let invoicePayment = paymentPurpose.getValueAsInvoicePayment()!
                let preimage = invoicePayment.getPaymentPreimage()!
                let secret = invoicePayment.getPaymentSecret()
                peer1.channelManager.claimFunds(paymentPreimage: preimage)
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
                print("sent payment \(paymentSent.getPaymentId()) worth \(paymentClaimed.getAmountMsat()) with fee \(paymentSent.getFeePaidMsat()) via \(paymentPathSuccessful.getPath().getHops().map { h in h.getShortChannelId() })")
            }

            var currentChannelABalance = prePaymentBalanceAToB
            var currentChannelBBalance = prePaymentBalanceBToA
            while true {
                let channelA = peer1.channelManager.listUsableChannels()[0]
                let channelB = peer2.channelManager.listUsableChannels()[0]
                currentChannelABalance = channelA.getBalanceMsat()
                currentChannelBBalance = channelB.getBalanceMsat()
                if currentChannelABalance != prePaymentBalanceAToB && currentChannelBBalance != prePaymentBalanceBToA {
                    break
                }
                // sleep for 100ms
                try! await Task.sleep(nanoseconds: 0_100_000_000)
            }

            let invoicePayment = invoicePaymentResult.getValue()!
            XCTAssertEqual(currentChannelABalance, prePaymentBalanceAToB + SEND_MSAT_AMOUNT_B_TO_A)
            XCTAssertEqual(currentChannelBBalance, prePaymentBalanceBToA - SEND_MSAT_AMOUNT_B_TO_A)
            XCTAssertEqual(currentChannelABalance, secondChannelBalanceAToB - SEND_MSAT_AMOUNT_A_TO_B + SEND_MSAT_AMOUNT_B_TO_A)
            XCTAssertEqual(currentChannelBBalance, secondChannelBalanceBToA + SEND_MSAT_AMOUNT_A_TO_B - SEND_MSAT_AMOUNT_B_TO_A)
        }


        do {
            // sleep for 5 seconds to ensure sanity
            try! await Task.sleep(nanoseconds: 5_000_000_000)

            peer1.constructor?.interrupt()
			peer2.constructor?.interrupt()
        }

    }

}
