public class Ping {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKPing?;


	/* DEFAULT_CONSTRUCTOR_START */
    public init(ponglen_arg: UInt16, byteslen_arg: UInt16) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = Ping_new(ponglen_arg, byteslen_arg)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKPing){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_ponglen() -> UInt16 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKPing>) in
Ping_get_ponglen(this_ptrPointer)
};
    }

    public func set_ponglen(val: UInt16) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKPing>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return Ping_set_ponglen(this_ptrPointer, val);
    }

    public func get_byteslen() -> UInt16 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKPing>) in
Ping_get_byteslen(this_ptrPointer)
};
    }

    public func set_byteslen(val: UInt16) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKPing>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return Ping_set_byteslen(this_ptrPointer, val);
    }

    public func clone() -> Ping {
    	
        return Ping(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKPing>) in
Ping_clone(origPointer)
});
    }

					internal func danglingClone() -> Ping {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKPing>) in
Ping_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_PingDecodeErrorZ {
    	
        return Result_PingDecodeErrorZ(pointer: Ping_read(Bindings.new_LDKu8slice(array: ser).cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return Ping_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Ping {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing Ping \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing Ping \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
