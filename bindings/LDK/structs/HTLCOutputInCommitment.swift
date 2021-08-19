import LDKHeaders

public class HTLCOutputInCommitment {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKHTLCOutputInCommitment?;


	/* DEFAULT_CONSTRUCTOR_START */
    public init(offered_arg: Bool, amount_msat_arg: UInt64, cltv_expiry_arg: UInt32, payment_hash_arg: [UInt8], transaction_output_index_arg: Option_u32Z) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = HTLCOutputInCommitment_new(offered_arg, amount_msat_arg, cltv_expiry_arg, Bindings.new_LDKThirtyTwoBytes(array: payment_hash_arg), transaction_output_index_arg.danglingClone().cOpaqueStruct!)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKHTLCOutputInCommitment){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_offered() -> Bool {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKHTLCOutputInCommitment>) in
HTLCOutputInCommitment_get_offered(this_ptrPointer)
};
    }

    public func set_offered(val: Bool) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKHTLCOutputInCommitment>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return HTLCOutputInCommitment_set_offered(this_ptrPointer, val);
    }

    public func get_amount_msat() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKHTLCOutputInCommitment>) in
HTLCOutputInCommitment_get_amount_msat(this_ptrPointer)
};
    }

    public func set_amount_msat(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKHTLCOutputInCommitment>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return HTLCOutputInCommitment_set_amount_msat(this_ptrPointer, val);
    }

    public func get_cltv_expiry() -> UInt32 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKHTLCOutputInCommitment>) in
HTLCOutputInCommitment_get_cltv_expiry(this_ptrPointer)
};
    }

    public func set_cltv_expiry(val: UInt32) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKHTLCOutputInCommitment>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return HTLCOutputInCommitment_set_cltv_expiry(this_ptrPointer, val);
    }

    public func get_payment_hash() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKHTLCOutputInCommitment>) in
HTLCOutputInCommitment_get_payment_hash(this_ptrPointer)
}.pointee);
    }

    public func set_payment_hash(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKHTLCOutputInCommitment>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return HTLCOutputInCommitment_set_payment_hash(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func get_transaction_output_index() -> Option_u32Z {
    	
        return Option_u32Z(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKHTLCOutputInCommitment>) in
HTLCOutputInCommitment_get_transaction_output_index(this_ptrPointer)
});
    }

    public func set_transaction_output_index(val: Option_u32Z) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKHTLCOutputInCommitment>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return HTLCOutputInCommitment_set_transaction_output_index(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func clone() -> HTLCOutputInCommitment {
    	
        return HTLCOutputInCommitment(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKHTLCOutputInCommitment>) in
HTLCOutputInCommitment_clone(origPointer)
});
    }

					internal func danglingClone() -> HTLCOutputInCommitment {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKHTLCOutputInCommitment>) in
HTLCOutputInCommitment_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_HTLCOutputInCommitmentDecodeErrorZ {
    	
        return Result_HTLCOutputInCommitmentDecodeErrorZ(pointer: HTLCOutputInCommitment_read(Bindings.new_LDKu8sliceWrapper(array: ser).cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return HTLCOutputInCommitment_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> HTLCOutputInCommitment {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing HTLCOutputInCommitment \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing HTLCOutputInCommitment \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
