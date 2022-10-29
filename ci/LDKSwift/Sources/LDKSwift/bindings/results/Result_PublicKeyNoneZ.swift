#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Result_PublicKeyNoneZ = Bindings.Result_PublicKeyNoneZ

extension Bindings {

	public class Result_PublicKeyNoneZ: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCResult_PublicKeyNoneZ?

		/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_PublicKeyNoneZ(contents: LDKCResult_PublicKeyNoneZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKCResult_PublicKeyNoneZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKCResult_PublicKeyNoneZ, anchor: NativeTypeWrapper){
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

			public func getValue() -> [UInt8]? {
				if self.cOpaqueStruct?.result_ok == true {
					return Bindings.LDKPublicKey_to_array(nativeType: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
		public class func ok(o: [UInt8]) -> Result_PublicKeyNoneZ {
			
			return Result_PublicKeyNoneZ(pointer: CResult_PublicKeyNoneZ_ok(Bindings.new_LDKPublicKey(array: o)));
		}

		public class func err() -> Result_PublicKeyNoneZ {
			
			return Result_PublicKeyNoneZ(pointer: CResult_PublicKeyNoneZ_err());
		}

		internal func free() -> Void {
			
			return CResult_PublicKeyNoneZ_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Result_PublicKeyNoneZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_PublicKeyNoneZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_PublicKeyNoneZ \(self.instanceNumber) due to dangle.")
						}
					}
				

		public func clone() -> Result_PublicKeyNoneZ {
			
			return Result_PublicKeyNoneZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_PublicKeyNoneZ>) in
CResult_PublicKeyNoneZ_clone(origPointer)
});
		}

					internal func danglingClone() -> Result_PublicKeyNoneZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		/* RESULT_METHODS_END */

	}

}
