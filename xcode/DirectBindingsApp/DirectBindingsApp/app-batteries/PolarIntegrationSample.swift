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
	static let POLAR_LND_PEER_PUBKEY_HEX = "02e62868ab834e7c062a929ca2f22ee8707827a5821e3a8eec343f106cbee24e7c"
	static let POLAR_LND_PEER_INVOICE = "lnbcrt130u1p3xpylgpp5zj0gn583pxdhmhynpj5am4ucyjy5emv68jvuutry3j4pnpvkr0ysdqqcqzpgxqyz5vqsp5j9t3slasvjhd5j8g9hzrcgwje9qya3550tvg9re8lxymra5tpess9qyyssqntel03t02muzwjls6nqghqtrkjxjn0qs3ygn52he8rsuh5vvmv2xzqqyxj5a8jwae3uq0ypwl9sr806xf2lxl0h6f7cp2r7jwcfwpucqpd788r"

	func testPolarFlow() async throws {
		let rpcInterface = try RegtestBlockchainManager(rpcProtocol: .https, rpcDomain: "arik.ngrok.io", rpcPort: 443, rpcUsername: "polaruser", rpcPassword: "polarpass")
		// let help = try await rpcInterface.getHelp()
		// print(help)

		try await self.ascertainSpareMoney(rpcInterface: rpcInterface)
		try await rpcInterface.preloadMonitor(anchorHeight: .chaintip)

		// let seed: [UInt8] = [UInt8](Data(base64Encoded: "//////////////////////////////////////////8=")!)
		var seed = [UInt8](repeating: 0, count: 32)
		let status = SecRandomCopyBytes(kSecRandomDefault, seed.count, &seed)

		let timestamp_seconds = UInt64(NSDate().timeIntervalSince1970)
		let timestamp_nanos = UInt32(truncating: NSNumber(value: timestamp_seconds * 1000 * 1000))
		let keysManager = KeysManager(seed: seed, starting_time_secs: timestamp_seconds, starting_time_nanos: timestamp_nanos)
		let keysInterface = keysManager.as_KeysInterface()

		let config = UserConfig()
		let lightningNetwork = LDKNetwork_Regtest
		let genesisHash = try await rpcInterface.getBlockHash(height: 0)
		let reversedGenesisHash = [UInt8](genesisHash.reversed())
		let chaintipHash = try await rpcInterface.getChaintipHash()
		let reversedChaintipHash = [UInt8](chaintipHash.reversed())
		let chaintipHeight = try await rpcInterface.getChaintipHeight()
		let networkGraph = NetworkGraph(genesis_hash: reversedGenesisHash)

		let scoringParams = ProbabilisticScoringParameters()
		let probabalisticScorer = ProbabilisticScorer(params: scoringParams, network_graph: networkGraph)
		let score = probabalisticScorer.as_Score()
		let multiThreadedScorer = MultiThreadedLockableScore(score: score)

		print("Genesis hash: \(PolarIntegrationSample.bytesToHexString(bytes: genesisHash))")
		print("Genesis hash reversed: \(PolarIntegrationSample.bytesToHexString(bytes: reversedGenesisHash))")
		print("Block 1 hash: \(try await rpcInterface.getBlockHashHex(height: 1))")
		print("Block 2 hash: \(try await rpcInterface.getBlockHashHex(height: 2))")
		print("Chaintip hash: \(PolarIntegrationSample.bytesToHexString(bytes: chaintipHash))")
		print("Chaintip hash reversed: \(PolarIntegrationSample.bytesToHexString(bytes: reversedChaintipHash))")

		let feeEstimator = LDKTraitImplementations.PolarFeeEstimator()
		let broadcaster = LDKTraitImplementations.PolarBroadcaster(rpcInterface: rpcInterface)
		let logger = LDKTraitImplementations.PolarLogger()
		let channelMonitorPersister = LDKTraitImplementations.PolarChannelMonitorPersister()
		let channelManagerAndNetworkGraphPersisterAndEventHandler = LDKTraitImplementations.PolarChannelManagerAndNetworkGraphPersisterAndEventHandler()
		let chainMonitor = ChainMonitor(chain_source: Option_FilterZ(value: nil), broadcaster: broadcaster, logger: logger, feeest: feeEstimator, persister: channelMonitorPersister)

		let channelManagerConstructor = ChannelManagerConstructor(network: lightningNetwork, config: config, current_blockchain_tip_hash: reversedChaintipHash, current_blockchain_tip_height: UInt32(chaintipHeight), keys_interface: keysInterface, fee_estimator: feeEstimator, chain_monitor: chainMonitor, net_graph: networkGraph, tx_broadcaster: broadcaster, logger: logger)
		let channelManager = channelManagerConstructor.channelManager
		let peerManager = channelManagerConstructor.peerManager
        let tcpPeerHandler = channelManagerConstructor.getTCPPeerHandler()

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
		channelManagerConstructor.chain_sync_completed(persister: channelManagerAndNetworkGraphPersisterAndEventHandler, scorer: multiThreadedScorer)

		guard let lndPubkey = PolarIntegrationSample.hexStringToBytes(hexString: PolarIntegrationSample.POLAR_LND_PEER_PUBKEY_HEX) else {
			throw TestFlowExceptions.hexParsingError
		}
		let connectionSuccess = tcpPeerHandler.connect(address: "172.20.2.30", port: 9735, theirNodeId: lndPubkey)

		// sleep for one second
		try await Task.sleep(nanoseconds: 1_000_000_000)
		let connectedPeers = peerManager.get_peer_node_ids()

		let channelValue: UInt64 = 1_300_000 // 1.3 million satoshis, or 0.013 BTC
		let channelValueBtcString = "0.013"
		let reserveAmount: UInt64 = 1000 // a thousand satoshis rserve
		let channelOpenResult = channelManager.create_channel(their_network_key: lndPubkey, channel_value_satoshis: channelValue, push_msat: reserveAmount, user_channel_id: 42, override_config: config)

		if let channelOpenError = channelOpenResult.getError() {
			print("error type: \(channelOpenError.getValueType())")
			if let error = channelOpenError.getValueAsAPIMisuseError() {
				print("API misuse error: \(error.getErr())")
			} else if let error = channelOpenError.getValueAsChannelUnavailable() {
				print("channel unavailable error: \(error.getErr())")
			} else if let error = channelOpenError.getValueAsFeeRateTooHigh() {
				print("excessive fee rate error: \(error.getErr())")
			} else if let error = channelOpenError.getValueAsIncompatibleShutdownScript() {
				print("incompatible shutdown script: \(error.getScript())")
			} else if let error = channelOpenError.getValueAsRouteError() {
				print("route error: \(error.getErr())")
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
				print("peer message: \(preciseReason.getPeer_msg())")
			}
		}

		guard let fundingReadyEvent = managerEvent.getValueAsFundingGenerationReady() else {
			throw TestFlowExceptions.unexpectedChannelManagerEventType
		}
		let fundingOutputScript = fundingReadyEvent.getOutput_script();
		let temporaryChannelId = fundingReadyEvent.getTemporary_channel_id();

		let outputScriptDetails = try await rpcInterface.decodeScript(script: fundingOutputScript)
		guard let outputScriptAddresses = outputScriptDetails["addresses"] as? [String] else {
			throw TestFlowExceptions.invalidOutputScript
		}
		guard let outputAddress = outputScriptAddresses.first else {
			throw TestFlowExceptions.outputScriptMissingAddresses
		}
		let fundingTxid = try await rpcInterface.sendMoney(destinationAddress: outputAddress, amount: channelValueBtcString)
		let fundingTransaction = try await rpcInterface.getTransaction(hash: fundingTxid)
		channelManager.funding_transaction_generated(temporary_channel_id: temporaryChannelId, funding_transaction: fundingTransaction)

		// let's add a couple confirmations
		let fakeAddress = try await self.getBogusAddress(rpcInterface: rpcInterface)
		try await rpcInterface.mineBlocks(number: 6, coinbaseDestinationAddress: fakeAddress)

		var usableChannels = [ChannelDetails]()
		while (usableChannels.isEmpty) {
			usableChannels = channelManager.list_usable_channels()
			// sleep for 100ms
			try await Task.sleep(nanoseconds: 0_100_000_000)
		}

		guard let invoicePayer = channelManagerConstructor.payer else {
			throw TestFlowExceptions.missingInvoicePayer
		}
		let invoiceResult = Invoice.from_str(s: PolarIntegrationSample.POLAR_LND_PEER_INVOICE)


		guard let invoice = invoiceResult.getValue() else {
			throw TestFlowExceptions.invoiceParsingError(invoiceResult.getError()!)
		}

        // let's not pay any invoices
        // channelManagerConstructor.interrupt(tcpPeerHandler: tcpPeerHandler)
        // return
        
		let invoicePaymentResult = invoicePayer.pay_invoice(invoice: invoice)

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
			print("sent payment \(paymentSent.getPayment_id()) with fee \(paymentSent.getFee_paid_msat().getValue()) via \(paymentPathSuccessful.getPath().map { h in h.get_short_channel_id() })")
		}

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
			override func get_est_sat_per_1000_weight(confirmation_target: LDKConfirmationTarget) -> UInt32 {
				return 253
			}
		}

		class PolarBroadcaster: BroadcasterInterface {

			private let rpcInterface: RegtestBlockchainManager

			init(rpcInterface: RegtestBlockchainManager) {
				self.rpcInterface = rpcInterface
				super.init()
			}

			override func broadcast_transaction(tx: [UInt8]) {
				Task {
					try? await self.rpcInterface.submitTransaction(transaction: tx)
				}
			}
		}

		class PolarLogger: Logger {
			override func log(record: Record) {
				print("\nRLPolarLog (\(record.get_level())): \(record.get_file()):\(record.get_line()):\n> \(record.get_args())\n")
			}
		}

		class PolarChannelMonitorPersister: Persist {

			override func persist_new_channel(channel_id: OutPoint, data: ChannelMonitor, update_id: MonitorUpdateId) -> Result_NoneChannelMonitorUpdateErrZ {
				let idBytes: [UInt8] = channel_id.write()
				let monitorBytes: [UInt8] = data.write()
				return Result_NoneChannelMonitorUpdateErrZ.ok()
			}

			override func update_persisted_channel(channel_id: OutPoint, update: ChannelMonitorUpdate, data: ChannelMonitor, update_id: MonitorUpdateId) -> Result_NoneChannelMonitorUpdateErrZ {
				let idBytes: [UInt8] = channel_id.write()
				let monitorBytes: [UInt8] = data.write()
				return Result_NoneChannelMonitorUpdateErrZ.ok()
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

			func handle_event(event: Event) {
				Task {
					await self.eventTracker.addEvent(event: event)
				}
			}

			override func persist_manager(channel_manager: ChannelManager) -> Result_NoneErrorZ {
				return Result_NoneErrorZ.ok()
			}

			override func persist_graph(network_graph: NetworkGraph) -> Result_NoneErrorZ {
				return Result_NoneErrorZ.ok()
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

