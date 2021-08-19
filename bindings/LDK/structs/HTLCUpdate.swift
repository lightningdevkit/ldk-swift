public class HTLCUpdate {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKHTLCUpdate?;


	

    public init(pointer: LDKHTLCUpdate){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func clone() -> HTLCUpdate {
    	
        return HTLCUpdate(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKHTLCUpdate>) in
HTLCUpdate_clone(origPointer)
});
    }

					internal func danglingClone() -> HTLCUpdate {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKHTLCUpdate>) in
HTLCUpdate_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_HTLCUpdateDecodeErrorZ {
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_HTLCUpdateDecodeErrorZ(pointer: HTLCUpdate_read(serWrapper.cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return HTLCUpdate_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> HTLCUpdate {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing HTLCUpdate \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing HTLCUpdate \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
