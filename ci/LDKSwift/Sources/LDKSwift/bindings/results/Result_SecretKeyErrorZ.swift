#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Result_SecretKeyErrorZ = Bindings.Result_SecretKeyErrorZ

extension Bindings {

	public class Result_SecretKeyErrorZ: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCResult_SecretKeyErrorZ?

		/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_SecretKeyErrorZ(contents: LDKCResult_SecretKeyErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKCResult_SecretKeyErrorZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKCResult_SecretKeyErrorZ, anchor: NativeTypeWrapper){
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

			public func getError() -> LDKSecp256k1Error? {
				if self.cOpaqueStruct?.result_ok == false {
					return self.cOpaqueStruct!.contents.err.pointee
				}
				return nil
			}
			
			public func getValue() -> [UInt8]? {
				if self.cOpaqueStruct?.result_ok == true {
					return Bindings.LDKSecretKey_to_array(nativeType: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
		public class func ok(o: [UInt8]) -> Result_SecretKeyErrorZ {
			
			return Result_SecretKeyErrorZ(pointer: CResult_SecretKeyErrorZ_ok(Bindings.new_LDKSecretKey(array: o)));
		}

		#warning("This method passes non-cloneable objects by owned value. Here be dragons.")
@available(*, deprecated, message: "This method passes non-cloneable objects by owned value. Here be dragons.")
public class func err(e: LDKSecp256k1Error) -> Result_SecretKeyErrorZ {
			
			return Result_SecretKeyErrorZ(pointer: CResult_SecretKeyErrorZ_err(e));
		}

		internal func free() -> Void {
			
			return CResult_SecretKeyErrorZ_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Result_SecretKeyErrorZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_SecretKeyErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_SecretKeyErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

		public func clone() -> Result_SecretKeyErrorZ {
			
			return Result_SecretKeyErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_SecretKeyErrorZ>) in
CResult_SecretKeyErrorZ_clone(origPointer)
});
		}

					internal func danglingClone() -> Result_SecretKeyErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		/* RESULT_METHODS_END */

	}

}
