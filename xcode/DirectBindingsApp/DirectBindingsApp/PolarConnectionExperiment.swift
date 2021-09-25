//
//  PolarConnectionExperiment.swift
//  DirectBindingsApp
//
//  Created by Arik Sosman on 8/27/21.
//

import Foundation

class PolarConnectionExperiment: ObservableObject {
    
    @Published internal var isMonitoring = false
    @Published internal var hasCaughtUpToChainTip = false
    @Published internal var hasCompletedChainSync = false
    @Published internal var isConnectedToAlice = false
    @Published internal var isChannelWithAliceOpen = false
    
    // non-reliant on anything
    var feeEstimator: FeeEstimator
    var logger: Logger
    var broadcaster: BroadcasterInterface
    var persister: Persist
    var filter: Filter
    var chainMonitor: ChainMonitor
    var keysManager: KeysManager
    var keysInterface: KeysInterface
    
    var blockchainObserver: RegtestBlockchainObserver!
    
    // reliant on async response from blockchain observer
    var channelManagerConstructor: ChannelManagerConstructor!
    var channelManager: ChannelManager!
    var cmPersister: ExtendedChannelManagerPersister!
    var peerManager: PeerManager!
    var peerNetworkHandler: TCPPeerHandler!
    
    init() {
        
        self.filter = TestFilter()
        self.broadcaster = RegtestBroadcasterInterface()
        self.logger = TestLogger()
        self.feeEstimator = TestFeeEstimator()
        self.persister = TestPersister()
        
        let filterOption = Option_FilterZ(value: self.filter)
        self.chainMonitor = ChainMonitor(chain_source: filterOption.dangle(), broadcaster: self.broadcaster, logger: self.logger, feeest: self.feeEstimator, persister: self.persister)
        
        let seed: [UInt8] = [UInt8](Data(base64Encoded: "//////////////////////////////////////////8=")!)
        let timestamp_seconds = UInt64(NSDate().timeIntervalSince1970)
        let timestamp_nanos = UInt32(truncating: NSNumber(value: timestamp_seconds * 1000 * 1000))
        
        self.keysManager = KeysManager(seed: seed, starting_time_secs: timestamp_seconds, starting_time_nanos: timestamp_nanos)
        
        self.keysInterface = self.keysManager.as_KeysInterface()
        
        self.blockchainObserver = RegtestBlockchainObserver(listeners: [], chainTip: nil) {
            // sync complete
            let config = UserConfig()
            let lightningNetwork = LDKNetwork_Regtest
            let genesis_hash: [UInt8] = [6, 34, 110, 70, 17, 26, 11, 89, 202, 175, 18, 96, 67, 235, 91, 191, 40, 195, 79, 58, 94, 51, 42, 31, 199, 178, 183, 60, 241, 136, 145, 15]
            let chainTipHash = self.blockchainObserver.chainTipHash
            let chainTipHeight = self.blockchainObserver.chainTipHeight
            
            self.channelManagerConstructor = ChannelManagerConstructor(network: lightningNetwork, config: config, current_blockchain_tip_hash: chainTipHash, current_blockchain_tip_height: chainTipHeight, keys_interface: self.keysInterface, fee_estimator: self.feeEstimator, chain_monitor: self.chainMonitor, router: nil, tx_broadcaster: self.broadcaster, logger: self.logger)
            
            self.channelManager = self.channelManagerConstructor.channelManager
            self.peerManager = self.channelManagerConstructor.peerManager
            self.peerNetworkHandler = TCPPeerHandler(peerManager: self.peerManager)
            
            self.cmPersister = RegtestChannelManagerPersister(channelManager: self.channelManager)
            self.hasCaughtUpToChainTip = true
            self.objectWillChange.send()
            
            // Bindings.new_LDKTransactionWrapper(array: <#T##[UInt8]#>)
        }
        
    }
    
    func startMonitoring() {
        if self.isMonitoring {
            return
        }
        self.isMonitoring = true
        self.blockchainObserver.monitor()
        self.objectWillChange.send()
    }
    
    func completeChainSync() {
        if !self.hasCaughtUpToChainTip || self.hasCompletedChainSync {
            return
        }
        self.hasCompletedChainSync = true
        self.channelManagerConstructor.chain_sync_completed(persister: self.cmPersister)
        self.objectWillChange.send()
    }
    
    func connectToAlice() {
        if !self.hasCompletedChainSync || self.isConnectedToAlice {
            return
        }
        self.isConnectedToAlice = true
        // let theirNodeId: [UInt8] = [3, 76, 1, 164, 167, 52, 78, 65, 176, 169, 137, 4, 159, 182, 49, 198, 72, 197, 210, 127, 107, 63, 166, 28, 124, 25, 59, 64, 220, 201, 106, 147, 65]
        let theirNodeId = Block.hexStringToBytes(hexString: "034c01a4a7344e41b0a989049fb631c648c5d27f6b3fa61c7c193b40dcc96a9341")!
        let connectionSucceeded = self.peerNetworkHandler.connect(address: "127.0.0.1", port: 9735, theirNodeId: theirNodeId)
        if !connectionSucceeded {
            self.isConnectedToAlice = false
            return
        }
        self.objectWillChange.send()
        
        let peers = self.peerManager.get_peer_node_ids()
    }
    
    func openChannelWithAlice() {
        if !self.isConnectedToAlice || self.isChannelWithAliceOpen {
            return
        }
        self.isChannelWithAliceOpen = true
        
        let config = UserConfig()
        let theirNodeId = Block.hexStringToBytes(hexString: "034c01a4a7344e41b0a989049fb631c648c5d27f6b3fa61c7c193b40dcc96a9341")!
        let channelOpenResult = self.channelManager.create_channel(their_network_key: theirNodeId, channel_value_satoshis: 4000000, push_msat: 2000000, user_id: 42, override_config: config)
        
        self.objectWillChange.send()
        
        if channelOpenResult.isOk() {
            print("Channel should have opened successfully!")
        }else if let errorDetails = channelOpenResult.getError(){
            print("Channel open failed!")
            if let error = errorDetails.getValueAsAPIMisuseError() {
                print("Misuse: \(error.getErr())")
            }else if let error = errorDetails.getValueAsRouteError() {
                print("Route: \(error.getErr())")
            }else if let error = errorDetails.getValueAsChannelUnavailable() {
                print("Channel Unavailable: \(error.getErr())")
            }else if let error = errorDetails.getValueAsFeeRateTooHigh() {
                print("fee rate: \(error.getErr())")
            }else if let error = errorDetails.getValueAsIncompatibleShutdownScript() {
                print("incompatible shutdown script")
            }
            self.isChannelWithAliceOpen = false
            self.objectWillChange.send()
        }
    }
    
    deinit {
        print("Polar Connection Experiment deinited")
    }
    
}
