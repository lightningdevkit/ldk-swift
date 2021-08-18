//
//  UtilMethods.swift
//  LDKSwiftARC
//
//  Created by Arik Sosman on 5/19/21.
//

import Foundation
import LDKHeaders



public class UtilMethods {

    /**
     * Read a C2Tuple_BlockHashChannelManagerZ from a byte array, created by C2Tuple_BlockHashChannelManagerZ_write
     */
    public class func constructor_BlockHashChannelManagerZ_read(ser: [UInt8], arg_keys_manager: KeysInterface, arg_fee_estimator: FeeEstimator, arg_chain_monitor: Watch, arg_tx_broadcaster: BroadcasterInterface, arg_logger: Logger, arg_default_config: UserConfig, arg_channel_monitors: [LDKChannelMonitor]) -> Result_C2Tuple_BlockHashChannelManagerZDecodeErrorZ {

        let clonedConfig = arg_default_config.danglingClone()
        print("instantiating channelManagerReadArgs with cloned user config")
        let args = ChannelManagerReadArgs(keys_manager: arg_keys_manager.dangle(), fee_estimator: arg_fee_estimator, chain_monitor: arg_chain_monitor.dangle(), tx_broadcaster: arg_tx_broadcaster, logger: arg_logger, default_config: clonedConfig, channel_monitors: arg_channel_monitors)
        // args.dangle()
        // let slice = Bindings.new_LDKu8slice(array: ser)
        // let wrappedSlice = U8SliceWrapper(pointer: slice)
        // let ret = C2Tuple_BlockHashChannelManagerZ_read(wrappedSlice.cOpaqueStruct!, args.cOpaqueStruct!)
        // return Result_C2Tuple_BlockHashChannelManagerZDecodeErrorZ(pointer: ret)
        print("returning result from blockhashchannelmanager reader")
        return Result_C2Tuple_BlockHashChannelManagerZDecodeErrorZ()
    }

    /**
     * Read a C2Tuple_BlockHashChannelMonitorZ from a byte array, created by C2Tuple_BlockHashChannelMonitorZ_write
     */
    public class func constructor_BlockHashChannelMonitorZ_read(ser: [UInt8], arg: KeysInterface) -> Result_C2Tuple_BlockHashChannelMonitorZDecodeErrorZ {
        let ret = withUnsafePointer(to: arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKKeysInterface>) -> LDKCResult_C2Tuple_BlockHashChannelMonitorZDecodeErrorZ in
            return C2Tuple_BlockHashChannelMonitorZ_read(Bindings.new_LDKu8slice(array: ser), pointer)
        }
        return Result_C2Tuple_BlockHashChannelMonitorZDecodeErrorZ(pointer: ret)
    }


}
