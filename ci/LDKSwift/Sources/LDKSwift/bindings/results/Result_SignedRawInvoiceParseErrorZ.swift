#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Result_SignedRawInvoiceParseErrorZ = Bindings.Result_SignedRawInvoiceParseErrorZ

extension Bindings {

	public class Result_SignedRawInvoiceParseErrorZ: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCResult_SignedRawInvoiceParseErrorZ?

		/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_SignedRawInvoiceParseErrorZ(contents: LDKCResult_SignedRawInvoiceParseErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKCResult_SignedRawInvoiceParseErrorZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKCResult_SignedRawInvoiceParseErrorZ, anchor: NativeTypeWrapper){
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

			public func getError() -> ParseError? {
				if self.cOpaqueStruct?.result_ok == false {
					return ParseError(pointer: self.cOpaqueStruct!.contents.err.pointee, anchor: self)
				}
				return nil
			}
			
			public func getValue() -> SignedRawInvoice? {
				if self.cOpaqueStruct?.result_ok == true {
					return SignedRawInvoice(pointer: self.cOpaqueStruct!.contents.result.pointee, anchor: self)
				}
				return nil
			}
			
		public class func ok(o: SignedRawInvoice) -> Result_SignedRawInvoiceParseErrorZ {
			
			return Result_SignedRawInvoiceParseErrorZ(pointer: CResult_SignedRawInvoiceParseErrorZ_ok(o.danglingClone().cOpaqueStruct!));
		}

		public class func err(e: ParseError) -> Result_SignedRawInvoiceParseErrorZ {
			
			return Result_SignedRawInvoiceParseErrorZ(pointer: CResult_SignedRawInvoiceParseErrorZ_err(e.danglingClone().cOpaqueStruct!));
		}

		internal func free() -> Void {
			
			return CResult_SignedRawInvoiceParseErrorZ_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Result_SignedRawInvoiceParseErrorZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_SignedRawInvoiceParseErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_SignedRawInvoiceParseErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

		public func clone() -> Result_SignedRawInvoiceParseErrorZ {
			
			return Result_SignedRawInvoiceParseErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_SignedRawInvoiceParseErrorZ>) in
CResult_SignedRawInvoiceParseErrorZ_clone(origPointer)
});
		}

					internal func danglingClone() -> Result_SignedRawInvoiceParseErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		/* RESULT_METHODS_END */

	}

}
