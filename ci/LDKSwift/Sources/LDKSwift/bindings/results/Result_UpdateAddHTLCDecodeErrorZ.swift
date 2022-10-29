#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Result_UpdateAddHTLCDecodeErrorZ = Bindings.Result_UpdateAddHTLCDecodeErrorZ

extension Bindings {

	public class Result_UpdateAddHTLCDecodeErrorZ: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCResult_UpdateAddHTLCDecodeErrorZ?

		/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_UpdateAddHTLCDecodeErrorZ(contents: LDKCResult_UpdateAddHTLCDecodeErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKCResult_UpdateAddHTLCDecodeErrorZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKCResult_UpdateAddHTLCDecodeErrorZ, anchor: NativeTypeWrapper){
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
			
			public func getValue() -> UpdateAddHTLC? {
				if self.cOpaqueStruct?.result_ok == true {
					return UpdateAddHTLC(pointer: self.cOpaqueStruct!.contents.result.pointee, anchor: self).dangle()
				}
				return nil
			}
			
		public class func ok(o: UpdateAddHTLC) -> Result_UpdateAddHTLCDecodeErrorZ {
			
			return Result_UpdateAddHTLCDecodeErrorZ(pointer: CResult_UpdateAddHTLCDecodeErrorZ_ok(o.danglingClone().cOpaqueStruct!));
		}

		public class func err(e: DecodeError) -> Result_UpdateAddHTLCDecodeErrorZ {
			
			return Result_UpdateAddHTLCDecodeErrorZ(pointer: CResult_UpdateAddHTLCDecodeErrorZ_err(e.danglingClone().cOpaqueStruct!));
		}

		internal func free() -> Void {
			
			return CResult_UpdateAddHTLCDecodeErrorZ_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Result_UpdateAddHTLCDecodeErrorZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_UpdateAddHTLCDecodeErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_UpdateAddHTLCDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

		public func clone() -> Result_UpdateAddHTLCDecodeErrorZ {
			
			return Result_UpdateAddHTLCDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_UpdateAddHTLCDecodeErrorZ>) in
CResult_UpdateAddHTLCDecodeErrorZ_clone(origPointer)
});
		}

					internal func danglingClone() -> Result_UpdateAddHTLCDecodeErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		/* RESULT_METHODS_END */

	}

}
