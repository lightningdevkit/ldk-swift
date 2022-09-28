#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Result_SharedSecretNoneZ = Bindings.Result_SharedSecretNoneZ

extension Bindings {

	public class Result_SharedSecretNoneZ: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCResult_SharedSecretNoneZ?

		/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_SharedSecretNoneZ(contents: LDKCResult_SharedSecretNoneZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKCResult_SharedSecretNoneZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKCResult_SharedSecretNoneZ, anchor: NativeTypeWrapper){
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
					return Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
		public class func ok(o: [UInt8]) -> Result_SharedSecretNoneZ {
			
			return Result_SharedSecretNoneZ(pointer: CResult_SharedSecretNoneZ_ok(Bindings.new_LDKThirtyTwoBytes(array: o)));
		}

		public class func err() -> Result_SharedSecretNoneZ {
			
			return Result_SharedSecretNoneZ(pointer: CResult_SharedSecretNoneZ_err());
		}

		internal func free() -> Void {
			
			return CResult_SharedSecretNoneZ_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Result_SharedSecretNoneZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_SharedSecretNoneZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_SharedSecretNoneZ \(self.instanceNumber) due to dangle.")
						}
					}
				

		public func clone() -> Result_SharedSecretNoneZ {
			
			return Result_SharedSecretNoneZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_SharedSecretNoneZ>) in
CResult_SharedSecretNoneZ_clone(origPointer)
});
		}

					internal func danglingClone() -> Result_SharedSecretNoneZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		/* RESULT_METHODS_END */

	}

}
