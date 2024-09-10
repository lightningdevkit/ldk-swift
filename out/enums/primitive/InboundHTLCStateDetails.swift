import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


/// Exposes the state of pending inbound HTLCs.
///
/// At a high level, an HTLC being forwarded from one Lightning node to another Lightning node goes
/// through the following states in the state machine:
/// - Announced for addition by the originating node through the update_add_htlc message.
/// - Added to the commitment transaction of the receiving node and originating node in turn
/// through the exchange of commitment_signed and revoke_and_ack messages.
/// - Announced for resolution (fulfillment or failure) by the receiving node through either one of
/// the update_fulfill_htlc, update_fail_htlc, and update_fail_malformed_htlc messages.
/// - Removed from the commitment transaction of the originating node and receiving node in turn
/// through the exchange of commitment_signed and revoke_and_ack messages.
///
/// This can be used to inspect what next message an HTLC is waiting for to advance its state.
public typealias InboundHTLCStateDetails = Bindings.InboundHTLCStateDetails

extension Bindings {

	/// Exposes the state of pending inbound HTLCs.
	///
	/// At a high level, an HTLC being forwarded from one Lightning node to another Lightning node goes
	/// through the following states in the state machine:
	/// - Announced for addition by the originating node through the update_add_htlc message.
	/// - Added to the commitment transaction of the receiving node and originating node in turn
	/// through the exchange of commitment_signed and revoke_and_ack messages.
	/// - Announced for resolution (fulfillment or failure) by the receiving node through either one of
	/// the update_fulfill_htlc, update_fail_htlc, and update_fail_malformed_htlc messages.
	/// - Removed from the commitment transaction of the originating node and receiving node in turn
	/// through the exchange of commitment_signed and revoke_and_ack messages.
	///
	/// This can be used to inspect what next message an HTLC is waiting for to advance its state.
	public enum InboundHTLCStateDetails {


		/// We have added this HTLC in our commitment transaction by receiving commitment_signed and
		/// returning revoke_and_ack. We are awaiting the appropriate revoke_and_ack's from the remote
		/// before this HTLC is included on the remote commitment transaction.
		case AwaitingRemoteRevokeToAdd

		/// This HTLC has been included in the commitment_signed and revoke_and_ack messages on both sides
		/// and is included in both commitment transactions.
		///
		/// This HTLC is now safe to either forward or be claimed as a payment by us. The HTLC will
		/// remain in this state until the forwarded upstream HTLC has been resolved and we resolve this
		/// HTLC correspondingly, or until we claim it as a payment. If it is part of a multipart
		/// payment, it will only be claimed together with other required parts.
		case Committed

		/// We have received the preimage for this HTLC and it is being removed by fulfilling it with
		/// update_fulfill_htlc. This HTLC is still on both commitment transactions, but we are awaiting
		/// the appropriate revoke_and_ack's from the remote before this HTLC is removed from the remote
		/// commitment transaction after update_fulfill_htlc.
		case AwaitingRemoteRevokeToRemoveFulfill

		/// The HTLC is being removed by failing it with update_fail_htlc or update_fail_malformed_htlc.
		/// This HTLC is still on both commitment transactions, but we are awaiting the appropriate
		/// revoke_and_ack's from the remote before this HTLC is removed from the remote commitment
		/// transaction.
		case AwaitingRemoteRevokeToRemoveFail


		internal init(value: LDKInboundHTLCStateDetails) {
			switch value {

				case LDKInboundHTLCStateDetails_AwaitingRemoteRevokeToAdd:
					self = .AwaitingRemoteRevokeToAdd

				case LDKInboundHTLCStateDetails_Committed:
					self = .Committed

				case LDKInboundHTLCStateDetails_AwaitingRemoteRevokeToRemoveFulfill:
					self = .AwaitingRemoteRevokeToRemoveFulfill

				case LDKInboundHTLCStateDetails_AwaitingRemoteRevokeToRemoveFail:
					self = .AwaitingRemoteRevokeToRemoveFail

				default:
					Bindings.print("Error: Invalid value type for InboundHTLCStateDetails! Aborting.", severity: .ERROR)
					abort()

			}
		}

		internal func getCValue() -> LDKInboundHTLCStateDetails {
			switch self {

				case .AwaitingRemoteRevokeToAdd:
					return LDKInboundHTLCStateDetails_AwaitingRemoteRevokeToAdd

				case .Committed:
					return LDKInboundHTLCStateDetails_Committed

				case .AwaitingRemoteRevokeToRemoveFulfill:
					return LDKInboundHTLCStateDetails_AwaitingRemoteRevokeToRemoveFulfill

				case .AwaitingRemoteRevokeToRemoveFail:
					return LDKInboundHTLCStateDetails_AwaitingRemoteRevokeToRemoveFail

			}
		}

	}

}
