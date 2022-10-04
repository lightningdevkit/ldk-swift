#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias DefaultRouter = Bindings.DefaultRouter

extension Bindings {

	public class DefaultRouter: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKDefaultRouter?


		/* DEFAULT_CONSTRUCTOR_START */
		public init(network_graph: NetworkGraph, logger: Logger, random_seed_bytes: [UInt8], scorer: LockableScore) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			
			self.cOpaqueStruct = withUnsafePointer(to: network_graph.cOpaqueStruct!) { (network_graphPointer: UnsafePointer<LDKNetworkGraph>) in
DefaultRouter_new(network_graphPointer, logger.activate().cOpaqueStruct!, Bindings.new_LDKThirtyTwoBytes(array: random_seed_bytes), scorer.activate().cOpaqueStruct!)
}
			super.init(conflictAvoidingVariableName: 0)
			try? self.addAnchor(anchor: network_graph)
try? self.addAnchor(anchor: logger)
try? self.addAnchor(anchor: scorer)

		}
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKDefaultRouter){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKDefaultRouter, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* STRUCT_METHODS_START */

		public func as_Router() -> NativelyImplementedRouter {
			
			return NativelyImplementedRouter(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKDefaultRouter>) in
DefaultRouter_as_Router(this_argPointer)
}, anchor: self);
		}

		internal func free() -> Void {
			
			return DefaultRouter_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> DefaultRouter {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing DefaultRouter \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing DefaultRouter \(self.instanceNumber) due to dangle.")
						}
					}
				

		/* STRUCT_METHODS_END */

	}

}
