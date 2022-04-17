//
//  LDKExperimentTest.swift
//  LDKExperimentTest
//
//  Created by Arik Sosman on 7/27/21.
//

import XCTest
import LDKSwift
import LDKHeaders

class LDKSwiftTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        Bindings.setLogThreshold(severity: .DEBUG)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testVersionSanity() throws {
        check_get_ldk_version()
        check_get_ldk_bindings_version()
        // check_platform()
    }

    private func incrementalMemoryLeakTest() throws {
        let filter = TestFilter()
        let broadcaster = TestBroadcasterInterface()
        let logger = TestLogger()
        let feeEstimator = TestFeeEstimator()
        let persister = TestPersister()

        let filterOption = Option_FilterZ(value: filter)
        let chainMonitor = ChainMonitor(chain_source: filterOption, broadcaster: broadcaster, logger: logger, feeest: feeEstimator, persister: persister)

        let seed: [UInt8] = [UInt8](Data(base64Encoded: "//////////////////////////////////////////8=")!)
        let timestamp_seconds = UInt64(NSDate().timeIntervalSince1970)
        let timestamp_nanos = UInt32(truncating: NSNumber(value: timestamp_seconds * 1000 * 1000))

        let keysManager = KeysManager(seed: seed, starting_time_secs: timestamp_seconds, starting_time_nanos: timestamp_nanos)
        let config = UserConfig()

        let keysInterface = keysManager.as_KeysInterface()

        let serialized_channel_manager = LDKTestFixtures.serializedChannelManager

        let serializedChannelMonitors: [[UInt8]] = LDKTestFixtures.serializedChannelMonitors

        var monitors: [LDKChannelMonitor] = []

        let channel_manager_constructor = try ChannelManagerConstructor(
                channel_manager_serialized: serialized_channel_manager,
                channel_monitors_serialized: serializedChannelMonitors,
                keys_interface: keysInterface,
                fee_estimator: feeEstimator,
                chain_monitor: chainMonitor,
                filter: filter,
                net_graph_serialized: nil,
                tx_broadcaster: broadcaster,
                logger: logger
        )

        let channel_manager = channel_manager_constructor.channelManager;
        let cmPersister = TestChannelManagerPersister(channelManager: channel_manager)

        let txdata = [C2Tuple_usizeTransactionZ.new(a: 2, b: Self.hexStringToBytes(hexString: "020000000001010000000000000000000000000000000000000000000000000000000000000000ffffffff03530101ffffffff0200f2052a0100000017a9149e6d815a46cd349527961f58cc20d41d15fcb99e870000000000000000266a24aa21a9ede2f61c3f71d1defd3fa999dfa36953755c690689799962b48bebd836974e8cf90120000000000000000000000000000000000000000000000000000000000000000000000000")!)]
        let header = Self.hexStringToBytes(hexString: "f5591ea0b69ae3edc0de11497ffb0fdd91f769ede96c5d662c805364e9bf8b2243e8e5b9d1833eff7cb19abd9fc9da3cd26fe84d718bbf8a336966ae4f7dea6a81372961ffff7f200400000001020000")
        channel_manager.as_Confirm().transactions_confirmed(header: header, txdata: txdata, height: 525)

        channel_manager_constructor.chain_sync_completed(persister: cmPersister, scorer: nil)
        channel_manager_constructor.interrupt()
    }

    func testMemoryLeaksIncrementally() throws {
        try incrementalMemoryLeakTest()
    }

    func testRouteConstruction() throws {

        let destPubkeyHex = "03c2abfa93eacec04721c019644584424aab2ba4dff3ac9bdab4e9c97007491dda"
        let short_channel_id_arg: UInt64 = 762615767524704256
        let paymentValueMsat: UInt64 = 666000
        let finalCltvValue: UInt32 = 40

        let routeHop = RouteHop(
                pubkey_arg: Self.hexStringToBytes(hexString: destPubkeyHex)!,
                node_features_arg: NodeFeatures(),
                short_channel_id_arg: short_channel_id_arg,
                channel_features_arg: ChannelFeatures(),
                fee_msat_arg: paymentValueMsat,
                cltv_expiry_delta_arg: finalCltvValue
        )

        var path: [RouteHop] = [routeHop]

        for _ in 0..<3 {

            let extraHop = RouteHop(
                    pubkey_arg: Self.hexStringToBytes(hexString: destPubkeyHex)!,
                    node_features_arg: NodeFeatures(),
                    short_channel_id_arg: short_channel_id_arg,
                    channel_features_arg: ChannelFeatures(),
                    fee_msat_arg: paymentValueMsat,
                    cltv_expiry_delta_arg: finalCltvValue
            )
            path.append(extraHop)
        }

        let paymentParams = PaymentParameters(payee_pubkey: Self.hexStringToBytes(hexString: destPubkeyHex)!)
		let route = Route(paths_arg: [path], payment_params_arg: paymentParams)
    }

    func testExtendedActivity() async throws {
		// for i in 0...(1 << 7) {
		for i in 0..<1 { // only do one test run initially
			let nice_close = (i & (1 << 0)) != 0;
			let use_km_wrapper = (i & (1 << 1)) != 0;
			let use_manual_watch = (i & (1 << 2)) != 0;
			let reload_peers = (i & (1 << 3)) != 0;
			let break_cross_refs = (i & (1 << 4)) != 0;
			let nio_peer_handler = true // (i & (1 << 5)) != 0;
			let use_chan_manager_constructor = true //  (i & (1 << 6)) != 0;

			if (break_cross_refs && !reload_peers) {
				// There are no cross refs to break without reloading peers.
				continue;
			}

			if (use_chan_manager_constructor && (use_manual_watch || !nio_peer_handler)) {
				// ChannelManagerConstructor requires a ChainMonitor as the Watch and creates a NioPeerHandler for us.
				continue;
			}

			print("Running test with flags \(i)");
			try await SimulationRunner.do_test(nice_close: nice_close, use_km_wrapper: use_km_wrapper, use_manual_watch: use_manual_watch, reload_peers: reload_peers, break_cross_peer_refs: break_cross_refs, nio_peer_handler: nio_peer_handler, use_chan_manager_constructor: use_chan_manager_constructor)
		}

	}

	fileprivate class SimulationRunner {

		class func do_test(nice_close: Bool, use_km_wrapper: Bool, use_manual_watch: Bool, reload_peers: Bool, break_cross_peer_refs: Bool, nio_peer_handler: Bool, use_chan_manager_constructor: Bool) async throws {

			let instance = await do_test_run(nice_close: nice_close, use_km_wrapper: use_km_wrapper, use_manual_watch: use_manual_watch, reload_peers: reload_peers, break_cross_peer_refs: break_cross_peer_refs, nio_peer_handler: nio_peer_handler, use_chan_manager_constructor: use_chan_manager_constructor)

		}

		class func do_test_run(nice_close: Bool, use_km_wrapper: Bool, use_manual_watch: Bool, reload_peers: Bool, break_cross_peer_refs: Bool, nio_peer_handler: Bool, use_chan_manager_constructor: Bool) async -> HumanObjectPeerTestInstance {

			let instance = HumanObjectPeerTestInstance(nice_close: nice_close, use_km_wrapper: use_km_wrapper, use_manual_watch: use_manual_watch, reload_peers: reload_peers, break_cross_peer_refs: break_cross_peer_refs, use_nio_peer_handler: nio_peer_handler, use_filter: !nio_peer_handler, use_chan_manager_constructor: use_chan_manager_constructor)

			await instance.do_test_message_handler()
			return instance
		}

	}

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        Bindings.setLogThreshold(severity: .WARNING)
        measure {
            // Put the code you want to measure the time of here.
            // try! incrementalMemoryLeakTest()
        }
        Bindings.setLogThreshold(severity: .DEBUG)
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

    private class func bytesToHexString(bytes: [UInt8]) -> String {
        let format = "%02hhx" // "%02hhX" (uppercase)
        return bytes.map {
            String(format: format, $0)
        }.joined()
    }

}
