//
//  ChannelManagerConstructor.swift
//  LDKSwiftARC
//
//  Created by Arik Sosman on 5/19/21.
//

import Foundation

enum InvalidSerializedDataError: Error {
    case invalidSerializedChannelMonitor
    case invalidSerializedChannelManager
}

public class ChannelManagerConstructor {

    public let channelManager: ChannelManager
    
    /**
     * The latest block has the channel manager saw. If this is non-null it is a 32-byte block hash.
     * You should sync the blockchain starting with the block that builds on this block.
     */
    public let channel_manager_latest_block_hash: [UInt8]?
    
    /**
     * A list of ChannelMonitors and the last block they each saw. You should sync the blockchain on each individually
     * starting with the block that builds on the hash given.
     * After doing so (and syncing the blockchain on the channel manager as well), you should call chain_sync_completed()
     * and then continue to normal application operation.
     */
    public private(set) var channel_monitors: [(ChannelMonitor, [UInt8])]

    private let chain_monitor: ChainMonitor

    public init(channel_manager_serialized: [UInt8], channel_monitors_serialized: [[UInt8]], keys_interface: KeysInterface, fee_estimator: FeeEstimator, chain_monitor: ChainMonitor, filter: Filter?, tx_broadcaster: BroadcasterInterface, logger: Logger) throws {

        var monitors: [LDKChannelMonitor] = []
        self.channel_monitors = []
        for currentSerializedChannelMonitor in channel_monitors_serialized {
            let res: Result_C2Tuple_BlockHashChannelMonitorZDecodeErrorZ = UtilMethods.constructor_BlockHashChannelMonitorZ_read(ser: currentSerializedChannelMonitor, arg: keys_interface)
            if res.cOpaqueStruct?.result_ok != true {
                throw InvalidSerializedDataError.invalidSerializedChannelMonitor
            }
            let value: LDKCResult_C2Tuple_BlockHashChannelMonitorZDecodeErrorZPtr = res.cOpaqueStruct!.contents
            let a: LDKThirtyTwoBytes = value.result!.pointee.a
            var b: LDKChannelMonitor = value.result!.pointee.b
            b.is_owned = false
            let currentChannelMonitor = ChannelMonitor(pointer: b)
            monitors.append(b)
            self.channel_monitors.append((currentChannelMonitor, Bindings.LDKThirtyTwoBytes_to_array(nativeType: a)))
        }

        let res = UtilMethods.constructor_BlockHashChannelManagerZ_read(ser: channel_manager_serialized, arg_keys_manager: keys_interface, arg_fee_estimator: fee_estimator, arg_chain_monitor: chain_monitor.as_Watch(), arg_tx_broadcaster: tx_broadcaster, arg_logger: logger, arg_default_config: UserConfig(), arg_channel_monitors: monitors)
        if res.cOpaqueStruct?.result_ok != true {
            throw InvalidSerializedDataError.invalidSerializedChannelManager
        }
        let latestBlockHash = Bindings.LDKThirtyTwoBytes_to_array(nativeType: res.cOpaqueStruct!.contents.result.pointee.a)
        let channelManager = ChannelManager(pointer: res.cOpaqueStruct!.contents.result.pointee.b)

        self.channelManager = channelManager
        self.channel_manager_latest_block_hash = latestBlockHash
        self.chain_monitor = chain_monitor

        if let filter = filter {
            for (currentMonitor, _) in self.channel_monitors {
                currentMonitor.load_outputs_to_watch(filter: filter)
            }
        }

    }

    /**
     * Constructs a channel manager from the given interface implementations
     */
    public init(network: LDKNetwork, config: UserConfig, current_blockchain_tip_hash: [UInt8], current_blockchain_tip_height: UInt32, keys_interface: KeysInterface, fee_estimator: FeeEstimator, chain_monitor: ChainMonitor, tx_broadcaster: BroadcasterInterface, logger: Logger) {
        self.channel_monitors = []
        self.channel_manager_latest_block_hash = nil
        self.chain_monitor = chain_monitor
        let block = BestBlock(block_hash: current_blockchain_tip_hash, height: current_blockchain_tip_height)
        let chainParameters = ChainParameters(network_arg: network, best_block_arg: block)
        self.channelManager = ChannelManager(fee_est: fee_estimator, chain_monitor: chain_monitor.as_Watch(), tx_broadcaster: tx_broadcaster, logger: logger, keys_manager: keys_interface, config: config, params: chainParameters)
    }
    
    var persisterWorkItem: DispatchWorkItem?
    var shutdown = false
    
    /**
     * Utility which adds all of the deserialized ChannelMonitors to the chain watch so that further updates from the
     * ChannelManager are processed as normal.
     *
     * This also spawns a background thread which will call the appropriate methods on the provided
     * ChannelManagerPersister as required.
     */
    public func chain_sync_completed(persister: ChannelManagerPersister) {
        if self.persisterWorkItem != nil {
            return
        }
        
        for (currentChannelMonitor, _) in self.channel_monitors {
            let chainMonitorWatch = self.chain_monitor.as_Watch()
            let fundingTxo = currentChannelMonitor.get_funding_txo()
            let outPoint = OutPoint(pointer: fundingTxo.cOpaqueStruct!.a)
            
            chainMonitorWatch.cOpaqueStruct!.watch_channel(chainMonitorWatch.cOpaqueStruct!.this_arg, outPoint.cOpaqueStruct!, currentChannelMonitor.cOpaqueStruct!)
            // chainMonitorWatch.watch_channel(funding_txo: outPoint, monitor: currentChannelMonitor)
        }
        
        self.persisterWorkItem = DispatchWorkItem {
            var lastTimerTick = NSDate().timeIntervalSince1970
            while !self.shutdown {
                var needsPersist = self.channelManager.await_persistable_update_timeout(max_wait: 1)
                
                let nativeManagerEventsProvider = self.channelManager.as_EventsProvider().cOpaqueStruct!
                let rawManagerEvents = Bindings.LDKCVec_EventZ_to_array(nativeType: nativeManagerEventsProvider.get_and_clear_pending_events(nativeManagerEventsProvider.this_arg))
                
                let managerEvents = rawManagerEvents.map { (e: LDKEvent) -> Event in
                    Event(pointer: e)
                }
                if managerEvents.count != 0 {
                    persister.handle_events(events: managerEvents)
                    needsPersist = true
                }
                
                let nativeMonitorEventsProvider = self.chain_monitor.as_EventsProvider().cOpaqueStruct!
                let rawMonitorEvents = Bindings.LDKCVec_EventZ_to_array(nativeType: nativeMonitorEventsProvider.get_and_clear_pending_events(nativeMonitorEventsProvider.this_arg))
                
                let monitorEvents = rawMonitorEvents.map { (e: LDKEvent) -> Event in
                    Event(pointer: e)
                }
                if monitorEvents.count != 0 {
                    persister.handle_events(events: monitorEvents)
                    needsPersist = true
                }
                
                if needsPersist {
                    persister.persist_manager(channel_manager_bytes: self.channelManager.write(obj: self.channelManager))
                }
                
                if self.shutdown {
                    return
                }
                
                let currentTimerTick = NSDate().timeIntervalSince1970
                if lastTimerTick < (currentTimerTick-60) { // more than 60 seconds have passed since the last timer tick
                    self.channelManager.timer_tick_occurred()
                    lastTimerTick = currentTimerTick
                }
                
                Thread.sleep(forTimeInterval: 1) // this should hopefully not suspend the main application
            }
        }
        
        let backgroundQueue = DispatchQueue(label: "org.ldk.ChannelManagerConstructor.persisterThread", qos: .background)
        backgroundQueue.async(execute: self.persisterWorkItem!)
    }
    
    public func interrupt() {
        self.shutdown = true
        if let workItem = self.persisterWorkItem {
            workItem.wait()
        }
    }

}

public protocol ChannelManagerPersister {
    func handle_events(events: [Event]) -> Void;
    func persist_manager(channel_manager_bytes: [UInt8]) -> Void;
}
