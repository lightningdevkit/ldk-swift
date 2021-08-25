public class RouteHint: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKRouteHint?


	

    public init(pointer: LDKRouteHint){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

    /* STRUCT_METHODS_START */

    public class func eq(a: RouteHint, b: RouteHint) -> Bool {
    	
        return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKRouteHint>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKRouteHint>) in
RouteHint_eq(aPointer, bPointer)
}
};
    }

    public func clone() -> RouteHint {
    	
        return RouteHint(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKRouteHint>) in
RouteHint_clone(origPointer)
});
    }

					internal func danglingClone() -> RouteHint {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    internal func free() -> Void {
    	
        return RouteHint_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> RouteHint {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing RouteHint \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing RouteHint \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
