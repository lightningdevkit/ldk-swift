public class OutPoint: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKOutPoint?


	/* DEFAULT_CONSTRUCTOR_START */
    public init(txid_arg: [UInt8], index_arg: UInt16) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = OutPoint_new(Bindings.new_LDKThirtyTwoBytes(array: txid_arg), index_arg)
        super.init(conflictAvoidingVariableName: 0)
        /* POST_INIT_ANCHORING */
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKOutPoint){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKOutPoint, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func get_txid() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKOutPoint>) in
OutPoint_get_txid(this_ptrPointer)
}.pointee);
    }

    public func set_txid(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKOutPoint>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return OutPoint_set_txid(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func get_index() -> UInt16 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKOutPoint>) in
OutPoint_get_index(this_ptrPointer)
};
    }

    public func set_index(val: UInt16) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKOutPoint>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return OutPoint_set_index(this_ptrPointer, val);
    }

    public func clone() -> OutPoint {
    	
        return OutPoint(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKOutPoint>) in
OutPoint_clone(origPointer)
});
    }

					internal func danglingClone() -> OutPoint {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public class func eq(a: OutPoint, b: OutPoint) -> Bool {
    	
        return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKOutPoint>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKOutPoint>) in
OutPoint_eq(aPointer, bPointer)
}
};
    }

    public func hash() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKOutPoint>) in
OutPoint_hash(oPointer)
};
    }

    public func to_channel_id() -> [UInt8] {
    	
        return Bindings.LDKThirtyTwoBytes_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKOutPoint>) in
OutPoint_to_channel_id(this_argPointer)
});
    }

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKOutPoint>) in
OutPoint_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_OutPointDecodeErrorZ {
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_OutPointDecodeErrorZ(pointer: OutPoint_read(serWrapper.cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return OutPoint_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> OutPoint {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing OutPoint \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing OutPoint \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
