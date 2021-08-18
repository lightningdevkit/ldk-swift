public class StaticPaymentOutputDescriptor {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKStaticPaymentOutputDescriptor?;


	/* DEFAULT_CONSTRUCTOR_START */
    public init(outpoint_arg: OutPoint, output_arg: LDKTxOut, channel_keys_id_arg: [UInt8], channel_value_satoshis_arg: UInt64) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = StaticPaymentOutputDescriptor_new(outpoint_arg.clone().cOpaqueStruct!, output_arg, Bindings.new_LDKThirtyTwoBytes(array: channel_keys_id_arg), channel_value_satoshis_arg)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKStaticPaymentOutputDescriptor){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_outpoint() -> OutPoint {
    	
        return OutPoint(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKStaticPaymentOutputDescriptor>) in
StaticPaymentOutputDescriptor_get_outpoint(this_ptrPointer)
});
    }

    public func set_outpoint(val: OutPoint) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKStaticPaymentOutputDescriptor>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return StaticPaymentOutputDescriptor_set_outpoint(this_ptrPointer, val.clone().cOpaqueStruct!);
    }

    public func set_output(val: LDKTxOut) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKStaticPaymentOutputDescriptor>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return StaticPaymentOutputDescriptor_set_output(this_ptrPointer, val);
    }

    public func get_channel_keys_id() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKStaticPaymentOutputDescriptor>) in
StaticPaymentOutputDescriptor_get_channel_keys_id(this_ptrPointer)
}.pointee);
    }

    public func set_channel_keys_id(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKStaticPaymentOutputDescriptor>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return StaticPaymentOutputDescriptor_set_channel_keys_id(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func get_channel_value_satoshis() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKStaticPaymentOutputDescriptor>) in
StaticPaymentOutputDescriptor_get_channel_value_satoshis(this_ptrPointer)
};
    }

    public func set_channel_value_satoshis(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKStaticPaymentOutputDescriptor>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return StaticPaymentOutputDescriptor_set_channel_value_satoshis(this_ptrPointer, val);
    }

    public func clone() -> StaticPaymentOutputDescriptor {
    	
        return StaticPaymentOutputDescriptor(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKStaticPaymentOutputDescriptor>) in
StaticPaymentOutputDescriptor_clone(origPointer)
});
    }

					internal func danglingClone() -> StaticPaymentOutputDescriptor {
        				var dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKStaticPaymentOutputDescriptor>) in
StaticPaymentOutputDescriptor_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_StaticPaymentOutputDescriptorDecodeErrorZ {
    	
        return Result_StaticPaymentOutputDescriptorDecodeErrorZ(pointer: StaticPaymentOutputDescriptor_read(Bindings.new_LDKu8slice(array: ser)));
    }

    internal func free() -> Void {
    	
        return StaticPaymentOutputDescriptor_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> StaticPaymentOutputDescriptor {
        				self.dangling = true
						return self
					}
					
					deinit {
						self.free()
					}
				

    /* STRUCT_METHODS_END */

}
