#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Result_CounterpartyCommitmentSecretsDecodeErrorZ = Bindings.Result_CounterpartyCommitmentSecretsDecodeErrorZ

extension Bindings {

	public class Result_CounterpartyCommitmentSecretsDecodeErrorZ: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCResult_CounterpartyCommitmentSecretsDecodeErrorZ?

		/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_CounterpartyCommitmentSecretsDecodeErrorZ(contents: LDKCResult_CounterpartyCommitmentSecretsDecodeErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKCResult_CounterpartyCommitmentSecretsDecodeErrorZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKCResult_CounterpartyCommitmentSecretsDecodeErrorZ, anchor: NativeTypeWrapper){
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
			
			public func getValue() -> CounterpartyCommitmentSecrets? {
				if self.cOpaqueStruct?.result_ok == true {
					return CounterpartyCommitmentSecrets(pointer: self.cOpaqueStruct!.contents.result.pointee, anchor: self).dangle()
				}
				return nil
			}
			
		public class func ok(o: CounterpartyCommitmentSecrets) -> Result_CounterpartyCommitmentSecretsDecodeErrorZ {
			
			return Result_CounterpartyCommitmentSecretsDecodeErrorZ(pointer: CResult_CounterpartyCommitmentSecretsDecodeErrorZ_ok(o.danglingClone().cOpaqueStruct!));
		}

		public class func err(e: DecodeError) -> Result_CounterpartyCommitmentSecretsDecodeErrorZ {
			
			return Result_CounterpartyCommitmentSecretsDecodeErrorZ(pointer: CResult_CounterpartyCommitmentSecretsDecodeErrorZ_err(e.danglingClone().cOpaqueStruct!));
		}

		internal func free() -> Void {
			
			return CResult_CounterpartyCommitmentSecretsDecodeErrorZ_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Result_CounterpartyCommitmentSecretsDecodeErrorZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_CounterpartyCommitmentSecretsDecodeErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_CounterpartyCommitmentSecretsDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

		public func clone() -> Result_CounterpartyCommitmentSecretsDecodeErrorZ {
			
			return Result_CounterpartyCommitmentSecretsDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_CounterpartyCommitmentSecretsDecodeErrorZ>) in
CResult_CounterpartyCommitmentSecretsDecodeErrorZ_clone(origPointer)
});
		}

					internal func danglingClone() -> Result_CounterpartyCommitmentSecretsDecodeErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		/* RESULT_METHODS_END */

	}

}
