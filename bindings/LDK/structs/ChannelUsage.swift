public class ChannelUsage: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKChannelUsage?


	/* DEFAULT_CONSTRUCTOR_START */
    public init(amount_msat_arg: UInt64, inflight_htlc_msat_arg: UInt64, effective_capacity_arg: EffectiveCapacity) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = ChannelUsage_new(amount_msat_arg, inflight_htlc_msat_arg, effective_capacity_arg.danglingClone().cOpaqueStruct!)
        super.init(conflictAvoidingVariableName: 0)
        
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKChannelUsage){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKChannelUsage, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func get_amount_msat() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelUsage>) in
ChannelUsage_get_amount_msat(this_ptrPointer)
};
    }

    public func set_amount_msat(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelUsage>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelUsage_set_amount_msat(this_ptrPointer, val);
    }

    public func get_inflight_htlc_msat() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelUsage>) in
ChannelUsage_get_inflight_htlc_msat(this_ptrPointer)
};
    }

    public func set_inflight_htlc_msat(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelUsage>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelUsage_set_inflight_htlc_msat(this_ptrPointer, val);
    }

    public func get_effective_capacity() -> EffectiveCapacity {
    	
        return EffectiveCapacity(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelUsage>) in
ChannelUsage_get_effective_capacity(this_ptrPointer)
});
    }

    public func set_effective_capacity(val: EffectiveCapacity) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelUsage>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelUsage_set_effective_capacity(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func clone() -> ChannelUsage {
    	
        return ChannelUsage(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKChannelUsage>) in
ChannelUsage_clone(origPointer)
});
    }

					internal func danglingClone() -> ChannelUsage {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    internal func free() -> Void {
    	
        return ChannelUsage_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> ChannelUsage {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing ChannelUsage \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing ChannelUsage \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
