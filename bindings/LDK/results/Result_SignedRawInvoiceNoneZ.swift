public class Result_SignedRawInvoiceNoneZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_SignedRawInvoiceNoneZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_SignedRawInvoiceNoneZ(contents: LDKCResult_SignedRawInvoiceNoneZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_SignedRawInvoiceNoneZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getValue() -> SignedRawInvoice? {
				if self.cOpaqueStruct?.result_ok == true {
					return SignedRawInvoice(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: SignedRawInvoice) -> Result_SignedRawInvoiceNoneZ {
    	
        return Result_SignedRawInvoiceNoneZ(pointer: CResult_SignedRawInvoiceNoneZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err() -> Result_SignedRawInvoiceNoneZ {
    	
        return Result_SignedRawInvoiceNoneZ(pointer: CResult_SignedRawInvoiceNoneZ_err());
    }

    internal func free() -> Void {
    	
        return CResult_SignedRawInvoiceNoneZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_SignedRawInvoiceNoneZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							self.free()
						}
					}
				

    public func clone() -> Result_SignedRawInvoiceNoneZ {
    	
        return Result_SignedRawInvoiceNoneZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_SignedRawInvoiceNoneZ>) in
CResult_SignedRawInvoiceNoneZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_SignedRawInvoiceNoneZ {
        				var dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}
