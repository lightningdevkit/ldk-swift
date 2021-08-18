import LDKHeaders

public class Result_NoneErrorZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_NoneErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_NoneErrorZ(contents: LDKCResult_NoneErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_NoneErrorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getError() -> LDKIOError? {
				if self.cOpaqueStruct?.result_ok == false {
					return self.cOpaqueStruct!.contents.err.pointee
				}
				return nil
			}
			
    public class func ok() -> Result_NoneErrorZ {
    	
        return Result_NoneErrorZ(pointer: CResult_NoneErrorZ_ok());
    }

    public class func err(e: LDKIOError) -> Result_NoneErrorZ {
    	
        return Result_NoneErrorZ(pointer: CResult_NoneErrorZ_err(e));
    }

    internal func free() -> Void {
    	
        return CResult_NoneErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_NoneErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing Result_NoneErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing Result_NoneErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_NoneErrorZ {
    	
        return Result_NoneErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_NoneErrorZ>) in
CResult_NoneErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_NoneErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}
