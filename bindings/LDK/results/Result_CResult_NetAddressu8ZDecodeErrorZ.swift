public class Result_CResult_NetAddressu8ZDecodeErrorZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_CResult_NetAddressu8ZDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_CResult_NetAddressu8ZDecodeErrorZ(contents: LDKCResult_CResult_NetAddressu8ZDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_CResult_NetAddressu8ZDecodeErrorZ){
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
			
			public func getValue() -> Result_NetAddressu8Z? {
				if self.cOpaqueStruct?.result_ok == true {
					return Result_NetAddressu8Z(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: Result_NetAddressu8Z) -> Result_CResult_NetAddressu8ZDecodeErrorZ {
    	
        return Result_CResult_NetAddressu8ZDecodeErrorZ(pointer: CResult_CResult_NetAddressu8ZDecodeErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_CResult_NetAddressu8ZDecodeErrorZ {
    	
        return Result_CResult_NetAddressu8ZDecodeErrorZ(pointer: CResult_CResult_NetAddressu8ZDecodeErrorZ_err(e.clone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_CResult_NetAddressu8ZDecodeErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_CResult_NetAddressu8ZDecodeErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							self.free()
						}
					}
				

    public func clone() -> Result_CResult_NetAddressu8ZDecodeErrorZ {
    	
        return Result_CResult_NetAddressu8ZDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_CResult_NetAddressu8ZDecodeErrorZ>) in
CResult_CResult_NetAddressu8ZDecodeErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_CResult_NetAddressu8ZDecodeErrorZ {
        				var dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}
