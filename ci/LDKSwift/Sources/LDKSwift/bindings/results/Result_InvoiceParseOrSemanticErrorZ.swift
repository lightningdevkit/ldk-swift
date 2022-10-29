#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Result_InvoiceParseOrSemanticErrorZ = Bindings.Result_InvoiceParseOrSemanticErrorZ

extension Bindings {

	public class Result_InvoiceParseOrSemanticErrorZ: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCResult_InvoiceParseOrSemanticErrorZ?

		/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_InvoiceParseOrSemanticErrorZ(contents: LDKCResult_InvoiceParseOrSemanticErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKCResult_InvoiceParseOrSemanticErrorZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKCResult_InvoiceParseOrSemanticErrorZ, anchor: NativeTypeWrapper){
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

			public func getError() -> ParseOrSemanticError? {
				if self.cOpaqueStruct?.result_ok == false {
					return ParseOrSemanticError(pointer: self.cOpaqueStruct!.contents.err.pointee, anchor: self).dangle()
				}
				return nil
			}
			
			public func getValue() -> Invoice? {
				if self.cOpaqueStruct?.result_ok == true {
					return Invoice(pointer: self.cOpaqueStruct!.contents.result.pointee, anchor: self).dangle()
				}
				return nil
			}
			
		public class func ok(o: Invoice) -> Result_InvoiceParseOrSemanticErrorZ {
			
			return Result_InvoiceParseOrSemanticErrorZ(pointer: CResult_InvoiceParseOrSemanticErrorZ_ok(o.danglingClone().cOpaqueStruct!));
		}

		public class func err(e: ParseOrSemanticError) -> Result_InvoiceParseOrSemanticErrorZ {
			
			return Result_InvoiceParseOrSemanticErrorZ(pointer: CResult_InvoiceParseOrSemanticErrorZ_err(e.danglingClone().cOpaqueStruct!));
		}

		internal func free() -> Void {
			
			return CResult_InvoiceParseOrSemanticErrorZ_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Result_InvoiceParseOrSemanticErrorZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_InvoiceParseOrSemanticErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_InvoiceParseOrSemanticErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

		public func clone() -> Result_InvoiceParseOrSemanticErrorZ {
			
			return Result_InvoiceParseOrSemanticErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_InvoiceParseOrSemanticErrorZ>) in
CResult_InvoiceParseOrSemanticErrorZ_clone(origPointer)
});
		}

					internal func danglingClone() -> Result_InvoiceParseOrSemanticErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		/* RESULT_METHODS_END */

	}

}
