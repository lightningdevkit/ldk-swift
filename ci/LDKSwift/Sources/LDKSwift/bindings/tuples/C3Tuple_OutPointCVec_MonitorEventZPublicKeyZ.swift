#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class C3Tuple_OutPointCVec_MonitorEventZPublicKeyZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKC3Tuple_OutPointCVec_MonitorEventZPublicKeyZ?

    public init(pointer: LDKC3Tuple_OutPointCVec_MonitorEventZPublicKeyZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKC3Tuple_OutPointCVec_MonitorEventZPublicKeyZ, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* TUPLE_METHODS_START */

    public func clone() -> C3Tuple_OutPointCVec_MonitorEventZPublicKeyZ {
    	
        return C3Tuple_OutPointCVec_MonitorEventZPublicKeyZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKC3Tuple_OutPointCVec_MonitorEventZPublicKeyZ>) in
C3Tuple_OutPointCVec_MonitorEventZPublicKeyZ_clone(origPointer)
});
    }

					internal func danglingClone() -> C3Tuple_OutPointCVec_MonitorEventZPublicKeyZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public class func new(a: OutPoint, b: [MonitorEvent], c: [UInt8]) -> C3Tuple_OutPointCVec_MonitorEventZPublicKeyZ {
    	
							let bUnwrapped = b.map { (bCurrentValue) in
							bCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
						let bWrapper = Bindings.new_LDKCVec_MonitorEventZWrapper(array: bUnwrapped)
						defer {
							bWrapper.noOpRetain()
						}
					
        return C3Tuple_OutPointCVec_MonitorEventZPublicKeyZ(pointer: C3Tuple_OutPointCVec_MonitorEventZPublicKeyZ_new(a.danglingClone().cOpaqueStruct!, bWrapper.dangle().cOpaqueStruct!, Bindings.new_LDKPublicKey(array: c)));
    }

    internal func free() -> Void {
    	
        return C3Tuple_OutPointCVec_MonitorEventZPublicKeyZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> C3Tuple_OutPointCVec_MonitorEventZPublicKeyZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing C3Tuple_OutPointCVec_MonitorEventZPublicKeyZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing C3Tuple_OutPointCVec_MonitorEventZPublicKeyZ \(self.instanceNumber) due to dangle.")
						}
					}
				

				public func getA() -> OutPoint? {
					return 
				{ () in
					let cStruct =
				self.cOpaqueStruct!.a;
				if cStruct.inner == nil {
					return nil
				}
				return OutPoint(pointer: cStruct, anchor: self)
				}()
			;
				}
			
				public func getB() -> [MonitorEvent] {
					return Bindings.LDKCVec_MonitorEventZ_to_array(nativeType: self.cOpaqueStruct!.b, deallocate: false)
						
						.map { (cOpaqueStruct) in
							MonitorEvent(pointer: cOpaqueStruct).dangle()
						}
					;
				}
			
				public func getC() -> [UInt8] {
					return Bindings.LDKPublicKey_to_array(nativeType: self.cOpaqueStruct!.c);
				}
			
    /* TUPLE_METHODS_END */

}
