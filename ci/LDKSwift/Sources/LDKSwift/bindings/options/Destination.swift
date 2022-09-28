#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Destination = Bindings.Destination

extension Bindings {

	public class Destination: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKDestination?

		

		public init(pointer: LDKDestination){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKDestination, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* OPTION_METHODS_START */

				public enum DestinationValueType {
					case Node, BlindedRoute
				}

				public func getValueType() -> DestinationValueType? {
					switch self.cOpaqueStruct?.tag {
                    
					case LDKDestination_Node:
						return .Node
					case LDKDestination_BlindedRoute:
						return .BlindedRoute
                    default:
                        return nil
                    }
				}

				
					public func getValueAsNode() -> [UInt8]? {
						if self.cOpaqueStruct?.tag != LDKDestination_Node {
							return nil
						}
						return Bindings.LDKPublicKey_to_array(nativeType: self.cOpaqueStruct!.node)
					}
				
					public func getValueAsBlindedRoute() -> Bindings.BlindedRoute? {
						if self.cOpaqueStruct?.tag != LDKDestination_BlindedRoute {
							return nil
						}
						return Bindings.BlindedRoute(pointer: self.cOpaqueStruct!.blinded_route, anchor: self)
					}
				
			
		internal func free() -> Void {
			
			return Destination_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> Destination {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing Destination \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Destination \(self.instanceNumber) due to dangle.")
						}
					}
				

		public class func node(a: [UInt8]) -> Destination {
			
			return Destination(pointer: Destination_node(Bindings.new_LDKPublicKey(array: a)));
		}

		public class func blinded_route(a: Bindings.BlindedRoute) -> Destination {
			
			return Destination(pointer: Destination_blinded_route(a.cOpaqueStruct!));
		}

		/* OPTION_METHODS_END */

		/* TYPE_CLASSES */
	}

}
