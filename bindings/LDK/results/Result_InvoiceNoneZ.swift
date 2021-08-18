import LDKHeaders

public class Result_InvoiceNoneZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_InvoiceNoneZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_InvoiceNoneZ(contents: LDKCResult_InvoiceNoneZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_InvoiceNoneZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getValue() -> Invoice? {
				if self.cOpaqueStruct?.result_ok == true {
					return Invoice(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: Invoice) -> Result_InvoiceNoneZ {
    	
        return Result_InvoiceNoneZ(pointer: CResult_InvoiceNoneZ_ok(o.danglingClone().cOpaqueStruct!));
    }

    public class func err() -> Result_InvoiceNoneZ {
    	
        return Result_InvoiceNoneZ(pointer: CResult_InvoiceNoneZ_err());
    }

    internal func free() -> Void {
    	
        return CResult_InvoiceNoneZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_InvoiceNoneZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							self.free()
						}
					}
				

    public func clone() -> Result_InvoiceNoneZ {
    	
        return Result_InvoiceNoneZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_InvoiceNoneZ>) in
CResult_InvoiceNoneZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_InvoiceNoneZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}
