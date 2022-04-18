//
// Created by Arik Sosman on 4/17/22.
//

import XCTest

@available(iOS 15.0, *)
public class PolarIntegrationTest: XCTestCase {

	static let WALLET_NAME = "POLAR_LDK_INTEGRATION_TEST_WALLET"
	static let BOGUS_OUTPUT_SCRIPT: [UInt8] = [0, 1, 0]

	// EDIT ME
	static let POLAR_LND_PEER_PUBKEY_HEX = "02e62868ab834e7c062a929ca2f22ee8707827a5821e3a8eec343f106cbee24e7c"

	func testPolarFlow() async throws {
		let rpcInterface = try RegtestBlockchainManager(rpcProtocol: .http, rpcDomain: "localhost", rpcPort: 18443, rpcUsername: "polaruser", rpcPassword: "polarpass")
		// let help = try await rpcInterface.getHelp()
		// print(help)

		try await self.ascertainSpareMoney(rpcInterface: rpcInterface)

		// let seed: [UInt8] = [UInt8](Data(base64Encoded: "//////////////////////////////////////////8=")!)
		var seed = [UInt8](repeating: 0, count: 32)
		let status = SecRandomCopyBytes(kSecRandomDefault, seed.count, &seed)
		XCTAssertEqual(status, errSecSuccess)

		let timestamp_seconds = UInt64(NSDate().timeIntervalSince1970)
		let timestamp_nanos = UInt32(truncating: NSNumber(value: timestamp_seconds * 1000 * 1000))
		let keysManager = KeysManager(seed: seed, starting_time_secs: timestamp_seconds, starting_time_nanos: timestamp_nanos)
		let keysInterface = keysManager.as_KeysInterface()

		let config = UserConfig()
		let lightningNetwork = LDKNetwork_Regtest
        let genesisHash = try await rpcInterface.getBlockHash(height: 0)
		let reversedGenesisHash = [UInt8](genesisHash.reversed())
		let networkGraph = NetworkGraph(genesis_hash: reversedGenesisHash)

		let feeEstimator = LDKTraitImplementations.PolarFeeEstimator()
		let broadcaster = LDKTraitImplementations.PolarBroadcaster(rpcInterface: rpcInterface)
		let logger = LDKTraitImplementations.PolarLogger()
		let channelMonitorPersister = LDKTraitImplementations.PolarChannelMonitorPersister()
		let channelManagerAndNetworkGraphPersisterAndEventHandler = LDKTraitImplementations.PolarChannelManagerAndNetworkGraphPersisterAndEventHandler()
		let chainMonitor = ChainMonitor(chain_source: Option_FilterZ(value: nil), broadcaster: broadcaster, logger: logger, feeest: feeEstimator, persister: channelMonitorPersister)

		let channelManagerConstructor = ChannelManagerConstructor(network: lightningNetwork, config: config, current_blockchain_tip_hash: reversedGenesisHash, current_blockchain_tip_height: UInt32(0), keys_interface: keysInterface, fee_estimator: feeEstimator, chain_monitor: chainMonitor, net_graph: networkGraph, tx_broadcaster: broadcaster, logger: logger)
		let channelManager = channelManagerConstructor.channelManager
		let peerManager = channelManagerConstructor.peerManager
		let tcpPeerHandler = TCPPeerHandler(peerManager: peerManager)

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
		try await rpcInterface.preloadMonitor(anchorHeight: .genesis);
		channelManagerConstructor.chain_sync_completed(persister: channelManagerAndNetworkGraphPersisterAndEventHandler, scorer: nil);
		async let monitor = try rpcInterface.monitorBlockchain()

		let lndPubkey = PolarIntegrationTest.hexStringToBytes(hexString: PolarIntegrationTest.POLAR_LND_PEER_PUBKEY_HEX)!
		let connectionSuccess = tcpPeerHandler.connect(address: "127.0.0.1", port: 9735, theirNodeId: lndPubkey)

		// sleep for one second
		try! await Task.sleep(nanoseconds: 1_000_000_000)
		let connectedPeers = peerManager.get_peer_node_ids()
		XCTAssertGreaterThanOrEqual(connectedPeers.count, 1)

		let channelValue: UInt64 = 1_300_000 // 1.3 million satoshis, or 0.013 BTC
		let channelValueBtcString = "0.013"
		let reserveAmount: UInt64 = 1000 // a thousand satoshis rserve
		let channelOpenResult = channelManager.create_channel(their_network_key: lndPubkey, channel_value_satoshis: channelValue, push_msat: reserveAmount, user_channel_id: 42, override_config: config)
		XCTAssertTrue(channelOpenResult.isOk())

		let managerEvents = await channelManagerAndNetworkGraphPersisterAndEventHandler.getManagerEvents(expectedCount: 1)
		XCTAssertEqual(managerEvents.count, 1)

		let managerEvent = managerEvents[0]
		print("value type: \(managerEvent.getValueType())")
		XCTAssertEqual(managerEvent.getValueType(), .FundingGenerationReady)

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

		let fundingReadyEvent = managerEvent.getValueAsFundingGenerationReady()!
		XCTAssertEqual(fundingReadyEvent.getChannel_value_satoshis(), channelValue)
		XCTAssertEqual(fundingReadyEvent.getUser_channel_id(), 42)
		let fundingOutputScript = fundingReadyEvent.getOutput_script();
		let temporaryChannelId = fundingReadyEvent.getTemporary_channel_id();

		XCTAssertEqual(fundingOutputScript.count, 34)
		XCTAssertEqual(fundingOutputScript[0], 0)
		XCTAssertEqual(fundingOutputScript[1], 32)

		let outputScriptDetails = try await rpcInterface.decodeScript(script: fundingOutputScript)
		let outputAddress = (outputScriptDetails["addresses"] as! [String]).first!
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
			try! await Task.sleep(nanoseconds: 0_100_000_000)
		}
		XCTAssertGreaterThanOrEqual(usableChannels.count, 1)
	}

	private func ascertainSpareMoney(rpcInterface: RegtestBlockchainManager) async throws {
		let availableWallets = try await rpcInterface.listAvailableWallets()
		let walletNames = (availableWallets["wallets"] as! [[String: Any]]).map { dictionary -> String in
			dictionary["name"] as! String
		}

		if !walletNames.contains(PolarIntegrationTest.WALLET_NAME) {
			// if a wallet is already loaded, this will load it also
			try await rpcInterface.createWallet(name: PolarIntegrationTest.WALLET_NAME)
		}

		let loadedWallets = try await rpcInterface.listLoadedWallets()
		let isPolarWalletLoaded = loadedWallets.contains(PolarIntegrationTest.WALLET_NAME)
		for currentWalletName in loadedWallets {
			if currentWalletName == PolarIntegrationTest.WALLET_NAME {
				continue
			}
			try await rpcInterface.unloadWallet(name: currentWalletName)
		}

		if !isPolarWalletLoaded {
			try await rpcInterface.loadWallet(name: PolarIntegrationTest.WALLET_NAME)
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
		let scriptDetails = try await rpcInterface.decodeScript(script: PolarIntegrationTest.BOGUS_OUTPUT_SCRIPT)
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
				let clonedEvent = event.dangle().clone()
				Task {
					await self.eventTracker.addEvent(event: clonedEvent)
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

				private func triggerContinuations(){
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

				func getAndClearEvents() -> [Event]{
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

		guard hexStr.count % 2 == 0 else { return nil }

		var newData = [UInt8]()

		var indexIsEven = true
		for i in hexStr.indices {
			if indexIsEven {
				let byteRange = i...hexStr.index(after: i)
				guard let byte = UInt8(hexStr[byteRange], radix: 16) else { return nil }
				newData.append(byte)
			}
			indexIsEven.toggle()
		}
		return newData
	}

}

