#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Result_NoneSendErrorZ = Bindings.Result_NoneSendErrorZ

extension Bindings {

	public class Result_NoneSendErrorZ: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCResult_NoneSendErrorZ?

		/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_NoneSendErrorZ(contents: LDKCResult_NoneSendErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKCResult_NoneSendErrorZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKCResult_NoneSendErrorZ, anchor: NativeTypeWrapper){
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

			public func getError() -> SendError? {
				if self.cOpaqueStruct?.result_ok == false {
					return SendError(pointer: self.cOpaqueStruct!.contents.err.pointee, anchor: self).dangle()
				}
				return nil
			}
			
		public class func ok() -> Result_NoneSendErrorZ {
			
			return Result_NoneSendErrorZ(pointer: CResult_NoneSendErrorZ_ok());
		}

		public class func err(e: SendError) -> Result_NoneSendErrorZ {
			
			return Result_NoneSendErrorZ(pointer: CResult_NoneSendErrorZ_err(e.danglingClone().cOpaqueStruct!));
		}

		internal func free() -> Void {
			
			return CResult_NoneSendErrorZ_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Result_NoneSendErrorZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_NoneSendErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_NoneSendErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

		/* RESULT_METHODS_END */

	}

}
