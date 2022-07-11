#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class C2Tuple_u64u64Z: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKC2Tuple_u64u64Z?

    public init(pointer: LDKC2Tuple_u64u64Z){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKC2Tuple_u64u64Z, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* TUPLE_METHODS_START */

    public func clone() -> C2Tuple_u64u64Z {
    	
        return C2Tuple_u64u64Z(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKC2Tuple_u64u64Z>) in
C2Tuple_u64u64Z_clone(origPointer)
});
    }

					internal func danglingClone() -> C2Tuple_u64u64Z {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public class func new(a: UInt64, b: UInt64) -> C2Tuple_u64u64Z {
    	
        return C2Tuple_u64u64Z(pointer: C2Tuple_u64u64Z_new(a, b));
    }

    internal func free() -> Void {
    	
        return C2Tuple_u64u64Z_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> C2Tuple_u64u64Z {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing C2Tuple_u64u64Z \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing C2Tuple_u64u64Z \(self.instanceNumber) due to dangle.")
						}
					}
				

				public func getA() -> UInt64 {
					return self.cOpaqueStruct!.a;
				}
			
				public func getB() -> UInt64 {
					return self.cOpaqueStruct!.b;
				}
			
    /* TUPLE_METHODS_END */

}
