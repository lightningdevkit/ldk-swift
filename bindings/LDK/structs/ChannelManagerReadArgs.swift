public class ChannelManagerReadArgs {

    var cOpaqueStruct: LDKChannelManagerReadArgs?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(keys_manager: KeysInterface, fee_estimator: FeeEstimator, chain_monitor: Watch, tx_broadcaster: BroadcasterInterface, logger: Logger, default_config: UserConfig, channel_monitors: [LDKChannelMonitor]) {
    	
		let converted_channel_monitors = Bindings.new_LDKCVec_ChannelMonitorZ(array: channel_monitors)
        self.cOpaqueStruct = ChannelManagerReadArgs_new(keys_manager.cOpaqueStruct!, fee_estimator.cOpaqueStruct!, chain_monitor.cOpaqueStruct!, tx_broadcaster.cOpaqueStruct!, logger.cOpaqueStruct!, default_config.cOpaqueStruct!, converted_channel_monitors)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKChannelManagerReadArgs){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_keys_manager() -> KeysInterface {
    	/* NATIVE_CALL_PREP */
        return KeysInterface(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelManagerReadArgs>) in
ChannelManagerReadArgs_get_keys_manager(this_ptrPointer)
}.pointee);
    }

    public func set_keys_manager(val: KeysInterface) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKChannelManagerReadArgs>) in
ChannelManagerReadArgs_set_keys_manager(this_ptrPointer, val.cOpaqueStruct!)
};
    }

    public func get_fee_estimator() -> FeeEstimator {
    	/* NATIVE_CALL_PREP */
        return FeeEstimator(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelManagerReadArgs>) in
ChannelManagerReadArgs_get_fee_estimator(this_ptrPointer)
}.pointee);
    }

    public func set_fee_estimator(val: FeeEstimator) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKChannelManagerReadArgs>) in
ChannelManagerReadArgs_set_fee_estimator(this_ptrPointer, val.cOpaqueStruct!)
};
    }

    public func get_chain_monitor() -> Watch {
    	/* NATIVE_CALL_PREP */
        return Watch(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelManagerReadArgs>) in
ChannelManagerReadArgs_get_chain_monitor(this_ptrPointer)
}.pointee);
    }

    public func set_chain_monitor(val: Watch) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKChannelManagerReadArgs>) in
ChannelManagerReadArgs_set_chain_monitor(this_ptrPointer, val.cOpaqueStruct!)
};
    }

    public func get_tx_broadcaster() -> BroadcasterInterface {
    	/* NATIVE_CALL_PREP */
        return BroadcasterInterface(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelManagerReadArgs>) in
ChannelManagerReadArgs_get_tx_broadcaster(this_ptrPointer)
}.pointee);
    }

    public func set_tx_broadcaster(val: BroadcasterInterface) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKChannelManagerReadArgs>) in
ChannelManagerReadArgs_set_tx_broadcaster(this_ptrPointer, val.cOpaqueStruct!)
};
    }

    public func get_logger() -> Logger {
    	/* NATIVE_CALL_PREP */
        return Logger(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelManagerReadArgs>) in
ChannelManagerReadArgs_get_logger(this_ptrPointer)
}.pointee);
    }

    public func set_logger(val: Logger) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKChannelManagerReadArgs>) in
ChannelManagerReadArgs_set_logger(this_ptrPointer, val.cOpaqueStruct!)
};
    }

    public func get_default_config() -> UserConfig {
    	/* NATIVE_CALL_PREP */
        return UserConfig(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelManagerReadArgs>) in
ChannelManagerReadArgs_get_default_config(this_ptrPointer)
});
    }

    public func set_default_config(val: UserConfig) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKChannelManagerReadArgs>) in
ChannelManagerReadArgs_set_default_config(this_ptrPointer, val.cOpaqueStruct!)
};
    }

				
	deinit {
					
					
		ChannelManagerReadArgs_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}
