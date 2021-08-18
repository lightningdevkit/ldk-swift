import LDKHeaders

public class ChannelUpdate {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKChannelUpdate?;


	/* DEFAULT_CONSTRUCTOR_START */
    public init(signature_arg: [UInt8], contents_arg: UnsignedChannelUpdate) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = ChannelUpdate_new(Bindings.new_LDKSignature(array: signature_arg), contents_arg.danglingClone().cOpaqueStruct!)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKChannelUpdate){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_signature() -> [UInt8] {
    	
        return Bindings.LDKSignature_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelUpdate>) in
ChannelUpdate_get_signature(this_ptrPointer)
});
    }

    public func set_signature(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelUpdate>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelUpdate_set_signature(this_ptrPointer, Bindings.new_LDKSignature(array: val));
    }

    public func get_contents() -> UnsignedChannelUpdate {
    	
        return UnsignedChannelUpdate(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelUpdate>) in
ChannelUpdate_get_contents(this_ptrPointer)
});
    }

    public func set_contents(val: UnsignedChannelUpdate) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelUpdate>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelUpdate_set_contents(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func clone() -> ChannelUpdate {
    	
        return ChannelUpdate(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKChannelUpdate>) in
ChannelUpdate_clone(origPointer)
});
    }

					internal func danglingClone() -> ChannelUpdate {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKChannelUpdate>) in
ChannelUpdate_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_ChannelUpdateDecodeErrorZ {
    	
        return Result_ChannelUpdateDecodeErrorZ(pointer: ChannelUpdate_read(Bindings.new_LDKu8slice(array: ser)));
    }

    internal func free() -> Void {
    	
        return ChannelUpdate_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> ChannelUpdate {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							self.free()
						}
					}
				

    /* STRUCT_METHODS_END */

}
