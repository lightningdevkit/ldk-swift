import LDKHeaders

public class Result_PrivateRouteCreationErrorZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKCResult_PrivateRouteCreationErrorZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_PrivateRouteCreationErrorZ(contents: LDKCResult_PrivateRouteCreationErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_PrivateRouteCreationErrorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
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
    	
        return Result_PrivateRouteCreationErrorZ(pointer: CResult_PrivateRouteCreationErrorZ_ok(o.danglingClone().cOpaqueStruct!));
    }

    public class func err(e: LDKCreationError) -> Result_PrivateRouteCreationErrorZ {
    	
        return Result_PrivateRouteCreationErrorZ(pointer: CResult_PrivateRouteCreationErrorZ_err(e));
    }

    internal func free() -> Void {
    	
        return CResult_PrivateRouteCreationErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_PrivateRouteCreationErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing Result_PrivateRouteCreationErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing Result_PrivateRouteCreationErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_PrivateRouteCreationErrorZ {
    	
        return Result_PrivateRouteCreationErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_PrivateRouteCreationErrorZ>) in
CResult_PrivateRouteCreationErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_PrivateRouteCreationErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}
