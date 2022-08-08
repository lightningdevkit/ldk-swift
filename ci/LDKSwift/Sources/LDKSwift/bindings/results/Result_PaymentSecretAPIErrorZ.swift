#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Result_PaymentSecretAPIErrorZ = Bindings.Result_PaymentSecretAPIErrorZ

extension Bindings {

	public class Result_PaymentSecretAPIErrorZ: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCResult_PaymentSecretAPIErrorZ?

		/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_PaymentSecretAPIErrorZ(contents: LDKCResult_PaymentSecretAPIErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKCResult_PaymentSecretAPIErrorZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKCResult_PaymentSecretAPIErrorZ, anchor: NativeTypeWrapper){
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

			public func getError() -> APIError? {
				if self.cOpaqueStruct?.result_ok == false {
					return APIError(pointer: self.cOpaqueStruct!.contents.err.pointee, anchor: self)
				}
				return nil
			}
			
			public func getValue() -> [UInt8]? {
				if self.cOpaqueStruct?.result_ok == true {
					return Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
		public class func ok(o: [UInt8]) -> Result_PaymentSecretAPIErrorZ {
			
			return Result_PaymentSecretAPIErrorZ(pointer: CResult_PaymentSecretAPIErrorZ_ok(Bindings.new_LDKThirtyTwoBytes(array: o)));
		}

		public class func err(e: APIError) -> Result_PaymentSecretAPIErrorZ {
			
			return Result_PaymentSecretAPIErrorZ(pointer: CResult_PaymentSecretAPIErrorZ_err(e.danglingClone().cOpaqueStruct!));
		}

		internal func free() -> Void {
			
			return CResult_PaymentSecretAPIErrorZ_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Result_PaymentSecretAPIErrorZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_PaymentSecretAPIErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_PaymentSecretAPIErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

		public func clone() -> Result_PaymentSecretAPIErrorZ {
			
			return Result_PaymentSecretAPIErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_PaymentSecretAPIErrorZ>) in
CResult_PaymentSecretAPIErrorZ_clone(origPointer)
});
		}

					internal func danglingClone() -> Result_PaymentSecretAPIErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		/* RESULT_METHODS_END */

	}

}
