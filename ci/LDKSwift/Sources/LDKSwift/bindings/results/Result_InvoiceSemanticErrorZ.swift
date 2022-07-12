#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class Result_InvoiceSemanticErrorZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKCResult_InvoiceSemanticErrorZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_InvoiceSemanticErrorZ(contents: LDKCResult_InvoiceSemanticErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_InvoiceSemanticErrorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKCResult_InvoiceSemanticErrorZ, anchor: NativeTypeWrapper){
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

			public func getError() -> LDKSemanticError? {
				if self.cOpaqueStruct?.result_ok == false {
					return self.cOpaqueStruct!.contents.err.pointee
				}
				return nil
			}
			
			public func getValue() -> Invoice? {
				if self.cOpaqueStruct?.result_ok == true {
					return Invoice(pointer: self.cOpaqueStruct!.contents.result.pointee, anchor: self)
				}
				return nil
			}
			
    public class func ok(o: Invoice) -> Result_InvoiceSemanticErrorZ {
    	
        return Result_InvoiceSemanticErrorZ(pointer: CResult_InvoiceSemanticErrorZ_ok(o.danglingClone().cOpaqueStruct!));
    }

    public class func err(e: LDKSemanticError) -> Result_InvoiceSemanticErrorZ {
    	
        return Result_InvoiceSemanticErrorZ(pointer: CResult_InvoiceSemanticErrorZ_err(e));
    }

    internal func free() -> Void {
    	
        return CResult_InvoiceSemanticErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_InvoiceSemanticErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_InvoiceSemanticErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_InvoiceSemanticErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_InvoiceSemanticErrorZ {
    	
        return Result_InvoiceSemanticErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_InvoiceSemanticErrorZ>) in
CResult_InvoiceSemanticErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_InvoiceSemanticErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}
