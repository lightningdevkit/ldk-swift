#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class C2Tuple_OutPointCVec_MonitorEventZZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKC2Tuple_OutPointCVec_MonitorEventZZ?

    public init(pointer: LDKC2Tuple_OutPointCVec_MonitorEventZZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKC2Tuple_OutPointCVec_MonitorEventZZ, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* TUPLE_METHODS_START */

    public func clone() -> C2Tuple_OutPointCVec_MonitorEventZZ {
    	
        return C2Tuple_OutPointCVec_MonitorEventZZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKC2Tuple_OutPointCVec_MonitorEventZZ>) in
C2Tuple_OutPointCVec_MonitorEventZZ_clone(origPointer)
});
    }

					internal func danglingClone() -> C2Tuple_OutPointCVec_MonitorEventZZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public class func new(a: OutPoint, b: [MonitorEvent]) -> C2Tuple_OutPointCVec_MonitorEventZZ {
    	
							let bUnwrapped = b.map { (bCurrentValue) in
							bCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
						let bWrapper = Bindings.new_LDKCVec_MonitorEventZWrapper(array: bUnwrapped)
						defer {
							bWrapper.noOpRetain()
						}
					
        return C2Tuple_OutPointCVec_MonitorEventZZ(pointer: C2Tuple_OutPointCVec_MonitorEventZZ_new(a.danglingClone().cOpaqueStruct!, bWrapper.dangle().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return C2Tuple_OutPointCVec_MonitorEventZZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> C2Tuple_OutPointCVec_MonitorEventZZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing C2Tuple_OutPointCVec_MonitorEventZZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing C2Tuple_OutPointCVec_MonitorEventZZ \(self.instanceNumber) due to dangle.")
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
			
    /* TUPLE_METHODS_END */

}
