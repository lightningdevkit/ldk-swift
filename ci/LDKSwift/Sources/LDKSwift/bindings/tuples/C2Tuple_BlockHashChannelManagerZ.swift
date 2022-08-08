#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias C2Tuple_BlockHashChannelManagerZ = Bindings.C2Tuple_BlockHashChannelManagerZ

extension Bindings {

	public class C2Tuple_BlockHashChannelManagerZ: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKC2Tuple_BlockHashChannelManagerZ?

		public init(pointer: LDKC2Tuple_BlockHashChannelManagerZ){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKC2Tuple_BlockHashChannelManagerZ, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* TUPLE_METHODS_START */

		#warning("This method passes non-cloneable objects by owned value. Here be dragons.")
@available(*, deprecated, message: "This method passes non-cloneable objects by owned value. Here be dragons.")
public class func new(a: [UInt8], b: ChannelManager) -> C2Tuple_BlockHashChannelManagerZ {
			
			return C2Tuple_BlockHashChannelManagerZ(pointer: C2Tuple_BlockHashChannelManagerZ_new(Bindings.new_LDKThirtyTwoBytes(array: a), b.cOpaqueStruct!));
		}

		internal func free() -> Void {
			
			return C2Tuple_BlockHashChannelManagerZ_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> C2Tuple_BlockHashChannelManagerZ {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing C2Tuple_BlockHashChannelManagerZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing C2Tuple_BlockHashChannelManagerZ \(self.instanceNumber) due to dangle.")
						}
					}
				

				public func getA() -> [UInt8] {
					return Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.a);
				}
			
				public func getB() -> ChannelManager {
					return ChannelManager(pointer: self.cOpaqueStruct!.b, anchor: self);
				}
			
		/* TUPLE_METHODS_END */

	}

}
