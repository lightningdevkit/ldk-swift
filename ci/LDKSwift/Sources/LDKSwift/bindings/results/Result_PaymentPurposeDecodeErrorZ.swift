#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Result_PaymentPurposeDecodeErrorZ = Bindings.Result_PaymentPurposeDecodeErrorZ

extension Bindings {

	public class Result_PaymentPurposeDecodeErrorZ: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCResult_PaymentPurposeDecodeErrorZ?

		/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_PaymentPurposeDecodeErrorZ(contents: LDKCResult_PaymentPurposeDecodeErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKCResult_PaymentPurposeDecodeErrorZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKCResult_PaymentPurposeDecodeErrorZ, anchor: NativeTypeWrapper){
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

			public func getError() -> DecodeError? {
				if self.cOpaqueStruct?.result_ok == false {
					return DecodeError(pointer: self.cOpaqueStruct!.contents.err.pointee, anchor: self).dangle()
				}
				return nil
			}
			
			public func getValue() -> PaymentPurpose? {
				if self.cOpaqueStruct?.result_ok == true {
					return PaymentPurpose(pointer: self.cOpaqueStruct!.contents.result.pointee, anchor: self).dangle()
				}
				return nil
			}
			
		public class func ok(o: PaymentPurpose) -> Result_PaymentPurposeDecodeErrorZ {
			
			return Result_PaymentPurposeDecodeErrorZ(pointer: CResult_PaymentPurposeDecodeErrorZ_ok(o.danglingClone().cOpaqueStruct!));
		}

		public class func err(e: DecodeError) -> Result_PaymentPurposeDecodeErrorZ {
			
			return Result_PaymentPurposeDecodeErrorZ(pointer: CResult_PaymentPurposeDecodeErrorZ_err(e.danglingClone().cOpaqueStruct!));
		}

		internal func free() -> Void {
			
			return CResult_PaymentPurposeDecodeErrorZ_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Result_PaymentPurposeDecodeErrorZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_PaymentPurposeDecodeErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_PaymentPurposeDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

		public func clone() -> Result_PaymentPurposeDecodeErrorZ {
			
			return Result_PaymentPurposeDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_PaymentPurposeDecodeErrorZ>) in
CResult_PaymentPurposeDecodeErrorZ_clone(origPointer)
});
		}

					internal func danglingClone() -> Result_PaymentPurposeDecodeErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		/* RESULT_METHODS_END */

	}

}
