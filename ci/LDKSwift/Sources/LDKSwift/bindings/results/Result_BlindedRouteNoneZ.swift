#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Result_BlindedRouteNoneZ = Bindings.Result_BlindedRouteNoneZ

extension Bindings {

	public class Result_BlindedRouteNoneZ: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKCResult_BlindedRouteNoneZ?

		/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_BlindedRouteNoneZ(contents: LDKCResult_BlindedRouteNoneZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKCResult_BlindedRouteNoneZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKCResult_BlindedRouteNoneZ, anchor: NativeTypeWrapper){
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

			public func getValue() -> BlindedRoute? {
				if self.cOpaqueStruct?.result_ok == true {
					return BlindedRoute(pointer: self.cOpaqueStruct!.contents.result.pointee, anchor: self)
				}
				return nil
			}
			
		#warning("This method passes non-cloneable objects by owned value. Here be dragons.")
@available(*, deprecated, message: "This method passes non-cloneable objects by owned value. Here be dragons.")
public class func ok(o: BlindedRoute) -> Result_BlindedRouteNoneZ {
			
			return Result_BlindedRouteNoneZ(pointer: CResult_BlindedRouteNoneZ_ok(o.cOpaqueStruct!));
		}

		public class func err() -> Result_BlindedRouteNoneZ {
			
			return Result_BlindedRouteNoneZ(pointer: CResult_BlindedRouteNoneZ_err());
		}

		internal func free() -> Void {
			
			return CResult_BlindedRouteNoneZ_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Result_BlindedRouteNoneZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_BlindedRouteNoneZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_BlindedRouteNoneZ \(self.instanceNumber) due to dangle.")
						}
					}
				

		/* RESULT_METHODS_END */

	}

}
