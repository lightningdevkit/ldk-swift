public class RawDataPart {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKRawDataPart?;


	

    public init(pointer: LDKRawDataPart){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_timestamp() -> PositiveTimestamp {
    	
        return PositiveTimestamp(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKRawDataPart>) in
RawDataPart_get_timestamp(this_ptrPointer)
});
    }

    public func set_timestamp(val: PositiveTimestamp) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKRawDataPart>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return RawDataPart_set_timestamp(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public class func eq(a: RawDataPart, b: RawDataPart) -> Bool {
    	
        return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKRawDataPart>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKRawDataPart>) in
RawDataPart_eq(aPointer, bPointer)
}
};
    }

    public func clone() -> RawDataPart {
    	
        return RawDataPart(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKRawDataPart>) in
RawDataPart_clone(origPointer)
});
    }

					internal func danglingClone() -> RawDataPart {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    internal func free() -> Void {
    	
        return RawDataPart_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> RawDataPart {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing RawDataPart \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing RawDataPart \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
