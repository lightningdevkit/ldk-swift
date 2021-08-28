public class Result_SignedRawInvoiceNoneZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKCResult_SignedRawInvoiceNoneZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_SignedRawInvoiceNoneZ(contents: LDKCResult_SignedRawInvoiceNoneZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_SignedRawInvoiceNoneZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKCResult_SignedRawInvoiceNoneZ, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getValue() -> SignedRawInvoice? {
				if self.cOpaqueStruct?.result_ok == true {
					return SignedRawInvoice(pointer: self.cOpaqueStruct!.contents.result.pointee, anchor: self)
				}
				return nil
			}
			
    public class func ok(o: SignedRawInvoice) -> Result_SignedRawInvoiceNoneZ {
    	
        return Result_SignedRawInvoiceNoneZ(pointer: CResult_SignedRawInvoiceNoneZ_ok(o.danglingClone().cOpaqueStruct!));
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
							Bindings.print("Freeing Result_SignedRawInvoiceNoneZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_SignedRawInvoiceNoneZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_SignedRawInvoiceNoneZ {
    	
        return Result_SignedRawInvoiceNoneZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_SignedRawInvoiceNoneZ>) in
CResult_SignedRawInvoiceNoneZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_SignedRawInvoiceNoneZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}
