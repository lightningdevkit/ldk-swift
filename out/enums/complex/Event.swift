import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


///
public typealias Event = Bindings.Event

extension Bindings {

	/// An Event which you should probably take some action in response to.
	///
	/// Note that while Writeable and Readable are implemented for Event, you probably shouldn't use
	/// them directly as they don't round-trip exactly (for example FundingGenerationReady is never
	/// written as it makes no sense to respond to it after reconnecting to peers).
	public class Event: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKEvent?

		internal init(cType: LDKEvent, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKEvent, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(cType: LDKEvent, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		public enum EventType {

			/// Used to indicate that the client should generate a funding transaction with the given
			/// parameters and then call [`ChannelManager::funding_transaction_generated`].
			/// Generated in [`ChannelManager`] message handling.
			/// Note that *all inputs* in the funding transaction must spend SegWit outputs or your
			/// counterparty can steal your funds!
			///
			/// [`ChannelManager`]: crate::ln::channelmanager::ChannelManager
			/// [`ChannelManager::funding_transaction_generated`]: crate::ln::channelmanager::ChannelManager::funding_transaction_generated
			case FundingGenerationReady

			/// Indicates that we've been offered a payment and it needs to be claimed via calling
			/// [`ChannelManager::claim_funds`] with the preimage given in [`PaymentPurpose`].
			///
			/// Note that if the preimage is not known, you should call
			/// [`ChannelManager::fail_htlc_backwards`] or [`ChannelManager::fail_htlc_backwards_with_reason`]
			/// to free up resources for this HTLC and avoid network congestion.
			/// If you fail to call either [`ChannelManager::claim_funds`], [`ChannelManager::fail_htlc_backwards`],
			/// or [`ChannelManager::fail_htlc_backwards_with_reason`] within the HTLC's timeout, the HTLC will be
			/// automatically failed.
			///
			/// # Note
			/// LDK will not stop an inbound payment from being paid multiple times, so multiple
			/// `PaymentClaimable` events may be generated for the same payment. In such a case it is
			/// polite (and required in the lightning specification) to fail the payment the second time
			/// and give the sender their money back rather than accepting double payment.
			///
			/// # Note
			/// This event used to be called `PaymentReceived` in LDK versions 0.0.112 and earlier.
			///
			/// [`ChannelManager::claim_funds`]: crate::ln::channelmanager::ChannelManager::claim_funds
			/// [`ChannelManager::fail_htlc_backwards`]: crate::ln::channelmanager::ChannelManager::fail_htlc_backwards
			/// [`ChannelManager::fail_htlc_backwards_with_reason`]: crate::ln::channelmanager::ChannelManager::fail_htlc_backwards_with_reason
			case PaymentClaimable

			/// Indicates a payment has been claimed and we've received money!
			///
			/// This most likely occurs when [`ChannelManager::claim_funds`] has been called in response
			/// to an [`Event::PaymentClaimable`]. However, if we previously crashed during a
			/// [`ChannelManager::claim_funds`] call you may see this event without a corresponding
			/// [`Event::PaymentClaimable`] event.
			///
			/// # Note
			/// LDK will not stop an inbound payment from being paid multiple times, so multiple
			/// `PaymentClaimable` events may be generated for the same payment. If you then call
			/// [`ChannelManager::claim_funds`] twice for the same [`Event::PaymentClaimable`] you may get
			/// multiple `PaymentClaimed` events.
			///
			/// [`ChannelManager::claim_funds`]: crate::ln::channelmanager::ChannelManager::claim_funds
			case PaymentClaimed

			/// Indicates an outbound payment we made succeeded (i.e. it made it all the way to its target
			/// and we got back the payment preimage for it).
			///
			/// Note for MPP payments: in rare cases, this event may be preceded by a `PaymentPathFailed`
			/// event. In this situation, you SHOULD treat this payment as having succeeded.
			case PaymentSent

			/// Indicates an outbound payment failed. Individual [`Event::PaymentPathFailed`] events
			/// provide failure information for each path attempt in the payment, including retries.
			///
			/// This event is provided once there are no further pending HTLCs for the payment and the
			/// payment is no longer retryable, due either to the [`Retry`] provided or
			/// [`ChannelManager::abandon_payment`] having been called for the corresponding payment.
			///
			/// [`Retry`]: crate::ln::channelmanager::Retry
			/// [`ChannelManager::abandon_payment`]: crate::ln::channelmanager::ChannelManager::abandon_payment
			case PaymentFailed

			/// Indicates that a path for an outbound payment was successful.
			///
			/// Always generated after [`Event::PaymentSent`] and thus useful for scoring channels. See
			/// [`Event::PaymentSent`] for obtaining the payment preimage.
			case PaymentPathSuccessful

			/// Indicates an outbound HTLC we sent failed, likely due to an intermediary node being unable to
			/// handle the HTLC.
			///
			/// Note that this does *not* indicate that all paths for an MPP payment have failed, see
			/// [`Event::PaymentFailed`].
			///
			/// See [`ChannelManager::abandon_payment`] for giving up on this payment before its retries have
			/// been exhausted.
			///
			/// [`ChannelManager::abandon_payment`]: crate::ln::channelmanager::ChannelManager::abandon_payment
			case PaymentPathFailed

			/// Indicates that a probe payment we sent returned successful, i.e., only failed at the destination.
			case ProbeSuccessful

			/// Indicates that a probe payment we sent failed at an intermediary node on the path.
			case ProbeFailed

			/// Used to indicate that [`ChannelManager::process_pending_htlc_forwards`] should be called at
			/// a time in the future.
			///
			/// [`ChannelManager::process_pending_htlc_forwards`]: crate::ln::channelmanager::ChannelManager::process_pending_htlc_forwards
			case PendingHTLCsForwardable

			/// Used to indicate that we've intercepted an HTLC forward. This event will only be generated if
			/// you've encoded an intercept scid in the receiver's invoice route hints using
			/// [`ChannelManager::get_intercept_scid`] and have set [`UserConfig::accept_intercept_htlcs`].
			///
			/// [`ChannelManager::forward_intercepted_htlc`] or
			/// [`ChannelManager::fail_intercepted_htlc`] MUST be called in response to this event. See
			/// their docs for more information.
			///
			/// [`ChannelManager::get_intercept_scid`]: crate::ln::channelmanager::ChannelManager::get_intercept_scid
			/// [`UserConfig::accept_intercept_htlcs`]: crate::util::config::UserConfig::accept_intercept_htlcs
			/// [`ChannelManager::forward_intercepted_htlc`]: crate::ln::channelmanager::ChannelManager::forward_intercepted_htlc
			/// [`ChannelManager::fail_intercepted_htlc`]: crate::ln::channelmanager::ChannelManager::fail_intercepted_htlc
			case HTLCIntercepted

			/// Used to indicate that an output which you should know how to spend was confirmed on chain
			/// and is now spendable.
			/// Such an output will *not* ever be spent by rust-lightning, and are not at risk of your
			/// counterparty spending them due to some kind of timeout. Thus, you need to store them
			/// somewhere and spend them when you create on-chain transactions.
			case SpendableOutputs

			/// This event is generated when a payment has been successfully forwarded through us and a
			/// forwarding fee earned.
			case PaymentForwarded

			/// Used to indicate that a channel with the given `channel_id` is being opened and pending
			/// confirmation on-chain.
			///
			/// This event is emitted when the funding transaction has been signed and is broadcast to the
			/// network. For 0conf channels it will be immediately followed by the corresponding
			/// [`Event::ChannelReady`] event.
			case ChannelPending

			/// Used to indicate that a channel with the given `channel_id` is ready to
			/// be used. This event is emitted either when the funding transaction has been confirmed
			/// on-chain, or, in case of a 0conf channel, when both parties have confirmed the channel
			/// establishment.
			case ChannelReady

			/// Used to indicate that a previously opened channel with the given `channel_id` is in the
			/// process of closure.
			case ChannelClosed

			/// Used to indicate to the user that they can abandon the funding transaction and recycle the
			/// inputs for another purpose.
			case DiscardFunding

			/// Indicates a request to open a new channel by a peer.
			///
			/// To accept the request, call [`ChannelManager::accept_inbound_channel`]. To reject the
			/// request, call [`ChannelManager::force_close_without_broadcasting_txn`].
			///
			/// The event is only triggered when a new open channel request is received and the
			/// [`UserConfig::manually_accept_inbound_channels`] config flag is set to true.
			///
			/// [`ChannelManager::accept_inbound_channel`]: crate::ln::channelmanager::ChannelManager::accept_inbound_channel
			/// [`ChannelManager::force_close_without_broadcasting_txn`]: crate::ln::channelmanager::ChannelManager::force_close_without_broadcasting_txn
			/// [`UserConfig::manually_accept_inbound_channels`]: crate::util::config::UserConfig::manually_accept_inbound_channels
			case OpenChannelRequest

			/// Indicates that the HTLC was accepted, but could not be processed when or after attempting to
			/// forward it.
			///
			/// Some scenarios where this event may be sent include:
			/// * Insufficient capacity in the outbound channel
			/// * While waiting to forward the HTLC, the channel it is meant to be forwarded through closes
			/// * When an unknown SCID is requested for forwarding a payment.
			/// * Expected MPP amount has already been reached
			/// * The HTLC has timed out
			///
			/// This event, however, does not get generated if an HTLC fails to meet the forwarding
			/// requirements (i.e. insufficient fees paid, or a CLTV that is too soon).
			case HTLCHandlingFailed

			/// Indicates that a transaction originating from LDK needs to have its fee bumped. This event
			/// requires confirmed external funds to be readily available to spend.
			///
			/// LDK does not currently generate this event unless the
			/// [`ChannelHandshakeConfig::negotiate_anchors_zero_fee_htlc_tx`] config flag is set to true.
			/// It is limited to the scope of channels with anchor outputs.
			///
			/// [`ChannelHandshakeConfig::negotiate_anchors_zero_fee_htlc_tx`]: crate::util::config::ChannelHandshakeConfig::negotiate_anchors_zero_fee_htlc_tx
			case BumpTransaction

		}

		public func getValueType() -> EventType {
			switch self.cType!.tag {
				case LDKEvent_FundingGenerationReady:
					return .FundingGenerationReady

				case LDKEvent_PaymentClaimable:
					return .PaymentClaimable

				case LDKEvent_PaymentClaimed:
					return .PaymentClaimed

				case LDKEvent_PaymentSent:
					return .PaymentSent

				case LDKEvent_PaymentFailed:
					return .PaymentFailed

				case LDKEvent_PaymentPathSuccessful:
					return .PaymentPathSuccessful

				case LDKEvent_PaymentPathFailed:
					return .PaymentPathFailed

				case LDKEvent_ProbeSuccessful:
					return .ProbeSuccessful

				case LDKEvent_ProbeFailed:
					return .ProbeFailed

				case LDKEvent_PendingHTLCsForwardable:
					return .PendingHTLCsForwardable

				case LDKEvent_HTLCIntercepted:
					return .HTLCIntercepted

				case LDKEvent_SpendableOutputs:
					return .SpendableOutputs

				case LDKEvent_PaymentForwarded:
					return .PaymentForwarded

				case LDKEvent_ChannelPending:
					return .ChannelPending

				case LDKEvent_ChannelReady:
					return .ChannelReady

				case LDKEvent_ChannelClosed:
					return .ChannelClosed

				case LDKEvent_DiscardFunding:
					return .DiscardFunding

				case LDKEvent_OpenChannelRequest:
					return .OpenChannelRequest

				case LDKEvent_HTLCHandlingFailed:
					return .HTLCHandlingFailed

				case LDKEvent_BumpTransaction:
					return .BumpTransaction

				default:
					Bindings.print("Error: Invalid value type for Event! Aborting.", severity: .ERROR)
					abort()
			}

		}


		/// Frees any resources used by the Event
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = Event_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the Event
		internal func clone() -> Event {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKEvent>) in
					Event_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Event(cType: nativeCallResult, instantiationContext: "Event.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new FundingGenerationReady-variant Event
		public class func initWithFundingGenerationReady(
			temporaryChannelId: [UInt8], counterpartyNodeId: [UInt8], channelValueSatoshis: UInt64,
			outputScript: [UInt8], userChannelId: [UInt8]
		) -> Event {
			// native call variable prep

			let temporaryChannelIdPrimitiveWrapper = ThirtyTwoBytes(
				value: temporaryChannelId, instantiationContext: "Event.swift::\(#function):\(#line)")

			let counterpartyNodeIdPrimitiveWrapper = PublicKey(
				value: counterpartyNodeId, instantiationContext: "Event.swift::\(#function):\(#line)")

			let outputScriptVector = Vec_u8Z(
				array: outputScript, instantiationContext: "Event.swift::\(#function):\(#line)"
			)
			.dangle()

			let userChannelIdPrimitiveWrapper = U128(
				value: userChannelId, instantiationContext: "Event.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = Event_funding_generation_ready(
				temporaryChannelIdPrimitiveWrapper.cType!, counterpartyNodeIdPrimitiveWrapper.cType!,
				channelValueSatoshis, outputScriptVector.cType!, userChannelIdPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			temporaryChannelIdPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			counterpartyNodeIdPrimitiveWrapper.noOpRetain()

			// outputScriptVector.noOpRetain()

			// for elided types, we need this
			userChannelIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Event(cType: nativeCallResult, instantiationContext: "Event.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new PaymentClaimable-variant Event
		public class func initWithPaymentClaimable(
			receiverNodeId: [UInt8], paymentHash: [UInt8], onionFields: Bindings.RecipientOnionFields,
			amountMsat: UInt64, counterpartySkimmedFeeMsat: UInt64, purpose: PaymentPurpose, viaChannelId: [UInt8],
			viaUserChannelId: [UInt8]?, claimDeadline: UInt32?
		) -> Event {
			// native call variable prep

			let receiverNodeIdPrimitiveWrapper = PublicKey(
				value: receiverNodeId, instantiationContext: "Event.swift::\(#function):\(#line)")

			let paymentHashPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentHash, instantiationContext: "Event.swift::\(#function):\(#line)")

			let viaChannelIdPrimitiveWrapper = ThirtyTwoBytes(
				value: viaChannelId, instantiationContext: "Event.swift::\(#function):\(#line)")

			let viaUserChannelIdOption = Option_u128Z(
				some: viaUserChannelId, instantiationContext: "Event.swift::\(#function):\(#line)"
			)
			.danglingClone()

			let claimDeadlineOption = Option_u32Z(
				some: claimDeadline, instantiationContext: "Event.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult = Event_payment_claimable(
				receiverNodeIdPrimitiveWrapper.cType!, paymentHashPrimitiveWrapper.cType!,
				onionFields.dynamicallyDangledClone().cType!, amountMsat, counterpartySkimmedFeeMsat,
				purpose.danglingClone().cType!, viaChannelIdPrimitiveWrapper.cType!, viaUserChannelIdOption.cType!,
				claimDeadlineOption.cType!)

			// cleanup

			// for elided types, we need this
			receiverNodeIdPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			paymentHashPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			viaChannelIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Event(cType: nativeCallResult, instantiationContext: "Event.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new PaymentClaimed-variant Event
		public class func initWithPaymentClaimed(
			receiverNodeId: [UInt8], paymentHash: [UInt8], amountMsat: UInt64, purpose: PaymentPurpose
		) -> Event {
			// native call variable prep

			let receiverNodeIdPrimitiveWrapper = PublicKey(
				value: receiverNodeId, instantiationContext: "Event.swift::\(#function):\(#line)")

			let paymentHashPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentHash, instantiationContext: "Event.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = Event_payment_claimed(
				receiverNodeIdPrimitiveWrapper.cType!, paymentHashPrimitiveWrapper.cType!, amountMsat,
				purpose.danglingClone().cType!)

			// cleanup

			// for elided types, we need this
			receiverNodeIdPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			paymentHashPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Event(cType: nativeCallResult, instantiationContext: "Event.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new PaymentSent-variant Event
		public class func initWithPaymentSent(
			paymentId: [UInt8]?, paymentPreimage: [UInt8], paymentHash: [UInt8], feePaidMsat: UInt64?
		) -> Event {
			// native call variable prep

			let paymentIdOption = Option_PaymentIdZ(
				some: paymentId, instantiationContext: "Event.swift::\(#function):\(#line)"
			)
			.danglingClone()

			let paymentPreimagePrimitiveWrapper = ThirtyTwoBytes(
				value: paymentPreimage, instantiationContext: "Event.swift::\(#function):\(#line)")

			let paymentHashPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentHash, instantiationContext: "Event.swift::\(#function):\(#line)")

			let feePaidMsatOption = Option_u64Z(
				some: feePaidMsat, instantiationContext: "Event.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult = Event_payment_sent(
				paymentIdOption.cType!, paymentPreimagePrimitiveWrapper.cType!, paymentHashPrimitiveWrapper.cType!,
				feePaidMsatOption.cType!)

			// cleanup

			// for elided types, we need this
			paymentPreimagePrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			paymentHashPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Event(cType: nativeCallResult, instantiationContext: "Event.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new PaymentFailed-variant Event
		public class func initWithPaymentFailed(paymentId: [UInt8], paymentHash: [UInt8], reason: PaymentFailureReason?)
			-> Event
		{
			// native call variable prep

			let paymentIdPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentId, instantiationContext: "Event.swift::\(#function):\(#line)")

			let paymentHashPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentHash, instantiationContext: "Event.swift::\(#function):\(#line)")

			let reasonOption = Option_PaymentFailureReasonZ(
				some: reason, instantiationContext: "Event.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult = Event_payment_failed(
				paymentIdPrimitiveWrapper.cType!, paymentHashPrimitiveWrapper.cType!, reasonOption.cType!)

			// cleanup

			// for elided types, we need this
			paymentIdPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			paymentHashPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Event(cType: nativeCallResult, instantiationContext: "Event.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new PaymentPathSuccessful-variant Event
		public class func initWithPaymentPathSuccessful(paymentId: [UInt8], paymentHash: [UInt8]?, path: Bindings.Path)
			-> Event
		{
			// native call variable prep

			let paymentIdPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentId, instantiationContext: "Event.swift::\(#function):\(#line)")

			let paymentHashOption = Option_PaymentHashZ(
				some: paymentHash, instantiationContext: "Event.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult = Event_payment_path_successful(
				paymentIdPrimitiveWrapper.cType!, paymentHashOption.cType!, path.dynamicallyDangledClone().cType!)

			// cleanup

			// for elided types, we need this
			paymentIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Event(cType: nativeCallResult, instantiationContext: "Event.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new PaymentPathFailed-variant Event
		public class func initWithPaymentPathFailed(
			paymentId: [UInt8]?, paymentHash: [UInt8], paymentFailedPermanently: Bool, failure: PathFailure,
			path: Bindings.Path, shortChannelId: UInt64?
		) -> Event {
			// native call variable prep

			let paymentIdOption = Option_PaymentIdZ(
				some: paymentId, instantiationContext: "Event.swift::\(#function):\(#line)"
			)
			.danglingClone()

			let paymentHashPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentHash, instantiationContext: "Event.swift::\(#function):\(#line)")

			let shortChannelIdOption = Option_u64Z(
				some: shortChannelId, instantiationContext: "Event.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult = Event_payment_path_failed(
				paymentIdOption.cType!, paymentHashPrimitiveWrapper.cType!, paymentFailedPermanently,
				failure.danglingClone().cType!, path.dynamicallyDangledClone().cType!, shortChannelIdOption.cType!)

			// cleanup

			// for elided types, we need this
			paymentHashPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Event(cType: nativeCallResult, instantiationContext: "Event.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new ProbeSuccessful-variant Event
		public class func initWithProbeSuccessful(paymentId: [UInt8], paymentHash: [UInt8], path: Bindings.Path)
			-> Event
		{
			// native call variable prep

			let paymentIdPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentId, instantiationContext: "Event.swift::\(#function):\(#line)")

			let paymentHashPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentHash, instantiationContext: "Event.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = Event_probe_successful(
				paymentIdPrimitiveWrapper.cType!, paymentHashPrimitiveWrapper.cType!,
				path.dynamicallyDangledClone().cType!)

			// cleanup

			// for elided types, we need this
			paymentIdPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			paymentHashPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Event(cType: nativeCallResult, instantiationContext: "Event.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new ProbeFailed-variant Event
		public class func initWithProbeFailed(
			paymentId: [UInt8], paymentHash: [UInt8], path: Bindings.Path, shortChannelId: UInt64?
		) -> Event {
			// native call variable prep

			let paymentIdPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentId, instantiationContext: "Event.swift::\(#function):\(#line)")

			let paymentHashPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentHash, instantiationContext: "Event.swift::\(#function):\(#line)")

			let shortChannelIdOption = Option_u64Z(
				some: shortChannelId, instantiationContext: "Event.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult = Event_probe_failed(
				paymentIdPrimitiveWrapper.cType!, paymentHashPrimitiveWrapper.cType!,
				path.dynamicallyDangledClone().cType!, shortChannelIdOption.cType!)

			// cleanup

			// for elided types, we need this
			paymentIdPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			paymentHashPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Event(cType: nativeCallResult, instantiationContext: "Event.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new PendingHTLCsForwardable-variant Event
		public class func initWithPendingHtlcsForwardable(timeForwardable: UInt64) -> Event {
			// native call variable prep


			// native method call
			let nativeCallResult = Event_pending_htlcs_forwardable(timeForwardable)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Event(cType: nativeCallResult, instantiationContext: "Event.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new HTLCIntercepted-variant Event
		public class func initWithHtlcintercepted(
			interceptId: [UInt8], requestedNextHopScid: UInt64, paymentHash: [UInt8], inboundAmountMsat: UInt64,
			expectedOutboundAmountMsat: UInt64
		) -> Event {
			// native call variable prep

			let interceptIdPrimitiveWrapper = ThirtyTwoBytes(
				value: interceptId, instantiationContext: "Event.swift::\(#function):\(#line)")

			let paymentHashPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentHash, instantiationContext: "Event.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = Event_htlcintercepted(
				interceptIdPrimitiveWrapper.cType!, requestedNextHopScid, paymentHashPrimitiveWrapper.cType!,
				inboundAmountMsat, expectedOutboundAmountMsat)

			// cleanup

			// for elided types, we need this
			interceptIdPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			paymentHashPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Event(cType: nativeCallResult, instantiationContext: "Event.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new SpendableOutputs-variant Event
		public class func initWithSpendableOutputs(outputs: [SpendableOutputDescriptor]) -> Event {
			// native call variable prep

			let outputsVector = Vec_SpendableOutputDescriptorZ(
				array: outputs, instantiationContext: "Event.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = Event_spendable_outputs(outputsVector.cType!)

			// cleanup

			// outputsVector.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Event(cType: nativeCallResult, instantiationContext: "Event.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new PaymentForwarded-variant Event
		public class func initWithPaymentForwarded(
			prevChannelId: [UInt8], nextChannelId: [UInt8], feeEarnedMsat: UInt64?, claimFromOnchainTx: Bool,
			outboundAmountForwardedMsat: UInt64?
		) -> Event {
			// native call variable prep

			let prevChannelIdPrimitiveWrapper = ThirtyTwoBytes(
				value: prevChannelId, instantiationContext: "Event.swift::\(#function):\(#line)")

			let nextChannelIdPrimitiveWrapper = ThirtyTwoBytes(
				value: nextChannelId, instantiationContext: "Event.swift::\(#function):\(#line)")

			let feeEarnedMsatOption = Option_u64Z(
				some: feeEarnedMsat, instantiationContext: "Event.swift::\(#function):\(#line)"
			)
			.danglingClone()

			let outboundAmountForwardedMsatOption = Option_u64Z(
				some: outboundAmountForwardedMsat, instantiationContext: "Event.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult = Event_payment_forwarded(
				prevChannelIdPrimitiveWrapper.cType!, nextChannelIdPrimitiveWrapper.cType!, feeEarnedMsatOption.cType!,
				claimFromOnchainTx, outboundAmountForwardedMsatOption.cType!)

			// cleanup

			// for elided types, we need this
			prevChannelIdPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			nextChannelIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Event(cType: nativeCallResult, instantiationContext: "Event.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new ChannelPending-variant Event
		public class func initWithChannelPending(
			channelId: [UInt8], userChannelId: [UInt8], formerTemporaryChannelId: [UInt8], counterpartyNodeId: [UInt8],
			fundingTxo: Bindings.OutPoint
		) -> Event {
			// native call variable prep

			let channelIdPrimitiveWrapper = ThirtyTwoBytes(
				value: channelId, instantiationContext: "Event.swift::\(#function):\(#line)")

			let userChannelIdPrimitiveWrapper = U128(
				value: userChannelId, instantiationContext: "Event.swift::\(#function):\(#line)")

			let formerTemporaryChannelIdPrimitiveWrapper = ThirtyTwoBytes(
				value: formerTemporaryChannelId, instantiationContext: "Event.swift::\(#function):\(#line)")

			let counterpartyNodeIdPrimitiveWrapper = PublicKey(
				value: counterpartyNodeId, instantiationContext: "Event.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = Event_channel_pending(
				channelIdPrimitiveWrapper.cType!, userChannelIdPrimitiveWrapper.cType!,
				formerTemporaryChannelIdPrimitiveWrapper.cType!, counterpartyNodeIdPrimitiveWrapper.cType!,
				fundingTxo.dynamicallyDangledClone().cType!)

			// cleanup

			// for elided types, we need this
			channelIdPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			userChannelIdPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			formerTemporaryChannelIdPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			counterpartyNodeIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Event(cType: nativeCallResult, instantiationContext: "Event.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new ChannelReady-variant Event
		public class func initWithChannelReady(
			channelId: [UInt8], userChannelId: [UInt8], counterpartyNodeId: [UInt8],
			channelType: Bindings.ChannelTypeFeatures
		) -> Event {
			// native call variable prep

			let channelIdPrimitiveWrapper = ThirtyTwoBytes(
				value: channelId, instantiationContext: "Event.swift::\(#function):\(#line)")

			let userChannelIdPrimitiveWrapper = U128(
				value: userChannelId, instantiationContext: "Event.swift::\(#function):\(#line)")

			let counterpartyNodeIdPrimitiveWrapper = PublicKey(
				value: counterpartyNodeId, instantiationContext: "Event.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = Event_channel_ready(
				channelIdPrimitiveWrapper.cType!, userChannelIdPrimitiveWrapper.cType!,
				counterpartyNodeIdPrimitiveWrapper.cType!, channelType.dynamicallyDangledClone().cType!)

			// cleanup

			// for elided types, we need this
			channelIdPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			userChannelIdPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			counterpartyNodeIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Event(cType: nativeCallResult, instantiationContext: "Event.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new ChannelClosed-variant Event
		public class func initWithChannelClosed(channelId: [UInt8], userChannelId: [UInt8], reason: ClosureReason)
			-> Event
		{
			// native call variable prep

			let channelIdPrimitiveWrapper = ThirtyTwoBytes(
				value: channelId, instantiationContext: "Event.swift::\(#function):\(#line)")

			let userChannelIdPrimitiveWrapper = U128(
				value: userChannelId, instantiationContext: "Event.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = Event_channel_closed(
				channelIdPrimitiveWrapper.cType!, userChannelIdPrimitiveWrapper.cType!, reason.danglingClone().cType!)

			// cleanup

			// for elided types, we need this
			channelIdPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			userChannelIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Event(cType: nativeCallResult, instantiationContext: "Event.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new DiscardFunding-variant Event
		public class func initWithDiscardFunding(channelId: [UInt8], transaction: [UInt8]) -> Event {
			// native call variable prep

			let channelIdPrimitiveWrapper = ThirtyTwoBytes(
				value: channelId, instantiationContext: "Event.swift::\(#function):\(#line)")

			let transactionPrimitiveWrapper = Transaction(
				value: transaction, instantiationContext: "Event.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = Event_discard_funding(
				channelIdPrimitiveWrapper.cType!, transactionPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			channelIdPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			transactionPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Event(cType: nativeCallResult, instantiationContext: "Event.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new OpenChannelRequest-variant Event
		public class func initWithOpenChannelRequest(
			temporaryChannelId: [UInt8], counterpartyNodeId: [UInt8], fundingSatoshis: UInt64, pushMsat: UInt64,
			channelType: Bindings.ChannelTypeFeatures
		) -> Event {
			// native call variable prep

			let temporaryChannelIdPrimitiveWrapper = ThirtyTwoBytes(
				value: temporaryChannelId, instantiationContext: "Event.swift::\(#function):\(#line)")

			let counterpartyNodeIdPrimitiveWrapper = PublicKey(
				value: counterpartyNodeId, instantiationContext: "Event.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = Event_open_channel_request(
				temporaryChannelIdPrimitiveWrapper.cType!, counterpartyNodeIdPrimitiveWrapper.cType!, fundingSatoshis,
				pushMsat, channelType.dynamicallyDangledClone().cType!)

			// cleanup

			// for elided types, we need this
			temporaryChannelIdPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			counterpartyNodeIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Event(cType: nativeCallResult, instantiationContext: "Event.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new HTLCHandlingFailed-variant Event
		public class func initWithHtlchandlingFailed(prevChannelId: [UInt8], failedNextDestination: HTLCDestination)
			-> Event
		{
			// native call variable prep

			let prevChannelIdPrimitiveWrapper = ThirtyTwoBytes(
				value: prevChannelId, instantiationContext: "Event.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = Event_htlchandling_failed(
				prevChannelIdPrimitiveWrapper.cType!, failedNextDestination.danglingClone().cType!)

			// cleanup

			// for elided types, we need this
			prevChannelIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Event(cType: nativeCallResult, instantiationContext: "Event.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new BumpTransaction-variant Event
		public class func initWithBumpTransaction(a: BumpTransactionEvent) -> Event {
			// native call variable prep


			// native method call
			let nativeCallResult = Event_bump_transaction(a.danglingClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Event(cType: nativeCallResult, instantiationContext: "Event.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Checks if two Events contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		public class func eq(a: Event, b: Event) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKEvent>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKEvent>) in
						Event_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Serialize the Event object into a byte array which can be read by Event_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKEvent>) in
					Event_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "Event.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a Event from a byte array, created by Event_write
		public class func read(ser: [UInt8]) -> Result_COption_EventZDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(value: ser, instantiationContext: "Event.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = Event_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_COption_EventZDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "Event.swift::\(#function):\(#line)")


			return returnValue
		}


		public func getValueAsFundingGenerationReady() -> FundingGenerationReady? {
			if self.cType?.tag != LDKEvent_FundingGenerationReady {
				return nil
			}

			return Event_LDKFundingGenerationReady_Body(
				cType: self.cType!.funding_generation_ready, instantiationContext: "Event.swift::\(#function):\(#line)",
				anchor: self)
		}

		public func getValueAsPaymentClaimable() -> PaymentClaimable? {
			if self.cType?.tag != LDKEvent_PaymentClaimable {
				return nil
			}

			return Event_LDKPaymentClaimable_Body(
				cType: self.cType!.payment_claimable, instantiationContext: "Event.swift::\(#function):\(#line)",
				anchor: self)
		}

		public func getValueAsPaymentClaimed() -> PaymentClaimed? {
			if self.cType?.tag != LDKEvent_PaymentClaimed {
				return nil
			}

			return Event_LDKPaymentClaimed_Body(
				cType: self.cType!.payment_claimed, instantiationContext: "Event.swift::\(#function):\(#line)",
				anchor: self)
		}

		public func getValueAsPaymentSent() -> PaymentSent? {
			if self.cType?.tag != LDKEvent_PaymentSent {
				return nil
			}

			return Event_LDKPaymentSent_Body(
				cType: self.cType!.payment_sent, instantiationContext: "Event.swift::\(#function):\(#line)",
				anchor: self)
		}

		public func getValueAsPaymentFailed() -> PaymentFailed? {
			if self.cType?.tag != LDKEvent_PaymentFailed {
				return nil
			}

			return Event_LDKPaymentFailed_Body(
				cType: self.cType!.payment_failed, instantiationContext: "Event.swift::\(#function):\(#line)",
				anchor: self)
		}

		public func getValueAsPaymentPathSuccessful() -> PaymentPathSuccessful? {
			if self.cType?.tag != LDKEvent_PaymentPathSuccessful {
				return nil
			}

			return Event_LDKPaymentPathSuccessful_Body(
				cType: self.cType!.payment_path_successful, instantiationContext: "Event.swift::\(#function):\(#line)",
				anchor: self)
		}

		public func getValueAsPaymentPathFailed() -> PaymentPathFailed? {
			if self.cType?.tag != LDKEvent_PaymentPathFailed {
				return nil
			}

			return Event_LDKPaymentPathFailed_Body(
				cType: self.cType!.payment_path_failed, instantiationContext: "Event.swift::\(#function):\(#line)",
				anchor: self)
		}

		public func getValueAsProbeSuccessful() -> ProbeSuccessful? {
			if self.cType?.tag != LDKEvent_ProbeSuccessful {
				return nil
			}

			return Event_LDKProbeSuccessful_Body(
				cType: self.cType!.probe_successful, instantiationContext: "Event.swift::\(#function):\(#line)",
				anchor: self)
		}

		public func getValueAsProbeFailed() -> ProbeFailed? {
			if self.cType?.tag != LDKEvent_ProbeFailed {
				return nil
			}

			return Event_LDKProbeFailed_Body(
				cType: self.cType!.probe_failed, instantiationContext: "Event.swift::\(#function):\(#line)",
				anchor: self)
		}

		public func getValueAsPendingHtlcsForwardable() -> PendingHTLCsForwardable? {
			if self.cType?.tag != LDKEvent_PendingHTLCsForwardable {
				return nil
			}

			return Event_LDKPendingHTLCsForwardable_Body(
				cType: self.cType!.pending_htl_cs_forwardable,
				instantiationContext: "Event.swift::\(#function):\(#line)", anchor: self)
		}

		public func getValueAsHtlcIntercepted() -> HTLCIntercepted? {
			if self.cType?.tag != LDKEvent_HTLCIntercepted {
				return nil
			}

			return Event_LDKHTLCIntercepted_Body(
				cType: self.cType!.htlc_intercepted, instantiationContext: "Event.swift::\(#function):\(#line)",
				anchor: self)
		}

		public func getValueAsSpendableOutputs() -> SpendableOutputs? {
			if self.cType?.tag != LDKEvent_SpendableOutputs {
				return nil
			}

			return Event_LDKSpendableOutputs_Body(
				cType: self.cType!.spendable_outputs, instantiationContext: "Event.swift::\(#function):\(#line)",
				anchor: self)
		}

		public func getValueAsPaymentForwarded() -> PaymentForwarded? {
			if self.cType?.tag != LDKEvent_PaymentForwarded {
				return nil
			}

			return Event_LDKPaymentForwarded_Body(
				cType: self.cType!.payment_forwarded, instantiationContext: "Event.swift::\(#function):\(#line)",
				anchor: self)
		}

		public func getValueAsChannelPending() -> ChannelPending? {
			if self.cType?.tag != LDKEvent_ChannelPending {
				return nil
			}

			return Event_LDKChannelPending_Body(
				cType: self.cType!.channel_pending, instantiationContext: "Event.swift::\(#function):\(#line)",
				anchor: self)
		}

		public func getValueAsChannelReady() -> ChannelReady? {
			if self.cType?.tag != LDKEvent_ChannelReady {
				return nil
			}

			return Event_LDKChannelReady_Body(
				cType: self.cType!.channel_ready, instantiationContext: "Event.swift::\(#function):\(#line)",
				anchor: self)
		}

		public func getValueAsChannelClosed() -> ChannelClosed? {
			if self.cType?.tag != LDKEvent_ChannelClosed {
				return nil
			}

			return Event_LDKChannelClosed_Body(
				cType: self.cType!.channel_closed, instantiationContext: "Event.swift::\(#function):\(#line)",
				anchor: self)
		}

		public func getValueAsDiscardFunding() -> DiscardFunding? {
			if self.cType?.tag != LDKEvent_DiscardFunding {
				return nil
			}

			return Event_LDKDiscardFunding_Body(
				cType: self.cType!.discard_funding, instantiationContext: "Event.swift::\(#function):\(#line)",
				anchor: self)
		}

		public func getValueAsOpenChannelRequest() -> OpenChannelRequest? {
			if self.cType?.tag != LDKEvent_OpenChannelRequest {
				return nil
			}

			return Event_LDKOpenChannelRequest_Body(
				cType: self.cType!.open_channel_request, instantiationContext: "Event.swift::\(#function):\(#line)",
				anchor: self)
		}

		public func getValueAsHtlcHandlingFailed() -> HTLCHandlingFailed? {
			if self.cType?.tag != LDKEvent_HTLCHandlingFailed {
				return nil
			}

			return Event_LDKHTLCHandlingFailed_Body(
				cType: self.cType!.htlc_handling_failed, instantiationContext: "Event.swift::\(#function):\(#line)",
				anchor: self)
		}

		public func getValueAsBumpTransaction() -> BumpTransactionEvent? {
			if self.cType?.tag != LDKEvent_BumpTransaction {
				return nil
			}

			return BumpTransactionEvent(
				cType: self.cType!.bump_transaction, instantiationContext: "Event.swift::\(#function):\(#line)",
				anchor: self)
		}


		internal func danglingClone() -> Event {
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
					Bindings.print("Freeing Event \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Event \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
			}
		}


		///
		internal typealias Event_LDKFundingGenerationReady_Body = FundingGenerationReady


		///
		public class FundingGenerationReady: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKEvent_LDKFundingGenerationReady_Body?

			internal init(cType: LDKEvent_LDKFundingGenerationReady_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKEvent_LDKFundingGenerationReady_Body, instantiationContext: String, anchor: NativeTypeWrapper
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKEvent_LDKFundingGenerationReady_Body, instantiationContext: String, anchor: NativeTypeWrapper,
				dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// The random channel_id we picked which you'll need to pass into
			/// [`ChannelManager::funding_transaction_generated`].
			///
			/// [`ChannelManager::funding_transaction_generated`]: crate::ln::channelmanager::ChannelManager::funding_transaction_generated
			public func getTemporaryChannelId() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					cType: self.cType!.temporary_channel_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The counterparty's node_id, which you'll need to pass back into
			/// [`ChannelManager::funding_transaction_generated`].
			///
			/// [`ChannelManager::funding_transaction_generated`]: crate::ln::channelmanager::ChannelManager::funding_transaction_generated
			public func getCounterpartyNodeId() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = PublicKey(
					cType: self.cType!.counterparty_node_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The value, in satoshis, that the output should have.
			public func getChannelValueSatoshis() -> UInt64 {
				// return value (do some wrapping)
				let returnValue = self.cType!.channel_value_satoshis

				return returnValue
			}

			/// The script which should be used in the transaction output.
			public func getOutputScript() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = Vec_u8Z(
					cType: self.cType!.output_script, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The `user_channel_id` value passed in to [`ChannelManager::create_channel`], or a
			/// random value for an inbound channel. This may be zero for objects serialized with LDK
			/// versions prior to 0.0.113.
			///
			/// [`ChannelManager::create_channel`]: crate::ln::channelmanager::ChannelManager::create_channel
			public func getUserChannelId() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = U128(
					cType: self.cType!.user_channel_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}


		}


		///
		internal typealias Event_LDKPaymentClaimable_Body = PaymentClaimable


		///
		public class PaymentClaimable: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKEvent_LDKPaymentClaimable_Body?

			internal init(cType: LDKEvent_LDKPaymentClaimable_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKEvent_LDKPaymentClaimable_Body, instantiationContext: String, anchor: NativeTypeWrapper
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKEvent_LDKPaymentClaimable_Body, instantiationContext: String, anchor: NativeTypeWrapper,
				dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// The node that will receive the payment after it has been claimed.
			/// This is useful to identify payments received via [phantom nodes].
			/// This field will always be filled in when the event was generated by LDK versions
			/// 0.0.113 and above.
			///
			/// [phantom nodes]: crate::sign::PhantomKeysManager
			///
			/// Note that this (or a relevant inner pointer) may be NULL or all-0s to represent None
			public func getReceiverNodeId() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = PublicKey(
					cType: self.cType!.receiver_node_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The hash for which the preimage should be handed to the ChannelManager. Note that LDK will
			/// not stop you from registering duplicate payment hashes for inbound payments.
			public func getPaymentHash() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					cType: self.cType!.payment_hash, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The fields in the onion which were received with each HTLC. Only fields which were
			/// identical in each HTLC involved in the payment will be included here.
			///
			/// Payments received on LDK versions prior to 0.0.115 will have this field unset.
			///
			/// Note that this (or a relevant inner pointer) may be NULL or all-0s to represent None
			public func getOnionFields() -> Bindings.RecipientOnionFields {
				// return value (do some wrapping)
				let returnValue = Bindings.RecipientOnionFields(
					cType: self.cType!.onion_fields, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self)

				return returnValue
			}

			/// The value, in thousandths of a satoshi, that this payment is claimable for. May be greater
			/// than the invoice amount.
			///
			/// May be less than the invoice amount if [`ChannelConfig::accept_underpaying_htlcs`] is set
			/// and the previous hop took an extra fee.
			///
			/// # Note
			/// If [`ChannelConfig::accept_underpaying_htlcs`] is set and you claim without verifying this
			/// field, you may lose money!
			///
			/// [`ChannelConfig::accept_underpaying_htlcs`]: crate::util::config::ChannelConfig::accept_underpaying_htlcs
			public func getAmountMsat() -> UInt64 {
				// return value (do some wrapping)
				let returnValue = self.cType!.amount_msat

				return returnValue
			}

			/// The value, in thousands of a satoshi, that was skimmed off of this payment as an extra fee
			/// taken by our channel counterparty.
			///
			/// Will always be 0 unless [`ChannelConfig::accept_underpaying_htlcs`] is set.
			///
			/// [`ChannelConfig::accept_underpaying_htlcs`]: crate::util::config::ChannelConfig::accept_underpaying_htlcs
			public func getCounterpartySkimmedFeeMsat() -> UInt64 {
				// return value (do some wrapping)
				let returnValue = self.cType!.counterparty_skimmed_fee_msat

				return returnValue
			}

			/// Information for claiming this received payment, based on whether the purpose of the
			/// payment is to pay an invoice or to send a spontaneous payment.
			public func getPurpose() -> PaymentPurpose {
				// return value (do some wrapping)
				let returnValue = PaymentPurpose(
					cType: self.cType!.purpose, instantiationContext: "Event.swift::\(#function):\(#line)", anchor: self
				)

				return returnValue
			}

			/// The `channel_id` indicating over which channel we received the payment.
			///
			/// Note that this (or a relevant inner pointer) may be NULL or all-0s to represent None
			public func getViaChannelId() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					cType: self.cType!.via_channel_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The `user_channel_id` indicating over which channel we received the payment.
			public func getViaUserChannelId() -> [UInt8]? {
				// return value (do some wrapping)
				let returnValue = Option_u128Z(
					cType: self.cType!.via_user_channel_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The block height at which this payment will be failed back and will no longer be
			/// eligible for claiming.
			///
			/// Prior to this height, a call to [`ChannelManager::claim_funds`] is guaranteed to
			/// succeed, however you should wait for [`Event::PaymentClaimed`] to be sure.
			///
			/// [`ChannelManager::claim_funds`]: crate::ln::channelmanager::ChannelManager::claim_funds
			public func getClaimDeadline() -> UInt32? {
				// return value (do some wrapping)
				let returnValue = Option_u32Z(
					cType: self.cType!.claim_deadline, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}


		}


		///
		internal typealias Event_LDKPaymentClaimed_Body = PaymentClaimed


		///
		public class PaymentClaimed: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKEvent_LDKPaymentClaimed_Body?

			internal init(cType: LDKEvent_LDKPaymentClaimed_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKEvent_LDKPaymentClaimed_Body, instantiationContext: String, anchor: NativeTypeWrapper
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKEvent_LDKPaymentClaimed_Body, instantiationContext: String, anchor: NativeTypeWrapper,
				dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// The node that received the payment.
			/// This is useful to identify payments which were received via [phantom nodes].
			/// This field will always be filled in when the event was generated by LDK versions
			/// 0.0.113 and above.
			///
			/// [phantom nodes]: crate::sign::PhantomKeysManager
			///
			/// Note that this (or a relevant inner pointer) may be NULL or all-0s to represent None
			public func getReceiverNodeId() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = PublicKey(
					cType: self.cType!.receiver_node_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The payment hash of the claimed payment. Note that LDK will not stop you from
			/// registering duplicate payment hashes for inbound payments.
			public func getPaymentHash() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					cType: self.cType!.payment_hash, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The value, in thousandths of a satoshi, that this payment is for. May be greater than the
			/// invoice amount.
			public func getAmountMsat() -> UInt64 {
				// return value (do some wrapping)
				let returnValue = self.cType!.amount_msat

				return returnValue
			}

			/// The purpose of the claimed payment, i.e. whether the payment was for an invoice or a
			/// spontaneous payment.
			public func getPurpose() -> PaymentPurpose {
				// return value (do some wrapping)
				let returnValue = PaymentPurpose(
					cType: self.cType!.purpose, instantiationContext: "Event.swift::\(#function):\(#line)", anchor: self
				)

				return returnValue
			}


		}


		///
		internal typealias Event_LDKPaymentSent_Body = PaymentSent


		///
		public class PaymentSent: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKEvent_LDKPaymentSent_Body?

			internal init(cType: LDKEvent_LDKPaymentSent_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(cType: LDKEvent_LDKPaymentSent_Body, instantiationContext: String, anchor: NativeTypeWrapper)
			{
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKEvent_LDKPaymentSent_Body, instantiationContext: String, anchor: NativeTypeWrapper,
				dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// The `payment_id` passed to [`ChannelManager::send_payment`].
			///
			/// [`ChannelManager::send_payment`]: crate::ln::channelmanager::ChannelManager::send_payment
			public func getPaymentId() -> [UInt8]? {
				// return value (do some wrapping)
				let returnValue = Option_PaymentIdZ(
					cType: self.cType!.payment_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The preimage to the hash given to ChannelManager::send_payment.
			/// Note that this serves as a payment receipt, if you wish to have such a thing, you must
			/// store it somehow!
			public func getPaymentPreimage() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					cType: self.cType!.payment_preimage, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The hash that was given to [`ChannelManager::send_payment`].
			///
			/// [`ChannelManager::send_payment`]: crate::ln::channelmanager::ChannelManager::send_payment
			public func getPaymentHash() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					cType: self.cType!.payment_hash, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The total fee which was spent at intermediate hops in this payment, across all paths.
			///
			/// Note that, like [`Route::get_total_fees`] this does *not* include any potential
			/// overpayment to the recipient node.
			///
			/// If the recipient or an intermediate node misbehaves and gives us free money, this may
			/// overstate the amount paid, though this is unlikely.
			///
			/// [`Route::get_total_fees`]: crate::routing::router::Route::get_total_fees
			public func getFeePaidMsat() -> UInt64? {
				// return value (do some wrapping)
				let returnValue = Option_u64Z(
					cType: self.cType!.fee_paid_msat, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}


		}


		///
		internal typealias Event_LDKPaymentFailed_Body = PaymentFailed


		///
		public class PaymentFailed: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKEvent_LDKPaymentFailed_Body?

			internal init(cType: LDKEvent_LDKPaymentFailed_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKEvent_LDKPaymentFailed_Body, instantiationContext: String, anchor: NativeTypeWrapper
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKEvent_LDKPaymentFailed_Body, instantiationContext: String, anchor: NativeTypeWrapper,
				dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// The `payment_id` passed to [`ChannelManager::send_payment`].
			///
			/// [`ChannelManager::send_payment`]: crate::ln::channelmanager::ChannelManager::send_payment
			public func getPaymentId() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					cType: self.cType!.payment_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The hash that was given to [`ChannelManager::send_payment`].
			///
			/// [`ChannelManager::send_payment`]: crate::ln::channelmanager::ChannelManager::send_payment
			public func getPaymentHash() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					cType: self.cType!.payment_hash, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The reason the payment failed. This is only `None` for events generated or serialized
			/// by versions prior to 0.0.115.
			public func getReason() -> PaymentFailureReason? {
				// return value (do some wrapping)
				let returnValue = Option_PaymentFailureReasonZ(
					cType: self.cType!.reason, instantiationContext: "Event.swift::\(#function):\(#line)", anchor: self
				)
				.getValue()

				return returnValue
			}


		}


		///
		internal typealias Event_LDKPaymentPathSuccessful_Body = PaymentPathSuccessful


		///
		public class PaymentPathSuccessful: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKEvent_LDKPaymentPathSuccessful_Body?

			internal init(cType: LDKEvent_LDKPaymentPathSuccessful_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKEvent_LDKPaymentPathSuccessful_Body, instantiationContext: String, anchor: NativeTypeWrapper
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKEvent_LDKPaymentPathSuccessful_Body, instantiationContext: String, anchor: NativeTypeWrapper,
				dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// The `payment_id` passed to [`ChannelManager::send_payment`].
			///
			/// [`ChannelManager::send_payment`]: crate::ln::channelmanager::ChannelManager::send_payment
			public func getPaymentId() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					cType: self.cType!.payment_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The hash that was given to [`ChannelManager::send_payment`].
			///
			/// This will be `Some` for all payments which completed on LDK 0.0.104 or later.
			///
			/// [`ChannelManager::send_payment`]: crate::ln::channelmanager::ChannelManager::send_payment
			public func getPaymentHash() -> [UInt8]? {
				// return value (do some wrapping)
				let returnValue = Option_PaymentHashZ(
					cType: self.cType!.payment_hash, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The payment path that was successful.
			///
			/// May contain a closed channel if the HTLC sent along the path was fulfilled on chain.
			public func getPath() -> Bindings.Path {
				// return value (do some wrapping)
				let returnValue = Bindings.Path(
					cType: self.cType!.path, instantiationContext: "Event.swift::\(#function):\(#line)", anchor: self)

				return returnValue
			}


		}


		///
		internal typealias Event_LDKPaymentPathFailed_Body = PaymentPathFailed


		///
		public class PaymentPathFailed: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKEvent_LDKPaymentPathFailed_Body?

			internal init(cType: LDKEvent_LDKPaymentPathFailed_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKEvent_LDKPaymentPathFailed_Body, instantiationContext: String, anchor: NativeTypeWrapper
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKEvent_LDKPaymentPathFailed_Body, instantiationContext: String, anchor: NativeTypeWrapper,
				dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// The `payment_id` passed to [`ChannelManager::send_payment`].
			///
			/// This will be `Some` for all payment paths which failed on LDK 0.0.103 or later.
			///
			/// [`ChannelManager::send_payment`]: crate::ln::channelmanager::ChannelManager::send_payment
			/// [`ChannelManager::abandon_payment`]: crate::ln::channelmanager::ChannelManager::abandon_payment
			public func getPaymentId() -> [UInt8]? {
				// return value (do some wrapping)
				let returnValue = Option_PaymentIdZ(
					cType: self.cType!.payment_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The hash that was given to [`ChannelManager::send_payment`].
			///
			/// [`ChannelManager::send_payment`]: crate::ln::channelmanager::ChannelManager::send_payment
			public func getPaymentHash() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					cType: self.cType!.payment_hash, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// Indicates the payment was rejected for some reason by the recipient. This implies that
			/// the payment has failed, not just the route in question. If this is not set, the payment may
			/// be retried via a different route.
			public func getPaymentFailedPermanently() -> Bool {
				// return value (do some wrapping)
				let returnValue = self.cType!.payment_failed_permanently

				return returnValue
			}

			/// Extra error details based on the failure type. May contain an update that needs to be
			/// applied to the [`NetworkGraph`].
			///
			/// [`NetworkGraph`]: crate::routing::gossip::NetworkGraph
			public func getFailure() -> PathFailure {
				// return value (do some wrapping)
				let returnValue = PathFailure(
					cType: self.cType!.failure, instantiationContext: "Event.swift::\(#function):\(#line)", anchor: self
				)

				return returnValue
			}

			/// The payment path that failed.
			public func getPath() -> Bindings.Path {
				// return value (do some wrapping)
				let returnValue = Bindings.Path(
					cType: self.cType!.path, instantiationContext: "Event.swift::\(#function):\(#line)", anchor: self)

				return returnValue
			}

			/// The channel responsible for the failed payment path.
			///
			/// Note that for route hints or for the first hop in a path this may be an SCID alias and
			/// may not refer to a channel in the public network graph. These aliases may also collide
			/// with channels in the public network graph.
			///
			/// If this is `Some`, then the corresponding channel should be avoided when the payment is
			/// retried. May be `None` for older [`Event`] serializations.
			public func getShortChannelId() -> UInt64? {
				// return value (do some wrapping)
				let returnValue = Option_u64Z(
					cType: self.cType!.short_channel_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}


		}


		///
		internal typealias Event_LDKProbeSuccessful_Body = ProbeSuccessful


		///
		public class ProbeSuccessful: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKEvent_LDKProbeSuccessful_Body?

			internal init(cType: LDKEvent_LDKProbeSuccessful_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKEvent_LDKProbeSuccessful_Body, instantiationContext: String, anchor: NativeTypeWrapper
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKEvent_LDKProbeSuccessful_Body, instantiationContext: String, anchor: NativeTypeWrapper,
				dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// The id returned by [`ChannelManager::send_probe`].
			///
			/// [`ChannelManager::send_probe`]: crate::ln::channelmanager::ChannelManager::send_probe
			public func getPaymentId() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					cType: self.cType!.payment_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The hash generated by [`ChannelManager::send_probe`].
			///
			/// [`ChannelManager::send_probe`]: crate::ln::channelmanager::ChannelManager::send_probe
			public func getPaymentHash() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					cType: self.cType!.payment_hash, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The payment path that was successful.
			public func getPath() -> Bindings.Path {
				// return value (do some wrapping)
				let returnValue = Bindings.Path(
					cType: self.cType!.path, instantiationContext: "Event.swift::\(#function):\(#line)", anchor: self)

				return returnValue
			}


		}


		///
		internal typealias Event_LDKProbeFailed_Body = ProbeFailed


		///
		public class ProbeFailed: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKEvent_LDKProbeFailed_Body?

			internal init(cType: LDKEvent_LDKProbeFailed_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(cType: LDKEvent_LDKProbeFailed_Body, instantiationContext: String, anchor: NativeTypeWrapper)
			{
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKEvent_LDKProbeFailed_Body, instantiationContext: String, anchor: NativeTypeWrapper,
				dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// The id returned by [`ChannelManager::send_probe`].
			///
			/// [`ChannelManager::send_probe`]: crate::ln::channelmanager::ChannelManager::send_probe
			public func getPaymentId() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					cType: self.cType!.payment_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The hash generated by [`ChannelManager::send_probe`].
			///
			/// [`ChannelManager::send_probe`]: crate::ln::channelmanager::ChannelManager::send_probe
			public func getPaymentHash() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					cType: self.cType!.payment_hash, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The payment path that failed.
			public func getPath() -> Bindings.Path {
				// return value (do some wrapping)
				let returnValue = Bindings.Path(
					cType: self.cType!.path, instantiationContext: "Event.swift::\(#function):\(#line)", anchor: self)

				return returnValue
			}

			/// The channel responsible for the failed probe.
			///
			/// Note that for route hints or for the first hop in a path this may be an SCID alias and
			/// may not refer to a channel in the public network graph. These aliases may also collide
			/// with channels in the public network graph.
			public func getShortChannelId() -> UInt64? {
				// return value (do some wrapping)
				let returnValue = Option_u64Z(
					cType: self.cType!.short_channel_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}


		}


		///
		internal typealias Event_LDKPendingHTLCsForwardable_Body = PendingHTLCsForwardable


		///
		public class PendingHTLCsForwardable: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKEvent_LDKPendingHTLCsForwardable_Body?

			internal init(cType: LDKEvent_LDKPendingHTLCsForwardable_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKEvent_LDKPendingHTLCsForwardable_Body, instantiationContext: String, anchor: NativeTypeWrapper
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKEvent_LDKPendingHTLCsForwardable_Body, instantiationContext: String,
				anchor: NativeTypeWrapper, dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// The minimum amount of time that should be waited prior to calling
			/// process_pending_htlc_forwards. To increase the effort required to correlate payments,
			/// you should wait a random amount of time in roughly the range (now + time_forwardable,
			/// now + 5*time_forwardable).
			public func getTimeForwardable() -> UInt64 {
				// return value (do some wrapping)
				let returnValue = self.cType!.time_forwardable

				return returnValue
			}


		}


		///
		internal typealias Event_LDKHTLCIntercepted_Body = HTLCIntercepted


		///
		public class HTLCIntercepted: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKEvent_LDKHTLCIntercepted_Body?

			internal init(cType: LDKEvent_LDKHTLCIntercepted_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKEvent_LDKHTLCIntercepted_Body, instantiationContext: String, anchor: NativeTypeWrapper
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKEvent_LDKHTLCIntercepted_Body, instantiationContext: String, anchor: NativeTypeWrapper,
				dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// An id to help LDK identify which HTLC is being forwarded or failed.
			public func getInterceptId() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					cType: self.cType!.intercept_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The fake scid that was programmed as the next hop's scid, generated using
			/// [`ChannelManager::get_intercept_scid`].
			///
			/// [`ChannelManager::get_intercept_scid`]: crate::ln::channelmanager::ChannelManager::get_intercept_scid
			public func getRequestedNextHopScid() -> UInt64 {
				// return value (do some wrapping)
				let returnValue = self.cType!.requested_next_hop_scid

				return returnValue
			}

			/// The payment hash used for this HTLC.
			public func getPaymentHash() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					cType: self.cType!.payment_hash, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// How many msats were received on the inbound edge of this HTLC.
			public func getInboundAmountMsat() -> UInt64 {
				// return value (do some wrapping)
				let returnValue = self.cType!.inbound_amount_msat

				return returnValue
			}

			/// How many msats the payer intended to route to the next node. Depending on the reason you are
			/// intercepting this payment, you might take a fee by forwarding less than this amount.
			/// Forwarding less than this amount may break compatibility with LDK versions prior to 0.0.116.
			///
			/// Note that LDK will NOT check that expected fees were factored into this value. You MUST
			/// check that whatever fee you want has been included here or subtract it as required. Further,
			/// LDK will not stop you from forwarding more than you received.
			public func getExpectedOutboundAmountMsat() -> UInt64 {
				// return value (do some wrapping)
				let returnValue = self.cType!.expected_outbound_amount_msat

				return returnValue
			}


		}


		///
		internal typealias Event_LDKSpendableOutputs_Body = SpendableOutputs


		///
		public class SpendableOutputs: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKEvent_LDKSpendableOutputs_Body?

			internal init(cType: LDKEvent_LDKSpendableOutputs_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKEvent_LDKSpendableOutputs_Body, instantiationContext: String, anchor: NativeTypeWrapper
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKEvent_LDKSpendableOutputs_Body, instantiationContext: String, anchor: NativeTypeWrapper,
				dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// The outputs which you should store as spendable by you.
			public func getOutputs() -> [SpendableOutputDescriptor] {
				// return value (do some wrapping)
				let returnValue = Vec_SpendableOutputDescriptorZ(
					cType: self.cType!.outputs, instantiationContext: "Event.swift::\(#function):\(#line)", anchor: self
				)
				.getValue()

				return returnValue
			}


		}


		///
		internal typealias Event_LDKPaymentForwarded_Body = PaymentForwarded


		///
		public class PaymentForwarded: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKEvent_LDKPaymentForwarded_Body?

			internal init(cType: LDKEvent_LDKPaymentForwarded_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKEvent_LDKPaymentForwarded_Body, instantiationContext: String, anchor: NativeTypeWrapper
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKEvent_LDKPaymentForwarded_Body, instantiationContext: String, anchor: NativeTypeWrapper,
				dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// The incoming channel between the previous node and us. This is only `None` for events
			/// generated or serialized by versions prior to 0.0.107.
			///
			/// Note that this (or a relevant inner pointer) may be NULL or all-0s to represent None
			public func getPrevChannelId() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					cType: self.cType!.prev_channel_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The outgoing channel between the next node and us. This is only `None` for events
			/// generated or serialized by versions prior to 0.0.107.
			///
			/// Note that this (or a relevant inner pointer) may be NULL or all-0s to represent None
			public func getNextChannelId() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					cType: self.cType!.next_channel_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The fee, in milli-satoshis, which was earned as a result of the payment.
			///
			/// Note that if we force-closed the channel over which we forwarded an HTLC while the HTLC
			/// was pending, the amount the next hop claimed will have been rounded down to the nearest
			/// whole satoshi. Thus, the fee calculated here may be higher than expected as we still
			/// claimed the full value in millisatoshis from the source. In this case,
			/// `claim_from_onchain_tx` will be set.
			///
			/// If the channel which sent us the payment has been force-closed, we will claim the funds
			/// via an on-chain transaction. In that case we do not yet know the on-chain transaction
			/// fees which we will spend and will instead set this to `None`. It is possible duplicate
			/// `PaymentForwarded` events are generated for the same payment iff `fee_earned_msat` is
			/// `None`.
			public func getFeeEarnedMsat() -> UInt64? {
				// return value (do some wrapping)
				let returnValue = Option_u64Z(
					cType: self.cType!.fee_earned_msat, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// If this is `true`, the forwarded HTLC was claimed by our counterparty via an on-chain
			/// transaction.
			public func getClaimFromOnchainTx() -> Bool {
				// return value (do some wrapping)
				let returnValue = self.cType!.claim_from_onchain_tx

				return returnValue
			}

			/// The final amount forwarded, in milli-satoshis, after the fee is deducted.
			///
			/// The caveat described above the `fee_earned_msat` field applies here as well.
			public func getOutboundAmountForwardedMsat() -> UInt64? {
				// return value (do some wrapping)
				let returnValue = Option_u64Z(
					cType: self.cType!.outbound_amount_forwarded_msat,
					instantiationContext: "Event.swift::\(#function):\(#line)", anchor: self
				)
				.getValue()

				return returnValue
			}


		}


		///
		internal typealias Event_LDKChannelPending_Body = ChannelPending


		///
		public class ChannelPending: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKEvent_LDKChannelPending_Body?

			internal init(cType: LDKEvent_LDKChannelPending_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKEvent_LDKChannelPending_Body, instantiationContext: String, anchor: NativeTypeWrapper
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKEvent_LDKChannelPending_Body, instantiationContext: String, anchor: NativeTypeWrapper,
				dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// The `channel_id` of the channel that is pending confirmation.
			public func getChannelId() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					cType: self.cType!.channel_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The `user_channel_id` value passed in to [`ChannelManager::create_channel`] for outbound
			/// channels, or to [`ChannelManager::accept_inbound_channel`] for inbound channels if
			/// [`UserConfig::manually_accept_inbound_channels`] config flag is set to true. Otherwise
			/// `user_channel_id` will be randomized for an inbound channel.
			///
			/// [`ChannelManager::create_channel`]: crate::ln::channelmanager::ChannelManager::create_channel
			/// [`ChannelManager::accept_inbound_channel`]: crate::ln::channelmanager::ChannelManager::accept_inbound_channel
			/// [`UserConfig::manually_accept_inbound_channels`]: crate::util::config::UserConfig::manually_accept_inbound_channels
			public func getUserChannelId() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = U128(
					cType: self.cType!.user_channel_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The `temporary_channel_id` this channel used to be known by during channel establishment.
			///
			/// Will be `None` for channels created prior to LDK version 0.0.115.
			///
			/// Note that this (or a relevant inner pointer) may be NULL or all-0s to represent None
			public func getFormerTemporaryChannelId() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					cType: self.cType!.former_temporary_channel_id,
					instantiationContext: "Event.swift::\(#function):\(#line)", anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The `node_id` of the channel counterparty.
			public func getCounterpartyNodeId() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = PublicKey(
					cType: self.cType!.counterparty_node_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The outpoint of the channel's funding transaction.
			public func getFundingTxo() -> Bindings.OutPoint {
				// return value (do some wrapping)
				let returnValue = Bindings.OutPoint(
					cType: self.cType!.funding_txo, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self)

				return returnValue
			}


		}


		///
		internal typealias Event_LDKChannelReady_Body = ChannelReady


		///
		public class ChannelReady: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKEvent_LDKChannelReady_Body?

			internal init(cType: LDKEvent_LDKChannelReady_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(cType: LDKEvent_LDKChannelReady_Body, instantiationContext: String, anchor: NativeTypeWrapper)
			{
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKEvent_LDKChannelReady_Body, instantiationContext: String, anchor: NativeTypeWrapper,
				dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// The `channel_id` of the channel that is ready.
			public func getChannelId() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					cType: self.cType!.channel_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The `user_channel_id` value passed in to [`ChannelManager::create_channel`] for outbound
			/// channels, or to [`ChannelManager::accept_inbound_channel`] for inbound channels if
			/// [`UserConfig::manually_accept_inbound_channels`] config flag is set to true. Otherwise
			/// `user_channel_id` will be randomized for an inbound channel.
			///
			/// [`ChannelManager::create_channel`]: crate::ln::channelmanager::ChannelManager::create_channel
			/// [`ChannelManager::accept_inbound_channel`]: crate::ln::channelmanager::ChannelManager::accept_inbound_channel
			/// [`UserConfig::manually_accept_inbound_channels`]: crate::util::config::UserConfig::manually_accept_inbound_channels
			public func getUserChannelId() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = U128(
					cType: self.cType!.user_channel_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The `node_id` of the channel counterparty.
			public func getCounterpartyNodeId() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = PublicKey(
					cType: self.cType!.counterparty_node_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The features that this channel will operate with.
			public func getChannelType() -> Bindings.ChannelTypeFeatures {
				// return value (do some wrapping)
				let returnValue = Bindings.ChannelTypeFeatures(
					cType: self.cType!.channel_type, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self)

				return returnValue
			}


		}


		///
		internal typealias Event_LDKChannelClosed_Body = ChannelClosed


		///
		public class ChannelClosed: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKEvent_LDKChannelClosed_Body?

			internal init(cType: LDKEvent_LDKChannelClosed_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKEvent_LDKChannelClosed_Body, instantiationContext: String, anchor: NativeTypeWrapper
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKEvent_LDKChannelClosed_Body, instantiationContext: String, anchor: NativeTypeWrapper,
				dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// The `channel_id` of the channel which has been closed. Note that on-chain transactions
			/// resolving the channel are likely still awaiting confirmation.
			public func getChannelId() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					cType: self.cType!.channel_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The `user_channel_id` value passed in to [`ChannelManager::create_channel`] for outbound
			/// channels, or to [`ChannelManager::accept_inbound_channel`] for inbound channels if
			/// [`UserConfig::manually_accept_inbound_channels`] config flag is set to true. Otherwise
			/// `user_channel_id` will be randomized for inbound channels.
			/// This may be zero for inbound channels serialized prior to 0.0.113 and will always be
			/// zero for objects serialized with LDK versions prior to 0.0.102.
			///
			/// [`ChannelManager::create_channel`]: crate::ln::channelmanager::ChannelManager::create_channel
			/// [`ChannelManager::accept_inbound_channel`]: crate::ln::channelmanager::ChannelManager::accept_inbound_channel
			/// [`UserConfig::manually_accept_inbound_channels`]: crate::util::config::UserConfig::manually_accept_inbound_channels
			public func getUserChannelId() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = U128(
					cType: self.cType!.user_channel_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The reason the channel was closed.
			public func getReason() -> ClosureReason {
				// return value (do some wrapping)
				let returnValue = ClosureReason(
					cType: self.cType!.reason, instantiationContext: "Event.swift::\(#function):\(#line)", anchor: self)

				return returnValue
			}


		}


		///
		internal typealias Event_LDKDiscardFunding_Body = DiscardFunding


		///
		public class DiscardFunding: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKEvent_LDKDiscardFunding_Body?

			internal init(cType: LDKEvent_LDKDiscardFunding_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKEvent_LDKDiscardFunding_Body, instantiationContext: String, anchor: NativeTypeWrapper
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKEvent_LDKDiscardFunding_Body, instantiationContext: String, anchor: NativeTypeWrapper,
				dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// The channel_id of the channel which has been closed.
			public func getChannelId() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					cType: self.cType!.channel_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The full transaction received from the user
			public func getTransaction() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = Transaction(
					cType: self.cType!.transaction, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}


		}


		///
		internal typealias Event_LDKOpenChannelRequest_Body = OpenChannelRequest


		///
		public class OpenChannelRequest: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKEvent_LDKOpenChannelRequest_Body?

			internal init(cType: LDKEvent_LDKOpenChannelRequest_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKEvent_LDKOpenChannelRequest_Body, instantiationContext: String, anchor: NativeTypeWrapper
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKEvent_LDKOpenChannelRequest_Body, instantiationContext: String, anchor: NativeTypeWrapper,
				dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// The temporary channel ID of the channel requested to be opened.
			///
			/// When responding to the request, the `temporary_channel_id` should be passed
			/// back to the ChannelManager through [`ChannelManager::accept_inbound_channel`] to accept,
			/// or through [`ChannelManager::force_close_without_broadcasting_txn`] to reject.
			///
			/// [`ChannelManager::accept_inbound_channel`]: crate::ln::channelmanager::ChannelManager::accept_inbound_channel
			/// [`ChannelManager::force_close_without_broadcasting_txn`]: crate::ln::channelmanager::ChannelManager::force_close_without_broadcasting_txn
			public func getTemporaryChannelId() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					cType: self.cType!.temporary_channel_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The node_id of the counterparty requesting to open the channel.
			///
			/// When responding to the request, the `counterparty_node_id` should be passed
			/// back to the `ChannelManager` through [`ChannelManager::accept_inbound_channel`] to
			/// accept the request, or through [`ChannelManager::force_close_without_broadcasting_txn`] to reject the
			/// request.
			///
			/// [`ChannelManager::accept_inbound_channel`]: crate::ln::channelmanager::ChannelManager::accept_inbound_channel
			/// [`ChannelManager::force_close_without_broadcasting_txn`]: crate::ln::channelmanager::ChannelManager::force_close_without_broadcasting_txn
			public func getCounterpartyNodeId() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = PublicKey(
					cType: self.cType!.counterparty_node_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The channel value of the requested channel.
			public func getFundingSatoshis() -> UInt64 {
				// return value (do some wrapping)
				let returnValue = self.cType!.funding_satoshis

				return returnValue
			}

			/// Our starting balance in the channel if the request is accepted, in milli-satoshi.
			public func getPushMsat() -> UInt64 {
				// return value (do some wrapping)
				let returnValue = self.cType!.push_msat

				return returnValue
			}

			/// The features that this channel will operate with. If you reject the channel, a
			/// well-behaved counterparty may automatically re-attempt the channel with a new set of
			/// feature flags.
			///
			/// Note that if [`ChannelTypeFeatures::supports_scid_privacy`] returns true on this type,
			/// the resulting [`ChannelManager`] will not be readable by versions of LDK prior to
			/// 0.0.106.
			///
			/// Furthermore, note that if [`ChannelTypeFeatures::supports_zero_conf`] returns true on this type,
			/// the resulting [`ChannelManager`] will not be readable by versions of LDK prior to
			/// 0.0.107. Channels setting this type also need to get manually accepted via
			/// [`crate::ln::channelmanager::ChannelManager::accept_inbound_channel_from_trusted_peer_0conf`],
			/// or will be rejected otherwise.
			///
			/// [`ChannelManager`]: crate::ln::channelmanager::ChannelManager
			public func getChannelType() -> Bindings.ChannelTypeFeatures {
				// return value (do some wrapping)
				let returnValue = Bindings.ChannelTypeFeatures(
					cType: self.cType!.channel_type, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self)

				return returnValue
			}


		}


		///
		internal typealias Event_LDKHTLCHandlingFailed_Body = HTLCHandlingFailed


		///
		public class HTLCHandlingFailed: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKEvent_LDKHTLCHandlingFailed_Body?

			internal init(cType: LDKEvent_LDKHTLCHandlingFailed_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKEvent_LDKHTLCHandlingFailed_Body, instantiationContext: String, anchor: NativeTypeWrapper
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKEvent_LDKHTLCHandlingFailed_Body, instantiationContext: String, anchor: NativeTypeWrapper,
				dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// The channel over which the HTLC was received.
			public func getPrevChannelId() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					cType: self.cType!.prev_channel_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// Destination of the HTLC that failed to be processed.
			public func getFailedNextDestination() -> HTLCDestination {
				// return value (do some wrapping)
				let returnValue = HTLCDestination(
					cType: self.cType!.failed_next_destination,
					instantiationContext: "Event.swift::\(#function):\(#line)", anchor: self)

				return returnValue
			}


		}


	}

}
