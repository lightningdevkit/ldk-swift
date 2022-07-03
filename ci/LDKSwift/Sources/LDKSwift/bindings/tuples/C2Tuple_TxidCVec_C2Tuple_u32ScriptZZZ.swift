#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKC2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ?

    public init(pointer: LDKC2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKC2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* TUPLE_METHODS_START */

    public func clone() -> C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ {
    	
        return C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKC2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ>) in
C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ_clone(origPointer)
});
    }

					internal func danglingClone() -> C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public class func new(a: [UInt8], b: [C2Tuple_u32ScriptZ]) -> C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ {
    	
							let bUnwrapped = b.map { (bCurrentValue) in
							bCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
						let bWrapper = Bindings.new_LDKCVec_C2Tuple_u32ScriptZZWrapper(array: bUnwrapped)
						defer {
							bWrapper.noOpRetain()
						}
					
        return C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ(pointer: C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ_new(Bindings.new_LDKThirtyTwoBytes(array: a), bWrapper.dangle().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ \(self.instanceNumber) due to dangle.")
						}
					}
				

				public func getA() -> [UInt8] {
					return Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.a);
				}
			
				public func getB() -> [C2Tuple_u32ScriptZ] {
					return Bindings.LDKCVec_C2Tuple_u32ScriptZZ_to_array(nativeType: self.cOpaqueStruct!.b, deallocate: false)
						
						.map { (cOpaqueStruct) in
							C2Tuple_u32ScriptZ(pointer: cOpaqueStruct).dangle()
						}
					;
				}
			
    /* TUPLE_METHODS_END */

}
