#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class C2Tuple_usizeTransactionZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKC2Tuple_usizeTransactionZ?

    public init(pointer: LDKC2Tuple_usizeTransactionZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKC2Tuple_usizeTransactionZ, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* TUPLE_METHODS_START */

    public func clone() -> C2Tuple_usizeTransactionZ {
    	
        return C2Tuple_usizeTransactionZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKC2Tuple_usizeTransactionZ>) in
C2Tuple_usizeTransactionZ_clone(origPointer)
});
    }

					internal func danglingClone() -> C2Tuple_usizeTransactionZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public class func new(a: UInt, b: [UInt8]) -> C2Tuple_usizeTransactionZ {
    	
						let bWrapper = Bindings.new_LDKTransactionWrapper(array: b)
						defer {
							bWrapper.noOpRetain()
						}
					
        return C2Tuple_usizeTransactionZ(pointer: C2Tuple_usizeTransactionZ_new(a, bWrapper.dangle().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return C2Tuple_usizeTransactionZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> C2Tuple_usizeTransactionZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing C2Tuple_usizeTransactionZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing C2Tuple_usizeTransactionZ \(self.instanceNumber) due to dangle.")
						}
					}
				

				public func getA() -> UInt {
					return self.cOpaqueStruct!.a;
				}
			
				public func getB() -> [UInt8] {
					return Bindings.LDKTransaction_to_array(nativeType: self.cOpaqueStruct!.b, deallocate: false);
				}
			
    /* TUPLE_METHODS_END */

}
