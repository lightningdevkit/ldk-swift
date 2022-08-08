#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Result_DescriptionCreationErrorZ = Bindings.Result_DescriptionCreationErrorZ

extension Bindings {

	public class Result_DescriptionCreationErrorZ: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCResult_DescriptionCreationErrorZ?

		/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_DescriptionCreationErrorZ(contents: LDKCResult_DescriptionCreationErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKCResult_DescriptionCreationErrorZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKCResult_DescriptionCreationErrorZ, anchor: NativeTypeWrapper){
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

			public func getError() -> LDKCreationError? {
				if self.cOpaqueStruct?.result_ok == false {
					return self.cOpaqueStruct!.contents.err.pointee
				}
				return nil
			}
			
			public func getValue() -> Description? {
				if self.cOpaqueStruct?.result_ok == true {
					return Description(pointer: self.cOpaqueStruct!.contents.result.pointee, anchor: self)
				}
				return nil
			}
			
		public class func ok(o: Description) -> Result_DescriptionCreationErrorZ {
			
			return Result_DescriptionCreationErrorZ(pointer: CResult_DescriptionCreationErrorZ_ok(o.danglingClone().cOpaqueStruct!));
		}

		public class func err(e: LDKCreationError) -> Result_DescriptionCreationErrorZ {
			
			return Result_DescriptionCreationErrorZ(pointer: CResult_DescriptionCreationErrorZ_err(e));
		}

		internal func free() -> Void {
			
			return CResult_DescriptionCreationErrorZ_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Result_DescriptionCreationErrorZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_DescriptionCreationErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_DescriptionCreationErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

		public func clone() -> Result_DescriptionCreationErrorZ {
			
			return Result_DescriptionCreationErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_DescriptionCreationErrorZ>) in
CResult_DescriptionCreationErrorZ_clone(origPointer)
});
		}

					internal func danglingClone() -> Result_DescriptionCreationErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		/* RESULT_METHODS_END */

	}

}
