#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class UnsignedChannelUpdate: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKUnsignedChannelUpdate?


	/* DEFAULT_CONSTRUCTOR_START */
    public init(chain_hash_arg: [UInt8], short_channel_id_arg: UInt64, timestamp_arg: UInt32, flags_arg: UInt8, cltv_expiry_delta_arg: UInt16, htlc_minimum_msat_arg: UInt64, htlc_maximum_msat_arg: UInt64, fee_base_msat_arg: UInt32, fee_proportional_millionths_arg: UInt32, excess_data_arg: [UInt8]) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
						let excess_data_argWrapper = Bindings.new_LDKCVec_u8ZWrapper(array: excess_data_arg)
						defer {
							excess_data_argWrapper.noOpRetain()
						}
					
        self.cOpaqueStruct = UnsignedChannelUpdate_new(Bindings.new_LDKThirtyTwoBytes(array: chain_hash_arg), short_channel_id_arg, timestamp_arg, flags_arg, cltv_expiry_delta_arg, htlc_minimum_msat_arg, htlc_maximum_msat_arg, fee_base_msat_arg, fee_proportional_millionths_arg, excess_data_argWrapper.dangle().cOpaqueStruct!)
        super.init(conflictAvoidingVariableName: 0)
        
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKUnsignedChannelUpdate){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKUnsignedChannelUpdate, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func get_chain_hash() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
UnsignedChannelUpdate_get_chain_hash(this_ptrPointer)
}.pointee);
    }

    public func set_chain_hash(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKUnsignedChannelUpdate>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return UnsignedChannelUpdate_set_chain_hash(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func get_short_channel_id() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
UnsignedChannelUpdate_get_short_channel_id(this_ptrPointer)
};
    }

    public func set_short_channel_id(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKUnsignedChannelUpdate>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return UnsignedChannelUpdate_set_short_channel_id(this_ptrPointer, val);
    }

    public func get_timestamp() -> UInt32 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
UnsignedChannelUpdate_get_timestamp(this_ptrPointer)
};
    }

    public func set_timestamp(val: UInt32) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKUnsignedChannelUpdate>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return UnsignedChannelUpdate_set_timestamp(this_ptrPointer, val);
    }

    public func get_flags() -> UInt8 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
UnsignedChannelUpdate_get_flags(this_ptrPointer)
};
    }

    public func set_flags(val: UInt8) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKUnsignedChannelUpdate>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return UnsignedChannelUpdate_set_flags(this_ptrPointer, val);
    }

    public func get_cltv_expiry_delta() -> UInt16 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
UnsignedChannelUpdate_get_cltv_expiry_delta(this_ptrPointer)
};
    }

    public func set_cltv_expiry_delta(val: UInt16) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKUnsignedChannelUpdate>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return UnsignedChannelUpdate_set_cltv_expiry_delta(this_ptrPointer, val);
    }

    public func get_htlc_minimum_msat() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
UnsignedChannelUpdate_get_htlc_minimum_msat(this_ptrPointer)
};
    }

    public func set_htlc_minimum_msat(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKUnsignedChannelUpdate>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return UnsignedChannelUpdate_set_htlc_minimum_msat(this_ptrPointer, val);
    }

    public func get_htlc_maximum_msat() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
UnsignedChannelUpdate_get_htlc_maximum_msat(this_ptrPointer)
};
    }

    public func set_htlc_maximum_msat(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKUnsignedChannelUpdate>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return UnsignedChannelUpdate_set_htlc_maximum_msat(this_ptrPointer, val);
    }

    public func get_fee_base_msat() -> UInt32 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
UnsignedChannelUpdate_get_fee_base_msat(this_ptrPointer)
};
    }

    public func set_fee_base_msat(val: UInt32) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKUnsignedChannelUpdate>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return UnsignedChannelUpdate_set_fee_base_msat(this_ptrPointer, val);
    }

    public func get_fee_proportional_millionths() -> UInt32 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
UnsignedChannelUpdate_get_fee_proportional_millionths(this_ptrPointer)
};
    }

    public func set_fee_proportional_millionths(val: UInt32) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKUnsignedChannelUpdate>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return UnsignedChannelUpdate_set_fee_proportional_millionths(this_ptrPointer, val);
    }

    public func get_excess_data() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
UnsignedChannelUpdate_get_excess_data(this_ptrPointer)
});
    }

    public func set_excess_data(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKUnsignedChannelUpdate>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
						let valWrapper = Bindings.new_LDKCVec_u8ZWrapper(array: val)
						defer {
							valWrapper.noOpRetain()
						}
					
        return UnsignedChannelUpdate_set_excess_data(this_ptrPointer, valWrapper.dangle().cOpaqueStruct!);
    }

    public func clone() -> UnsignedChannelUpdate {
    	
        return UnsignedChannelUpdate(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
UnsignedChannelUpdate_clone(origPointer)
});
    }

					internal func danglingClone() -> UnsignedChannelUpdate {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
UnsignedChannelUpdate_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_UnsignedChannelUpdateDecodeErrorZ {
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_UnsignedChannelUpdateDecodeErrorZ(pointer: UnsignedChannelUpdate_read(serWrapper.cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return UnsignedChannelUpdate_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> UnsignedChannelUpdate {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing UnsignedChannelUpdate \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing UnsignedChannelUpdate \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
