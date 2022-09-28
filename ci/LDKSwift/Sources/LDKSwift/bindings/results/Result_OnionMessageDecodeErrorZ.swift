#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Result_OnionMessageDecodeErrorZ = Bindings.Result_OnionMessageDecodeErrorZ

extension Bindings {

	public class Result_OnionMessageDecodeErrorZ: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCResult_OnionMessageDecodeErrorZ?

		/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_OnionMessageDecodeErrorZ(contents: LDKCResult_OnionMessageDecodeErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKCResult_OnionMessageDecodeErrorZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKCResult_OnionMessageDecodeErrorZ, anchor: NativeTypeWrapper){
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
			
			public func getValue() -> OnionMessage? {
				if self.cOpaqueStruct?.result_ok == true {
					return OnionMessage(pointer: self.cOpaqueStruct!.contents.result.pointee, anchor: self)
				}
				return nil
			}
			
		public class func ok(o: OnionMessage) -> Result_OnionMessageDecodeErrorZ {
			
			return Result_OnionMessageDecodeErrorZ(pointer: CResult_OnionMessageDecodeErrorZ_ok(o.danglingClone().cOpaqueStruct!));
		}

		public class func err(e: DecodeError) -> Result_OnionMessageDecodeErrorZ {
			
			return Result_OnionMessageDecodeErrorZ(pointer: CResult_OnionMessageDecodeErrorZ_err(e.danglingClone().cOpaqueStruct!));
		}

		internal func free() -> Void {
			
			return CResult_OnionMessageDecodeErrorZ_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Result_OnionMessageDecodeErrorZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_OnionMessageDecodeErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_OnionMessageDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

		public func clone() -> Result_OnionMessageDecodeErrorZ {
			
			return Result_OnionMessageDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_OnionMessageDecodeErrorZ>) in
CResult_OnionMessageDecodeErrorZ_clone(origPointer)
});
		}

					internal func danglingClone() -> Result_OnionMessageDecodeErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		/* RESULT_METHODS_END */

	}

}
