public class ChannelManagerReadArgs: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKChannelManagerReadArgs?


	/* DEFAULT_CONSTRUCTOR_START */
    internal init(keys_manager: KeysInterface, fee_estimator: FeeEstimator, chain_monitor: Watch, tx_broadcaster: BroadcasterInterface, logger: Logger, default_config: UserConfig, channel_monitors: [LDKChannelMonitor]) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
						let channel_monitorsWrapper = Bindings.new_LDKCVec_ChannelMonitorZWrapper(array: channel_monitors)
						defer {
							channel_monitorsWrapper.noOpRetain()
						}
					
        self.cOpaqueStruct = ChannelManagerReadArgs_new(keys_manager.cOpaqueStruct!, fee_estimator.cOpaqueStruct!, chain_monitor.cOpaqueStruct!, tx_broadcaster.cOpaqueStruct!, logger.cOpaqueStruct!, default_config.danglingClone().cOpaqueStruct!, channel_monitorsWrapper.dangle().cOpaqueStruct!)
        super.init(conflictAvoidingVariableName: 0)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKChannelManagerReadArgs){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKChannelManagerReadArgs, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */
    public convenience init(keys_manager: KeysInterface, fee_estimator: FeeEstimator, chain_monitor: Watch, tx_broadcaster: BroadcasterInterface, logger: Logger, default_config: UserConfig, channel_monitors: [ChannelMonitor])  {
    	
							let channel_monitorsUnwrapped = channel_monitors.map { (channel_monitorsCurrentValue) in
							channel_monitorsCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
        self.init(keys_manager: keys_manager, fee_estimator: fee_estimator, chain_monitor: chain_monitor, tx_broadcaster: tx_broadcaster, logger: logger, default_config: default_config, channel_monitors: channel_monitorsUnwrapped);
    }

    public func get_keys_manager() -> NativelyImplementedKeysInterface {
    	
        return NativelyImplementedKeysInterface(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelManagerReadArgs>) in
ChannelManagerReadArgs_get_keys_manager(this_ptrPointer)
}.pointee, anchor: self);
    }

    public func set_keys_manager(val: KeysInterface) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelManagerReadArgs>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelManagerReadArgs_set_keys_manager(this_ptrPointer, val.cOpaqueStruct!);
    }

    public func get_fee_estimator() -> NativelyImplementedFeeEstimator {
    	
        return NativelyImplementedFeeEstimator(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelManagerReadArgs>) in
ChannelManagerReadArgs_get_fee_estimator(this_ptrPointer)
}.pointee, anchor: self);
    }

    public func set_fee_estimator(val: FeeEstimator) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelManagerReadArgs>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelManagerReadArgs_set_fee_estimator(this_ptrPointer, val.cOpaqueStruct!);
    }

    public func get_chain_monitor() -> NativelyImplementedWatch {
    	
        return NativelyImplementedWatch(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelManagerReadArgs>) in
ChannelManagerReadArgs_get_chain_monitor(this_ptrPointer)
}.pointee, anchor: self);
    }

    public func set_chain_monitor(val: Watch) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelManagerReadArgs>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelManagerReadArgs_set_chain_monitor(this_ptrPointer, val.cOpaqueStruct!);
    }

    public func get_tx_broadcaster() -> NativelyImplementedBroadcasterInterface {
    	
        return NativelyImplementedBroadcasterInterface(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelManagerReadArgs>) in
ChannelManagerReadArgs_get_tx_broadcaster(this_ptrPointer)
}.pointee, anchor: self);
    }

    public func set_tx_broadcaster(val: BroadcasterInterface) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelManagerReadArgs>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelManagerReadArgs_set_tx_broadcaster(this_ptrPointer, val.cOpaqueStruct!);
    }

    public func get_logger() -> NativelyImplementedLogger {
    	
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
							Bindings.print("Freeing ChannelManagerReadArgs \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing ChannelManagerReadArgs \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
