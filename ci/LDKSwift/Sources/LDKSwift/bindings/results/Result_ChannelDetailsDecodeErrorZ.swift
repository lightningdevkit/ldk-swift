#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Result_ChannelDetailsDecodeErrorZ = Bindings.Result_ChannelDetailsDecodeErrorZ

extension Bindings {

	public class Result_ChannelDetailsDecodeErrorZ: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCResult_ChannelDetailsDecodeErrorZ?

		/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_ChannelDetailsDecodeErrorZ(contents: LDKCResult_ChannelDetailsDecodeErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKCResult_ChannelDetailsDecodeErrorZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKCResult_ChannelDetailsDecodeErrorZ, anchor: NativeTypeWrapper){
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
			
			public func getValue() -> ChannelDetails? {
				if self.cOpaqueStruct?.result_ok == true {
					return ChannelDetails(pointer: self.cOpaqueStruct!.contents.result.pointee, anchor: self).dangle()
				}
				return nil
			}
			
		public class func ok(o: ChannelDetails) -> Result_ChannelDetailsDecodeErrorZ {
			
			return Result_ChannelDetailsDecodeErrorZ(pointer: CResult_ChannelDetailsDecodeErrorZ_ok(o.danglingClone().cOpaqueStruct!));
		}

		public class func err(e: DecodeError) -> Result_ChannelDetailsDecodeErrorZ {
			
			return Result_ChannelDetailsDecodeErrorZ(pointer: CResult_ChannelDetailsDecodeErrorZ_err(e.danglingClone().cOpaqueStruct!));
		}

		internal func free() -> Void {
			
			return CResult_ChannelDetailsDecodeErrorZ_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Result_ChannelDetailsDecodeErrorZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_ChannelDetailsDecodeErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_ChannelDetailsDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

		public func clone() -> Result_ChannelDetailsDecodeErrorZ {
			
			return Result_ChannelDetailsDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_ChannelDetailsDecodeErrorZ>) in
CResult_ChannelDetailsDecodeErrorZ_clone(origPointer)
});
		}

					internal func danglingClone() -> Result_ChannelDetailsDecodeErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		/* RESULT_METHODS_END */

	}

}
