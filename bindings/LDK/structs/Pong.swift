public class Pong: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKPong?


	/* DEFAULT_CONSTRUCTOR_START */
    public init(byteslen_arg: UInt16) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = Pong_new(byteslen_arg)
        super.init()
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKPong){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init()
	}

    /* STRUCT_METHODS_START */

    public func get_byteslen() -> UInt16 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKPong>) in
Pong_get_byteslen(this_ptrPointer)
};
    }

    public func set_byteslen(val: UInt16) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKPong>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return Pong_set_byteslen(this_ptrPointer, val);
    }

    public func clone() -> Pong {
    	
        return Pong(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKPong>) in
Pong_clone(origPointer)
});
    }

					internal func danglingClone() -> Pong {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKPong>) in
Pong_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_PongDecodeErrorZ {
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_PongDecodeErrorZ(pointer: Pong_read(serWrapper.cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return Pong_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Pong {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing Pong \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing Pong \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
