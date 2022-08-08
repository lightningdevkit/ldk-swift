#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Result_ChannelConfigDecodeErrorZ = Bindings.Result_ChannelConfigDecodeErrorZ

extension Bindings {

	public class Result_ChannelConfigDecodeErrorZ: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCResult_ChannelConfigDecodeErrorZ?

		/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_ChannelConfigDecodeErrorZ(contents: LDKCResult_ChannelConfigDecodeErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKCResult_ChannelConfigDecodeErrorZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKCResult_ChannelConfigDecodeErrorZ, anchor: NativeTypeWrapper){
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
			
			public func getValue() -> ChannelConfig? {
				if self.cOpaqueStruct?.result_ok == true {
					return ChannelConfig(pointer: self.cOpaqueStruct!.contents.result.pointee, anchor: self)
				}
				return nil
			}
			
		public class func ok(o: ChannelConfig) -> Result_ChannelConfigDecodeErrorZ {
			
			return Result_ChannelConfigDecodeErrorZ(pointer: CResult_ChannelConfigDecodeErrorZ_ok(o.danglingClone().cOpaqueStruct!));
		}

		public class func err(e: DecodeError) -> Result_ChannelConfigDecodeErrorZ {
			
			return Result_ChannelConfigDecodeErrorZ(pointer: CResult_ChannelConfigDecodeErrorZ_err(e.danglingClone().cOpaqueStruct!));
		}

		internal func free() -> Void {
			
			return CResult_ChannelConfigDecodeErrorZ_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Result_ChannelConfigDecodeErrorZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_ChannelConfigDecodeErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_ChannelConfigDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

		public func clone() -> Result_ChannelConfigDecodeErrorZ {
			
			return Result_ChannelConfigDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_ChannelConfigDecodeErrorZ>) in
CResult_ChannelConfigDecodeErrorZ_clone(origPointer)
});
		}

					internal func danglingClone() -> Result_ChannelConfigDecodeErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		/* RESULT_METHODS_END */

	}

}
