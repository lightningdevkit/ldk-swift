public class Result_PrivateRouteCreationErrorZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_PrivateRouteCreationErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_PrivateRouteCreationErrorZ(contents: LDKCResult_PrivateRouteCreationErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_PrivateRouteCreationErrorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getError() -> LDKCreationError? {
				if self.cOpaqueStruct?.result_ok == false {
					return self.cOpaqueStruct!.contents.err.pointee
				}
				return nil
			}
			
			public func getValue() -> PrivateRoute? {
				if self.cOpaqueStruct?.result_ok == true {
					return PrivateRoute(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: PrivateRoute) -> Result_PrivateRouteCreationErrorZ {
    	
        return Result_PrivateRouteCreationErrorZ(pointer: CResult_PrivateRouteCreationErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: LDKCreationError) -> Result_PrivateRouteCreationErrorZ {
    	
        return Result_PrivateRouteCreationErrorZ(pointer: CResult_PrivateRouteCreationErrorZ_err(e));
    }

    public func free() -> Void {
    	
        return CResult_PrivateRouteCreationErrorZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_PrivateRouteCreationErrorZ {
    	
        return Result_PrivateRouteCreationErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_PrivateRouteCreationErrorZ>) in
CResult_PrivateRouteCreationErrorZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}
