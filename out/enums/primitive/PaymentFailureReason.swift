
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			/// The reason the payment failed. Used in [`Event::PaymentFailed`].
			public typealias PaymentFailureReason = Bindings.PaymentFailureReason

			extension Bindings {

				/// The reason the payment failed. Used in [`Event::PaymentFailed`].
				public enum PaymentFailureReason {

					
					/// The intended recipient rejected our payment.
					case RecipientRejected
			
					/// The user chose to abandon this payment by calling [`ChannelManager::abandon_payment`].
					/// 
					/// [`ChannelManager::abandon_payment`]: crate::ln::channelmanager::ChannelManager::abandon_payment
					case UserAbandoned
			
					/// We exhausted all of our retry attempts while trying to send the payment, or we
					/// exhausted the [`Retry::Timeout`] if the user set one. If at any point a retry
					/// attempt failed while being forwarded along the path, an [`Event::PaymentPathFailed`] will
					/// have come before this.
					/// 
					/// [`Retry::Timeout`]: crate::ln::channelmanager::Retry::Timeout
					case RetriesExhausted
			
					/// The payment expired while retrying, based on the provided
					/// [`PaymentParameters::expiry_time`].
					/// 
					/// [`PaymentParameters::expiry_time`]: crate::routing::router::PaymentParameters::expiry_time
					case PaymentExpired
			
					/// We failed to find a route while retrying the payment.
					case RouteNotFound
			
					/// This error should generally never happen. This likely means that there is a problem with
					/// your router.
					case UnexpectedError
			

					internal init (value: LDKPaymentFailureReason) {
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
			
						}
					}

				}

			}
		