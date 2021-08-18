public class UpdateFulfillHTLC {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKUpdateFulfillHTLC?;


	/* DEFAULT_CONSTRUCTOR_START */
    public init(channel_id_arg: [UInt8], htlc_id_arg: UInt64, payment_preimage_arg: [UInt8]) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = UpdateFulfillHTLC_new(Bindings.new_LDKThirtyTwoBytes(array: channel_id_arg).cOpaqueStruct!, htlc_id_arg, Bindings.new_LDKThirtyTwoBytes(array: payment_preimage_arg).cOpaqueStruct!)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKUpdateFulfillHTLC){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_channel_id() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUpdateFulfillHTLC>) in
UpdateFulfillHTLC_get_channel_id(this_ptrPointer)
}.pointee);
    }

    public func set_channel_id(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKUpdateFulfillHTLC>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return UpdateFulfillHTLC_set_channel_id(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val).cOpaqueStruct!);
    }

    public func get_htlc_id() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUpdateFulfillHTLC>) in
UpdateFulfillHTLC_get_htlc_id(this_ptrPointer)
};
    }

    public func set_htlc_id(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKUpdateFulfillHTLC>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return UpdateFulfillHTLC_set_htlc_id(this_ptrPointer, val);
    }

    public func get_payment_preimage() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKUpdateFulfillHTLC>) in
UpdateFulfillHTLC_get_payment_preimage(this_ptrPointer)
}.pointee);
    }

    public func set_payment_preimage(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKUpdateFulfillHTLC>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return UpdateFulfillHTLC_set_payment_preimage(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val).cOpaqueStruct!);
    }

    public func clone() -> UpdateFulfillHTLC {
    	
        return UpdateFulfillHTLC(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKUpdateFulfillHTLC>) in
UpdateFulfillHTLC_clone(origPointer)
});
    }

					internal func danglingClone() -> UpdateFulfillHTLC {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKUpdateFulfillHTLC>) in
UpdateFulfillHTLC_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_UpdateFulfillHTLCDecodeErrorZ {
    	
        return Result_UpdateFulfillHTLCDecodeErrorZ(pointer: UpdateFulfillHTLC_read(Bindings.new_LDKu8slice(array: ser).cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return UpdateFulfillHTLC_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> UpdateFulfillHTLC {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing UpdateFulfillHTLC \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing UpdateFulfillHTLC \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
