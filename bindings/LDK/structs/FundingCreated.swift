public class FundingCreated {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKFundingCreated?;


	/* DEFAULT_CONSTRUCTOR_START */
    public init(temporary_channel_id_arg: [UInt8], funding_txid_arg: [UInt8], funding_output_index_arg: UInt16, signature_arg: [UInt8]) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = FundingCreated_new(Bindings.new_LDKThirtyTwoBytes(array: temporary_channel_id_arg).cOpaqueStruct!, Bindings.new_LDKThirtyTwoBytes(array: funding_txid_arg).cOpaqueStruct!, funding_output_index_arg, Bindings.new_LDKSignature(array: signature_arg).cOpaqueStruct!)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKFundingCreated){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_temporary_channel_id() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKFundingCreated>) in
FundingCreated_get_temporary_channel_id(this_ptrPointer)
}.pointee);
    }

    public func set_temporary_channel_id(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKFundingCreated>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return FundingCreated_set_temporary_channel_id(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val).cOpaqueStruct!);
    }

    public func get_funding_txid() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKFundingCreated>) in
FundingCreated_get_funding_txid(this_ptrPointer)
}.pointee);
    }

    public func set_funding_txid(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKFundingCreated>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return FundingCreated_set_funding_txid(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val).cOpaqueStruct!);
    }

    public func get_funding_output_index() -> UInt16 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKFundingCreated>) in
FundingCreated_get_funding_output_index(this_ptrPointer)
};
    }

    public func set_funding_output_index(val: UInt16) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKFundingCreated>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return FundingCreated_set_funding_output_index(this_ptrPointer, val);
    }

    public func get_signature() -> [UInt8] {
    	
        return Bindings.LDKSignature_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKFundingCreated>) in
FundingCreated_get_signature(this_ptrPointer)
});
    }

    public func set_signature(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKFundingCreated>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return FundingCreated_set_signature(this_ptrPointer, Bindings.new_LDKSignature(array: val).cOpaqueStruct!);
    }

    public func clone() -> FundingCreated {
    	
        return FundingCreated(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKFundingCreated>) in
FundingCreated_clone(origPointer)
});
    }

					internal func danglingClone() -> FundingCreated {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKFundingCreated>) in
FundingCreated_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_FundingCreatedDecodeErrorZ {
    	
        return Result_FundingCreatedDecodeErrorZ(pointer: FundingCreated_read(Bindings.new_LDKu8slice(array: ser).cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return FundingCreated_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> FundingCreated {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing FundingCreated \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing FundingCreated \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
