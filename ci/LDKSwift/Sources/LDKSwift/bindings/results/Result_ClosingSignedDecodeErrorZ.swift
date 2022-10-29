#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Result_ClosingSignedDecodeErrorZ = Bindings.Result_ClosingSignedDecodeErrorZ

extension Bindings {

	public class Result_ClosingSignedDecodeErrorZ: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCResult_ClosingSignedDecodeErrorZ?

		/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_ClosingSignedDecodeErrorZ(contents: LDKCResult_ClosingSignedDecodeErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKCResult_ClosingSignedDecodeErrorZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKCResult_ClosingSignedDecodeErrorZ, anchor: NativeTypeWrapper){
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
			
			public func getValue() -> ClosingSigned? {
				if self.cOpaqueStruct?.result_ok == true {
					return ClosingSigned(pointer: self.cOpaqueStruct!.contents.result.pointee, anchor: self).dangle()
				}
				return nil
			}
			
		public class func ok(o: ClosingSigned) -> Result_ClosingSignedDecodeErrorZ {
			
			return Result_ClosingSignedDecodeErrorZ(pointer: CResult_ClosingSignedDecodeErrorZ_ok(o.danglingClone().cOpaqueStruct!));
		}

		public class func err(e: DecodeError) -> Result_ClosingSignedDecodeErrorZ {
			
			return Result_ClosingSignedDecodeErrorZ(pointer: CResult_ClosingSignedDecodeErrorZ_err(e.danglingClone().cOpaqueStruct!));
		}

		internal func free() -> Void {
			
			return CResult_ClosingSignedDecodeErrorZ_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Result_ClosingSignedDecodeErrorZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_ClosingSignedDecodeErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_ClosingSignedDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

		public func clone() -> Result_ClosingSignedDecodeErrorZ {
			
			return Result_ClosingSignedDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_ClosingSignedDecodeErrorZ>) in
CResult_ClosingSignedDecodeErrorZ_clone(origPointer)
});
		}

					internal func danglingClone() -> Result_ClosingSignedDecodeErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		/* RESULT_METHODS_END */

	}

}
