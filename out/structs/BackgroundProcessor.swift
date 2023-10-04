#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// `BackgroundProcessor` takes care of tasks that (1) need to happen periodically to keep
/// Rust-Lightning running properly, and (2) either can or should be run in the background. Its
/// responsibilities are:
/// * Processing [`Event`]s with a user-provided [`EventHandler`].
/// * Monitoring whether the [`ChannelManager`] needs to be re-persisted to disk, and if so,
/// writing it to disk/backups by invoking the callback given to it at startup.
/// [`ChannelManager`] persistence should be done in the background.
/// * Calling [`ChannelManager::timer_tick_occurred`], [`ChainMonitor::rebroadcast_pending_claims`]
/// and [`PeerManager::timer_tick_occurred`] at the appropriate intervals.
/// * Calling [`NetworkGraph::remove_stale_channels_and_tracking`] (if a [`GossipSync`] with a
/// [`NetworkGraph`] is provided to [`BackgroundProcessor::start`]).
///
/// It will also call [`PeerManager::process_events`] periodically though this shouldn't be relied
/// upon as doing so may result in high latency.
///
/// # Note
///
/// If [`ChannelManager`] persistence fails and the persisted manager becomes out-of-date, then
/// there is a risk of channels force-closing on startup when the manager realizes it's outdated.
/// However, as long as [`ChannelMonitor`] backups are sound, no funds besides those used for
/// unilateral chain closure fees are at risk.
///
/// [`ChannelMonitor`]: lightning::chain::channelmonitor::ChannelMonitor
/// [`Event`]: lightning::events::Event
/// [`PeerManager::timer_tick_occurred`]: lightning::ln::peer_handler::PeerManager::timer_tick_occurred
/// [`PeerManager::process_events`]: lightning::ln::peer_handler::PeerManager::process_events
/// BackgroundProcessor will immediately stop on drop. It should be stored until shutdown.
public typealias BackgroundProcessor = Bindings.BackgroundProcessor

extension Bindings {


	/// `BackgroundProcessor` takes care of tasks that (1) need to happen periodically to keep
	/// Rust-Lightning running properly, and (2) either can or should be run in the background. Its
	/// responsibilities are:
	/// * Processing [`Event`]s with a user-provided [`EventHandler`].
	/// * Monitoring whether the [`ChannelManager`] needs to be re-persisted to disk, and if so,
	/// writing it to disk/backups by invoking the callback given to it at startup.
	/// [`ChannelManager`] persistence should be done in the background.
	/// * Calling [`ChannelManager::timer_tick_occurred`], [`ChainMonitor::rebroadcast_pending_claims`]
	/// and [`PeerManager::timer_tick_occurred`] at the appropriate intervals.
	/// * Calling [`NetworkGraph::remove_stale_channels_and_tracking`] (if a [`GossipSync`] with a
	/// [`NetworkGraph`] is provided to [`BackgroundProcessor::start`]).
	///
	/// It will also call [`PeerManager::process_events`] periodically though this shouldn't be relied
	/// upon as doing so may result in high latency.
	///
	/// # Note
	///
	/// If [`ChannelManager`] persistence fails and the persisted manager becomes out-of-date, then
	/// there is a risk of channels force-closing on startup when the manager realizes it's outdated.
	/// However, as long as [`ChannelMonitor`] backups are sound, no funds besides those used for
	/// unilateral chain closure fees are at risk.
	///
	/// [`ChannelMonitor`]: lightning::chain::channelmonitor::ChannelMonitor
	/// [`Event`]: lightning::events::Event
	/// [`PeerManager::timer_tick_occurred`]: lightning::ln::peer_handler::PeerManager::timer_tick_occurred
	/// [`PeerManager::process_events`]: lightning::ln::peer_handler::PeerManager::process_events
	/// BackgroundProcessor will immediately stop on drop. It should be stored until shutdown.
	public class BackgroundProcessor: NativeTypeWrapper {

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

		internal var cType: LDKBackgroundProcessor?

		internal init(cType: LDKBackgroundProcessor, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKBackgroundProcessor, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKBackgroundProcessor, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the BackgroundProcessor, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = BackgroundProcessor_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Start a background thread that takes care of responsibilities enumerated in the [top-level
		/// documentation].
		///
		/// The thread runs indefinitely unless the object is dropped, [`stop`] is called, or
		/// [`Persister::persist_manager`] returns an error. In case of an error, the error is retrieved by calling
		/// either [`join`] or [`stop`].
		///
		/// # Data Persistence
		///
		/// [`Persister::persist_manager`] is responsible for writing out the [`ChannelManager`] to disk, and/or
		/// uploading to one or more backup services. See [`ChannelManager::write`] for writing out a
		/// [`ChannelManager`]. See the `lightning-persister` crate for LDK's
		/// provided implementation.
		///
		/// [`Persister::persist_graph`] is responsible for writing out the [`NetworkGraph`] to disk, if
		/// [`GossipSync`] is supplied. See [`NetworkGraph::write`] for writing out a [`NetworkGraph`].
		/// See the `lightning-persister` crate for LDK's provided implementation.
		///
		/// Typically, users should either implement [`Persister::persist_manager`] to never return an
		/// error or call [`join`] and handle any error that may arise. For the latter case,
		/// `BackgroundProcessor` must be restarted by calling `start` again after handling the error.
		///
		/// # Event Handling
		///
		/// `event_handler` is responsible for handling events that users should be notified of (e.g.,
		/// payment failed). [`BackgroundProcessor`] may decorate the given [`EventHandler`] with common
		/// functionality implemented by other handlers.
		/// * [`P2PGossipSync`] if given will update the [`NetworkGraph`] based on payment failures.
		///
		/// # Rapid Gossip Sync
		///
		/// If rapid gossip sync is meant to run at startup, pass [`RapidGossipSync`] via `gossip_sync`
		/// to indicate that the [`BackgroundProcessor`] should not prune the [`NetworkGraph`] instance
		/// until the [`RapidGossipSync`] instance completes its first sync.
		///
		/// [top-level documentation]: BackgroundProcessor
		/// [`join`]: Self::join
		/// [`stop`]: Self::stop
		/// [`ChannelManager`]: lightning::ln::channelmanager::ChannelManager
		/// [`ChannelManager::write`]: lightning::ln::channelmanager::ChannelManager#impl-Writeable
		/// [`Persister::persist_manager`]: lightning::util::persist::Persister::persist_manager
		/// [`Persister::persist_graph`]: lightning::util::persist::Persister::persist_graph
		/// [`NetworkGraph`]: lightning::routing::gossip::NetworkGraph
		/// [`NetworkGraph::write`]: lightning::routing::gossip::NetworkGraph#impl-Writeable
		@available(
			*, deprecated,
			message: "This method passes the following non-cloneable, but freeable objects by value: `gossipSync`."
		)
		public class func start(
			persister: Persister, eventHandler: EventHandler, chainMonitor: ChainMonitor,
			channelManager: ChannelManager, gossipSync: GossipSync, peerManager: PeerManager, logger: Logger,
			scorer: WriteableScore?
		) -> BackgroundProcessor {
			// native call variable prep

			let scorerOption = Option_WriteableScoreZ(
				some: scorer, instantiationContext: "BackgroundProcessor.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: chainMonitor.cType!) { (chainMonitorPointer: UnsafePointer<LDKChainMonitor>) in

					withUnsafePointer(to: channelManager.cType!) {
						(channelManagerPointer: UnsafePointer<LDKChannelManager>) in

						withUnsafePointer(to: peerManager.cType!) {
							(peerManagerPointer: UnsafePointer<LDKPeerManager>) in
							BackgroundProcessor_start(
								persister.activate().cType!, eventHandler.activate().cType!, chainMonitorPointer,
								channelManagerPointer, gossipSync.dangle().cType!, peerManagerPointer,
								logger.activate().cType!, scorerOption.cType!)
						}

					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = BackgroundProcessor(
				cType: nativeCallResult, instantiationContext: "BackgroundProcessor.swift::\(#function):\(#line)")


			try! returnValue.addAnchor(anchor: chainMonitor)
			try! returnValue.addAnchor(anchor: channelManager)
			try! returnValue.addAnchor(anchor: peerManager)
			return returnValue
		}

		/// Join `BackgroundProcessor`'s thread, returning any error that occurred while persisting
		/// [`ChannelManager`].
		///
		/// # Panics
		///
		/// This function panics if the background thread has panicked such as while persisting or
		/// handling events.
		///
		/// [`ChannelManager`]: lightning::ln::channelmanager::ChannelManager
		@available(
			*, deprecated,
			message: "This method passes the following non-cloneable, but freeable objects by value: self."
		)
		public func join() -> Result_NoneIOErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult = BackgroundProcessor_join(self.dangle().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_NoneIOErrorZ(
				cType: nativeCallResult, instantiationContext: "BackgroundProcessor.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Stop `BackgroundProcessor`'s thread, returning any error that occurred while persisting
		/// [`ChannelManager`].
		///
		/// # Panics
		///
		/// This function panics if the background thread has panicked such as while persisting or
		/// handling events.
		///
		/// [`ChannelManager`]: lightning::ln::channelmanager::ChannelManager
		@available(
			*, deprecated,
			message: "This method passes the following non-cloneable, but freeable objects by value: self."
		)
		public func stop() -> Result_NoneIOErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult = BackgroundProcessor_stop(self.dangle().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_NoneIOErrorZ(
				cType: nativeCallResult, instantiationContext: "BackgroundProcessor.swift::\(#function):\(#line)")


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


		internal func setCFreeability(freeable: Bool) -> BackgroundProcessor {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> BackgroundProcessor {
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
						"Freeing BackgroundProcessor \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing BackgroundProcessor \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

