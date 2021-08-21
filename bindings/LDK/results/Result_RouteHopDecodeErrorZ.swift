public class Result_RouteHopDecodeErrorZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_RouteHopDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_RouteHopDecodeErrorZ(contents: LDKCResult_RouteHopDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_RouteHopDecodeErrorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getError() -> DecodeError? {
				if self.cOpaqueStruct?.result_ok == false {
					return DecodeError(pointer: self.cOpaqueStruct!.contents.err.pointee)
				}
				return nil
			}
			
			public func getValue() -> RouteHop? {
				if self.cOpaqueStruct?.result_ok == true {
					return RouteHop(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: RouteHop) -> Result_RouteHopDecodeErrorZ {
    	
        return Result_RouteHopDecodeErrorZ(pointer: CResult_RouteHopDecodeErrorZ_ok(o.danglingClone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_RouteHopDecodeErrorZ {
    	
        return Result_RouteHopDecodeErrorZ(pointer: CResult_RouteHopDecodeErrorZ_err(e.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_RouteHopDecodeErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_RouteHopDecodeErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing Result_RouteHopDecodeErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing Result_RouteHopDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_RouteHopDecodeErrorZ {
    	
        return Result_RouteHopDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_RouteHopDecodeErrorZ>) in
CResult_RouteHopDecodeErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_RouteHopDecodeErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}
