#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Result_TxOutAccessErrorZ = Bindings.Result_TxOutAccessErrorZ

extension Bindings {

	public class Result_TxOutAccessErrorZ: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCResult_TxOutAccessErrorZ?

		/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_TxOutAccessErrorZ(contents: LDKCResult_TxOutAccessErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKCResult_TxOutAccessErrorZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKCResult_TxOutAccessErrorZ, anchor: NativeTypeWrapper){
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

			public func getError() -> LDKAccessError? {
				if self.cOpaqueStruct?.result_ok == false {
					return self.cOpaqueStruct!.contents.err.pointee
				}
				return nil
			}
			
			public func getValue() -> TxOut? {
				if self.cOpaqueStruct?.result_ok == true {
					return TxOut(pointer: self.cOpaqueStruct!.contents.result.pointee, anchor: self).dangle()
				}
				return nil
			}
			
		public class func ok(o: LDKTxOut) -> Result_TxOutAccessErrorZ {
			
			return Result_TxOutAccessErrorZ(pointer: CResult_TxOutAccessErrorZ_ok(o));
		}

		public class func err(e: LDKAccessError) -> Result_TxOutAccessErrorZ {
			
			return Result_TxOutAccessErrorZ(pointer: CResult_TxOutAccessErrorZ_err(e));
		}

		internal func free() -> Void {
			
			return CResult_TxOutAccessErrorZ_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Result_TxOutAccessErrorZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_TxOutAccessErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_TxOutAccessErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

		public func clone() -> Result_TxOutAccessErrorZ {
			
			return Result_TxOutAccessErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_TxOutAccessErrorZ>) in
CResult_TxOutAccessErrorZ_clone(origPointer)
});
		}

					internal func danglingClone() -> Result_TxOutAccessErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		/* RESULT_METHODS_END */

	}

}
