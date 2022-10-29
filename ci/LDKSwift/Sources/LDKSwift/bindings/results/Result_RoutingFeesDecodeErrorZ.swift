#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Result_RoutingFeesDecodeErrorZ = Bindings.Result_RoutingFeesDecodeErrorZ

extension Bindings {

	public class Result_RoutingFeesDecodeErrorZ: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCResult_RoutingFeesDecodeErrorZ?

		/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_RoutingFeesDecodeErrorZ(contents: LDKCResult_RoutingFeesDecodeErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKCResult_RoutingFeesDecodeErrorZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKCResult_RoutingFeesDecodeErrorZ, anchor: NativeTypeWrapper){
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
			
			public func getValue() -> RoutingFees? {
				if self.cOpaqueStruct?.result_ok == true {
					return RoutingFees(pointer: self.cOpaqueStruct!.contents.result.pointee, anchor: self).dangle()
				}
				return nil
			}
			
		public class func ok(o: RoutingFees) -> Result_RoutingFeesDecodeErrorZ {
			
			return Result_RoutingFeesDecodeErrorZ(pointer: CResult_RoutingFeesDecodeErrorZ_ok(o.danglingClone().cOpaqueStruct!));
		}

		public class func err(e: DecodeError) -> Result_RoutingFeesDecodeErrorZ {
			
			return Result_RoutingFeesDecodeErrorZ(pointer: CResult_RoutingFeesDecodeErrorZ_err(e.danglingClone().cOpaqueStruct!));
		}

		internal func free() -> Void {
			
			return CResult_RoutingFeesDecodeErrorZ_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Result_RoutingFeesDecodeErrorZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_RoutingFeesDecodeErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_RoutingFeesDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

		public func clone() -> Result_RoutingFeesDecodeErrorZ {
			
			return Result_RoutingFeesDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_RoutingFeesDecodeErrorZ>) in
CResult_RoutingFeesDecodeErrorZ_clone(origPointer)
});
		}

					internal func danglingClone() -> Result_RoutingFeesDecodeErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

		/* RESULT_METHODS_END */

	}

}
