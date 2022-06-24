#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class MinFinalCltvExpiry: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKMinFinalCltvExpiry?


	/* DEFAULT_CONSTRUCTOR_START */
    public init(a_arg: UInt64) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = MinFinalCltvExpiry_new(a_arg)
        super.init(conflictAvoidingVariableName: 0)
        
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKMinFinalCltvExpiry){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKMinFinalCltvExpiry, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func get_a() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKMinFinalCltvExpiry>) in
MinFinalCltvExpiry_get_a(this_ptrPointer)
};
    }

    public func set_a(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKMinFinalCltvExpiry>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return MinFinalCltvExpiry_set_a(this_ptrPointer, val);
    }

    public func clone() -> MinFinalCltvExpiry {
    	
        return MinFinalCltvExpiry(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKMinFinalCltvExpiry>) in
MinFinalCltvExpiry_clone(origPointer)
});
    }

					internal func danglingClone() -> MinFinalCltvExpiry {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func hash() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKMinFinalCltvExpiry>) in
MinFinalCltvExpiry_hash(oPointer)
};
    }

    public class func eq(a: MinFinalCltvExpiry, b: MinFinalCltvExpiry) -> Bool {
    	
        return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKMinFinalCltvExpiry>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKMinFinalCltvExpiry>) in
MinFinalCltvExpiry_eq(aPointer, bPointer)
}
};
    }

    internal func free() -> Void {
    	
        return MinFinalCltvExpiry_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> MinFinalCltvExpiry {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing MinFinalCltvExpiry \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing MinFinalCltvExpiry \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
