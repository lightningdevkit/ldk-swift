#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Result_InvoiceSignOrCreationErrorZ = Bindings.Result_InvoiceSignOrCreationErrorZ

extension Bindings {

	public class Result_InvoiceSignOrCreationErrorZ: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCResult_InvoiceSignOrCreationErrorZ?

		/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_InvoiceSignOrCreationErrorZ(contents: LDKCResult_InvoiceSignOrCreationErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKCResult_InvoiceSignOrCreationErrorZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKCResult_InvoiceSignOrCreationErrorZ, anchor: NativeTypeWrapper){
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

			public func getError() -> SignOrCreationError? {
				if self.cOpaqueStruct?.result_ok == false {
					return SignOrCreationError(pointer: self.cOpaqueStruct!.contents.err.pointee, anchor: self)
				}
				return nil
			}
			
			public func getValue() -> Invoice? {
				if self.cOpaqueStruct?.result_ok == true {
					return Invoice(pointer: self.cOpaqueStruct!.contents.result.pointee, anchor: self)
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
							Bindings.print("Freeing Result_InvoiceSignOrCreationErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_InvoiceSignOrCreationErrorZ \(self.instanceNumber) due to dangle.")
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

}
