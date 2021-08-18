import LDKHeaders

public class UpdateFailMalformedHTLC {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKUpdateFailMalformedHTLC?;


	

    public init(pointer: LDKUpdateFailMalformedHTLC){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_channel_id() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUpdateFailMalformedHTLC>) in
UpdateFailMalformedHTLC_get_channel_id(this_ptrPointer)
}.pointee);
    }

    public func set_channel_id(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKUpdateFailMalformedHTLC>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return UpdateFailMalformedHTLC_set_channel_id(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func get_htlc_id() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUpdateFailMalformedHTLC>) in
UpdateFailMalformedHTLC_get_htlc_id(this_ptrPointer)
};
    }

    public func set_htlc_id(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKUpdateFailMalformedHTLC>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return UpdateFailMalformedHTLC_set_htlc_id(this_ptrPointer, val);
    }

    public func get_failure_code() -> UInt16 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUpdateFailMalformedHTLC>) in
UpdateFailMalformedHTLC_get_failure_code(this_ptrPointer)
};
    }

    public func set_failure_code(val: UInt16) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKUpdateFailMalformedHTLC>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return UpdateFailMalformedHTLC_set_failure_code(this_ptrPointer, val);
    }

    public func clone() -> UpdateFailMalformedHTLC {
    	
        return UpdateFailMalformedHTLC(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKUpdateFailMalformedHTLC>) in
UpdateFailMalformedHTLC_clone(origPointer)
});
    }

					internal func danglingClone() -> UpdateFailMalformedHTLC {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKUpdateFailMalformedHTLC>) in
UpdateFailMalformedHTLC_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_UpdateFailMalformedHTLCDecodeErrorZ {
    	
        return Result_UpdateFailMalformedHTLCDecodeErrorZ(pointer: UpdateFailMalformedHTLC_read(Bindings.new_LDKu8slice(array: ser)));
    }

    internal func free() -> Void {
    	
        return UpdateFailMalformedHTLC_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> UpdateFailMalformedHTLC {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing UpdateFailMalformedHTLC \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing UpdateFailMalformedHTLC \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
