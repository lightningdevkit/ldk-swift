//
// Created by Arik Sosman on 4/17/22.
//

import Foundation


@available(iOS 15.0, *)
public class PolarIntegrationSample {

    enum TestFlowExceptions: Error {
        case unexpectedChannelManagerEventType
        case missingInvoicePayer
        case invoiceParsingError(ParseOrSemanticError)
        case hexParsingError
        case invalidOutputScript
        case outputScriptMissingAddresses
        case paymentPathUnsuccessful
    }

    static let WALLET_NAME = "POLAR_LDK_INTEGRATION_TEST_WALLET"
    static let BOGUS_OUTPUT_SCRIPT: [UInt8] = [0, 1, 0]

    // EDIT ME
    static let POLAR_LND_PEER_PUBKEY_HEX = "022ebd21c61ab89eef5313e72666093e946d78bad8db5569c3dbedd7e9b10c2774"
    static let POLAR_LND_PEER_INVOICE = "lnbcrt500u1p34cr64pp5w4k29c568d9ccaycm9pmestdfu5w3tn9w90rdyslxk0g5gtrfdrsdq62pshjmt9de6zqar0yp3kzun0dssp5j6mf3g5fuz6eadz7hj9sg9ndjn5zcgjtuxsd9wycjnwhlwh56zsqmqz9gxqrrsscqp79q2sqqqqqysgqqah206m7ajavcyag4jjzqacwltk5tsrjsf0fw2pmvzpkhs32cj3y483ktfqxcr787tcf8m0qlzatt6435dvf0gkvh30grhkl5du4u2spaf7anm"

    func testPolarFlow() async throws {
        
        Bindings.setLogThreshold(severity: .DEBUG)
        
        let rpcInterface = try RegtestBlockchainManager(rpcProtocol: .http, rpcDomain: "localhost", rpcPort: 18443, rpcUsername: "polaruser", rpcPassword: "polarpass")
        // let help = try await rpcInterface.getHelp()
        // print(help)

        try await self.ascertainSpareMoney(rpcInterface: rpcInterface)
        try await rpcInterface.preloadMonitor(anchorHeight: .chaintip)

        // let seed: [UInt8] = [UInt8](Data(base64Encoded: "//////////////////////////////////////////8=")!)
        var seed = [UInt8](repeating: 0, count: 32)
        let status = SecRandomCopyBytes(kSecRandomDefault, seed.count, &seed)

        let timestamp_seconds = UInt64(NSDate().timeIntervalSince1970)
        let timestamp_nanos = UInt32(truncating: NSNumber(value: timestamp_seconds * 1000 * 1000))
        let keysManager = KeysManager(seed: seed, startingTimeSecs: timestamp_seconds, startingTimeNanos: timestamp_nanos)
        let keysInterface = keysManager.asKeysInterface()

        let logger = LDKTraitImplementations.PolarLogger()
        let config = UserConfig.initWithDefault()
        let lightningNetwork = Bindings.Network.Regtest
        let genesisHash = try await rpcInterface.getBlockHash(height: 0)
        let reversedGenesisHash = [UInt8](genesisHash.reversed())
        let chaintipHash = try await rpcInterface.getChaintipHash()
        let reversedChaintipHash = [UInt8](chaintipHash.reversed())
        let chaintipHeight = try await rpcInterface.getChaintipHeight()
        let networkGraph = NetworkGraph(genesisHash: reversedGenesisHash, logger: logger)

        let scoringParams = ProbabilisticScoringParameters.initWithDefault()
        let probabalisticScorer = ProbabilisticScorer(params: scoringParams, networkGraph: networkGraph, logger: logger)
        let score = probabalisticScorer.asScore()
        let multiThreadedScorer = MultiThreadedLockableScore(score: score)

        print("Genesis hash: \(PolarIntegrationSample.bytesToHexString(bytes: genesisHash))")
        print("Genesis hash reversed: \(PolarIntegrationSample.bytesToHexString(bytes: reversedGenesisHash))")
        print("Block 1 hash: \(try await rpcInterface.getBlockHashHex(height: 1))")
        print("Block 2 hash: \(try await rpcInterface.getBlockHashHex(height: 2))")
        print("Chaintip hash: \(PolarIntegrationSample.bytesToHexString(bytes: chaintipHash))")
        print("Chaintip hash reversed: \(PolarIntegrationSample.bytesToHexString(bytes: reversedChaintipHash))")

        let feeEstimator = LDKTraitImplementations.PolarFeeEstimator()
        let broadcaster = LDKTraitImplementations.PolarBroadcaster(rpcInterface: rpcInterface)
        let channelMonitorPersister = LDKTraitImplementations.PolarChannelMonitorPersister()
        let channelManagerAndNetworkGraphPersisterAndEventHandler = LDKTraitImplementations.PolarChannelManagerAndNetworkGraphPersisterAndEventHandler()
        let chainMonitor = ChainMonitor(chainSource: nil, broadcaster: broadcaster, logger: logger, feeest: feeEstimator, persister: channelMonitorPersister)

        let channelManagerConstructor = ChannelManagerConstructor(network: lightningNetwork, config: config, currentBlockchainTipHash: reversedChaintipHash, currentBlockchainTipHeight: UInt32(chaintipHeight), keysInterface: keysInterface, feeEstimator: feeEstimator, chainMonitor: chainMonitor, netGraph: networkGraph, txBroadcaster: broadcaster, logger: logger)
        let channelManager = channelManagerConstructor.channelManager
        let peerManager = channelManagerConstructor.peerManager
        let tcpPeerHandler = channelManagerConstructor.getTCPPeerHandler()
        if let netGraph = channelManagerConstructor.netGraph {
            print("net graph available!")
        }
        
        

        struct Listener: BlockchainListener {
            private let channelManager: ChannelManager
            private let chainMonitor: ChainMonitor

            init(channelManager: ChannelManager, chainMonitor: ChainMonitor) {
                self.channelManager = channelManager
                self.chainMonitor = chainMonitor
            }

            func blockConnected(block: [UInt8], height: UInt32) {
                self.channelManager.asListen().blockConnected(block: block, height: height)
                self.chainMonitor.asListen().blockConnected(block: block, height: height)
            }

            func blockDisconnected(header: [UInt8]?, height: UInt32) {
                self.chainMonitor.asListen().blockDisconnected(header: header, height: height)
                self.channelManager.asListen().blockDisconnected(header: header, height: height)
            }
        }


        let listener = Listener(channelManager: channelManager, chainMonitor: chainMonitor)
        rpcInterface.registerListener(listener);
        async let monitor = try rpcInterface.monitorBlockchain()
        channelManagerConstructor.chainSyncCompleted(persister: channelManagerAndNetworkGraphPersisterAndEventHandler, scorer: multiThreadedScorer)

        guard let lndPubkey = PolarIntegrationSample.hexStringToBytes(hexString: PolarIntegrationSample.POLAR_LND_PEER_PUBKEY_HEX) else {
            throw TestFlowExceptions.hexParsingError
        }
        let connectionSuccess = tcpPeerHandler.connect(address: "127.0.0.1", port: 9937, theirNodeId: lndPubkey)
        assert(connectionSuccess)

        // sleep for one second
        try await Task.sleep(nanoseconds: 1_000_000_000)
        let connectedPeers = peerManager.getPeerNodeIds()

        let channelValue: UInt64 = 1_300_000 // 1.3 million satoshis, or 0.013 BTC
        let channelValueBtcString = "0.013"
        let reserveAmount: UInt64 = 1000 // a thousand satoshis rserve
		let userChannelId: [UInt8] = [UInt8](repeating: 42, count: 16);
		let channelOpenResult = channelManager.createChannel(theirNetworkKey: lndPubkey, channelValueSatoshis: channelValue, pushMsat: reserveAmount, userChannelId: userChannelId, overrideConfig: config)

        if let channelOpenError = channelOpenResult.getError() {
            print("error type: \(channelOpenError.getValueType())")
            if let error = channelOpenError.getValueAsApiMisuseError() {
                print("API misuse error: \(error.getErr())")
            } else if let error = channelOpenError.getValueAsChannelUnavailable() {
                print("anchor count: \(error.anchors.count)")
                print("channel unavailable error: \(error.getErr())")
            } else if let error = channelOpenError.getValueAsFeeRateTooHigh() {
                print("excessive fee rate error: \(error.getErr())")
            } else if let error = channelOpenError.getValueAsIncompatibleShutdownScript() {
                print("incompatible shutdown script: \(error.getScript())")
            } else if let error = channelOpenError.getValueAsInvalidRoute() {
                print("invalid route error: \(error.getErr())")
            }
            return
        }

        let managerEvents = await channelManagerAndNetworkGraphPersisterAndEventHandler.getManagerEvents(expectedCount: 1)


        let managerEvent = managerEvents[0]
        print("value type: \(managerEvent.getValueType())")

        if let channelClosedEvent = managerEvent.getValueAsChannelClosed() {
            let reason = channelClosedEvent.getReason()
            print("closure reason: \(reason.getValueType()) \(reason)")
            if let preciseReason = reason.getValueAsProcessingError() {
                let errorString = preciseReason.getErr()
                print("processing error: \(errorString)")
            } else if let preciseReason = reason.getValueAsCounterpartyForceClosed() {
                print("peer message: \(preciseReason.getPeerMsg())")
            }
        }

        guard let fundingReadyEvent = managerEvent.getValueAsFundingGenerationReady() else {
            throw TestFlowExceptions.unexpectedChannelManagerEventType
        }
        let fundingOutputScript = fundingReadyEvent.getOutputScript();
        let temporaryChannelId = fundingReadyEvent.getTemporaryChannelId();

        let outputScriptDetails = try await rpcInterface.decodeScript(script: fundingOutputScript)
        guard let outputScriptAddresses = outputScriptDetails["addresses"] as? [String] else {
            throw TestFlowExceptions.invalidOutputScript
        }
        guard let outputAddress = outputScriptAddresses.first else {
            throw TestFlowExceptions.outputScriptMissingAddresses
        }
        let fundingTxid = try await rpcInterface.sendMoney(destinationAddress: outputAddress, amount: channelValueBtcString)
        let fundingTransaction = try await rpcInterface.getTransaction(hash: fundingTxid)
        channelManager.fundingTransactionGenerated(temporaryChannelId: temporaryChannelId, counterpartyNodeId: lndPubkey, fundingTransaction: fundingTransaction)

        // let's add a couple confirmations
        let fakeAddress = try await self.getBogusAddress(rpcInterface: rpcInterface)
        try await rpcInterface.mineBlocks(number: 6, coinbaseDestinationAddress: fakeAddress)

        var usableChannels = [ChannelDetails]()
        while (usableChannels.isEmpty) {
            usableChannels = channelManager.listUsableChannels()
            // sleep for 100ms
            try await Task.sleep(nanoseconds: 0_100_000_000)
        }

        guard let invoicePayer = channelManagerConstructor.payer else {
            throw TestFlowExceptions.missingInvoicePayer
        }
        let invoiceResult = Invoice.fromStr(s: PolarIntegrationSample.POLAR_LND_PEER_INVOICE)

        guard let invoice = invoiceResult.getValue() else {
            throw TestFlowExceptions.invoiceParsingError(invoiceResult.getError()!)
        }

        // let's not pay any invoices
        // channelManagerConstructor.interrupt(tcpPeerHandler: tcpPeerHandler)
        // return
        
        let invoicePaymentResult = invoicePayer.payInvoice(invoice: invoice)

        do {
            // process payment
            let events = await channelManagerAndNetworkGraphPersisterAndEventHandler.getManagerEvents(expectedCount: 2)
            let paymentSentEvent = events[0]
            let paymentPathSuccessfulEvent = events[1]
            guard let paymentSent = paymentSentEvent.getValueAsPaymentSent() else {
                throw TestFlowExceptions.unexpectedChannelManagerEventType
            }
            guard let paymentPathSuccessful = paymentPathSuccessfulEvent.getValueAsPaymentPathSuccessful() else {
                throw TestFlowExceptions.paymentPathUnsuccessful
            }
            print("sent payment \(paymentSent.getPaymentId()) with fee \(paymentSent.getFeePaidMsat()) via \(paymentPathSuccessful.getPath().map { h in h.getShortChannelId() })")
        }
        
        for i in 0...600 {
            // sleep for 100ms
            try await Task.sleep(nanoseconds: 0_100_000_000)
        }
        
        print(channelManagerConstructor.peerManager.getPeerNodeIds())

    }

    private func ascertainSpareMoney(rpcInterface: RegtestBlockchainManager) async throws {
        let availableWallets = try await rpcInterface.listAvailableWallets()
        let walletNames = (availableWallets["wallets"] as! [[String: Any]]).map { dictionary -> String in
            dictionary["name"] as! String
        }

        if !walletNames.contains(PolarIntegrationSample.WALLET_NAME) {
            // if a wallet is already loaded, this will load it also
            try await rpcInterface.createWallet(name: PolarIntegrationSample.WALLET_NAME)
        }

        let loadedWallets = try await rpcInterface.listLoadedWallets()
        let isPolarWalletLoaded = loadedWallets.contains(PolarIntegrationSample.WALLET_NAME)
        for currentWalletName in loadedWallets {
            if currentWalletName == PolarIntegrationSample.WALLET_NAME {
                continue
            }
            try await rpcInterface.unloadWallet(name: currentWalletName)
        }

        if !isPolarWalletLoaded {
            try await rpcInterface.loadWallet(name: PolarIntegrationSample.WALLET_NAME)
        }

        try await rpcInterface.getWalletInfo()
        let walletBalance = try await rpcInterface.getWalletBalance()

        if walletBalance < 5 {
            print("Wallet balance of \(walletBalance) too low, mining some blocks")
            let address = try await rpcInterface.generateAddress()
            try await rpcInterface.mineBlocks(number: 1, coinbaseDestinationAddress: address)

            let fakeAddress = try await self.getBogusAddress(rpcInterface: rpcInterface)
            try await rpcInterface.mineBlocks(number: 100, coinbaseDestinationAddress: fakeAddress)

            let updatedWalletBalance = try await rpcInterface.getWalletBalance()
            let balanceIncrease = updatedWalletBalance - walletBalance
            print("New wallet balance: \(updatedWalletBalance) (increase of \(balanceIncrease))")
        }
    }

    private func getBogusAddress(rpcInterface: RegtestBlockchainManager) async throws -> String {
        let scriptDetails = try await rpcInterface.decodeScript(script: PolarIntegrationSample.BOGUS_OUTPUT_SCRIPT)
        let fakeAddress = ((scriptDetails["segwit"] as! [String: Any])["addresses"] as! [String]).first!
        return fakeAddress
    }

    class LDKTraitImplementations {

        class PolarFeeEstimator: FeeEstimator {
            override func getEstSatPer_1000Weight(confirmationTarget: Bindings.ConfirmationTarget) -> UInt32 {
                return 253
            }
        }

        class PolarBroadcaster: BroadcasterInterface {

            private let rpcInterface: BlockchainObserver

            init(rpcInterface: BlockchainObserver) {
                self.rpcInterface = rpcInterface
                super.init()
            }

            override func broadcastTransaction(tx: [UInt8]) {
                Task {
                    try? await self.rpcInterface.submitTransaction(transaction: tx)
                }
            }
        }
        
        class MuteBroadcaster: BroadcasterInterface {
            override func broadcastTransaction(tx: [UInt8]) {
                // do nothing
            }
        }

        class PolarLogger: Logger {
            override func log(record: Record) {
                print("\nRLPolarLog (\(record.getLevel())): \(record.getFile()):\(record.getLine()):\n> \(record.getArgs())\n")
            }
        }
        
        class MuteLogger: Logger {
            override func log(record: Record) {
                // do nothing
            }
        }

        class PolarChannelMonitorPersister: Persist {
            
            override func persistNewChannel(channelId: Bindings.OutPoint, data: Bindings.ChannelMonitor, updateId: Bindings.MonitorUpdateId) -> Bindings.ChannelMonitorUpdateStatus {
                return .Completed
            }
            
            override func updatePersistedChannel(channelId: Bindings.OutPoint, update: Bindings.ChannelMonitorUpdate, data: Bindings.ChannelMonitor, updateId: Bindings.MonitorUpdateId) -> Bindings.ChannelMonitorUpdateStatus {
                return .Completed
            }
            

        }

        class PolarChannelManagerAndNetworkGraphPersisterAndEventHandler: Persister, ExtendedChannelManagerPersister {

            private let eventTracker = PendingEventTracker()

            fileprivate func getManagerEvents(expectedCount: UInt) async -> [Event] {
                while true {
                    if await self.eventTracker.getCount() >= expectedCount {
                        return await self.eventTracker.getAndClearEvents()
                    }
                    await self.eventTracker.awaitAddition()
                }
            }

            func handleEvent(event: Event) {
                Task {
                    await self.eventTracker.addEvent(event: event)
                }
            }
            
            override func persistManager(channelManager: Bindings.ChannelManager) -> Bindings.Result_NoneErrorZ {
                .initWithOk()
            }
            
            override func persistGraph(networkGraph: Bindings.NetworkGraph) -> Bindings.Result_NoneErrorZ {
                .initWithOk()
            }
            
            override func persistScorer(scorer: Bindings.WriteableScore) -> Bindings.Result_NoneErrorZ {
                .initWithOk()
            }

            fileprivate actor PendingEventTracker {

                private(set) var pendingEvents: [Event] = []
                private(set) var continuations: [CheckedContinuation<Void, Never>] = []

                private func triggerContinuations() {
                    let continuations = self.continuations
                    self.continuations.removeAll()
                    for currentContinuation in continuations {
                        currentContinuation.resume()
                    }
                }

                func addEvent(event: Event) {
                    self.pendingEvents.append(event)
                    self.triggerContinuations()
                }

                func addEvents(events: [Event]) {
                    self.pendingEvents.append(contentsOf: events)
                    self.triggerContinuations()
                }

                func getCount() -> Int {
                    return self.pendingEvents.count
                }

                private func getEvents() -> [Event] {
                    return self.pendingEvents
                }

                func getAndClearEvents() -> [Event] {
                    let events = self.pendingEvents
                    self.pendingEvents.removeAll()
                    return events
                }

                func awaitAddition() async {
                    await withCheckedContinuation({ continuation in
                        self.continuations.append(continuation)
                    })
                }
            }

        }

    }
    
    public class MultiPeerSimulator {
        
        private var rpcInterface: BlockchainObserver!
        
        private var keysManager: KeysManager!
        private var keysInterface: KeysInterface!
        private var config: UserConfig!
        // private var networkGraph: NetworkGraph!
        // private var multiThreadedScorer: MultiThreadedLockableScore!
        
        // private var feeEstimator: FeeEstimator!
        // private var broadcaster: BroadcasterInterface!
        // private var logger: Logger!
        
        public var channelManagerConstructor: ChannelManagerConstructor!
        
        public func simulateMultiplePeers() async throws {
            print("bindings version: \(Bindings.getLDKSwiftBindingsSerializationHash())")
            // print("\(Bindings.versio)")
            
            /*
            let username = ProcessInfo.processInfo.environment["BITCOIN_REGTEST_RPC_USERNAME"] ?? "polaruser" // "alice"
            let password = ProcessInfo.processInfo.environment["BITCOIN_REGTEST_RPC_PASSWORD"] ?? "polarpass" // "DONT_USE_THIS_YOU_WILL_GET_ROBBED"
            rpcInterface = try BlockchainObserver(rpcProtocol: .http, rpcDomain: "localhost", rpcPort: 8332, rpcUsername: username, rpcPassword: password)
            try await rpcInterface.preloadMonitor(anchorHeight: .chaintip)
            */
            
            var seed = [UInt8](repeating: 0, count: 32)
            let status = SecRandomCopyBytes(kSecRandomDefault, seed.count, &seed)

            let timestamp_seconds = UInt64(NSDate().timeIntervalSince1970)
            let timestamp_nanos = UInt32(truncating: NSNumber(value: timestamp_seconds * 1000 * 1000))
            keysManager = KeysManager(seed: seed, startingTimeSecs: timestamp_seconds, startingTimeNanos: timestamp_nanos)
            keysInterface = keysManager.asKeysInterface()

            config = UserConfig.initWithDefault()
            let logger = LDKTraitImplementations.MuteLogger()
            let lightningNetwork = Bindings.Network.Bitcoin
            /*
            let genesisHash = try await rpcInterface.getBlockHash(height: 0)
            let reversedGenesisHash = [UInt8](genesisHash.reversed())
            let chaintipHash = try await rpcInterface.getChaintipHash()
            let reversedChaintipHash = [UInt8](chaintipHash.reversed())
            let chaintipHeight = try await rpcInterface.getChaintipHeight()
            */
            let reversedGenesisHashHex = "6fe28c0ab6f1b372c1a6a246ae63f74f931e8365e15a089c68d6190000000000"
            let reversedGenesisHash = PolarIntegrationSample.hexStringToBytes(hexString: reversedGenesisHashHex)!
            let chaintipHeight = 0
            let reversedChaintipHash = reversedGenesisHash
            let networkGraph = NetworkGraph(genesisHash: reversedGenesisHash, logger: logger)
            
            print("Genesis hash reversed: \(PolarIntegrationSample.bytesToHexString(bytes: reversedGenesisHash))")

            let scoringParams = ProbabilisticScoringParameters.initWithDefault()
            let probabalisticScorer = ProbabilisticScorer(params: scoringParams, networkGraph: networkGraph, logger: logger)
            let score = probabalisticScorer.asScore()
            let multiThreadedScorer = MultiThreadedLockableScore(score: score)
            
            let feeEstimator = LDKTraitImplementations.PolarFeeEstimator()
            // broadcaster = LDKTraitImplementations.PolarBroadcaster(rpcInterface: rpcInterface)
            let broadcaster = LDKTraitImplementations.MuteBroadcaster()
            // logger = LDKTraitImplementations.PolarLogger()
            
            let channelMonitorPersister = LDKTraitImplementations.PolarChannelMonitorPersister()
            let channelManagerAndNetworkGraphPersisterAndEventHandler = LDKTraitImplementations.PolarChannelManagerAndNetworkGraphPersisterAndEventHandler()
            let chainMonitor = ChainMonitor(chainSource: nil, broadcaster: broadcaster, logger: logger, feeest: feeEstimator, persister: channelMonitorPersister)

            channelManagerConstructor = ChannelManagerConstructor(network: lightningNetwork, config: config, currentBlockchainTipHash: reversedChaintipHash, currentBlockchainTipHeight: UInt32(chaintipHeight), keysInterface: keysInterface, feeEstimator: feeEstimator, chainMonitor: chainMonitor, netGraph: networkGraph, txBroadcaster: broadcaster, logger: logger)
            let channelManager = channelManagerConstructor.channelManager
            let peerManager = channelManagerConstructor.peerManager
            let tcpPeerHandler = channelManagerConstructor.getTCPPeerHandler()
            
            channelManagerConstructor.chainSyncCompleted(persister: channelManagerAndNetworkGraphPersisterAndEventHandler, scorer: multiThreadedScorer)
            
            let interPeerConnectionInterval = 0
            let pauseForNextPeer = { () async in
                for _ in 0..<(interPeerConnectionInterval * 10) {
                    // sleep for 100ms
                    try! await Task.sleep(nanoseconds: 0_100_000_000)
                }
            }
            
            print("increasing log threshold")
            Bindings.setLogThreshold(severity: .WARNING)
            
            do {
                // bitrefill
                print("connecting bitrefill")
                let connectionResult = tcpPeerHandler.connect(address: "52.50.244.44", port: 9735, theirNodeId: PolarIntegrationSample.hexStringToBytes(hexString: "030c3f19d742ca294a55c00376b3b355c3c90d61c6b6b39554dbc7ac19b141c14f")!)
                print("bitrefill connection success: \(connectionResult)")
                await pauseForNextPeer()
            }
            
            do {
                // River
                print("connecting river")
                let connectionResult = tcpPeerHandler.connect(address: "104.196.249.140", port: 9735, theirNodeId: PolarIntegrationSample.hexStringToBytes(hexString: "03037dc08e9ac63b82581f79b662a4d0ceca8a8ca162b1af3551595b8f2d97b70a")!)
                print("river connection success: \(connectionResult)")
                await pauseForNextPeer()
            }
            
            do {
                // Acinq
                print("connecting acinq")
                let connectionResult = tcpPeerHandler.connect(address: "3.33.236.230", port: 9735, theirNodeId: PolarIntegrationSample.hexStringToBytes(hexString: "03864ef025fde8fb587d989186ce6a4a186895ee44a926bfc370e2c366597a3f8f")!)
                print("acinq connection success: \(connectionResult)")
                await pauseForNextPeer()
            }
            
            do {
                // Kraken
                print("connecting kraken")
                let connectionResult = tcpPeerHandler.connect(address: "52.13.118.208", port: 9735, theirNodeId: PolarIntegrationSample.hexStringToBytes(hexString: "02f1a8c87607f415c8f22c00593002775941dea48869ce23096af27b0cfdcc0b69")!)
                print("kraken connection success: \(connectionResult)")
                await pauseForNextPeer()
            }
            
            do {
                // Matt
                print("connecting matt")
                let connectionResult = tcpPeerHandler.connect(address: "69.59.18.80", port: 9735, theirNodeId: PolarIntegrationSample.hexStringToBytes(hexString: "03db10aa09ff04d3568b0621750794063df401e6853c79a21a83e1a3f3b5bfb0c8")!)
                print("matt connection success: \(connectionResult)")
                await pauseForNextPeer()
            }
            
            do {
                // Fold
                print("connecting fold")
                let connectionResult = tcpPeerHandler.connect(address: "35.238.153.25", port: 9735, theirNodeId: PolarIntegrationSample.hexStringToBytes(hexString: "02816caed43171d3c9854e3b0ab2cf0c42be086ff1bd4005acc2a5f7db70d83774")!)
                print("fold connection success: \(connectionResult)")
                await pauseForNextPeer()
            }
            
            do {
                // wallet of satoshi
                print("connecting wallet of satoshi")
                let connectionResult = tcpPeerHandler.connect(address: "170.75.163.209", port: 9735, theirNodeId: PolarIntegrationSample.hexStringToBytes(hexString: "035e4ff418fc8b5554c5d9eea66396c227bd429a3251c8cbc711002ba215bfc226")!)
                print("wallet of satoshi connection success: \(connectionResult)")
                await pauseForNextPeer()
            }
            
            /*
            struct Listener: BlockchainListener {
                private let channelManager: ChannelManager
                private let chainMonitor: ChainMonitor

                init(channelManager: ChannelManager, chainMonitor: ChainMonitor) {
                    self.channelManager = channelManager
                    self.chainMonitor = chainMonitor
                }

                func blockConnected(block: [UInt8], height: UInt32) {
                    self.channelManager.as_Listen().block_connected(block: block, height: height)
                    self.chainMonitor.as_Listen().block_connected(block: block, height: height)
                }

                func blockDisconnected(header: [UInt8]?, height: UInt32) {
                    self.chainMonitor.as_Listen().block_disconnected(header: header, height: height)
                    self.channelManager.as_Listen().block_disconnected(header: header, height: height)
                }
            }


            let listener = Listener(channelManager: channelManager, chainMonitor: chainMonitor)
            rpcInterface.registerListener(listener);
            async let monitor = try rpcInterface.monitorBlockchain()
            */
            
            // channelManagerConstructor.chain_sync_completed(persister: channelManagerAndNetworkGraphPersisterAndEventHandler, scorer: multiThreadedScorer)
            
            // channelManagerConstructor.interrupt()
            
        }
        
        public func interrupt() async {
            Bindings.setLogThreshold(severity: .DEBUG)
            channelManagerConstructor.interrupt()
            // channelManagerConstructor = nil
            
            let interFreeConnectionInterval = 5
            let pauseForNextFree = { () async in
                for _ in 0..<(interFreeConnectionInterval * 10) {
                    // sleep for 100ms
                    try! await Task.sleep(nanoseconds: 0_100_000_000)
                }
            }
            
            return;
            
            await pauseForNextFree()
            print("freeing channel manager constructor")
            channelManagerConstructor = nil
            
            /*
            await pauseForNextFree()
            print("freeing network graph")
            networkGraph = nil
            
            await pauseForNextFree()
            print("freeing logger")
            logger = nil
            
            await pauseForNextFree()
            print("freeing multi-threaded scorer")
            multiThreadedScorer = nil
            
            await pauseForNextFree()
            print("freeing broadcaster")
            broadcaster = nil
            */
            
            print("here we are")
            
        }
        
    }

    private class func bytesToHexString(bytes: [UInt8]) -> String {
        let format = "%02hhx" // "%02hhX" (uppercase)
        return bytes.map {
            String(format: format, $0)
        }
        .joined()
    }

    private class func hexStringToBytes(hexString: String) -> [UInt8]? {
        let hexStr = hexString.dropFirst(hexString.hasPrefix("0x") ? 2 : 0)

        guard hexStr.count % 2 == 0 else {
            return nil
        }

        var newData = [UInt8]()

        var indexIsEven = true
        for i in hexStr.indices {
            if indexIsEven {
                let byteRange = i...hexStr.index(after: i)
                guard let byte = UInt8(hexStr[byteRange], radix: 16) else {
                    return nil
                }
                newData.append(byte)
            }
            indexIsEven.toggle()
        }
        return newData
    }
    
    

}

