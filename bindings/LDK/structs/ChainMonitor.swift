public class ChainMonitor: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKChainMonitor?


	/* DEFAULT_CONSTRUCTOR_START */
    #warning("This method passes non-cloneable objects by owned value. Here be dragons.")
@available(*, deprecated, message: "This method passes non-cloneable objects by owned value. Here be dragons.")
public init(chain_source: Option_FilterZ, broadcaster: BroadcasterInterface, logger: Logger, feeest: FeeEstimator, persister: Persist) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = ChainMonitor_new(chain_source.cOpaqueStruct!, broadcaster.cOpaqueStruct!, logger.cOpaqueStruct!, feeest.cOpaqueStruct!, persister.cOpaqueStruct!)
        super.init(conflictAvoidingVariableName: 0)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    #warning("This method passes non-cloneable objects by owned value. Here be dragons.")
@available(*, deprecated, message: "This method passes non-cloneable objects by owned value. Here be dragons.")
public init(pointer: LDKChainMonitor){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	#warning("This method passes non-cloneable objects by owned value. Here be dragons.")
@available(*, deprecated, message: "This method passes non-cloneable objects by owned value. Here be dragons.")
public init(pointer: LDKChainMonitor, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func get_claimable_balances(ignored_channels: [ChannelDetails]) -> [Balance] {
    	
							let ignored_channelsUnwrapped = ignored_channels.map { (ignored_channelsCurrentValue) in
							ignored_channelsCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
        return self.get_claimable_balances(ignored_channels: ignored_channelsUnwrapped);
    }

    internal func get_claimable_balances(ignored_channels: [LDKChannelDetails]) -> [Balance] {
    	
						let ignored_channelsWrapper = Bindings.new_LDKCVec_ChannelDetailsZWrapper(array: ignored_channels)
						defer {
							ignored_channelsWrapper.noOpRetain()
						}
					
        return Bindings.LDKCVec_BalanceZ_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChainMonitor>) in
ChainMonitor_get_claimable_balances(this_argPointer, ignored_channelsWrapper.dangle().cOpaqueStruct!)
})
						
						.map { (cOpaqueStruct) in
							Balance(pointer: cOpaqueStruct)
						}
					;
    }

    public func as_Listen() -> NativelyImplementedListen {
    	
        return NativelyImplementedListen(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChainMonitor>) in
ChainMonitor_as_Listen(this_argPointer)
}, anchor: self);
    }

    public func as_Confirm() -> NativelyImplementedConfirm {
    	
        return NativelyImplementedConfirm(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChainMonitor>) in
ChainMonitor_as_Confirm(this_argPointer)
}, anchor: self);
    }

    public func as_Watch() -> NativelyImplementedWatch {
    	
        return NativelyImplementedWatch(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChainMonitor>) in
ChainMonitor_as_Watch(this_argPointer)
}, anchor: self);
    }

    public func as_EventsProvider() -> NativelyImplementedEventsProvider {
    	
        return NativelyImplementedEventsProvider(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChainMonitor>) in
ChainMonitor_as_EventsProvider(this_argPointer)
}, anchor: self);
    }

    internal func free() -> Void {
    	
        return ChainMonitor_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> ChainMonitor {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing ChainMonitor \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing ChainMonitor \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
