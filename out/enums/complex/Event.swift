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
			/// # Failure Behavior and Persistence
			/// This event will eventually be replayed after failures-to-handle (i.e., the event handler
			/// returning `Err(ReplayEvent ())`), but won't be persisted across restarts.
			///
			/// [`ChannelManager`]: crate::ln::channelmanager::ChannelManager
			/// [`ChannelManager::funding_transaction_generated`]: crate::ln::channelmanager::ChannelManager::funding_transaction_generated
			case FundingGenerationReady

			/// Used to indicate that the counterparty node has provided the signature(s) required to
			/// recover our funds in case they go offline.
			///
			/// It is safe (and your responsibility) to broadcast the funding transaction upon receiving this
			/// event.
			///
			/// This event is only emitted if you called
			/// [`ChannelManager::unsafe_manual_funding_transaction_generated`] instead of
			/// [`ChannelManager::funding_transaction_generated`].
			///
			/// [`ChannelManager::unsafe_manual_funding_transaction_generated`]: crate::ln::channelmanager::ChannelManager::unsafe_manual_funding_transaction_generated
			/// [`ChannelManager::funding_transaction_generated`]: crate::ln::channelmanager::ChannelManager::funding_transaction_generated
			case FundingTxBroadcastSafe

			/// Indicates that we've been offered a payment and it needs to be claimed via calling
			/// [`ChannelManager::claim_funds`] with the preimage given in [`PaymentPurpose`].
			///
			/// Note that if the preimage is not known, you should call
			/// [`ChannelManager::fail_htlc_backwards`] or [`ChannelManager::fail_htlc_backwards_with_reason`]
			/// to free up resources for this HTLC and avoid network congestion.
			///
			/// If [`Event::PaymentClaimable::onion_fields`] is `Some`, and includes custom TLVs with even type
			/// numbers, you should use [`ChannelManager::fail_htlc_backwards_with_reason`] with
			/// [`FailureCode::InvalidOnionPayload`] if you fail to understand and handle the contents, or
			/// [`ChannelManager::claim_funds_with_known_custom_tlvs`] upon successful handling.
			/// If you don't intend to check for custom TLVs, you can simply use
			/// [`ChannelManager::claim_funds`], which will automatically fail back even custom TLVs.
			///
			/// If you fail to call [`ChannelManager::claim_funds`],
			/// [`ChannelManager::claim_funds_with_known_custom_tlvs`],
			/// [`ChannelManager::fail_htlc_backwards`], or
			/// [`ChannelManager::fail_htlc_backwards_with_reason`] within the HTLC's timeout, the HTLC will
			/// be automatically failed.
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
			/// # Failure Behavior and Persistence
			/// This event will eventually be replayed after failures-to-handle (i.e., the event handler
			/// returning `Err(ReplayEvent ())`) and will be persisted across restarts.
			///
			/// [`ChannelManager::claim_funds`]: crate::ln::channelmanager::ChannelManager::claim_funds
			/// [`ChannelManager::claim_funds_with_known_custom_tlvs`]: crate::ln::channelmanager::ChannelManager::claim_funds_with_known_custom_tlvs
			/// [`FailureCode::InvalidOnionPayload`]: crate::ln::channelmanager::FailureCode::InvalidOnionPayload
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
			/// # Failure Behavior and Persistence
			/// This event will eventually be replayed after failures-to-handle (i.e., the event handler
			/// returning `Err(ReplayEvent ())`) and will be persisted across restarts.
			///
			/// [`ChannelManager::claim_funds`]: crate::ln::channelmanager::ChannelManager::claim_funds
			case PaymentClaimed

			/// Indicates that a peer connection with a node is needed in order to send an [`OnionMessage`].
			///
			/// Typically, this happens when a [`MessageRouter`] is unable to find a complete path to a
			/// [`Destination`]. Once a connection is established, any messages buffered by an
			/// [`OnionMessageHandler`] may be sent.
			///
			/// This event will not be generated for onion message forwards; only for sends including
			/// replies. Handlers should connect to the node otherwise any buffered messages may be lost.
			///
			/// # Failure Behavior and Persistence
			/// This event won't be replayed after failures-to-handle
			/// (i.e., the event handler returning `Err(ReplayEvent ())`), and also won't be persisted
			/// across restarts.
			///
			/// [`OnionMessage`]: msgs::OnionMessage
			/// [`MessageRouter`]: crate::onion_message::messenger::MessageRouter
			/// [`Destination`]: crate::onion_message::messenger::Destination
			/// [`OnionMessageHandler`]: crate::ln::msgs::OnionMessageHandler
			case ConnectionNeeded

			/// Indicates a [`Bolt12Invoice`] in response to an [`InvoiceRequest`] or a [`Refund`] was
			/// received.
			///
			/// This event will only be generated if [`UserConfig::manually_handle_bolt12_invoices`] is set.
			/// Use [`ChannelManager::send_payment_for_bolt12_invoice`] to pay the invoice or
			/// [`ChannelManager::abandon_payment`] to abandon the associated payment. See those docs for
			/// further details.
			///
			/// # Failure Behavior and Persistence
			/// This event will eventually be replayed after failures-to-handle (i.e., the event handler
			/// returning `Err(ReplayEvent ())`) and will be persisted across restarts.
			///
			/// [`InvoiceRequest`]: crate::offers::invoice_request::InvoiceRequest
			/// [`Refund`]: crate::offers::refund::Refund
			/// [`UserConfig::manually_handle_bolt12_invoices`]: crate::util::config::UserConfig::manually_handle_bolt12_invoices
			/// [`ChannelManager::send_payment_for_bolt12_invoice`]: crate::ln::channelmanager::ChannelManager::send_payment_for_bolt12_invoice
			/// [`ChannelManager::abandon_payment`]: crate::ln::channelmanager::ChannelManager::abandon_payment
			case InvoiceReceived

			/// Indicates an outbound payment we made succeeded (i.e. it made it all the way to its target
			/// and we got back the payment preimage for it).
			///
			/// Note for MPP payments: in rare cases, this event may be preceded by a `PaymentPathFailed`
			/// event. In this situation, you SHOULD treat this payment as having succeeded.
			///
			/// # Failure Behavior and Persistence
			/// This event will eventually be replayed after failures-to-handle (i.e., the event handler
			/// returning `Err(ReplayEvent ())`) and will be persisted across restarts.
			case PaymentSent

			/// Indicates an outbound payment failed. Individual [`Event::PaymentPathFailed`] events
			/// provide failure information for each path attempt in the payment, including retries.
			///
			/// This event is provided once there are no further pending HTLCs for the payment and the
			/// payment is no longer retryable, due either to the [`Retry`] provided or
			/// [`ChannelManager::abandon_payment`] having been called for the corresponding payment.
			///
			/// In exceedingly rare cases, it is possible that an [`Event::PaymentFailed`] is generated for
			/// a payment after an [`Event::PaymentSent`] event for this same payment has already been
			/// received and processed. In this case, the [`Event::PaymentFailed`] event MUST be ignored,
			/// and the payment MUST be treated as having succeeded.
			///
			/// # Failure Behavior and Persistence
			/// This event will eventually be replayed after failures-to-handle (i.e., the event handler
			/// returning `Err(ReplayEvent ())`) and will be persisted across restarts.
			///
			/// [`Retry`]: crate::ln::channelmanager::Retry
			/// [`ChannelManager::abandon_payment`]: crate::ln::channelmanager::ChannelManager::abandon_payment
			case PaymentFailed

			/// Indicates that a path for an outbound payment was successful.
			///
			/// Always generated after [`Event::PaymentSent`] and thus useful for scoring channels. See
			/// [`Event::PaymentSent`] for obtaining the payment preimage.
			///
			/// # Failure Behavior and Persistence
			/// This event will eventually be replayed after failures-to-handle (i.e., the event handler
			/// returning `Err(ReplayEvent ())`) and will be persisted across restarts.
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
			/// # Failure Behavior and Persistence
			/// This event will eventually be replayed after failures-to-handle (i.e., the event handler
			/// returning `Err(ReplayEvent ())`) and will be persisted across restarts.
			///
			/// [`ChannelManager::abandon_payment`]: crate::ln::channelmanager::ChannelManager::abandon_payment
			case PaymentPathFailed

			/// Indicates that a probe payment we sent returned successful, i.e., only failed at the destination.
			///
			/// # Failure Behavior and Persistence
			/// This event will eventually be replayed after failures-to-handle (i.e., the event handler
			/// returning `Err(ReplayEvent ())`) and will be persisted across restarts.
			case ProbeSuccessful

			/// Indicates that a probe payment we sent failed at an intermediary node on the path.
			///
			/// # Failure Behavior and Persistence
			/// This event will eventually be replayed after failures-to-handle (i.e., the event handler
			/// returning `Err(ReplayEvent ())`) and will be persisted across restarts.
			case ProbeFailed

			/// Used to indicate that [`ChannelManager::process_pending_htlc_forwards`] should be called at
			/// a time in the future.
			///
			/// # Failure Behavior and Persistence
			/// This event will eventually be replayed after failures-to-handle (i.e., the event handler
			/// returning `Err(ReplayEvent ())`) and will be regenerated after restarts.
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
			/// # Failure Behavior and Persistence
			/// This event will eventually be replayed after failures-to-handle (i.e., the event handler
			/// returning `Err(ReplayEvent ())`) and will be persisted across restarts.
			///
			/// [`ChannelManager::get_intercept_scid`]: crate::ln::channelmanager::ChannelManager::get_intercept_scid
			/// [`UserConfig::accept_intercept_htlcs`]: crate::util::config::UserConfig::accept_intercept_htlcs
			/// [`ChannelManager::forward_intercepted_htlc`]: crate::ln::channelmanager::ChannelManager::forward_intercepted_htlc
			/// [`ChannelManager::fail_intercepted_htlc`]: crate::ln::channelmanager::ChannelManager::fail_intercepted_htlc
			case HTLCIntercepted

			/// Used to indicate that an output which you should know how to spend was confirmed on chain
			/// and is now spendable.
			///
			/// Such an output will *never* be spent directly by LDK, and are not at risk of your
			/// counterparty spending them due to some kind of timeout. Thus, you need to store them
			/// somewhere and spend them when you create on-chain transactions.
			///
			/// You may hand them to the [`OutputSweeper`] utility which will store and (re-)generate spending
			/// transactions for you.
			///
			/// # Failure Behavior and Persistence
			/// This event will eventually be replayed after failures-to-handle (i.e., the event handler
			/// returning `Err(ReplayEvent ())`) and will be persisted across restarts.
			///
			/// [`OutputSweeper`]: crate::util::sweep::OutputSweeper
			case SpendableOutputs

			/// This event is generated when a payment has been successfully forwarded through us and a
			/// forwarding fee earned.
			///
			/// # Failure Behavior and Persistence
			/// This event will eventually be replayed after failures-to-handle (i.e., the event handler
			/// returning `Err(ReplayEvent ())`) and will be persisted across restarts.
			case PaymentForwarded

			/// Used to indicate that a channel with the given `channel_id` is being opened and pending
			/// confirmation on-chain.
			///
			/// This event is emitted when the funding transaction has been signed and is broadcast to the
			/// network. For 0conf channels it will be immediately followed by the corresponding
			/// [`Event::ChannelReady`] event.
			///
			/// # Failure Behavior and Persistence
			/// This event will eventually be replayed after failures-to-handle (i.e., the event handler
			/// returning `Err(ReplayEvent ())`) and will be persisted across restarts.
			case ChannelPending

			/// Used to indicate that a channel with the given `channel_id` is ready to
			/// be used. This event is emitted either when the funding transaction has been confirmed
			/// on-chain, or, in case of a 0conf channel, when both parties have confirmed the channel
			/// establishment.
			///
			/// # Failure Behavior and Persistence
			/// This event will eventually be replayed after failures-to-handle (i.e., the event handler
			/// returning `Err(ReplayEvent ())`) and will be persisted across restarts.
			case ChannelReady

			/// Used to indicate that a channel that got past the initial handshake with the given `channel_id` is in the
			/// process of closure. This includes previously opened channels, and channels that time out from not being funded.
			///
			/// Note that this event is only triggered for accepted channels: if the
			/// [`UserConfig::manually_accept_inbound_channels`] config flag is set to true and the channel is
			/// rejected, no `ChannelClosed` event will be sent.
			///
			/// [`ChannelManager::accept_inbound_channel`]: crate::ln::channelmanager::ChannelManager::accept_inbound_channel
			/// [`UserConfig::manually_accept_inbound_channels`]: crate::util::config::UserConfig::manually_accept_inbound_channels
			///
			/// # Failure Behavior and Persistence
			/// This event will eventually be replayed after failures-to-handle (i.e., the event handler
			/// returning `Err(ReplayEvent ())`) and will be persisted across restarts.
			case ChannelClosed

			/// Used to indicate to the user that they can abandon the funding transaction and recycle the
			/// inputs for another purpose.
			///
			/// This event is not guaranteed to be generated for channels that are closed due to a restart.
			///
			/// # Failure Behavior and Persistence
			/// This event will eventually be replayed after failures-to-handle (i.e., the event handler
			/// returning `Err(ReplayEvent ())`) and will be persisted across restarts.
			case DiscardFunding

			/// Indicates a request to open a new channel by a peer.
			///
			/// To accept the request, call [`ChannelManager::accept_inbound_channel`]. To reject the request,
			/// call [`ChannelManager::force_close_without_broadcasting_txn`]. Note that a ['ChannelClosed`]
			/// event will _not_ be triggered if the channel is rejected.
			///
			/// The event is only triggered when a new open channel request is received and the
			/// [`UserConfig::manually_accept_inbound_channels`] config flag is set to true.
			///
			/// # Failure Behavior and Persistence
			/// This event will eventually be replayed after failures-to-handle (i.e., the event handler
			/// returning `Err(ReplayEvent ())`) and will be persisted across restarts.
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
			///
			/// # Failure Behavior and Persistence
			/// This event will eventually be replayed after failures-to-handle (i.e., the event handler
			/// returning `Err(ReplayEvent ())`) and will be persisted across restarts.
			case HTLCHandlingFailed

			/// Indicates that a transaction originating from LDK needs to have its fee bumped. This event
			/// requires confirmed external funds to be readily available to spend.
			///
			/// LDK does not currently generate this event unless the
			/// [`ChannelHandshakeConfig::negotiate_anchors_zero_fee_htlc_tx`] config flag is set to true.
			/// It is limited to the scope of channels with anchor outputs.
			///
			/// # Failure Behavior and Persistence
			/// This event will eventually be replayed after failures-to-handle (i.e., the event handler
			/// returning `Err(ReplayEvent ())`), but will only be regenerated as needed after restarts.
			///
			/// [`ChannelHandshakeConfig::negotiate_anchors_zero_fee_htlc_tx`]: crate::util::config::ChannelHandshakeConfig::negotiate_anchors_zero_fee_htlc_tx
			case BumpTransaction

			/// We received an onion message that is intended to be forwarded to a peer
			/// that is currently offline. This event will only be generated if the
			/// `OnionMessenger` was initialized with
			/// [`OnionMessenger::new_with_offline_peer_interception`], see its docs.
			///
			/// # Failure Behavior and Persistence
			/// This event will eventually be replayed after failures-to-handle (i.e., the event handler
			/// returning `Err(ReplayEvent ())`), but won't be persisted across restarts.
			///
			/// [`OnionMessenger::new_with_offline_peer_interception`]: crate::onion_message::messenger::OnionMessenger::new_with_offline_peer_interception
			case OnionMessageIntercepted

			/// Indicates that an onion message supporting peer has come online and it may
			/// be time to forward any onion messages that were previously intercepted for
			/// them. This event will only be generated if the `OnionMessenger` was
			/// initialized with
			/// [`OnionMessenger::new_with_offline_peer_interception`], see its docs.
			///
			/// # Failure Behavior and Persistence
			/// This event will eventually be replayed after failures-to-handle (i.e., the event handler
			/// returning `Err(ReplayEvent ())`), but won't be persisted across restarts.
			///
			/// [`OnionMessenger::new_with_offline_peer_interception`]: crate::onion_message::messenger::OnionMessenger::new_with_offline_peer_interception
			case OnionMessagePeerConnected

		}

		public func getValueType() -> EventType {
			switch self.cType!.tag {
				case LDKEvent_FundingGenerationReady:
					return .FundingGenerationReady

				case LDKEvent_FundingTxBroadcastSafe:
					return .FundingTxBroadcastSafe

				case LDKEvent_PaymentClaimable:
					return .PaymentClaimable

				case LDKEvent_PaymentClaimed:
					return .PaymentClaimed

				case LDKEvent_ConnectionNeeded:
					return .ConnectionNeeded

				case LDKEvent_InvoiceReceived:
					return .InvoiceReceived

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

				case LDKEvent_OnionMessageIntercepted:
					return .OnionMessageIntercepted

				case LDKEvent_OnionMessagePeerConnected:
					return .OnionMessagePeerConnected

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
			temporaryChannelId: Bindings.ChannelId, counterpartyNodeId: [UInt8], channelValueSatoshis: UInt64,
			outputScript: [UInt8], userChannelId: [UInt8]
		) -> Event {
			// native call variable prep

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
				temporaryChannelId.dynamicallyDangledClone().cType!, counterpartyNodeIdPrimitiveWrapper.cType!,
				channelValueSatoshis, outputScriptVector.cType!, userChannelIdPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			counterpartyNodeIdPrimitiveWrapper.noOpRetain()

			// outputScriptVector.noOpRetain()

			// for elided types, we need this
			userChannelIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Event(cType: nativeCallResult, instantiationContext: "Event.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new FundingTxBroadcastSafe-variant Event
		public class func initWithFundingTxBroadcastSafe(
			channelId: Bindings.ChannelId, userChannelId: [UInt8], fundingTxo: Bindings.OutPoint,
			counterpartyNodeId: [UInt8], formerTemporaryChannelId: Bindings.ChannelId
		) -> Event {
			// native call variable prep

			let userChannelIdPrimitiveWrapper = U128(
				value: userChannelId, instantiationContext: "Event.swift::\(#function):\(#line)")

			let counterpartyNodeIdPrimitiveWrapper = PublicKey(
				value: counterpartyNodeId, instantiationContext: "Event.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = Event_funding_tx_broadcast_safe(
				channelId.dynamicallyDangledClone().cType!, userChannelIdPrimitiveWrapper.cType!,
				fundingTxo.dynamicallyDangledClone().cType!, counterpartyNodeIdPrimitiveWrapper.cType!,
				formerTemporaryChannelId.dynamicallyDangledClone().cType!)

			// cleanup

			// for elided types, we need this
			userChannelIdPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			counterpartyNodeIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Event(cType: nativeCallResult, instantiationContext: "Event.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new PaymentClaimable-variant Event
		public class func initWithPaymentClaimable(
			receiverNodeId: [UInt8], paymentHash: [UInt8], onionFields: Bindings.RecipientOnionFields,
			amountMsat: UInt64, counterpartySkimmedFeeMsat: UInt64, purpose: PaymentPurpose,
			viaChannelId: Bindings.ChannelId, viaUserChannelId: [UInt8]?, claimDeadline: UInt32?
		) -> Event {
			// native call variable prep

			let receiverNodeIdPrimitiveWrapper = PublicKey(
				value: receiverNodeId, instantiationContext: "Event.swift::\(#function):\(#line)")

			let paymentHashPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentHash, instantiationContext: "Event.swift::\(#function):\(#line)")

			let viaUserChannelIdOption = Option_U128Z(
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
				purpose.danglingClone().cType!, viaChannelId.dynamicallyDangledClone().cType!,
				viaUserChannelIdOption.cType!, claimDeadlineOption.cType!)

			// cleanup

			// for elided types, we need this
			receiverNodeIdPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			paymentHashPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Event(cType: nativeCallResult, instantiationContext: "Event.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new PaymentClaimed-variant Event
		public class func initWithPaymentClaimed(
			receiverNodeId: [UInt8], paymentHash: [UInt8], amountMsat: UInt64, purpose: PaymentPurpose,
			htlcs: [ClaimedHTLC], senderIntendedTotalMsat: UInt64?, onionFields: Bindings.RecipientOnionFields
		) -> Event {
			// native call variable prep

			let receiverNodeIdPrimitiveWrapper = PublicKey(
				value: receiverNodeId, instantiationContext: "Event.swift::\(#function):\(#line)")

			let paymentHashPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentHash, instantiationContext: "Event.swift::\(#function):\(#line)")

			let htlcsVector = Vec_ClaimedHTLCZ(array: htlcs, instantiationContext: "Event.swift::\(#function):\(#line)")
				.dangle()

			let senderIntendedTotalMsatOption = Option_u64Z(
				some: senderIntendedTotalMsat, instantiationContext: "Event.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult = Event_payment_claimed(
				receiverNodeIdPrimitiveWrapper.cType!, paymentHashPrimitiveWrapper.cType!, amountMsat,
				purpose.danglingClone().cType!, htlcsVector.cType!, senderIntendedTotalMsatOption.cType!,
				onionFields.dynamicallyDangledClone().cType!)

			// cleanup

			// for elided types, we need this
			receiverNodeIdPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			paymentHashPrimitiveWrapper.noOpRetain()

			// htlcsVector.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Event(cType: nativeCallResult, instantiationContext: "Event.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new ConnectionNeeded-variant Event
		public class func initWithConnectionNeeded(nodeId: [UInt8], addresses: [SocketAddress]) -> Event {
			// native call variable prep

			let nodeIdPrimitiveWrapper = PublicKey(
				value: nodeId, instantiationContext: "Event.swift::\(#function):\(#line)")

			let addressesVector = Vec_SocketAddressZ(
				array: addresses, instantiationContext: "Event.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = Event_connection_needed(nodeIdPrimitiveWrapper.cType!, addressesVector.cType!)

			// cleanup

			// for elided types, we need this
			nodeIdPrimitiveWrapper.noOpRetain()

			// addressesVector.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Event(cType: nativeCallResult, instantiationContext: "Event.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new InvoiceReceived-variant Event
		public class func initWithInvoiceReceived(
			paymentId: [UInt8], invoice: Bindings.Bolt12Invoice, context: OffersContext?, responder: Bindings.Responder
		) -> Event {
			// native call variable prep

			let paymentIdPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentId, instantiationContext: "Event.swift::\(#function):\(#line)")

			let contextOption = Option_OffersContextZ(
				some: context, instantiationContext: "Event.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult = Event_invoice_received(
				paymentIdPrimitiveWrapper.cType!, invoice.dynamicallyDangledClone().cType!, contextOption.cType!,
				responder.dynamicallyDangledClone().cType!)

			// cleanup

			// for elided types, we need this
			paymentIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Event(cType: nativeCallResult, instantiationContext: "Event.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new PaymentSent-variant Event
		public class func initWithPaymentSent(
			paymentId: [UInt8]?, paymentPreimage: [UInt8], paymentHash: [UInt8], feePaidMsat: UInt64?
		) -> Event {
			// native call variable prep

			let paymentIdOption = Option_ThirtyTwoBytesZ(
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
		public class func initWithPaymentFailed(
			paymentId: [UInt8], paymentHash: [UInt8]?, reason: PaymentFailureReason?
		) -> Event {
			// native call variable prep

			let paymentIdPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentId, instantiationContext: "Event.swift::\(#function):\(#line)")

			let paymentHashOption = Option_ThirtyTwoBytesZ(
				some: paymentHash, instantiationContext: "Event.swift::\(#function):\(#line)"
			)
			.danglingClone()

			let reasonOption = Option_PaymentFailureReasonZ(
				some: reason, instantiationContext: "Event.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult = Event_payment_failed(
				paymentIdPrimitiveWrapper.cType!, paymentHashOption.cType!, reasonOption.cType!)

			// cleanup

			// for elided types, we need this
			paymentIdPrimitiveWrapper.noOpRetain()


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

			let paymentHashOption = Option_ThirtyTwoBytesZ(
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

			let paymentIdOption = Option_ThirtyTwoBytesZ(
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
		public class func initWithSpendableOutputs(outputs: [SpendableOutputDescriptor], channelId: Bindings.ChannelId)
			-> Event
		{
			// native call variable prep

			let outputsVector = Vec_SpendableOutputDescriptorZ(
				array: outputs, instantiationContext: "Event.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = Event_spendable_outputs(
				outputsVector.cType!, channelId.dynamicallyDangledClone().cType!)

			// cleanup

			// outputsVector.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Event(cType: nativeCallResult, instantiationContext: "Event.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new PaymentForwarded-variant Event
		public class func initWithPaymentForwarded(
			prevChannelId: Bindings.ChannelId, nextChannelId: Bindings.ChannelId, prevUserChannelId: [UInt8]?,
			nextUserChannelId: [UInt8]?, totalFeeEarnedMsat: UInt64?, skimmedFeeMsat: UInt64?, claimFromOnchainTx: Bool,
			outboundAmountForwardedMsat: UInt64?
		) -> Event {
			// native call variable prep

			let prevUserChannelIdOption = Option_U128Z(
				some: prevUserChannelId, instantiationContext: "Event.swift::\(#function):\(#line)"
			)
			.danglingClone()

			let nextUserChannelIdOption = Option_U128Z(
				some: nextUserChannelId, instantiationContext: "Event.swift::\(#function):\(#line)"
			)
			.danglingClone()

			let totalFeeEarnedMsatOption = Option_u64Z(
				some: totalFeeEarnedMsat, instantiationContext: "Event.swift::\(#function):\(#line)"
			)
			.danglingClone()

			let skimmedFeeMsatOption = Option_u64Z(
				some: skimmedFeeMsat, instantiationContext: "Event.swift::\(#function):\(#line)"
			)
			.danglingClone()

			let outboundAmountForwardedMsatOption = Option_u64Z(
				some: outboundAmountForwardedMsat, instantiationContext: "Event.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult = Event_payment_forwarded(
				prevChannelId.dynamicallyDangledClone().cType!, nextChannelId.dynamicallyDangledClone().cType!,
				prevUserChannelIdOption.cType!, nextUserChannelIdOption.cType!, totalFeeEarnedMsatOption.cType!,
				skimmedFeeMsatOption.cType!, claimFromOnchainTx, outboundAmountForwardedMsatOption.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Event(cType: nativeCallResult, instantiationContext: "Event.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new ChannelPending-variant Event
		public class func initWithChannelPending(
			channelId: Bindings.ChannelId, userChannelId: [UInt8], formerTemporaryChannelId: Bindings.ChannelId,
			counterpartyNodeId: [UInt8], fundingTxo: Bindings.OutPoint, channelType: Bindings.ChannelTypeFeatures
		) -> Event {
			// native call variable prep

			let userChannelIdPrimitiveWrapper = U128(
				value: userChannelId, instantiationContext: "Event.swift::\(#function):\(#line)")

			let counterpartyNodeIdPrimitiveWrapper = PublicKey(
				value: counterpartyNodeId, instantiationContext: "Event.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = Event_channel_pending(
				channelId.dynamicallyDangledClone().cType!, userChannelIdPrimitiveWrapper.cType!,
				formerTemporaryChannelId.dynamicallyDangledClone().cType!, counterpartyNodeIdPrimitiveWrapper.cType!,
				fundingTxo.dynamicallyDangledClone().cType!, channelType.dynamicallyDangledClone().cType!)

			// cleanup

			// for elided types, we need this
			userChannelIdPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			counterpartyNodeIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Event(cType: nativeCallResult, instantiationContext: "Event.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new ChannelReady-variant Event
		public class func initWithChannelReady(
			channelId: Bindings.ChannelId, userChannelId: [UInt8], counterpartyNodeId: [UInt8],
			channelType: Bindings.ChannelTypeFeatures
		) -> Event {
			// native call variable prep

			let userChannelIdPrimitiveWrapper = U128(
				value: userChannelId, instantiationContext: "Event.swift::\(#function):\(#line)")

			let counterpartyNodeIdPrimitiveWrapper = PublicKey(
				value: counterpartyNodeId, instantiationContext: "Event.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = Event_channel_ready(
				channelId.dynamicallyDangledClone().cType!, userChannelIdPrimitiveWrapper.cType!,
				counterpartyNodeIdPrimitiveWrapper.cType!, channelType.dynamicallyDangledClone().cType!)

			// cleanup

			// for elided types, we need this
			userChannelIdPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			counterpartyNodeIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Event(cType: nativeCallResult, instantiationContext: "Event.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new ChannelClosed-variant Event
		public class func initWithChannelClosed(
			channelId: Bindings.ChannelId, userChannelId: [UInt8], reason: ClosureReason, counterpartyNodeId: [UInt8],
			channelCapacitySats: UInt64?, channelFundingTxo: Bindings.OutPoint
		) -> Event {
			// native call variable prep

			let userChannelIdPrimitiveWrapper = U128(
				value: userChannelId, instantiationContext: "Event.swift::\(#function):\(#line)")

			let counterpartyNodeIdPrimitiveWrapper = PublicKey(
				value: counterpartyNodeId, instantiationContext: "Event.swift::\(#function):\(#line)")

			let channelCapacitySatsOption = Option_u64Z(
				some: channelCapacitySats, instantiationContext: "Event.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult = Event_channel_closed(
				channelId.dynamicallyDangledClone().cType!, userChannelIdPrimitiveWrapper.cType!,
				reason.danglingClone().cType!, counterpartyNodeIdPrimitiveWrapper.cType!,
				channelCapacitySatsOption.cType!, channelFundingTxo.dynamicallyDangledClone().cType!)

			// cleanup

			// for elided types, we need this
			userChannelIdPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			counterpartyNodeIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Event(cType: nativeCallResult, instantiationContext: "Event.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new DiscardFunding-variant Event
		public class func initWithDiscardFunding(channelId: Bindings.ChannelId, fundingInfo: FundingInfo) -> Event {
			// native call variable prep


			// native method call
			let nativeCallResult = Event_discard_funding(
				channelId.dynamicallyDangledClone().cType!, fundingInfo.danglingClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Event(cType: nativeCallResult, instantiationContext: "Event.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new OpenChannelRequest-variant Event
		public class func initWithOpenChannelRequest(
			temporaryChannelId: Bindings.ChannelId, counterpartyNodeId: [UInt8], fundingSatoshis: UInt64,
			pushMsat: UInt64, channelType: Bindings.ChannelTypeFeatures, isAnnounced: Bool,
			params: Bindings.ChannelParameters
		) -> Event {
			// native call variable prep

			let counterpartyNodeIdPrimitiveWrapper = PublicKey(
				value: counterpartyNodeId, instantiationContext: "Event.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = Event_open_channel_request(
				temporaryChannelId.dynamicallyDangledClone().cType!, counterpartyNodeIdPrimitiveWrapper.cType!,
				fundingSatoshis, pushMsat, channelType.dynamicallyDangledClone().cType!, isAnnounced,
				params.dynamicallyDangledClone().cType!)

			// cleanup

			// for elided types, we need this
			counterpartyNodeIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Event(cType: nativeCallResult, instantiationContext: "Event.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new HTLCHandlingFailed-variant Event
		public class func initWithHtlchandlingFailed(
			prevChannelId: Bindings.ChannelId, failedNextDestination: HTLCDestination
		) -> Event {
			// native call variable prep


			// native method call
			let nativeCallResult = Event_htlchandling_failed(
				prevChannelId.dynamicallyDangledClone().cType!, failedNextDestination.danglingClone().cType!)

			// cleanup


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

		/// Utility method to constructs a new OnionMessageIntercepted-variant Event
		public class func initWithOnionMessageIntercepted(peerNodeId: [UInt8], message: Bindings.OnionMessage) -> Event
		{
			// native call variable prep

			let peerNodeIdPrimitiveWrapper = PublicKey(
				value: peerNodeId, instantiationContext: "Event.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = Event_onion_message_intercepted(
				peerNodeIdPrimitiveWrapper.cType!, message.dynamicallyDangledClone().cType!)

			// cleanup

			// for elided types, we need this
			peerNodeIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Event(cType: nativeCallResult, instantiationContext: "Event.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new OnionMessagePeerConnected-variant Event
		public class func initWithOnionMessagePeerConnected(peerNodeId: [UInt8]) -> Event {
			// native call variable prep

			let peerNodeIdPrimitiveWrapper = PublicKey(
				value: peerNodeId, instantiationContext: "Event.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = Event_onion_message_peer_connected(peerNodeIdPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			peerNodeIdPrimitiveWrapper.noOpRetain()


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

		public func getValueAsFundingTxBroadcastSafe() -> FundingTxBroadcastSafe? {
			if self.cType?.tag != LDKEvent_FundingTxBroadcastSafe {
				return nil
			}

			return Event_LDKFundingTxBroadcastSafe_Body(
				cType: self.cType!.funding_tx_broadcast_safe,
				instantiationContext: "Event.swift::\(#function):\(#line)", anchor: self)
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

		public func getValueAsConnectionNeeded() -> ConnectionNeeded? {
			if self.cType?.tag != LDKEvent_ConnectionNeeded {
				return nil
			}

			return Event_LDKConnectionNeeded_Body(
				cType: self.cType!.connection_needed, instantiationContext: "Event.swift::\(#function):\(#line)",
				anchor: self)
		}

		public func getValueAsInvoiceReceived() -> InvoiceReceived? {
			if self.cType?.tag != LDKEvent_InvoiceReceived {
				return nil
			}

			return Event_LDKInvoiceReceived_Body(
				cType: self.cType!.invoice_received, instantiationContext: "Event.swift::\(#function):\(#line)",
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

		public func getValueAsOnionMessageIntercepted() -> OnionMessageIntercepted? {
			if self.cType?.tag != LDKEvent_OnionMessageIntercepted {
				return nil
			}

			return Event_LDKOnionMessageIntercepted_Body(
				cType: self.cType!.onion_message_intercepted,
				instantiationContext: "Event.swift::\(#function):\(#line)", anchor: self)
		}

		public func getValueAsOnionMessagePeerConnected() -> OnionMessagePeerConnected? {
			if self.cType?.tag != LDKEvent_OnionMessagePeerConnected {
				return nil
			}

			return Event_LDKOnionMessagePeerConnected_Body(
				cType: self.cType!.onion_message_peer_connected,
				instantiationContext: "Event.swift::\(#function):\(#line)", anchor: self)
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
			public func getTemporaryChannelId() -> Bindings.ChannelId {
				// return value (do some wrapping)
				let returnValue = Bindings.ChannelId(
					cType: self.cType!.temporary_channel_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self)

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

			/// The `user_channel_id` value passed in to [`ChannelManager::create_channel`] for outbound
			/// channels, or to [`ChannelManager::accept_inbound_channel`] for inbound channels if
			/// [`UserConfig::manually_accept_inbound_channels`] config flag is set to true. Otherwise
			/// `user_channel_id` will be randomized for an inbound channel.  This may be zero for objects
			/// serialized with LDK versions prior to 0.0.113.
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


		}


		///
		internal typealias Event_LDKFundingTxBroadcastSafe_Body = FundingTxBroadcastSafe


		///
		public class FundingTxBroadcastSafe: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKEvent_LDKFundingTxBroadcastSafe_Body?

			internal init(cType: LDKEvent_LDKFundingTxBroadcastSafe_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKEvent_LDKFundingTxBroadcastSafe_Body, instantiationContext: String, anchor: NativeTypeWrapper
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKEvent_LDKFundingTxBroadcastSafe_Body, instantiationContext: String, anchor: NativeTypeWrapper,
				dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// The `channel_id` indicating which channel has reached this stage.
			public func getChannelId() -> Bindings.ChannelId {
				// return value (do some wrapping)
				let returnValue = Bindings.ChannelId(
					cType: self.cType!.channel_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self)

				return returnValue
			}

			/// The `user_channel_id` value passed in to [`ChannelManager::create_channel`].
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

			/// The outpoint of the channel's funding transaction.
			public func getFundingTxo() -> Bindings.OutPoint {
				// return value (do some wrapping)
				let returnValue = Bindings.OutPoint(
					cType: self.cType!.funding_txo, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self)

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

			/// The `temporary_channel_id` this channel used to be known by during channel establishment.
			public func getFormerTemporaryChannelId() -> Bindings.ChannelId {
				// return value (do some wrapping)
				let returnValue = Bindings.ChannelId(
					cType: self.cType!.former_temporary_channel_id,
					instantiationContext: "Event.swift::\(#function):\(#line)", anchor: self)

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
			public func getViaChannelId() -> Bindings.ChannelId {
				// return value (do some wrapping)
				let returnValue = Bindings.ChannelId(
					cType: self.cType!.via_channel_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self)

				return returnValue
			}

			/// The `user_channel_id` indicating over which channel we received the payment.
			public func getViaUserChannelId() -> [UInt8]? {
				// return value (do some wrapping)
				let returnValue = Option_U128Z(
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

			/// The HTLCs that comprise the claimed payment. This will be empty for events serialized prior
			/// to LDK version 0.0.117.
			public func getHtlcs() -> [ClaimedHTLC] {
				// return value (do some wrapping)
				let returnValue = Vec_ClaimedHTLCZ(
					cType: self.cType!.htlcs, instantiationContext: "Event.swift::\(#function):\(#line)", anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The sender-intended sum total of all the MPP parts. This will be `None` for events
			/// serialized prior to LDK version 0.0.117.
			public func getSenderIntendedTotalMsat() -> UInt64? {
				// return value (do some wrapping)
				let returnValue = Option_u64Z(
					cType: self.cType!.sender_intended_total_msat,
					instantiationContext: "Event.swift::\(#function):\(#line)", anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The fields in the onion which were received with each HTLC. Only fields which were
			/// identical in each HTLC involved in the payment will be included here.
			///
			/// Payments received on LDK versions prior to 0.0.124 will have this field unset.
			///
			/// Note that this (or a relevant inner pointer) may be NULL or all-0s to represent None
			public func getOnionFields() -> Bindings.RecipientOnionFields {
				// return value (do some wrapping)
				let returnValue = Bindings.RecipientOnionFields(
					cType: self.cType!.onion_fields, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self)

				return returnValue
			}


		}


		///
		internal typealias Event_LDKConnectionNeeded_Body = ConnectionNeeded


		///
		public class ConnectionNeeded: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKEvent_LDKConnectionNeeded_Body?

			internal init(cType: LDKEvent_LDKConnectionNeeded_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKEvent_LDKConnectionNeeded_Body, instantiationContext: String, anchor: NativeTypeWrapper
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKEvent_LDKConnectionNeeded_Body, instantiationContext: String, anchor: NativeTypeWrapper,
				dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// The node id for the node needing a connection.
			public func getNodeId() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = PublicKey(
					cType: self.cType!.node_id, instantiationContext: "Event.swift::\(#function):\(#line)", anchor: self
				)
				.getValue()

				return returnValue
			}

			/// Sockets for connecting to the node.
			public func getAddresses() -> [SocketAddress] {
				// return value (do some wrapping)
				let returnValue = Vec_SocketAddressZ(
					cType: self.cType!.addresses, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}


		}


		///
		internal typealias Event_LDKInvoiceReceived_Body = InvoiceReceived


		///
		public class InvoiceReceived: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKEvent_LDKInvoiceReceived_Body?

			internal init(cType: LDKEvent_LDKInvoiceReceived_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKEvent_LDKInvoiceReceived_Body, instantiationContext: String, anchor: NativeTypeWrapper
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKEvent_LDKInvoiceReceived_Body, instantiationContext: String, anchor: NativeTypeWrapper,
				dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// The `payment_id` associated with payment for the invoice.
			public func getPaymentId() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					cType: self.cType!.payment_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The invoice to pay.
			public func getInvoice() -> Bindings.Bolt12Invoice {
				// return value (do some wrapping)
				let returnValue = Bindings.Bolt12Invoice(
					cType: self.cType!.invoice, instantiationContext: "Event.swift::\(#function):\(#line)", anchor: self
				)

				return returnValue
			}

			/// The context of the [`BlindedMessagePath`] used to send the invoice.
			///
			/// [`BlindedMessagePath`]: crate::blinded_path::message::BlindedMessagePath
			public func getContext() -> OffersContext? {
				// return value (do some wrapping)
				let returnValue = Option_OffersContextZ(
					cType: self.cType!.context, instantiationContext: "Event.swift::\(#function):\(#line)", anchor: self
				)
				.getValue()

				return returnValue
			}

			/// A responder for replying with an [`InvoiceError`] if needed.
			///
			/// `None` if the invoice wasn't sent with a reply path.
			///
			/// [`InvoiceError`]: crate::offers::invoice_error::InvoiceError
			///
			/// Note that this (or a relevant inner pointer) may be NULL or all-0s to represent None
			public func getResponder() -> Bindings.Responder {
				// return value (do some wrapping)
				let returnValue = Bindings.Responder(
					cType: self.cType!.responder, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self)

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
				let returnValue = Option_ThirtyTwoBytesZ(
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
			/// This is only `None` for payments initiated on LDK versions prior to 0.0.103.
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

			/// The hash that was given to [`ChannelManager::send_payment`]. `None` if the payment failed
			/// before receiving an invoice when paying a BOLT12 [`Offer`].
			///
			/// [`ChannelManager::send_payment`]: crate::ln::channelmanager::ChannelManager::send_payment
			/// [`Offer`]: crate::offers::offer::Offer
			public func getPaymentHash() -> [UInt8]? {
				// return value (do some wrapping)
				let returnValue = Option_ThirtyTwoBytesZ(
					cType: self.cType!.payment_hash, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The reason the payment failed. This is only `None` for events generated or serialized
			/// by versions prior to 0.0.115, or when downgrading to a version with a reason that was
			/// added after.
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
				let returnValue = Option_ThirtyTwoBytesZ(
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
				let returnValue = Option_ThirtyTwoBytesZ(
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

			/// The `channel_id` indicating which channel the spendable outputs belong to.
			///
			/// This will always be `Some` for events generated by LDK versions 0.0.117 and above.
			///
			/// Note that this (or a relevant inner pointer) may be NULL or all-0s to represent None
			public func getChannelId() -> Bindings.ChannelId {
				// return value (do some wrapping)
				let returnValue = Bindings.ChannelId(
					cType: self.cType!.channel_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self)

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


			/// The channel id of the incoming channel between the previous node and us.
			///
			/// This is only `None` for events generated or serialized by versions prior to 0.0.107.
			///
			/// Note that this (or a relevant inner pointer) may be NULL or all-0s to represent None
			public func getPrevChannelId() -> Bindings.ChannelId {
				// return value (do some wrapping)
				let returnValue = Bindings.ChannelId(
					cType: self.cType!.prev_channel_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self)

				return returnValue
			}

			/// The channel id of the outgoing channel between the next node and us.
			///
			/// This is only `None` for events generated or serialized by versions prior to 0.0.107.
			///
			/// Note that this (or a relevant inner pointer) may be NULL or all-0s to represent None
			public func getNextChannelId() -> Bindings.ChannelId {
				// return value (do some wrapping)
				let returnValue = Bindings.ChannelId(
					cType: self.cType!.next_channel_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self)

				return returnValue
			}

			/// The `user_channel_id` of the incoming channel between the previous node and us.
			///
			/// This is only `None` for events generated or serialized by versions prior to 0.0.122.
			public func getPrevUserChannelId() -> [UInt8]? {
				// return value (do some wrapping)
				let returnValue = Option_U128Z(
					cType: self.cType!.prev_user_channel_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The `user_channel_id` of the outgoing channel between the next node and us.
			///
			/// This will be `None` if the payment was settled via an on-chain transaction. See the
			/// caveat described for the `total_fee_earned_msat` field. Moreover it will be `None` for
			/// events generated or serialized by versions prior to 0.0.122.
			public func getNextUserChannelId() -> [UInt8]? {
				// return value (do some wrapping)
				let returnValue = Option_U128Z(
					cType: self.cType!.next_user_channel_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The total fee, in milli-satoshis, which was earned as a result of the payment.
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
			/// `PaymentForwarded` events are generated for the same payment iff `total_fee_earned_msat` is
			/// `None`.
			public func getTotalFeeEarnedMsat() -> UInt64? {
				// return value (do some wrapping)
				let returnValue = Option_u64Z(
					cType: self.cType!.total_fee_earned_msat,
					instantiationContext: "Event.swift::\(#function):\(#line)", anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The share of the total fee, in milli-satoshis, which was withheld in addition to the
			/// forwarding fee.
			///
			/// This will only be `Some` if we forwarded an intercepted HTLC with less than the
			/// expected amount. This means our counterparty accepted to receive less than the invoice
			/// amount, e.g., by claiming the payment featuring a corresponding
			/// [`PaymentClaimable::counterparty_skimmed_fee_msat`].
			///
			/// Will also always be `None` for events serialized with LDK prior to version 0.0.122.
			///
			/// The caveat described above the `total_fee_earned_msat` field applies here as well.
			///
			/// [`PaymentClaimable::counterparty_skimmed_fee_msat`]: Self::PaymentClaimable::counterparty_skimmed_fee_msat
			public func getSkimmedFeeMsat() -> UInt64? {
				// return value (do some wrapping)
				let returnValue = Option_u64Z(
					cType: self.cType!.skimmed_fee_msat, instantiationContext: "Event.swift::\(#function):\(#line)",
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
			/// The caveat described above the `total_fee_earned_msat` field applies here as well.
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
			public func getChannelId() -> Bindings.ChannelId {
				// return value (do some wrapping)
				let returnValue = Bindings.ChannelId(
					cType: self.cType!.channel_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self)

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
			public func getFormerTemporaryChannelId() -> Bindings.ChannelId {
				// return value (do some wrapping)
				let returnValue = Bindings.ChannelId(
					cType: self.cType!.former_temporary_channel_id,
					instantiationContext: "Event.swift::\(#function):\(#line)", anchor: self)

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

			/// The features that this channel will operate with.
			///
			/// Will be `None` for channels created prior to LDK version 0.0.122.
			///
			/// Note that this (or a relevant inner pointer) may be NULL or all-0s to represent None
			public func getChannelType() -> Bindings.ChannelTypeFeatures {
				// return value (do some wrapping)
				let returnValue = Bindings.ChannelTypeFeatures(
					cType: self.cType!.channel_type, instantiationContext: "Event.swift::\(#function):\(#line)",
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
			public func getChannelId() -> Bindings.ChannelId {
				// return value (do some wrapping)
				let returnValue = Bindings.ChannelId(
					cType: self.cType!.channel_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self)

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
			public func getChannelId() -> Bindings.ChannelId {
				// return value (do some wrapping)
				let returnValue = Bindings.ChannelId(
					cType: self.cType!.channel_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self)

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

			/// Counterparty in the closed channel.
			///
			/// This field will be `None` for objects serialized prior to LDK 0.0.117.
			///
			/// Note that this (or a relevant inner pointer) may be NULL or all-0s to represent None
			public func getCounterpartyNodeId() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = PublicKey(
					cType: self.cType!.counterparty_node_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// Channel capacity of the closing channel (sats).
			///
			/// This field will be `None` for objects serialized prior to LDK 0.0.117.
			public func getChannelCapacitySats() -> UInt64? {
				// return value (do some wrapping)
				let returnValue = Option_u64Z(
					cType: self.cType!.channel_capacity_sats,
					instantiationContext: "Event.swift::\(#function):\(#line)", anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The original channel funding TXO; this helps checking for the existence and confirmation
			/// status of the closing tx.
			/// Note that for instances serialized in v0.0.119 or prior this will be missing (None).
			///
			/// Note that this (or a relevant inner pointer) may be NULL or all-0s to represent None
			public func getChannelFundingTxo() -> Bindings.OutPoint {
				// return value (do some wrapping)
				let returnValue = Bindings.OutPoint(
					cType: self.cType!.channel_funding_txo, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self)

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
			public func getChannelId() -> Bindings.ChannelId {
				// return value (do some wrapping)
				let returnValue = Bindings.ChannelId(
					cType: self.cType!.channel_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self)

				return returnValue
			}

			/// The full transaction received from the user
			public func getFundingInfo() -> FundingInfo {
				// return value (do some wrapping)
				let returnValue = FundingInfo(
					cType: self.cType!.funding_info, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self)

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
			public func getTemporaryChannelId() -> Bindings.ChannelId {
				// return value (do some wrapping)
				let returnValue = Bindings.ChannelId(
					cType: self.cType!.temporary_channel_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self)

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

			/// True if this channel is (or will be) publicly-announced.
			public func isAnnounced() -> Bool {
				// return value (do some wrapping)
				let returnValue = self.cType!.is_announced

				return returnValue
			}

			/// Channel parameters given by the counterparty.
			public func getParams() -> Bindings.ChannelParameters {
				// return value (do some wrapping)
				let returnValue = Bindings.ChannelParameters(
					cType: self.cType!.params, instantiationContext: "Event.swift::\(#function):\(#line)", anchor: self)

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
			public func getPrevChannelId() -> Bindings.ChannelId {
				// return value (do some wrapping)
				let returnValue = Bindings.ChannelId(
					cType: self.cType!.prev_channel_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self)

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


		///
		internal typealias Event_LDKOnionMessageIntercepted_Body = OnionMessageIntercepted


		///
		public class OnionMessageIntercepted: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKEvent_LDKOnionMessageIntercepted_Body?

			internal init(cType: LDKEvent_LDKOnionMessageIntercepted_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKEvent_LDKOnionMessageIntercepted_Body, instantiationContext: String, anchor: NativeTypeWrapper
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKEvent_LDKOnionMessageIntercepted_Body, instantiationContext: String,
				anchor: NativeTypeWrapper, dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// The node id of the offline peer.
			public func getPeerNodeId() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = PublicKey(
					cType: self.cType!.peer_node_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The onion message intended to be forwarded to `peer_node_id`.
			public func getMessage() -> Bindings.OnionMessage {
				// return value (do some wrapping)
				let returnValue = Bindings.OnionMessage(
					cType: self.cType!.message, instantiationContext: "Event.swift::\(#function):\(#line)", anchor: self
				)

				return returnValue
			}


		}


		///
		internal typealias Event_LDKOnionMessagePeerConnected_Body = OnionMessagePeerConnected


		///
		public class OnionMessagePeerConnected: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKEvent_LDKOnionMessagePeerConnected_Body?

			internal init(cType: LDKEvent_LDKOnionMessagePeerConnected_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKEvent_LDKOnionMessagePeerConnected_Body, instantiationContext: String,
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
				cType: LDKEvent_LDKOnionMessagePeerConnected_Body, instantiationContext: String,
				anchor: NativeTypeWrapper, dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// The node id of the peer we just connected to, who advertises support for
			/// onion messages.
			public func getPeerNodeId() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = PublicKey(
					cType: self.cType!.peer_node_id, instantiationContext: "Event.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}


		}


	}

}
