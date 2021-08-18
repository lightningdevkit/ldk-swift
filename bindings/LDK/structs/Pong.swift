public class Pong {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKPong?;


	/* DEFAULT_CONSTRUCTOR_START */
    public init(byteslen_arg: UInt16) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = Pong_new(byteslen_arg)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKPong){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
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
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKPong>) in
Pong(pointer: Pong_clone(origPointer))
};
    }

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKPong>) in
Pong_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_PongDecodeErrorZ {
    	
        return Result_PongDecodeErrorZ(pointer: Pong_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
					
		Pong_free(self.cOpaqueStruct!)
					
				
	}
			
    /* STRUCT_METHODS_END */

}
