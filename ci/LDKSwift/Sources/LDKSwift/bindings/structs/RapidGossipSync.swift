#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias RapidGossipSync = Bindings.RapidGossipSync

extension Bindings {

	public class RapidGossipSync: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKRapidGossipSync?


		/* DEFAULT_CONSTRUCTOR_START */
		public init(network_graph: NetworkGraph) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			
			self.cOpaqueStruct = withUnsafePointer(to: network_graph.cOpaqueStruct!) { (network_graphPointer: UnsafePointer<LDKNetworkGraph>) in
RapidGossipSync_new(network_graphPointer)
}
			super.init(conflictAvoidingVariableName: 0)
			try? self.addAnchor(anchor: network_graph)

		}
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKRapidGossipSync){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKRapidGossipSync, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* STRUCT_METHODS_START */

		public func update_network_graph(update_data: [UInt8]) -> Result_u32GraphSyncErrorZ {
			
						let update_dataWrapper = Bindings.new_LDKu8sliceWrapper(array: update_data)
						defer {
							update_dataWrapper.noOpRetain()
						}
					
			return Result_u32GraphSyncErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKRapidGossipSync>) in
RapidGossipSync_update_network_graph(this_argPointer, update_dataWrapper.cOpaqueStruct!)
});
		}

		public func is_initial_sync_complete() -> Bool {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKRapidGossipSync>) in
RapidGossipSync_is_initial_sync_complete(this_argPointer)
};
		}

		internal func free() -> Void {
			
			return RapidGossipSync_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> RapidGossipSync {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing RapidGossipSync \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing RapidGossipSync \(self.instanceNumber) due to dangle.")
						}
					}
				

		/* STRUCT_METHODS_END */

	}

}
