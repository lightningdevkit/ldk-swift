#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class PrivateRoute: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKPrivateRoute?


	

    public init(pointer: LDKPrivateRoute){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKPrivateRoute, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func clone() -> PrivateRoute {
    	
        return PrivateRoute(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKPrivateRoute>) in
PrivateRoute_clone(origPointer)
});
    }

					internal func danglingClone() -> PrivateRoute {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func hash() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKPrivateRoute>) in
PrivateRoute_hash(oPointer)
};
    }

    public class func eq(a: PrivateRoute, b: PrivateRoute) -> Bool {
    	
        return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKPrivateRoute>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKPrivateRoute>) in
PrivateRoute_eq(aPointer, bPointer)
}
};
    }

    public class func new(hops: RouteHint) -> Result_PrivateRouteCreationErrorZ {
    	
        return Result_PrivateRouteCreationErrorZ(pointer: PrivateRoute_new(hops.danglingClone().cOpaqueStruct!));
    }

    public func into_inner() -> RouteHint {
    	
        return RouteHint(pointer: PrivateRoute_into_inner(self.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return PrivateRoute_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> PrivateRoute {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing PrivateRoute \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing PrivateRoute \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
