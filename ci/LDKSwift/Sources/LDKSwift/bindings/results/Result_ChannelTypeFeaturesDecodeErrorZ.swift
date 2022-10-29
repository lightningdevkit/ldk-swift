#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Result_ChannelTypeFeaturesDecodeErrorZ = Bindings.Result_ChannelTypeFeaturesDecodeErrorZ

extension Bindings {

	public class Result_ChannelTypeFeaturesDecodeErrorZ: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCResult_ChannelTypeFeaturesDecodeErrorZ?

		/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_ChannelTypeFeaturesDecodeErrorZ(contents: LDKCResult_ChannelTypeFeaturesDecodeErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKCResult_ChannelTypeFeaturesDecodeErrorZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKCResult_ChannelTypeFeaturesDecodeErrorZ, anchor: NativeTypeWrapper){
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
			
			public func getValue() -> ChannelTypeFeatures? {
				if self.cOpaqueStruct?.result_ok == true {
					return ChannelTypeFeatures(pointer: self.cOpaqueStruct!.contents.result.pointee, anchor: self).dangle()
				}
				return nil
			}
			
		public class func ok(o: ChannelTypeFeatures) -> Result_ChannelTypeFeaturesDecodeErrorZ {
			
			return Result_ChannelTypeFeaturesDecodeErrorZ(pointer: CResult_ChannelTypeFeaturesDecodeErrorZ_ok(o.danglingClone().cOpaqueStruct!));
		}

		public class func err(e: DecodeError) -> Result_ChannelTypeFeaturesDecodeErrorZ {
			
			return Result_ChannelTypeFeaturesDecodeErrorZ(pointer: CResult_ChannelTypeFeaturesDecodeErrorZ_err(e.danglingClone().cOpaqueStruct!));
		}

		internal func free() -> Void {
			
			return CResult_ChannelTypeFeaturesDecodeErrorZ_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Result_ChannelTypeFeaturesDecodeErrorZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_ChannelTypeFeaturesDecodeErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_ChannelTypeFeaturesDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

		public func clone() -> Result_ChannelTypeFeaturesDecodeErrorZ {
			
			return Result_ChannelTypeFeaturesDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_ChannelTypeFeaturesDecodeErrorZ>) in
CResult_ChannelTypeFeaturesDecodeErrorZ_clone(origPointer)
});
		}

					internal func danglingClone() -> Result_ChannelTypeFeaturesDecodeErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		/* RESULT_METHODS_END */

	}

}
