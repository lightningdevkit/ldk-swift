//
//  ChannelManagerConstructor.swift
//  LDKSwiftARC
//
//  Created by Arik Sosman on 5/19/21.
//

import Foundation

enum InvalidSerializedDataError: Error {
    case runtimeError
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
                throw InvalidSerializedDataError.runtimeError
            }
            let value: LDKCResult_C2Tuple_BlockHashChannelMonitorZDecodeErrorZPtr = res.cOpaqueStruct!.contents
            let a: LDKThirtyTwoBytes = value.result!.pointee.a
            let b: LDKChannelMonitor = value.result!.pointee.b
            let currentChannelMonitor = ChannelMonitor(pointer: b)
            monitors.append(b)
            self.channel_monitors.append((currentChannelMonitor, Bindings.LDKThirtyTwoBytes_to_array(nativeType: a)))
        }

        let res = UtilMethods.constructor_BlockHashChannelManagerZ_read(ser: channel_manager_serialized, arg_keys_manager: keys_interface, arg_fee_estimator: fee_estimator, arg_chain_monitor: chain_monitor.as_Watch(), arg_tx_broadcaster: tx_broadcaster, arg_logger: logger, arg_default_config: UserConfig(), arg_channel_monitors: monitors)
        if res.cOpaqueStruct?.result_ok != true {
            throw InvalidSerializedDataError.runtimeError
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

    /*
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

}
