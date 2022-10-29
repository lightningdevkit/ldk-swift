#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Result_CounterpartyForwardingInfoDecodeErrorZ = Bindings.Result_CounterpartyForwardingInfoDecodeErrorZ

extension Bindings {

	public class Result_CounterpartyForwardingInfoDecodeErrorZ: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCResult_CounterpartyForwardingInfoDecodeErrorZ?

		/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_CounterpartyForwardingInfoDecodeErrorZ(contents: LDKCResult_CounterpartyForwardingInfoDecodeErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKCResult_CounterpartyForwardingInfoDecodeErrorZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKCResult_CounterpartyForwardingInfoDecodeErrorZ, anchor: NativeTypeWrapper){
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
			
			public func getValue() -> CounterpartyForwardingInfo? {
				if self.cOpaqueStruct?.result_ok == true {
					return CounterpartyForwardingInfo(pointer: self.cOpaqueStruct!.contents.result.pointee, anchor: self).dangle()
				}
				return nil
			}
			
		public class func ok(o: CounterpartyForwardingInfo) -> Result_CounterpartyForwardingInfoDecodeErrorZ {
			
			return Result_CounterpartyForwardingInfoDecodeErrorZ(pointer: CResult_CounterpartyForwardingInfoDecodeErrorZ_ok(o.danglingClone().cOpaqueStruct!));
		}

		public class func err(e: DecodeError) -> Result_CounterpartyForwardingInfoDecodeErrorZ {
			
			return Result_CounterpartyForwardingInfoDecodeErrorZ(pointer: CResult_CounterpartyForwardingInfoDecodeErrorZ_err(e.danglingClone().cOpaqueStruct!));
		}

		internal func free() -> Void {
			
			return CResult_CounterpartyForwardingInfoDecodeErrorZ_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Result_CounterpartyForwardingInfoDecodeErrorZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_CounterpartyForwardingInfoDecodeErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_CounterpartyForwardingInfoDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

		public func clone() -> Result_CounterpartyForwardingInfoDecodeErrorZ {
			
			return Result_CounterpartyForwardingInfoDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_CounterpartyForwardingInfoDecodeErrorZ>) in
CResult_CounterpartyForwardingInfoDecodeErrorZ_clone(origPointer)
});
		}

					internal func danglingClone() -> Result_CounterpartyForwardingInfoDecodeErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		/* RESULT_METHODS_END */

	}

}
