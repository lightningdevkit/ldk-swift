import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


/// The reason the payment failed. Used in [`Event::PaymentFailed`].
public typealias PaymentFailureReason = Bindings.PaymentFailureReason

extension Bindings {

	/// The reason the payment failed. Used in [`Event::PaymentFailed`].
	public enum PaymentFailureReason {


		/// The intended recipient rejected our payment.
		///
		/// Also used for [`UnknownRequiredFeatures`] and [`InvoiceRequestRejected`] when downgrading to
		/// version prior to 0.0.124.
		///
		/// [`UnknownRequiredFeatures`]: Self::UnknownRequiredFeatures
		/// [`InvoiceRequestRejected`]: Self::InvoiceRequestRejected
		case RecipientRejected

		/// The user chose to abandon this payment by calling [`ChannelManager::abandon_payment`].
		///
		/// [`ChannelManager::abandon_payment`]: crate::ln::channelmanager::ChannelManager::abandon_payment
		case UserAbandoned

		/// We exhausted all of our retry attempts while trying to send the payment, or we
		/// exhausted the [`Retry::Timeout`] if the user set one.
		/// If at any point a retry attempt failed while being forwarded along the path, an [`Event::PaymentPathFailed`] will
		/// have come before this.
		///
		/// [`Retry::Timeout`]: crate::ln::channelmanager::Retry::Timeout
		case RetriesExhausted

		/// The payment expired while retrying, based on the provided
		/// [`PaymentParameters::expiry_time`].
		///
		/// Also used for [`InvoiceRequestExpired`] when downgrading to version prior to 0.0.124.
		///
		/// [`PaymentParameters::expiry_time`]: crate::routing::router::PaymentParameters::expiry_time
		/// [`InvoiceRequestExpired`]: Self::InvoiceRequestExpired
		case PaymentExpired

		/// We failed to find a route while sending or retrying the payment.
		///
		/// Note that this generally indicates that we've exhausted the available set of possible
		/// routes - we tried the payment over a few routes but were not able to find any further
		/// candidate routes beyond those.
		///
		/// Also used for [`BlindedPathCreationFailed`] when downgrading to versions prior to 0.0.124.
		///
		/// [`BlindedPathCreationFailed`]: Self::BlindedPathCreationFailed
		case RouteNotFound

		/// This error should generally never happen. This likely means that there is a problem with
		/// your router.
		case UnexpectedError

		/// An invoice was received that required unknown features.
		case UnknownRequiredFeatures

		/// A [`Bolt12Invoice`] was not received in a reasonable amount of time.
		case InvoiceRequestExpired

		/// An [`InvoiceRequest`] for the payment was rejected by the recipient.
		///
		/// [`InvoiceRequest`]: crate::offers::invoice_request::InvoiceRequest
		case InvoiceRequestRejected

		/// Failed to create a blinded path back to ourselves.
		/// We attempted to initiate payment to a static invoice but failed to create a reply path for our
		/// [`HeldHtlcAvailable`] message.
		///
		/// [`HeldHtlcAvailable`]: crate::onion_message::async_payments::HeldHtlcAvailable
		case BlindedPathCreationFailed


		internal init(value: LDKPaymentFailureReason) {
			switch value {

				case LDKPaymentFailureReason_RecipientRejected:
					self = .RecipientRejected

				case LDKPaymentFailureReason_UserAbandoned:
					self = .UserAbandoned

				case LDKPaymentFailureReason_RetriesExhausted:
					self = .RetriesExhausted

				case LDKPaymentFailureReason_PaymentExpired:
					self = .PaymentExpired

				case LDKPaymentFailureReason_RouteNotFound:
					self = .RouteNotFound

				case LDKPaymentFailureReason_UnexpectedError:
					self = .UnexpectedError

				case LDKPaymentFailureReason_UnknownRequiredFeatures:
					self = .UnknownRequiredFeatures

				case LDKPaymentFailureReason_InvoiceRequestExpired:
					self = .InvoiceRequestExpired

				case LDKPaymentFailureReason_InvoiceRequestRejected:
					self = .InvoiceRequestRejected

				case LDKPaymentFailureReason_BlindedPathCreationFailed:
					self = .BlindedPathCreationFailed

				default:
					Bindings.print("Error: Invalid value type for PaymentFailureReason! Aborting.", severity: .ERROR)
					abort()

			}
		}

		internal func getCValue() -> LDKPaymentFailureReason {
			switch self {

				case .RecipientRejected:
					return LDKPaymentFailureReason_RecipientRejected

				case .UserAbandoned:
					return LDKPaymentFailureReason_UserAbandoned

				case .RetriesExhausted:
					return LDKPaymentFailureReason_RetriesExhausted

				case .PaymentExpired:
					return LDKPaymentFailureReason_PaymentExpired

				case .RouteNotFound:
					return LDKPaymentFailureReason_RouteNotFound

				case .UnexpectedError:
					return LDKPaymentFailureReason_UnexpectedError

				case .UnknownRequiredFeatures:
					return LDKPaymentFailureReason_UnknownRequiredFeatures

				case .InvoiceRequestExpired:
					return LDKPaymentFailureReason_InvoiceRequestExpired

				case .InvoiceRequestRejected:
					return LDKPaymentFailureReason_InvoiceRequestRejected

				case .BlindedPathCreationFailed:
					return LDKPaymentFailureReason_BlindedPathCreationFailed

			}
		}

	}

}
