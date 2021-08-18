import LDKHeaders

public class Result_TxOutAccessErrorZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_TxOutAccessErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_TxOutAccessErrorZ(contents: LDKCResult_TxOutAccessErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_TxOutAccessErrorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getError() -> LDKAccessError? {
				if self.cOpaqueStruct?.result_ok == false {
					return self.cOpaqueStruct!.contents.err.pointee
				}
				return nil
			}
			
			public func getValue() -> TxOut? {
				if self.cOpaqueStruct?.result_ok == true {
					return TxOut(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: LDKTxOut) -> Result_TxOutAccessErrorZ {
    	
        return Result_TxOutAccessErrorZ(pointer: CResult_TxOutAccessErrorZ_ok(o));
    }

    public class func err(e: LDKAccessError) -> Result_TxOutAccessErrorZ {
    	
        return Result_TxOutAccessErrorZ(pointer: CResult_TxOutAccessErrorZ_err(e));
    }

    internal func free() -> Void {
    	
        return CResult_TxOutAccessErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_TxOutAccessErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							self.free()
						}
					}
				

    public func clone() -> Result_TxOutAccessErrorZ {
    	
        return Result_TxOutAccessErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_TxOutAccessErrorZ>) in
CResult_TxOutAccessErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_TxOutAccessErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}
