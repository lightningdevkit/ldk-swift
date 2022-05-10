//
//  DirectBindingsAppTests.swift
//  DirectBindingsAppTests
//
//  Created by Arik Sosman on 8/20/21.
//

import XCTest
// @testable import DirectBindingsApp





class DirectBindingsAppTests: XCTestCase {

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
    
    func testMainnetGraphSync() async throws {
        let reversedGenesisHashHex = "6fe28c0ab6f1b372c1a6a246ae63f74f931e8365e15a089c68d6190000000000"
        let reversedGenesisHash = LDKSwiftTests.hexStringToBytes(hexString: reversedGenesisHashHex)!
        
        let seed: [UInt8] = [UInt8](Data(base64Encoded: "//////////////////////////////////////////8=")!)
        let timestamp_seconds = UInt64(NSDate().timeIntervalSince1970)
        let timestamp_nanos = UInt32(truncating: NSNumber(value: timestamp_seconds * 1000 * 1000))

        let keysManager = KeysManager(seed: seed, starting_time_secs: timestamp_seconds, starting_time_nanos: timestamp_nanos)
        let keysInterface = keysManager.as_KeysInterface()

        let config = UserConfig()
        let lightningNetwork = LDKNetwork_Bitcoin
        let networkGraph = NetworkGraph(genesis_hash: reversedGenesisHash)
        
        let scoringParams = ProbabilisticScoringParameters()
        let probabalisticScorer = ProbabilisticScorer(params: scoringParams, network_graph: networkGraph)
        let score = probabalisticScorer.as_Score()
        let multiThreadedScorer = MultiThreadedLockableScore(score: score)
        
        let feeEstimator = TestFeeEstimator()
        let broadcaster = TestBroadcasterInterface()
        let logger = TestLogger()
        let channelMonitorPersister = TestPersister()
        let chainMonitor = ChainMonitor(chain_source: Option_FilterZ(value: nil), broadcaster: broadcaster, logger: logger, feeest: feeEstimator, persister: channelMonitorPersister)

        let channelManagerConstructor = ChannelManagerConstructor(network: lightningNetwork, config: config, current_blockchain_tip_hash: reversedGenesisHash, current_blockchain_tip_height: 0, keys_interface: keysInterface, fee_estimator: feeEstimator, chain_monitor: chainMonitor, net_graph: networkGraph, tx_broadcaster: broadcaster, logger: logger)
        let channelManager = channelManagerConstructor.channelManager
        let peerManager = channelManagerConstructor.peerManager
        let tcpPeerHandler = channelManagerConstructor.getTCPPeerHandler()
        if let netGraph = channelManagerConstructor.net_graph {
            print("net graph available!")
        }
        
        let channelManagerAndNetworkGraphPersisterAndEventHandler = TestChannelManagerPersister()
        channelManagerConstructor.chain_sync_completed(persister: channelManagerAndNetworkGraphPersisterAndEventHandler, scorer: multiThreadedScorer)
        
        let interPeerConnectionInterval = 10
        func pauseForNextPeer() async {
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
            let connectionResult = tcpPeerHandler.connect(address: "52.50.244.44", port: 9735, theirNodeId: LDKSwiftTests.hexStringToBytes(hexString: "030c3f19d742ca294a55c00376b3b355c3c90d61c6b6b39554dbc7ac19b141c14f")!)
            print("bitrefill connection success: \(connectionResult)")
            await pauseForNextPeer()
        }
        
        do {
            // River
            print("connecting river")
            let connectionResult = tcpPeerHandler.connect(address: "104.196.249.140", port: 9735, theirNodeId: LDKSwiftTests.hexStringToBytes(hexString: "03037dc08e9ac63b82581f79b662a4d0ceca8a8ca162b1af3551595b8f2d97b70a")!)
            print("river connection success: \(connectionResult)")
            await pauseForNextPeer()
        }
        
        do {
            // Acinq
            print("connecting acinq")
            let connectionResult = tcpPeerHandler.connect(address: "3.33.236.230", port: 9735, theirNodeId: LDKSwiftTests.hexStringToBytes(hexString: "03864ef025fde8fb587d989186ce6a4a186895ee44a926bfc370e2c366597a3f8f")!)
            print("acinq connection success: \(connectionResult)")
            await pauseForNextPeer()
        }
        
        do {
            // Kraken
            print("connecting kraken")
            let connectionResult = tcpPeerHandler.connect(address: "52.13.118.208", port: 9735, theirNodeId: LDKSwiftTests.hexStringToBytes(hexString: "02f1a8c87607f415c8f22c00593002775941dea48869ce23096af27b0cfdcc0b69")!)
            print("kraken connection success: \(connectionResult)")
            await pauseForNextPeer()
        }
        
        do {
            // Matt
            print("connecting matt")
            let connectionResult = tcpPeerHandler.connect(address: "69.59.18.80", port: 9735, theirNodeId: LDKSwiftTests.hexStringToBytes(hexString: "03db10aa09ff04d3568b0621750794063df401e6853c79a21a83e1a3f3b5bfb0c8")!)
            print("matt connection success: \(connectionResult)")
            await pauseForNextPeer()
        }
        
        do {
            // Fold
            print("connecting fold")
            let connectionResult = tcpPeerHandler.connect(address: "35.238.153.25", port: 9735, theirNodeId: LDKSwiftTests.hexStringToBytes(hexString: "02816caed43171d3c9854e3b0ab2cf0c42be086ff1bd4005acc2a5f7db70d83774")!)
            print("fold connection success: \(connectionResult)")
            await pauseForNextPeer()
        }
        
        do {
            // wallet of satoshi
            print("connecting wallet of satoshi")
            let connectionResult = tcpPeerHandler.connect(address: "170.75.163.209", port: 9735, theirNodeId: LDKSwiftTests.hexStringToBytes(hexString: "035e4ff418fc8b5554c5d9eea66396c227bd429a3251c8cbc711002ba215bfc226")!)
            print("wallet of satoshi connection success: \(connectionResult)")
            await pauseForNextPeer()
        }
        
        // run this for twenty minutes
        for _ in 0..<12000 {
            // sleep for 100ms
            try! await Task.sleep(nanoseconds: 0_100_000_000)
        }
    }
    
    func testPeerGraphConnectivity() async throws {
        let instance = HumanObjectPeerTestInstance(nice_close: true, use_km_wrapper: false, use_manual_watch: false, reload_peers: false, break_cross_peer_refs: false, use_nio_peer_handler: true, use_filter: false, use_chan_manager_constructor: true)
        await instance.test_multiple_peer_connections()
    }

}
