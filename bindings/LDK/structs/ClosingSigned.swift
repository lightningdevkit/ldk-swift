import LDKHeaders

public class ClosingSigned {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKClosingSigned?;


	/* DEFAULT_CONSTRUCTOR_START */
    public init(channel_id_arg: [UInt8], fee_satoshis_arg: UInt64, signature_arg: [UInt8]) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = ClosingSigned_new(Bindings.new_LDKThirtyTwoBytes(array: channel_id_arg), fee_satoshis_arg, Bindings.new_LDKSignature(array: signature_arg))
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKClosingSigned){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_channel_id() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKClosingSigned>) in
ClosingSigned_get_channel_id(this_ptrPointer)
}.pointee);
    }

    public func set_channel_id(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKClosingSigned>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ClosingSigned_set_channel_id(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func get_fee_satoshis() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKClosingSigned>) in
ClosingSigned_get_fee_satoshis(this_ptrPointer)
};
    }

    public func set_fee_satoshis(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKClosingSigned>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ClosingSigned_set_fee_satoshis(this_ptrPointer, val);
    }

    public func get_signature() -> [UInt8] {
    	
        return Bindings.LDKSignature_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKClosingSigned>) in
ClosingSigned_get_signature(this_ptrPointer)
});
    }

    public func set_signature(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKClosingSigned>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ClosingSigned_set_signature(this_ptrPointer, Bindings.new_LDKSignature(array: val));
    }

    public func clone() -> ClosingSigned {
    	
        return ClosingSigned(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKClosingSigned>) in
ClosingSigned_clone(origPointer)
});
    }

					internal func danglingClone() -> ClosingSigned {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKClosingSigned>) in
ClosingSigned_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_ClosingSignedDecodeErrorZ {
    	
        return Result_ClosingSignedDecodeErrorZ(pointer: ClosingSigned_read(Bindings.new_LDKu8slice(array: ser)));
    }

    internal func free() -> Void {
    	
        return ClosingSigned_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> ClosingSigned {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing ClosingSigned \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing ClosingSigned \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
