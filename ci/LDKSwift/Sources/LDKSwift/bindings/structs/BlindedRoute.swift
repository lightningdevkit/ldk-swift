#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias BlindedRoute = Bindings.BlindedRoute

extension Bindings {

	public class BlindedRoute: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKBlindedRoute?


		

		public init(pointer: LDKBlindedRoute){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKBlindedRoute, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* STRUCT_METHODS_START */

		public class func new(node_pks: [[UInt8]], keys_manager: KeysInterface) -> Result_BlindedRouteNoneZ {
			
						let node_pksWrapper = Bindings.new_LDKCVec_PublicKeyZWrapper(array: node_pks)
						defer {
							node_pksWrapper.noOpRetain()
						}
					
			return Result_BlindedRouteNoneZ(pointer: withUnsafePointer(to: keys_manager.activateOnce().cOpaqueStruct!) { (keys_managerPointer: UnsafePointer<LDKKeysInterface>) in
BlindedRoute_new(node_pksWrapper.dangle().cOpaqueStruct!, keys_managerPointer)
});
		}

		public func write() -> [UInt8] {
			
			return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKBlindedRoute>) in
BlindedRoute_write(objPointer)
}, callerContext: "BlindedRoute::write");
		}

		public class func read(ser: [UInt8]) -> Result_BlindedRouteDecodeErrorZ {
			
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
			return Result_BlindedRouteDecodeErrorZ(pointer: BlindedRoute_read(serWrapper.cOpaqueStruct!));
		}

		internal func free() -> Void {
			
			return BlindedRoute_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> BlindedRoute {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing BlindedRoute \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing BlindedRoute \(self.instanceNumber) due to dangle.")
						}
					}
				

		/* STRUCT_METHODS_END */

	}

}
