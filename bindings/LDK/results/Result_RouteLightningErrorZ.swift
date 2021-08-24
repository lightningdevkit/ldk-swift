import LDKHeaders

public class Result_RouteLightningErrorZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKCResult_RouteLightningErrorZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_RouteLightningErrorZ(contents: LDKCResult_RouteLightningErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_RouteLightningErrorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getError() -> LightningError? {
				if self.cOpaqueStruct?.result_ok == false {
					return LightningError(pointer: self.cOpaqueStruct!.contents.err.pointee)
				}
				return nil
			}
			
			public func getValue() -> Route? {
				if self.cOpaqueStruct?.result_ok == true {
					return Route(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: Route) -> Result_RouteLightningErrorZ {
    	
        return Result_RouteLightningErrorZ(pointer: CResult_RouteLightningErrorZ_ok(o.danglingClone().cOpaqueStruct!));
    }

    public class func err(e: LightningError) -> Result_RouteLightningErrorZ {
    	
        return Result_RouteLightningErrorZ(pointer: CResult_RouteLightningErrorZ_err(e.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_RouteLightningErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_RouteLightningErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing Result_RouteLightningErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing Result_RouteLightningErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_RouteLightningErrorZ {
    	
        return Result_RouteLightningErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_RouteLightningErrorZ>) in
CResult_RouteLightningErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_RouteLightningErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}
