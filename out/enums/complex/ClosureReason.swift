import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


///
public typealias ClosureReason = Bindings.ClosureReason

extension Bindings {

	/// The reason the channel was closed. See individual variants for more details.
	public class ClosureReason: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKClosureReason?

		internal init(cType: LDKClosureReason, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKClosureReason, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKClosureReason, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		public enum ClosureReasonType {

			/// Closure generated from receiving a peer error message.
			///
			/// Our counterparty may have broadcasted their latest commitment state, and we have
			/// as well.
			case CounterpartyForceClosed

			/// Closure generated from [`ChannelManager::force_close_channel`], called by the user.
			///
			/// [`ChannelManager::force_close_channel`]: crate::ln::channelmanager::ChannelManager::force_close_channel.
			case HolderForceClosed

			/// The channel was closed after negotiating a cooperative close and we've now broadcasted
			/// the cooperative close transaction. Note the shutdown may have been initiated by us.
			///
			/// This was only set in versions of LDK prior to 0.0.122.
			case LegacyCooperativeClosure

			/// The channel was closed after negotiating a cooperative close and we've now broadcasted
			/// the cooperative close transaction. This indicates that the shutdown was initiated by our
			/// counterparty.
			///
			/// In rare cases where we initiated closure immediately prior to shutting down without
			/// persisting, this value may be provided for channels we initiated closure for.
			case CounterpartyInitiatedCooperativeClosure

			/// The channel was closed after negotiating a cooperative close and we've now broadcasted
			/// the cooperative close transaction. This indicates that the shutdown was initiated by us.
			case LocallyInitiatedCooperativeClosure

			/// A commitment transaction was confirmed on chain, closing the channel. Most likely this
			/// commitment transaction came from our counterparty, but it may also have come from
			/// a copy of our own `ChannelMonitor`.
			case CommitmentTxConfirmed

			/// The funding transaction failed to confirm in a timely manner on an inbound channel.
			case FundingTimedOut

			/// Closure generated from processing an event, likely a HTLC forward/relay/reception.
			case ProcessingError

			/// The peer disconnected prior to funding completing. In this case the spec mandates that we
			/// forget the channel entirely - we can attempt again if the peer reconnects.
			///
			/// This includes cases where we restarted prior to funding completion, including prior to the
			/// initial [`ChannelMonitor`] persistence completing.
			///
			/// In LDK versions prior to 0.0.107 this could also occur if we were unable to connect to the
			/// peer because of mutual incompatibility between us and our channel counterparty.
			///
			/// [`ChannelMonitor`]: crate::chain::channelmonitor::ChannelMonitor
			case DisconnectedPeer

			/// Closure generated from `ChannelManager::read` if the [`ChannelMonitor`] is newer than
			/// the [`ChannelManager`] deserialized.
			///
			/// [`ChannelMonitor`]: crate::chain::channelmonitor::ChannelMonitor
			/// [`ChannelManager`]: crate::ln::channelmanager::ChannelManager
			case OutdatedChannelManager

			/// The counterparty requested a cooperative close of a channel that had not been funded yet.
			/// The channel has been immediately closed.
			case CounterpartyCoopClosedUnfundedChannel

			/// Another channel in the same funding batch closed before the funding transaction
			/// was ready to be broadcast.
			case FundingBatchClosure

			/// One of our HTLCs timed out in a channel, causing us to force close the channel.
			case HTLCsTimedOut

			/// Our peer provided a feerate which violated our required minimum (fetched from our
			/// [`FeeEstimator`] either as [`ConfirmationTarget::MinAllowedAnchorChannelRemoteFee`] or
			/// [`ConfirmationTarget::MinAllowedNonAnchorChannelRemoteFee`]).
			///
			/// [`FeeEstimator`]: crate::chain::chaininterface::FeeEstimator
			/// [`ConfirmationTarget::MinAllowedAnchorChannelRemoteFee`]: crate::chain::chaininterface::ConfirmationTarget::MinAllowedAnchorChannelRemoteFee
			/// [`ConfirmationTarget::MinAllowedNonAnchorChannelRemoteFee`]: crate::chain::chaininterface::ConfirmationTarget::MinAllowedNonAnchorChannelRemoteFee
			case PeerFeerateTooLow

		}

		public func getValueType() -> ClosureReasonType {
			switch self.cType!.tag {
				case LDKClosureReason_CounterpartyForceClosed:
					return .CounterpartyForceClosed

				case LDKClosureReason_HolderForceClosed:
					return .HolderForceClosed

				case LDKClosureReason_LegacyCooperativeClosure:
					return .LegacyCooperativeClosure

				case LDKClosureReason_CounterpartyInitiatedCooperativeClosure:
					return .CounterpartyInitiatedCooperativeClosure

				case LDKClosureReason_LocallyInitiatedCooperativeClosure:
					return .LocallyInitiatedCooperativeClosure

				case LDKClosureReason_CommitmentTxConfirmed:
					return .CommitmentTxConfirmed

				case LDKClosureReason_FundingTimedOut:
					return .FundingTimedOut

				case LDKClosureReason_ProcessingError:
					return .ProcessingError

				case LDKClosureReason_DisconnectedPeer:
					return .DisconnectedPeer

				case LDKClosureReason_OutdatedChannelManager:
					return .OutdatedChannelManager

				case LDKClosureReason_CounterpartyCoopClosedUnfundedChannel:
					return .CounterpartyCoopClosedUnfundedChannel

				case LDKClosureReason_FundingBatchClosure:
					return .FundingBatchClosure

				case LDKClosureReason_HTLCsTimedOut:
					return .HTLCsTimedOut

				case LDKClosureReason_PeerFeerateTooLow:
					return .PeerFeerateTooLow

				default:
					Bindings.print("Error: Invalid value type for ClosureReason! Aborting.", severity: .ERROR)
					abort()
			}

		}


		/// Frees any resources used by the ClosureReason
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = ClosureReason_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the ClosureReason
		internal func clone() -> ClosureReason {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKClosureReason>) in
					ClosureReason_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ClosureReason(
				cType: nativeCallResult, instantiationContext: "ClosureReason.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new CounterpartyForceClosed-variant ClosureReason
		public class func initWithCounterpartyForceClosed(peerMsg: Bindings.UntrustedString) -> ClosureReason {
			// native call variable prep


			// native method call
			let nativeCallResult = ClosureReason_counterparty_force_closed(peerMsg.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = ClosureReason(
				cType: nativeCallResult, instantiationContext: "ClosureReason.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new HolderForceClosed-variant ClosureReason
		public class func initWithHolderForceClosed(broadcastedLatestTxn: Bool?) -> ClosureReason {
			// native call variable prep

			let broadcastedLatestTxnOption = Option_boolZ(
				some: broadcastedLatestTxn, instantiationContext: "ClosureReason.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult = ClosureReason_holder_force_closed(broadcastedLatestTxnOption.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = ClosureReason(
				cType: nativeCallResult, instantiationContext: "ClosureReason.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new LegacyCooperativeClosure-variant ClosureReason
		public class func initWithLegacyCooperativeClosure() -> ClosureReason {
			// native call variable prep


			// native method call
			let nativeCallResult = ClosureReason_legacy_cooperative_closure()

			// cleanup


			// return value (do some wrapping)
			let returnValue = ClosureReason(
				cType: nativeCallResult, instantiationContext: "ClosureReason.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new CounterpartyInitiatedCooperativeClosure-variant ClosureReason
		public class func initWithCounterpartyInitiatedCooperativeClosure() -> ClosureReason {
			// native call variable prep


			// native method call
			let nativeCallResult = ClosureReason_counterparty_initiated_cooperative_closure()

			// cleanup


			// return value (do some wrapping)
			let returnValue = ClosureReason(
				cType: nativeCallResult, instantiationContext: "ClosureReason.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new LocallyInitiatedCooperativeClosure-variant ClosureReason
		public class func initWithLocallyInitiatedCooperativeClosure() -> ClosureReason {
			// native call variable prep


			// native method call
			let nativeCallResult = ClosureReason_locally_initiated_cooperative_closure()

			// cleanup


			// return value (do some wrapping)
			let returnValue = ClosureReason(
				cType: nativeCallResult, instantiationContext: "ClosureReason.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new CommitmentTxConfirmed-variant ClosureReason
		public class func initWithCommitmentTxConfirmed() -> ClosureReason {
			// native call variable prep


			// native method call
			let nativeCallResult = ClosureReason_commitment_tx_confirmed()

			// cleanup


			// return value (do some wrapping)
			let returnValue = ClosureReason(
				cType: nativeCallResult, instantiationContext: "ClosureReason.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new FundingTimedOut-variant ClosureReason
		public class func initWithFundingTimedOut() -> ClosureReason {
			// native call variable prep


			// native method call
			let nativeCallResult = ClosureReason_funding_timed_out()

			// cleanup


			// return value (do some wrapping)
			let returnValue = ClosureReason(
				cType: nativeCallResult, instantiationContext: "ClosureReason.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new ProcessingError-variant ClosureReason
		public class func initWithProcessingError(err: String) -> ClosureReason {
			// native call variable prep

			let errPrimitiveWrapper = Str(
				value: err, instantiationContext: "ClosureReason.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = ClosureReason_processing_error(errPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			errPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = ClosureReason(
				cType: nativeCallResult, instantiationContext: "ClosureReason.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new DisconnectedPeer-variant ClosureReason
		public class func initWithDisconnectedPeer() -> ClosureReason {
			// native call variable prep


			// native method call
			let nativeCallResult = ClosureReason_disconnected_peer()

			// cleanup


			// return value (do some wrapping)
			let returnValue = ClosureReason(
				cType: nativeCallResult, instantiationContext: "ClosureReason.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new OutdatedChannelManager-variant ClosureReason
		public class func initWithOutdatedChannelManager() -> ClosureReason {
			// native call variable prep


			// native method call
			let nativeCallResult = ClosureReason_outdated_channel_manager()

			// cleanup


			// return value (do some wrapping)
			let returnValue = ClosureReason(
				cType: nativeCallResult, instantiationContext: "ClosureReason.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new CounterpartyCoopClosedUnfundedChannel-variant ClosureReason
		public class func initWithCounterpartyCoopClosedUnfundedChannel() -> ClosureReason {
			// native call variable prep


			// native method call
			let nativeCallResult = ClosureReason_counterparty_coop_closed_unfunded_channel()

			// cleanup


			// return value (do some wrapping)
			let returnValue = ClosureReason(
				cType: nativeCallResult, instantiationContext: "ClosureReason.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new FundingBatchClosure-variant ClosureReason
		public class func initWithFundingBatchClosure() -> ClosureReason {
			// native call variable prep


			// native method call
			let nativeCallResult = ClosureReason_funding_batch_closure()

			// cleanup


			// return value (do some wrapping)
			let returnValue = ClosureReason(
				cType: nativeCallResult, instantiationContext: "ClosureReason.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new HTLCsTimedOut-variant ClosureReason
		public class func initWithHtlcsTimedOut() -> ClosureReason {
			// native call variable prep


			// native method call
			let nativeCallResult = ClosureReason_htlcs_timed_out()

			// cleanup


			// return value (do some wrapping)
			let returnValue = ClosureReason(
				cType: nativeCallResult, instantiationContext: "ClosureReason.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new PeerFeerateTooLow-variant ClosureReason
		public class func initWithPeerFeerateTooLow(peerFeerateSatPerKw: UInt32, requiredFeerateSatPerKw: UInt32)
			-> ClosureReason
		{
			// native call variable prep


			// native method call
			let nativeCallResult = ClosureReason_peer_feerate_too_low(peerFeerateSatPerKw, requiredFeerateSatPerKw)

			// cleanup


			// return value (do some wrapping)
			let returnValue = ClosureReason(
				cType: nativeCallResult, instantiationContext: "ClosureReason.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Checks if two ClosureReasons contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		public class func eq(a: ClosureReason, b: ClosureReason) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKClosureReason>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKClosureReason>) in
						ClosureReason_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Get the string representation of a ClosureReason object
		public func toStr() -> String {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKClosureReason>) in
					ClosureReason_to_str(oPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Str(
				cType: nativeCallResult, instantiationContext: "ClosureReason.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Serialize the ClosureReason object into a byte array which can be read by ClosureReason_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKClosureReason>) in
					ClosureReason_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "ClosureReason.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a ClosureReason from a byte array, created by ClosureReason_write
		public class func read(ser: [UInt8]) -> Result_COption_ClosureReasonZDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "ClosureReason.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = ClosureReason_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_COption_ClosureReasonZDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "ClosureReason.swift::\(#function):\(#line)")


			return returnValue
		}


		public func getValueAsCounterpartyForceClosed() -> CounterpartyForceClosed? {
			if self.cType?.tag != LDKClosureReason_CounterpartyForceClosed {
				return nil
			}

			return ClosureReason_LDKCounterpartyForceClosed_Body(
				cType: self.cType!.counterparty_force_closed,
				instantiationContext: "ClosureReason.swift::\(#function):\(#line)", anchor: self)
		}

		public func getValueAsHolderForceClosed() -> HolderForceClosed? {
			if self.cType?.tag != LDKClosureReason_HolderForceClosed {
				return nil
			}

			return ClosureReason_LDKHolderForceClosed_Body(
				cType: self.cType!.holder_force_closed,
				instantiationContext: "ClosureReason.swift::\(#function):\(#line)", anchor: self)
		}

		public func getValueAsProcessingError() -> ProcessingError? {
			if self.cType?.tag != LDKClosureReason_ProcessingError {
				return nil
			}

			return ClosureReason_LDKProcessingError_Body(
				cType: self.cType!.processing_error, instantiationContext: "ClosureReason.swift::\(#function):\(#line)",
				anchor: self)
		}

		public func getValueAsPeerFeerateTooLow() -> PeerFeerateTooLow? {
			if self.cType?.tag != LDKClosureReason_PeerFeerateTooLow {
				return nil
			}

			return ClosureReason_LDKPeerFeerateTooLow_Body(
				cType: self.cType!.peer_feerate_too_low,
				instantiationContext: "ClosureReason.swift::\(#function):\(#line)", anchor: self)
		}


		internal func danglingClone() -> ClosureReason {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print(
						"Freeing ClosureReason \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing ClosureReason \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


		///
		internal typealias ClosureReason_LDKCounterpartyForceClosed_Body = CounterpartyForceClosed


		///
		public class CounterpartyForceClosed: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKClosureReason_LDKCounterpartyForceClosed_Body?

			internal init(cType: LDKClosureReason_LDKCounterpartyForceClosed_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKClosureReason_LDKCounterpartyForceClosed_Body, instantiationContext: String,
				anchor: NativeTypeWrapper
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKClosureReason_LDKCounterpartyForceClosed_Body, instantiationContext: String,
				anchor: NativeTypeWrapper, dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// The error which the peer sent us.
			///
			/// Be careful about printing the peer_msg, a well-crafted message could exploit
			/// a security vulnerability in the terminal emulator or the logging subsystem.
			/// To be safe, use `Display` on `UntrustedString`
			///
			/// [`UntrustedString`]: crate::util::string::UntrustedString
			public func getPeerMsg() -> Bindings.UntrustedString {
				// return value (do some wrapping)
				let returnValue = Bindings.UntrustedString(
					cType: self.cType!.peer_msg, instantiationContext: "ClosureReason.swift::\(#function):\(#line)",
					anchor: self)

				return returnValue
			}


		}


		///
		internal typealias ClosureReason_LDKHolderForceClosed_Body = HolderForceClosed


		///
		public class HolderForceClosed: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKClosureReason_LDKHolderForceClosed_Body?

			internal init(cType: LDKClosureReason_LDKHolderForceClosed_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKClosureReason_LDKHolderForceClosed_Body, instantiationContext: String,
				anchor: NativeTypeWrapper
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKClosureReason_LDKHolderForceClosed_Body, instantiationContext: String,
				anchor: NativeTypeWrapper, dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// Whether or not the latest transaction was broadcasted when the channel was force
			/// closed.
			///
			/// Channels closed using [`ChannelManager::force_close_broadcasting_latest_txn`] will have
			/// this field set to true, whereas channels closed using [`ChannelManager::force_close_without_broadcasting_txn`]
			/// or force-closed prior to being funded will have this field set to false.
			///
			/// This will be `None` for objects generated or written by LDK 0.0.123 and
			/// earlier.
			///
			/// [`ChannelManager::force_close_broadcasting_latest_txn`]: crate::ln::channelmanager::ChannelManager::force_close_broadcasting_latest_txn.
			/// [`ChannelManager::force_close_without_broadcasting_txn`]: crate::ln::channelmanager::ChannelManager::force_close_without_broadcasting_txn.
			public func getBroadcastedLatestTxn() -> Bool? {
				// return value (do some wrapping)
				let returnValue = Option_boolZ(
					cType: self.cType!.broadcasted_latest_txn,
					instantiationContext: "ClosureReason.swift::\(#function):\(#line)", anchor: self
				)
				.getValue()

				return returnValue
			}


		}


		///
		internal typealias ClosureReason_LDKProcessingError_Body = ProcessingError


		///
		public class ProcessingError: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKClosureReason_LDKProcessingError_Body?

			internal init(cType: LDKClosureReason_LDKProcessingError_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKClosureReason_LDKProcessingError_Body, instantiationContext: String, anchor: NativeTypeWrapper
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKClosureReason_LDKProcessingError_Body, instantiationContext: String,
				anchor: NativeTypeWrapper, dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// A developer-readable error message which we generated.
			public func getErr() -> String {
				// return value (do some wrapping)
				let returnValue = Str(
					cType: self.cType!.err, instantiationContext: "ClosureReason.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}


		}


		///
		internal typealias ClosureReason_LDKPeerFeerateTooLow_Body = PeerFeerateTooLow


		///
		public class PeerFeerateTooLow: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKClosureReason_LDKPeerFeerateTooLow_Body?

			internal init(cType: LDKClosureReason_LDKPeerFeerateTooLow_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKClosureReason_LDKPeerFeerateTooLow_Body, instantiationContext: String,
				anchor: NativeTypeWrapper
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKClosureReason_LDKPeerFeerateTooLow_Body, instantiationContext: String,
				anchor: NativeTypeWrapper, dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// The feerate on our channel set by our peer.
			public func getPeerFeerateSatPerKw() -> UInt32 {
				// return value (do some wrapping)
				let returnValue = self.cType!.peer_feerate_sat_per_kw

				return returnValue
			}

			/// The required feerate we enforce, from our [`FeeEstimator`].
			///
			/// [`FeeEstimator`]: crate::chain::chaininterface::FeeEstimator
			public func getRequiredFeerateSatPerKw() -> UInt32 {
				// return value (do some wrapping)
				let returnValue = self.cType!.required_feerate_sat_per_kw

				return returnValue
			}


		}


	}

}
