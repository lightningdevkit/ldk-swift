public class Result_InvoiceSignOrCreationErrorZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_InvoiceSignOrCreationErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_InvoiceSignOrCreationErrorZ(contents: LDKCResult_InvoiceSignOrCreationErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_InvoiceSignOrCreationErrorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getError() -> SignOrCreationError? {
				if self.cOpaqueStruct?.result_ok == false {
					return SignOrCreationError(pointer: self.cOpaqueStruct!.contents.err.pointee)
				}
				return nil
			}
			
			public func getValue() -> Invoice? {
				if self.cOpaqueStruct?.result_ok == true {
					return Invoice(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: Invoice) -> Result_InvoiceSignOrCreationErrorZ {
    	
        return Result_InvoiceSignOrCreationErrorZ(pointer: CResult_InvoiceSignOrCreationErrorZ_ok(o.danglingClone().cOpaqueStruct!));
    }

    public class func err(e: SignOrCreationError) -> Result_InvoiceSignOrCreationErrorZ {
    	
        return Result_InvoiceSignOrCreationErrorZ(pointer: CResult_InvoiceSignOrCreationErrorZ_err(e.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_InvoiceSignOrCreationErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_InvoiceSignOrCreationErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing Result_InvoiceSignOrCreationErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing Result_InvoiceSignOrCreationErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_InvoiceSignOrCreationErrorZ {
    	
        return Result_InvoiceSignOrCreationErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_InvoiceSignOrCreationErrorZ>) in
CResult_InvoiceSignOrCreationErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_InvoiceSignOrCreationErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}
