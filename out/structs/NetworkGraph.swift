#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// Represents the network as nodes and channels between them
public typealias NetworkGraph = Bindings.NetworkGraph

extension Bindings {


	/// Represents the network as nodes and channels between them
	public class NetworkGraph: NativeTypeWrapper {

		let initialCFreeability: Bool


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKNetworkGraph?

		internal init(cType: LDKNetworkGraph, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKNetworkGraph, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKNetworkGraph, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the NetworkGraph, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = NetworkGraph_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Handles any network updates originating from [`Event`]s.
		/// Note that this will skip applying any [`NetworkUpdate::ChannelUpdateMessage`] to avoid
		/// leaking possibly identifying information of the sender to the public network.
		///
		/// [`Event`]: crate::events::Event
		public func handleNetworkUpdate(networkUpdate: NetworkUpdate) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNetworkGraph>) in

					withUnsafePointer(to: networkUpdate.cType!) {
						(networkUpdatePointer: UnsafePointer<LDKNetworkUpdate>) in
						NetworkGraph_handle_network_update(thisArgPointer, networkUpdatePointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Gets the chain hash for this network graph.
		public func getChainHash() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNetworkGraph>) in
					NetworkGraph_get_chain_hash(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ThirtyTwoBytes(
				cType: nativeCallResult, instantiationContext: "NetworkGraph.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Serialize the NetworkGraph object into a byte array which can be read by NetworkGraph_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKNetworkGraph>) in
					NetworkGraph_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "NetworkGraph.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a NetworkGraph from a byte array, created by NetworkGraph_write
		public class func read(ser: [UInt8], arg: Logger) -> Result_NetworkGraphDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "NetworkGraph.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = NetworkGraph_read(serPrimitiveWrapper.cType!, arg.activate().cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_NetworkGraphDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "NetworkGraph.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Creates a new, empty, network graph.
		public init(network: Network, logger: Logger) {
			// native call variable prep


			// native method call
			let nativeCallResult = NetworkGraph_new(network.getCValue(), logger.activate().cType!)

			// cleanup

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = NetworkGraph(cType: nativeCallResult, instantiationContext: "NetworkGraph.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0, instantiationContext: "NetworkGraph.swift::\(#function):\(#line)")


		}

		/// Returns a read-only view of the network graph.
		public func readOnly() -> ReadOnlyNetworkGraph {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNetworkGraph>) in
					NetworkGraph_read_only(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ReadOnlyNetworkGraph(
				cType: nativeCallResult, instantiationContext: "NetworkGraph.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// The unix timestamp provided by the most recent rapid gossip sync.
		/// It will be set by the rapid sync process after every sync completion.
		public func getLastRapidGossipSyncTimestamp() -> UInt32? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNetworkGraph>) in
					NetworkGraph_get_last_rapid_gossip_sync_timestamp(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_u32Z(
				cType: nativeCallResult, instantiationContext: "NetworkGraph.swift::\(#function):\(#line)", anchor: self
			)
			.getValue()


			return returnValue
		}

		/// Update the unix timestamp provided by the most recent rapid gossip sync.
		/// This should be done automatically by the rapid sync process after every sync completion.
		public func setLastRapidGossipSyncTimestamp(lastRapidGossipSyncTimestamp: UInt32) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNetworkGraph>) in
					NetworkGraph_set_last_rapid_gossip_sync_timestamp(thisArgPointer, lastRapidGossipSyncTimestamp)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// For an already known node (from channel announcements), update its stored properties from a
		/// given node announcement.
		///
		/// You probably don't want to call this directly, instead relying on a P2PGossipSync's
		/// RoutingMessageHandler implementation to call it indirectly. This may be useful to accept
		/// routing messages from a source using a protocol other than the lightning P2P protocol.
		public func updateNodeFromAnnouncement(msg: NodeAnnouncement) -> Result_NoneLightningErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNetworkGraph>) in

					withUnsafePointer(to: msg.cType!) { (msgPointer: UnsafePointer<LDKNodeAnnouncement>) in
						NetworkGraph_update_node_from_announcement(thisArgPointer, msgPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_NoneLightningErrorZ(
				cType: nativeCallResult, instantiationContext: "NetworkGraph.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// For an already known node (from channel announcements), update its stored properties from a
		/// given node announcement without verifying the associated signatures. Because we aren't
		/// given the associated signatures here we cannot relay the node announcement to any of our
		/// peers.
		public func updateNodeFromUnsignedAnnouncement(msg: UnsignedNodeAnnouncement) -> Result_NoneLightningErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNetworkGraph>) in

					withUnsafePointer(to: msg.cType!) { (msgPointer: UnsafePointer<LDKUnsignedNodeAnnouncement>) in
						NetworkGraph_update_node_from_unsigned_announcement(thisArgPointer, msgPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_NoneLightningErrorZ(
				cType: nativeCallResult, instantiationContext: "NetworkGraph.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Store or update channel info from a channel announcement.
		///
		/// You probably don't want to call this directly, instead relying on a [`P2PGossipSync`]'s
		/// [`RoutingMessageHandler`] implementation to call it indirectly. This may be useful to accept
		/// routing messages from a source using a protocol other than the lightning P2P protocol.
		///
		/// If a [`UtxoLookup`] object is provided via `utxo_lookup`, it will be called to verify
		/// the corresponding UTXO exists on chain and is correctly-formatted.
		public func updateChannelFromAnnouncement(msg: ChannelAnnouncement, utxoLookup: UtxoLookup?)
			-> Result_NoneLightningErrorZ
		{
			// native call variable prep

			let utxoLookupOption = Option_UtxoLookupZ(
				some: utxoLookup, instantiationContext: "NetworkGraph.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNetworkGraph>) in

					withUnsafePointer(to: msg.cType!) { (msgPointer: UnsafePointer<LDKChannelAnnouncement>) in
						NetworkGraph_update_channel_from_announcement(
							thisArgPointer, msgPointer, utxoLookupOption.cType!)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_NoneLightningErrorZ(
				cType: nativeCallResult, instantiationContext: "NetworkGraph.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Store or update channel info from a channel announcement.
		///
		/// You probably don't want to call this directly, instead relying on a [`P2PGossipSync`]'s
		/// [`RoutingMessageHandler`] implementation to call it indirectly. This may be useful to accept
		/// routing messages from a source using a protocol other than the lightning P2P protocol.
		///
		/// This will skip verification of if the channel is actually on-chain.
		public func updateChannelFromAnnouncementNoLookup(msg: ChannelAnnouncement) -> Result_NoneLightningErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNetworkGraph>) in

					withUnsafePointer(to: msg.cType!) { (msgPointer: UnsafePointer<LDKChannelAnnouncement>) in
						NetworkGraph_update_channel_from_announcement_no_lookup(thisArgPointer, msgPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_NoneLightningErrorZ(
				cType: nativeCallResult, instantiationContext: "NetworkGraph.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Store or update channel info from a channel announcement without verifying the associated
		/// signatures. Because we aren't given the associated signatures here we cannot relay the
		/// channel announcement to any of our peers.
		///
		/// If a [`UtxoLookup`] object is provided via `utxo_lookup`, it will be called to verify
		/// the corresponding UTXO exists on chain and is correctly-formatted.
		public func updateChannelFromUnsignedAnnouncement(msg: UnsignedChannelAnnouncement, utxoLookup: UtxoLookup?)
			-> Result_NoneLightningErrorZ
		{
			// native call variable prep

			let utxoLookupOption = Option_UtxoLookupZ(
				some: utxoLookup, instantiationContext: "NetworkGraph.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNetworkGraph>) in

					withUnsafePointer(to: msg.cType!) { (msgPointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
						NetworkGraph_update_channel_from_unsigned_announcement(
							thisArgPointer, msgPointer, utxoLookupOption.cType!)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_NoneLightningErrorZ(
				cType: nativeCallResult, instantiationContext: "NetworkGraph.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Update channel from partial announcement data received via rapid gossip sync
		///
		/// `timestamp: u64`: Timestamp emulating the backdated original announcement receipt (by the
		/// rapid gossip sync server)
		///
		/// All other parameters as used in [`msgs::UnsignedChannelAnnouncement`] fields.
		public func addChannelFromPartialAnnouncement(
			shortChannelId: UInt64, timestamp: UInt64, features: ChannelFeatures, nodeId1: [UInt8], nodeId2: [UInt8]
		) -> Result_NoneLightningErrorZ {
			// native call variable prep

			let nodeId1PrimitiveWrapper = PublicKey(
				value: nodeId1, instantiationContext: "NetworkGraph.swift::\(#function):\(#line)")

			let nodeId2PrimitiveWrapper = PublicKey(
				value: nodeId2, instantiationContext: "NetworkGraph.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNetworkGraph>) in
					NetworkGraph_add_channel_from_partial_announcement(
						thisArgPointer, shortChannelId, timestamp, features.dynamicallyDangledClone().cType!,
						nodeId1PrimitiveWrapper.cType!, nodeId2PrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			nodeId1PrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			nodeId2PrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_NoneLightningErrorZ(
				cType: nativeCallResult, instantiationContext: "NetworkGraph.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Marks a channel in the graph as failed permanently.
		///
		/// The channel and any node for which this was their last channel are removed from the graph.
		public func channelFailedPermanent(shortChannelId: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNetworkGraph>) in
					NetworkGraph_channel_failed_permanent(thisArgPointer, shortChannelId)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Marks a node in the graph as permanently failed, effectively removing it and its channels
		/// from local storage.
		public func nodeFailedPermanent(nodeId: [UInt8]) {
			// native call variable prep

			let nodeIdPrimitiveWrapper = PublicKey(
				value: nodeId, instantiationContext: "NetworkGraph.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNetworkGraph>) in
					NetworkGraph_node_failed_permanent(thisArgPointer, nodeIdPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			nodeIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Removes information about channels that we haven't heard any updates about in some time.
		/// This can be used regularly to prune the network graph of channels that likely no longer
		/// exist.
		///
		/// While there is no formal requirement that nodes regularly re-broadcast their channel
		/// updates every two weeks, the non-normative section of BOLT 7 currently suggests that
		/// pruning occur for updates which are at least two weeks old, which we implement here.
		///
		/// Note that for users of the `lightning-background-processor` crate this method may be
		/// automatically called regularly for you.
		///
		/// This method will also cause us to stop tracking removed nodes and channels if they have been
		/// in the map for a while so that these can be resynced from gossip in the future.
		///
		/// This method is only available with the `std` feature. See
		/// [`NetworkGraph::remove_stale_channels_and_tracking_with_time`] for `no-std` use.
		public func removeStaleChannelsAndTracking() {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNetworkGraph>) in
					NetworkGraph_remove_stale_channels_and_tracking(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Removes information about channels that we haven't heard any updates about in some time.
		/// This can be used regularly to prune the network graph of channels that likely no longer
		/// exist.
		///
		/// While there is no formal requirement that nodes regularly re-broadcast their channel
		/// updates every two weeks, the non-normative section of BOLT 7 currently suggests that
		/// pruning occur for updates which are at least two weeks old, which we implement here.
		///
		/// This method will also cause us to stop tracking removed nodes and channels if they have been
		/// in the map for a while so that these can be resynced from gossip in the future.
		///
		/// This function takes the current unix time as an argument. For users with the `std` feature
		/// enabled, [`NetworkGraph::remove_stale_channels_and_tracking`] may be preferable.
		public func removeStaleChannelsAndTrackingWithTime(currentTimeUnix: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNetworkGraph>) in
					NetworkGraph_remove_stale_channels_and_tracking_with_time(thisArgPointer, currentTimeUnix)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// For an already known (from announcement) channel, update info about one of the directions
		/// of the channel.
		///
		/// You probably don't want to call this directly, instead relying on a [`P2PGossipSync`]'s
		/// [`RoutingMessageHandler`] implementation to call it indirectly. This may be useful to accept
		/// routing messages from a source using a protocol other than the lightning P2P protocol.
		///
		/// If built with `no-std`, any updates with a timestamp more than two weeks in the past or
		/// materially in the future will be rejected.
		public func updateChannel(msg: ChannelUpdate) -> Result_NoneLightningErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNetworkGraph>) in

					withUnsafePointer(to: msg.cType!) { (msgPointer: UnsafePointer<LDKChannelUpdate>) in
						NetworkGraph_update_channel(thisArgPointer, msgPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_NoneLightningErrorZ(
				cType: nativeCallResult, instantiationContext: "NetworkGraph.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// For an already known (from announcement) channel, update info about one of the directions
		/// of the channel without verifying the associated signatures. Because we aren't given the
		/// associated signatures here we cannot relay the channel update to any of our peers.
		///
		/// If built with `no-std`, any updates with a timestamp more than two weeks in the past or
		/// materially in the future will be rejected.
		public func updateChannelUnsigned(msg: UnsignedChannelUpdate) -> Result_NoneLightningErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNetworkGraph>) in

					withUnsafePointer(to: msg.cType!) { (msgPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
						NetworkGraph_update_channel_unsigned(thisArgPointer, msgPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_NoneLightningErrorZ(
				cType: nativeCallResult, instantiationContext: "NetworkGraph.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// For an already known (from announcement) channel, verify the given [`ChannelUpdate`].
		///
		/// This checks whether the update currently is applicable by [`Self::update_channel`].
		///
		/// If built with `no-std`, any updates with a timestamp more than two weeks in the past or
		/// materially in the future will be rejected.
		public func verifyChannelUpdate(msg: ChannelUpdate) -> Result_NoneLightningErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNetworkGraph>) in

					withUnsafePointer(to: msg.cType!) { (msgPointer: UnsafePointer<LDKChannelUpdate>) in
						NetworkGraph_verify_channel_update(thisArgPointer, msgPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_NoneLightningErrorZ(
				cType: nativeCallResult, instantiationContext: "NetworkGraph.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false)


			return returnValue
		}


		/// Indicates that this is the only struct which contains the same pointer.
		/// Rust functions which take ownership of an object provided via an argument require
		/// this to be true and invalidate the object pointed to by inner.
		public func isOwned() -> Bool {
			// return value (do some wrapping)
			let returnValue = self.cType!.is_owned

			return returnValue
		}


		internal func setCFreeability(freeable: Bool) -> NetworkGraph {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> NetworkGraph {
			self.dangling = self.cType!.is_owned
			return self
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print(
						"Freeing NetworkGraph \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing NetworkGraph \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

