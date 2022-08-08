#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Result_WarningMessageDecodeErrorZ = Bindings.Result_WarningMessageDecodeErrorZ

extension Bindings {

	public class Result_WarningMessageDecodeErrorZ: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCResult_WarningMessageDecodeErrorZ?

		/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_WarningMessageDecodeErrorZ(contents: LDKCResult_WarningMessageDecodeErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKCResult_WarningMessageDecodeErrorZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKCResult_WarningMessageDecodeErrorZ, anchor: NativeTypeWrapper){
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
			
			public func getValue() -> WarningMessage? {
				if self.cOpaqueStruct?.result_ok == true {
					return WarningMessage(pointer: self.cOpaqueStruct!.contents.result.pointee, anchor: self)
				}
				return nil
			}
			
		public class func ok(o: WarningMessage) -> Result_WarningMessageDecodeErrorZ {
			
			return Result_WarningMessageDecodeErrorZ(pointer: CResult_WarningMessageDecodeErrorZ_ok(o.danglingClone().cOpaqueStruct!));
		}

		public class func err(e: DecodeError) -> Result_WarningMessageDecodeErrorZ {
			
			return Result_WarningMessageDecodeErrorZ(pointer: CResult_WarningMessageDecodeErrorZ_err(e.danglingClone().cOpaqueStruct!));
		}

		internal func free() -> Void {
			
			return CResult_WarningMessageDecodeErrorZ_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Result_WarningMessageDecodeErrorZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_WarningMessageDecodeErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_WarningMessageDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

		public func clone() -> Result_WarningMessageDecodeErrorZ {
			
			return Result_WarningMessageDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_WarningMessageDecodeErrorZ>) in
CResult_WarningMessageDecodeErrorZ_clone(origPointer)
});
		}

					internal func danglingClone() -> Result_WarningMessageDecodeErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		/* RESULT_METHODS_END */

	}

}
