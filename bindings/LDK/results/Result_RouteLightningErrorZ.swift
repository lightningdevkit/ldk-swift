public class Result_RouteLightningErrorZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_RouteLightningErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_RouteLightningErrorZ(contents: LDKCResult_RouteLightningErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_RouteLightningErrorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
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
							self.free()
						}
					}
				

    public func clone() -> Result_RouteLightningErrorZ {
    	
        return Result_RouteLightningErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_RouteLightningErrorZ>) in
CResult_RouteLightningErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_RouteLightningErrorZ {
        				var dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}
