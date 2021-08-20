public class ChannelManagerReadArgs {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKChannelManagerReadArgs?;


	/* DEFAULT_CONSTRUCTOR_START */
    public init(keys_manager: KeysInterface, fee_estimator: FeeEstimator, chain_monitor: Watch, tx_broadcaster: BroadcasterInterface, logger: Logger, default_config: UserConfig, channel_monitors: [LDKChannelMonitor]) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
						let channel_monitorsWrapper = Bindings.new_LDKCVec_ChannelMonitorZWrapper(array: Bindings.cloneNativeLDKChannelMonitorArray(array: channel_monitors))
                        channel_monitorsWrapper.dangle()
						defer {
							channel_monitorsWrapper.noOpRetain()
						}
					
        self.cOpaqueStruct = ChannelManagerReadArgs_new(keys_manager.cOpaqueStruct!, fee_estimator.cOpaqueStruct!, chain_monitor.cOpaqueStruct!, tx_broadcaster.cOpaqueStruct!, logger.cOpaqueStruct!, default_config.danglingClone().cOpaqueStruct!, channel_monitorsWrapper.cOpaqueStruct!)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKChannelManagerReadArgs){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_keys_manager() -> KeysInterface {
    	
        return NativelyImplementedKeysInterface(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelManagerReadArgs>) in
ChannelManagerReadArgs_get_keys_manager(this_ptrPointer)
}.pointee, anchor: self);
    }

    public func set_keys_manager(val: KeysInterface) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelManagerReadArgs>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelManagerReadArgs_set_keys_manager(this_ptrPointer, val.cOpaqueStruct!);
    }

    public func get_fee_estimator() -> FeeEstimator {
    	
        return NativelyImplementedFeeEstimator(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelManagerReadArgs>) in
ChannelManagerReadArgs_get_fee_estimator(this_ptrPointer)
}.pointee, anchor: self);
    }

    public func set_fee_estimator(val: FeeEstimator) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelManagerReadArgs>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelManagerReadArgs_set_fee_estimator(this_ptrPointer, val.cOpaqueStruct!);
    }

    public func get_chain_monitor() -> Watch {
    	
        return NativelyImplementedWatch(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelManagerReadArgs>) in
ChannelManagerReadArgs_get_chain_monitor(this_ptrPointer)
}.pointee, anchor: self);
    }

    public func set_chain_monitor(val: Watch) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelManagerReadArgs>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelManagerReadArgs_set_chain_monitor(this_ptrPointer, val.cOpaqueStruct!);
    }

    public func get_tx_broadcaster() -> BroadcasterInterface {
    	
        return NativelyImplementedBroadcasterInterface(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelManagerReadArgs>) in
ChannelManagerReadArgs_get_tx_broadcaster(this_ptrPointer)
}.pointee, anchor: self);
    }

    public func set_tx_broadcaster(val: BroadcasterInterface) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelManagerReadArgs>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelManagerReadArgs_set_tx_broadcaster(this_ptrPointer, val.cOpaqueStruct!);
    }

    public func get_logger() -> Logger {
    	
        return NativelyImplementedLogger(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelManagerReadArgs>) in
ChannelManagerReadArgs_get_logger(this_ptrPointer)
}.pointee, anchor: self);
    }

    public func set_logger(val: Logger) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelManagerReadArgs>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelManagerReadArgs_set_logger(this_ptrPointer, val.cOpaqueStruct!);
    }

    public func get_default_config() -> UserConfig {
    	
        return UserConfig(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelManagerReadArgs>) in
ChannelManagerReadArgs_get_default_config(this_ptrPointer)
});
    }

    public func set_default_config(val: UserConfig) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelManagerReadArgs>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelManagerReadArgs_set_default_config(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    internal func free() -> Void {
    	
        return ChannelManagerReadArgs_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> ChannelManagerReadArgs {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing ChannelManagerReadArgs \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing ChannelManagerReadArgs \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
