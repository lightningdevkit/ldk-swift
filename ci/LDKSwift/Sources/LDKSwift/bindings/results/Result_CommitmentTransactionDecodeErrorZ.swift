#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Result_CommitmentTransactionDecodeErrorZ = Bindings.Result_CommitmentTransactionDecodeErrorZ

extension Bindings {

	public class Result_CommitmentTransactionDecodeErrorZ: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCResult_CommitmentTransactionDecodeErrorZ?

		/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_CommitmentTransactionDecodeErrorZ(contents: LDKCResult_CommitmentTransactionDecodeErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKCResult_CommitmentTransactionDecodeErrorZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKCResult_CommitmentTransactionDecodeErrorZ, anchor: NativeTypeWrapper){
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
					return DecodeError(pointer: self.cOpaqueStruct!.contents.err.pointee, anchor: self)
				}
				return nil
			}
			
			public func getValue() -> CommitmentTransaction? {
				if self.cOpaqueStruct?.result_ok == true {
					return CommitmentTransaction(pointer: self.cOpaqueStruct!.contents.result.pointee, anchor: self)
				}
				return nil
			}
			
		public class func ok(o: CommitmentTransaction) -> Result_CommitmentTransactionDecodeErrorZ {
			
			return Result_CommitmentTransactionDecodeErrorZ(pointer: CResult_CommitmentTransactionDecodeErrorZ_ok(o.danglingClone().cOpaqueStruct!));
		}

		public class func err(e: DecodeError) -> Result_CommitmentTransactionDecodeErrorZ {
			
			return Result_CommitmentTransactionDecodeErrorZ(pointer: CResult_CommitmentTransactionDecodeErrorZ_err(e.danglingClone().cOpaqueStruct!));
		}

		internal func free() -> Void {
			
			return CResult_CommitmentTransactionDecodeErrorZ_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Result_CommitmentTransactionDecodeErrorZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_CommitmentTransactionDecodeErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_CommitmentTransactionDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

		public func clone() -> Result_CommitmentTransactionDecodeErrorZ {
			
			return Result_CommitmentTransactionDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_CommitmentTransactionDecodeErrorZ>) in
CResult_CommitmentTransactionDecodeErrorZ_clone(origPointer)
});
		}

					internal func danglingClone() -> Result_CommitmentTransactionDecodeErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		/* RESULT_METHODS_END */

	}

}
