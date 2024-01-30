#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// Implements [`Persist`] in a way that writes and reads both [`ChannelMonitor`]s and
/// [`ChannelMonitorUpdate`]s.
///
/// # Overview
///
/// The main benefit this provides over the [`KVStore`]'s [`Persist`] implementation is decreased
/// I/O bandwidth and storage churn, at the expense of more IOPS (including listing, reading, and
/// deleting) and complexity. This is because it writes channel monitor differential updates,
/// whereas the other (default) implementation rewrites the entire monitor on each update. For
/// routing nodes, updates can happen many times per second to a channel, and monitors can be tens
/// of megabytes (or more). Updates can be as small as a few hundred bytes.
///
/// Note that monitors written with `MonitorUpdatingPersister` are _not_ backward-compatible with
/// the default [`KVStore`]'s [`Persist`] implementation. They have a prepended byte sequence,
/// [`MONITOR_UPDATING_PERSISTER_PREPEND_SENTINEL`], applied to prevent deserialization with other
/// persisters. This is because monitors written by this struct _may_ have unapplied updates. In
/// order to downgrade, you must ensure that all updates are applied to the monitor, and remove the
/// sentinel bytes.
///
/// # Storing monitors
///
/// Monitors are stored by implementing the [`Persist`] trait, which has two functions:
///
/// - [`Persist::persist_new_channel`], which persists whole [`ChannelMonitor`]s.
/// - [`Persist::update_persisted_channel`], which persists only a [`ChannelMonitorUpdate`]
///
/// Whole [`ChannelMonitor`]s are stored in the [`CHANNEL_MONITOR_PERSISTENCE_PRIMARY_NAMESPACE`],
/// using the familiar encoding of an [`OutPoint`] (for example, `[SOME-64-CHAR-HEX-STRING]_1`).
///
/// Each [`ChannelMonitorUpdate`] is stored in a dynamic secondary namespace, as follows:
///
/// - primary namespace: [`CHANNEL_MONITOR_UPDATE_PERSISTENCE_PRIMARY_NAMESPACE`]
/// - secondary namespace: [the monitor's encoded outpoint name]
///
/// Under that secondary namespace, each update is stored with a number string, like `21`, which
/// represents its `update_id` value.
///
/// For example, consider this channel, named for its transaction ID and index, or [`OutPoint`]:
///
/// - Transaction ID: `deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef`
/// - Index: `1`
///
/// Full channel monitors would be stored at a single key:
///
/// `[CHANNEL_MONITOR_PERSISTENCE_PRIMARY_NAMESPACE]/deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef_1`
///
/// Updates would be stored as follows (with `/` delimiting primary_namespace/secondary_namespace/key):
///
/// ```text
/// [CHANNEL_MONITOR_UPDATE_PERSISTENCE_PRIMARY_NAMESPACE]/deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef_1/1
/// [CHANNEL_MONITOR_UPDATE_PERSISTENCE_PRIMARY_NAMESPACE]/deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef_1/2
/// [CHANNEL_MONITOR_UPDATE_PERSISTENCE_PRIMARY_NAMESPACE]/deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef_1/3
/// ```
/// ... and so on.
///
/// # Reading channel state from storage
///
/// Channel state can be reconstructed by calling
/// [`MonitorUpdatingPersister::read_all_channel_monitors_with_updates`]. Alternatively, users can
/// list channel monitors themselves and load channels individually using
/// [`MonitorUpdatingPersister::read_channel_monitor_with_updates`].
///
/// ## EXTREMELY IMPORTANT
///
/// It is extremely important that your [`KVStore::read`] implementation uses the
/// [`io::ErrorKind::NotFound`] variant correctly: that is, when a file is not found, and _only_ in
/// that circumstance (not when there is really a permissions error, for example). This is because
/// neither channel monitor reading function lists updates. Instead, either reads the monitor, and
/// using its stored `update_id`, synthesizes update storage keys, and tries them in sequence until
/// one is not found. All _other_ errors will be bubbled up in the function's [`Result`].
///
/// # Pruning stale channel updates
///
/// Stale updates are pruned when the consolidation threshold is reached according to `maximum_pending_updates`.
/// Monitor updates in the range between the latest `update_id` and `update_id - maximum_pending_updates`
/// are deleted.
/// The `lazy` flag is used on the [`KVStore::remove`] method, so there are no guarantees that the deletions
/// will complete. However, stale updates are not a problem for data integrity, since updates are
/// only read that are higher than the stored [`ChannelMonitor`]'s `update_id`.
///
/// If you have many stale updates stored (such as after a crash with pending lazy deletes), and
/// would like to get rid of them, consider using the
/// [`MonitorUpdatingPersister::cleanup_stale_updates`] function.
public typealias MonitorUpdatingPersister = Bindings.MonitorUpdatingPersister

extension Bindings {


	/// Implements [`Persist`] in a way that writes and reads both [`ChannelMonitor`]s and
	/// [`ChannelMonitorUpdate`]s.
	///
	/// # Overview
	///
	/// The main benefit this provides over the [`KVStore`]'s [`Persist`] implementation is decreased
	/// I/O bandwidth and storage churn, at the expense of more IOPS (including listing, reading, and
	/// deleting) and complexity. This is because it writes channel monitor differential updates,
	/// whereas the other (default) implementation rewrites the entire monitor on each update. For
	/// routing nodes, updates can happen many times per second to a channel, and monitors can be tens
	/// of megabytes (or more). Updates can be as small as a few hundred bytes.
	///
	/// Note that monitors written with `MonitorUpdatingPersister` are _not_ backward-compatible with
	/// the default [`KVStore`]'s [`Persist`] implementation. They have a prepended byte sequence,
	/// [`MONITOR_UPDATING_PERSISTER_PREPEND_SENTINEL`], applied to prevent deserialization with other
	/// persisters. This is because monitors written by this struct _may_ have unapplied updates. In
	/// order to downgrade, you must ensure that all updates are applied to the monitor, and remove the
	/// sentinel bytes.
	///
	/// # Storing monitors
	///
	/// Monitors are stored by implementing the [`Persist`] trait, which has two functions:
	///
	/// - [`Persist::persist_new_channel`], which persists whole [`ChannelMonitor`]s.
	/// - [`Persist::update_persisted_channel`], which persists only a [`ChannelMonitorUpdate`]
	///
	/// Whole [`ChannelMonitor`]s are stored in the [`CHANNEL_MONITOR_PERSISTENCE_PRIMARY_NAMESPACE`],
	/// using the familiar encoding of an [`OutPoint`] (for example, `[SOME-64-CHAR-HEX-STRING]_1`).
	///
	/// Each [`ChannelMonitorUpdate`] is stored in a dynamic secondary namespace, as follows:
	///
	/// - primary namespace: [`CHANNEL_MONITOR_UPDATE_PERSISTENCE_PRIMARY_NAMESPACE`]
	/// - secondary namespace: [the monitor's encoded outpoint name]
	///
	/// Under that secondary namespace, each update is stored with a number string, like `21`, which
	/// represents its `update_id` value.
	///
	/// For example, consider this channel, named for its transaction ID and index, or [`OutPoint`]:
	///
	/// - Transaction ID: `deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef`
	/// - Index: `1`
	///
	/// Full channel monitors would be stored at a single key:
	///
	/// `[CHANNEL_MONITOR_PERSISTENCE_PRIMARY_NAMESPACE]/deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef_1`
	///
	/// Updates would be stored as follows (with `/` delimiting primary_namespace/secondary_namespace/key):
	///
	/// ```text
	/// [CHANNEL_MONITOR_UPDATE_PERSISTENCE_PRIMARY_NAMESPACE]/deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef_1/1
	/// [CHANNEL_MONITOR_UPDATE_PERSISTENCE_PRIMARY_NAMESPACE]/deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef_1/2
	/// [CHANNEL_MONITOR_UPDATE_PERSISTENCE_PRIMARY_NAMESPACE]/deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef_1/3
	/// ```
	/// ... and so on.
	///
	/// # Reading channel state from storage
	///
	/// Channel state can be reconstructed by calling
	/// [`MonitorUpdatingPersister::read_all_channel_monitors_with_updates`]. Alternatively, users can
	/// list channel monitors themselves and load channels individually using
	/// [`MonitorUpdatingPersister::read_channel_monitor_with_updates`].
	///
	/// ## EXTREMELY IMPORTANT
	///
	/// It is extremely important that your [`KVStore::read`] implementation uses the
	/// [`io::ErrorKind::NotFound`] variant correctly: that is, when a file is not found, and _only_ in
	/// that circumstance (not when there is really a permissions error, for example). This is because
	/// neither channel monitor reading function lists updates. Instead, either reads the monitor, and
	/// using its stored `update_id`, synthesizes update storage keys, and tries them in sequence until
	/// one is not found. All _other_ errors will be bubbled up in the function's [`Result`].
	///
	/// # Pruning stale channel updates
	///
	/// Stale updates are pruned when the consolidation threshold is reached according to `maximum_pending_updates`.
	/// Monitor updates in the range between the latest `update_id` and `update_id - maximum_pending_updates`
	/// are deleted.
	/// The `lazy` flag is used on the [`KVStore::remove`] method, so there are no guarantees that the deletions
	/// will complete. However, stale updates are not a problem for data integrity, since updates are
	/// only read that are higher than the stored [`ChannelMonitor`]'s `update_id`.
	///
	/// If you have many stale updates stored (such as after a crash with pending lazy deletes), and
	/// would like to get rid of them, consider using the
	/// [`MonitorUpdatingPersister::cleanup_stale_updates`] function.
	public class MonitorUpdatingPersister: NativeTypeWrapper {

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

		internal var cType: LDKMonitorUpdatingPersister?

		internal init(cType: LDKMonitorUpdatingPersister, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKMonitorUpdatingPersister, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKMonitorUpdatingPersister, instantiationContext: String, anchor: NativeTypeWrapper,
			dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the MonitorUpdatingPersister, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = MonitorUpdatingPersister_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new [`MonitorUpdatingPersister`].
		///
		/// The `maximum_pending_updates` parameter controls how many updates may be stored before a
		/// [`MonitorUpdatingPersister`] consolidates updates by writing a full monitor. Note that
		/// consolidation will frequently occur with fewer updates than what you set here; this number
		/// is merely the maximum that may be stored. When setting this value, consider that for higher
		/// values of `maximum_pending_updates`:
		///
		/// - [`MonitorUpdatingPersister`] will tend to write more [`ChannelMonitorUpdate`]s than
		/// [`ChannelMonitor`]s, approaching one [`ChannelMonitor`] write for every
		/// `maximum_pending_updates` [`ChannelMonitorUpdate`]s.
		/// - [`MonitorUpdatingPersister`] will issue deletes differently. Lazy deletes will come in
		/// \"waves\" for each [`ChannelMonitor`] write. A larger `maximum_pending_updates` means bigger,
		/// less frequent \"waves.\"
		/// - [`MonitorUpdatingPersister`] will potentially have more listing to do if you need to run
		/// [`MonitorUpdatingPersister::cleanup_stale_updates`].
		public init(
			kvStore: KVStore, logger: Logger, maximumPendingUpdates: UInt64, entropySource: EntropySource,
			signerProvider: SignerProvider
		) {
			// native call variable prep


			// native method call
			let nativeCallResult = MonitorUpdatingPersister_new(
				kvStore.activate().cType!, logger.activate().cType!, maximumPendingUpdates,
				entropySource.activate().cType!, signerProvider.activate().cType!)

			// cleanup

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = MonitorUpdatingPersister(cType: nativeCallResult, instantiationContext: "MonitorUpdatingPersister.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0,
					instantiationContext: "MonitorUpdatingPersister.swift::\(#function):\(#line)")


		}

		/// Reads all stored channel monitors, along with any stored updates for them.
		///
		/// It is extremely important that your [`KVStore::read`] implementation uses the
		/// [`io::ErrorKind::NotFound`] variant correctly. For more information, please see the
		/// documentation for [`MonitorUpdatingPersister`].
		public func readAllChannelMonitorsWithUpdates(broadcaster: BroadcasterInterface, feeEstimator: FeeEstimator)
			-> Result_CVec_C2Tuple_ThirtyTwoBytesChannelMonitorZZIOErrorZ
		{
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKMonitorUpdatingPersister>) in

					withUnsafePointer(to: broadcaster.activate().cType!) {
						(broadcasterPointer: UnsafePointer<LDKBroadcasterInterface>) in

						withUnsafePointer(to: feeEstimator.activate().cType!) {
							(feeEstimatorPointer: UnsafePointer<LDKFeeEstimator>) in
							MonitorUpdatingPersister_read_all_channel_monitors_with_updates(
								thisArgPointer, broadcasterPointer, feeEstimatorPointer)
						}

					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_CVec_C2Tuple_ThirtyTwoBytesChannelMonitorZZIOErrorZ(
				cType: nativeCallResult, instantiationContext: "MonitorUpdatingPersister.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Read a single channel monitor, along with any stored updates for it.
		///
		/// It is extremely important that your [`KVStore::read`] implementation uses the
		/// [`io::ErrorKind::NotFound`] variant correctly. For more information, please see the
		/// documentation for [`MonitorUpdatingPersister`].
		///
		/// For `monitor_key`, channel storage keys be the channel's transaction ID and index, or
		/// [`OutPoint`], with an underscore `_` between them. For example, given:
		///
		/// - Transaction ID: `deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef`
		/// - Index: `1`
		///
		/// The correct `monitor_key` would be:
		/// `deadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeefdeadbeef_1`
		///
		/// Loading a large number of monitors will be faster if done in parallel. You can use this
		/// function to accomplish this. Take care to limit the number of parallel readers.
		public func readChannelMonitorWithUpdates(
			broadcaster: BroadcasterInterface, feeEstimator: FeeEstimator, monitorKey: String
		) -> Result_C2Tuple_ThirtyTwoBytesChannelMonitorZIOErrorZ {
			// native call variable prep

			let monitorKeyPrimitiveWrapper = Str(
				value: monitorKey, instantiationContext: "MonitorUpdatingPersister.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKMonitorUpdatingPersister>) in

					withUnsafePointer(to: broadcaster.activate().cType!) {
						(broadcasterPointer: UnsafePointer<LDKBroadcasterInterface>) in

						withUnsafePointer(to: feeEstimator.activate().cType!) {
							(feeEstimatorPointer: UnsafePointer<LDKFeeEstimator>) in
							MonitorUpdatingPersister_read_channel_monitor_with_updates(
								thisArgPointer, broadcasterPointer, feeEstimatorPointer,
								monitorKeyPrimitiveWrapper.cType!)
						}

					}

				}


			// cleanup

			// for elided types, we need this
			monitorKeyPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_C2Tuple_ThirtyTwoBytesChannelMonitorZIOErrorZ(
				cType: nativeCallResult, instantiationContext: "MonitorUpdatingPersister.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Cleans up stale updates for all monitors.
		///
		/// This function works by first listing all monitors, and then for each of them, listing all
		/// updates. The updates that have an `update_id` less than or equal to than the stored monitor
		/// are deleted. The deletion can either be lazy or non-lazy based on the `lazy` flag; this will
		/// be passed to [`KVStore::remove`].
		public func cleanupStaleUpdates(lazy: Bool) -> Result_NoneIOErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKMonitorUpdatingPersister>) in
					MonitorUpdatingPersister_cleanup_stale_updates(thisArgPointer, lazy)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_NoneIOErrorZ(
				cType: nativeCallResult, instantiationContext: "MonitorUpdatingPersister.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Constructs a new Persist which calls the relevant methods on this_arg.
		/// This copies the `inner` pointer in this_arg and thus the returned Persist must be freed before this_arg is
		public func asPersist() -> Persist {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKMonitorUpdatingPersister>) in
					MonitorUpdatingPersister_as_Persist(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NativelyImplementedPersist(
				cType: nativeCallResult, instantiationContext: "MonitorUpdatingPersister.swift::\(#function):\(#line)",
				anchor: self)


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


		internal func setCFreeability(freeable: Bool) -> MonitorUpdatingPersister {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> MonitorUpdatingPersister {
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
						"Freeing MonitorUpdatingPersister \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing MonitorUpdatingPersister \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

