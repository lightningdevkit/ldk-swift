#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Result_PositiveTimestampCreationErrorZ = Bindings.Result_PositiveTimestampCreationErrorZ

extension Bindings {

	public class Result_PositiveTimestampCreationErrorZ: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCResult_PositiveTimestampCreationErrorZ?

		/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_PositiveTimestampCreationErrorZ(contents: LDKCResult_PositiveTimestampCreationErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKCResult_PositiveTimestampCreationErrorZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKCResult_PositiveTimestampCreationErrorZ, anchor: NativeTypeWrapper){
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
			
			public func getValue() -> PositiveTimestamp? {
				if self.cOpaqueStruct?.result_ok == true {
					return PositiveTimestamp(pointer: self.cOpaqueStruct!.contents.result.pointee, anchor: self)
				}
				return nil
			}
			
		public class func ok(o: PositiveTimestamp) -> Result_PositiveTimestampCreationErrorZ {
			
			return Result_PositiveTimestampCreationErrorZ(pointer: CResult_PositiveTimestampCreationErrorZ_ok(o.danglingClone().cOpaqueStruct!));
		}

		public class func err(e: LDKCreationError) -> Result_PositiveTimestampCreationErrorZ {
			
			return Result_PositiveTimestampCreationErrorZ(pointer: CResult_PositiveTimestampCreationErrorZ_err(e));
		}

		internal func free() -> Void {
			
			return CResult_PositiveTimestampCreationErrorZ_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Result_PositiveTimestampCreationErrorZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_PositiveTimestampCreationErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_PositiveTimestampCreationErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

		public func clone() -> Result_PositiveTimestampCreationErrorZ {
			
			return Result_PositiveTimestampCreationErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_PositiveTimestampCreationErrorZ>) in
CResult_PositiveTimestampCreationErrorZ_clone(origPointer)
});
		}

					internal func danglingClone() -> Result_PositiveTimestampCreationErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		/* RESULT_METHODS_END */

	}

}
