#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias ReadOnlyNetworkGraph = Bindings.ReadOnlyNetworkGraph

extension Bindings {

	public class ReadOnlyNetworkGraph: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKReadOnlyNetworkGraph?


		

		public init(pointer: LDKReadOnlyNetworkGraph){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKReadOnlyNetworkGraph, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* STRUCT_METHODS_START */

		public func channel(short_channel_id: UInt64) -> ChannelInfo {
			
			return ChannelInfo(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKReadOnlyNetworkGraph>) in
ReadOnlyNetworkGraph_channel(this_argPointer, short_channel_id)
});
		}

		public func list_channels() -> [UInt64] {
			
			return Bindings.LDKCVec_u64Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKReadOnlyNetworkGraph>) in
ReadOnlyNetworkGraph_list_channels(this_argPointer)
}, callerContext: "ReadOnlyNetworkGraph::list_channels");
		}

		public func node(node_id: NodeId) -> NodeInfo {
			
			return NodeInfo(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKReadOnlyNetworkGraph>) in
withUnsafePointer(to: node_id.cOpaqueStruct!) { (node_idPointer: UnsafePointer<LDKNodeId>) in
ReadOnlyNetworkGraph_node(this_argPointer, node_idPointer)
}
});
		}

		public func list_nodes() -> [NodeId] {
			
			return Bindings.LDKCVec_NodeIdZ_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKReadOnlyNetworkGraph>) in
ReadOnlyNetworkGraph_list_nodes(this_argPointer)
}, callerContext: "ReadOnlyNetworkGraph::list_nodes")
						
						.map { (cOpaqueStruct) in
							NodeId(pointer: cOpaqueStruct)
						}
					;
		}

		public func get_addresses(pubkey: [UInt8]) -> Option_CVec_NetAddressZZ {
			
			return Option_CVec_NetAddressZZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKReadOnlyNetworkGraph>) in
ReadOnlyNetworkGraph_get_addresses(this_argPointer, Bindings.new_LDKPublicKey(array: pubkey))
});
		}

		internal func free() -> Void {
			
			return ReadOnlyNetworkGraph_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> ReadOnlyNetworkGraph {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing ReadOnlyNetworkGraph \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing ReadOnlyNetworkGraph \(self.instanceNumber) due to dangle.")
						}
					}
				

		/* STRUCT_METHODS_END */

	}

}
