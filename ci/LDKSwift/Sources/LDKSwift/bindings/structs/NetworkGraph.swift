#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias NetworkGraph = Bindings.NetworkGraph

extension Bindings {

	public class NetworkGraph: NativeTypeWrapper {

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cOpaqueStruct: LDKNetworkGraph?


		/* DEFAULT_CONSTRUCTOR_START */
		public init(genesis_hash: [UInt8], logger: Logger) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			
			self.cOpaqueStruct = NetworkGraph_new(Bindings.new_LDKThirtyTwoBytes(array: genesis_hash), logger.activate().cOpaqueStruct!)
			super.init(conflictAvoidingVariableName: 0)
			try? self.addAnchor(anchor: logger)

		}
		/* DEFAULT_CONSTRUCTOR_END */

		public init(pointer: LDKNetworkGraph){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
		}

		public init(pointer: LDKNetworkGraph, anchor: NativeTypeWrapper){
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cOpaqueStruct = pointer
			super.init(conflictAvoidingVariableName: 0)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		/* STRUCT_METHODS_START */

		public func as_EventHandler() -> NativelyImplementedEventHandler {
			
			return NativelyImplementedEventHandler(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNetworkGraph>) in
NetworkGraph_as_EventHandler(this_argPointer)
}, anchor: self);
		}

		public func write() -> [UInt8] {
			
			return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKNetworkGraph>) in
NetworkGraph_write(objPointer)
}, callerContext: "NetworkGraph::write");
		}

		public class func read(ser: [UInt8], arg: Logger) -> Result_NetworkGraphDecodeErrorZ {
			
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
			return Result_NetworkGraphDecodeErrorZ(pointer: NetworkGraph_read(serWrapper.cOpaqueStruct!, arg.activate().cOpaqueStruct!));
		}

		public func read_only() -> ReadOnlyNetworkGraph {
			
			return ReadOnlyNetworkGraph(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNetworkGraph>) in
NetworkGraph_read_only(this_argPointer)
});
		}

		public func get_last_rapid_gossip_sync_timestamp() -> Option_u32Z {
			
			return Option_u32Z(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNetworkGraph>) in
NetworkGraph_get_last_rapid_gossip_sync_timestamp(this_argPointer)
});
		}

		public func set_last_rapid_gossip_sync_timestamp(last_rapid_gossip_sync_timestamp: UInt32) -> Void {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNetworkGraph>) in
NetworkGraph_set_last_rapid_gossip_sync_timestamp(this_argPointer, last_rapid_gossip_sync_timestamp)
};
		}

		public func update_node_from_announcement(msg: NodeAnnouncement) -> Result_NoneLightningErrorZ {
			
			return Result_NoneLightningErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNetworkGraph>) in
withUnsafePointer(to: msg.cOpaqueStruct!) { (msgPointer: UnsafePointer<LDKNodeAnnouncement>) in
NetworkGraph_update_node_from_announcement(this_argPointer, msgPointer)
}
});
		}

		public func update_node_from_unsigned_announcement(msg: UnsignedNodeAnnouncement) -> Result_NoneLightningErrorZ {
			
			return Result_NoneLightningErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNetworkGraph>) in
withUnsafePointer(to: msg.cOpaqueStruct!) { (msgPointer: UnsafePointer<LDKUnsignedNodeAnnouncement>) in
NetworkGraph_update_node_from_unsigned_announcement(this_argPointer, msgPointer)
}
});
		}

		public func update_channel_from_announcement(msg: ChannelAnnouncement, chain_access: Option_AccessZ) -> Result_NoneLightningErrorZ {
			
			return Result_NoneLightningErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNetworkGraph>) in
withUnsafePointer(to: msg.cOpaqueStruct!) { (msgPointer: UnsafePointer<LDKChannelAnnouncement>) in
NetworkGraph_update_channel_from_announcement(this_argPointer, msgPointer, chain_access.cOpaqueStruct!)
}
});
		}

		public func update_channel_from_unsigned_announcement(msg: UnsignedChannelAnnouncement, chain_access: Option_AccessZ) -> Result_NoneLightningErrorZ {
			
			return Result_NoneLightningErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNetworkGraph>) in
withUnsafePointer(to: msg.cOpaqueStruct!) { (msgPointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
NetworkGraph_update_channel_from_unsigned_announcement(this_argPointer, msgPointer, chain_access.cOpaqueStruct!)
}
});
		}

		public func add_channel_from_partial_announcement(short_channel_id: UInt64, timestamp: UInt64, features: ChannelFeatures, node_id_1: [UInt8], node_id_2: [UInt8]) -> Result_NoneLightningErrorZ {
			
			return Result_NoneLightningErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNetworkGraph>) in
NetworkGraph_add_channel_from_partial_announcement(this_argPointer, short_channel_id, timestamp, features.danglingClone().cOpaqueStruct!, Bindings.new_LDKPublicKey(array: node_id_1), Bindings.new_LDKPublicKey(array: node_id_2))
});
		}

		public func channel_failed(short_channel_id: UInt64, is_permanent: Bool) -> Void {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNetworkGraph>) in
NetworkGraph_channel_failed(this_argPointer, short_channel_id, is_permanent)
};
		}

		public func node_failed_permanent(node_id: [UInt8]) -> Void {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNetworkGraph>) in
NetworkGraph_node_failed_permanent(this_argPointer, Bindings.new_LDKPublicKey(array: node_id))
};
		}

		public func remove_stale_channels_and_tracking() -> Void {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNetworkGraph>) in
NetworkGraph_remove_stale_channels_and_tracking(this_argPointer)
};
		}

		public func remove_stale_channels_and_tracking_with_time(current_time_unix: UInt64) -> Void {
			
			return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNetworkGraph>) in
NetworkGraph_remove_stale_channels_and_tracking_with_time(this_argPointer, current_time_unix)
};
		}

		public func update_channel(msg: ChannelUpdate) -> Result_NoneLightningErrorZ {
			
			return Result_NoneLightningErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNetworkGraph>) in
withUnsafePointer(to: msg.cOpaqueStruct!) { (msgPointer: UnsafePointer<LDKChannelUpdate>) in
NetworkGraph_update_channel(this_argPointer, msgPointer)
}
});
		}

		public func update_channel_unsigned(msg: UnsignedChannelUpdate) -> Result_NoneLightningErrorZ {
			
			return Result_NoneLightningErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNetworkGraph>) in
withUnsafePointer(to: msg.cOpaqueStruct!) { (msgPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
NetworkGraph_update_channel_unsigned(this_argPointer, msgPointer)
}
});
		}

		internal func free() -> Void {
			
			return NetworkGraph_free(self.cOpaqueStruct!);
		}

					internal func dangle() -> NetworkGraph {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing NetworkGraph \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing NetworkGraph \(self.instanceNumber) due to dangle.")
						}
					}
				

		/* STRUCT_METHODS_END */

	}

}
