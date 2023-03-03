
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			/// Indicates an immediate error on [`ChannelManager::send_payment_with_retry`]. Further errors
			/// may be surfaced later via [`Event::PaymentPathFailed`] and [`Event::PaymentFailed`].
			/// 
			/// [`ChannelManager::send_payment_with_retry`]: crate::ln::channelmanager::ChannelManager::send_payment_with_retry
			/// [`Event::PaymentPathFailed`]: crate::util::events::Event::PaymentPathFailed
			/// [`Event::PaymentFailed`]: crate::util::events::Event::PaymentFailed
			public typealias RetryableSendFailure = Bindings.RetryableSendFailure

			extension Bindings {

				/// Indicates an immediate error on [`ChannelManager::send_payment_with_retry`]. Further errors
				/// may be surfaced later via [`Event::PaymentPathFailed`] and [`Event::PaymentFailed`].
				/// 
				/// [`ChannelManager::send_payment_with_retry`]: crate::ln::channelmanager::ChannelManager::send_payment_with_retry
				/// [`Event::PaymentPathFailed`]: crate::util::events::Event::PaymentPathFailed
				/// [`Event::PaymentFailed`]: crate::util::events::Event::PaymentFailed
				public enum RetryableSendFailure {

					
					/// The provided [`PaymentParameters::expiry_time`] indicated that the payment has expired. Note
					/// that this error is *not* caused by [`Retry::Timeout`].
					/// 
					/// [`PaymentParameters::expiry_time`]: crate::routing::router::PaymentParameters::expiry_time
					case PaymentExpired
			
					/// We were unable to find a route to the destination.
					case RouteNotFound
			
					/// Indicates that a payment for the provided [`PaymentId`] is already in-flight and has not
					/// yet completed (i.e. generated an [`Event::PaymentSent`] or [`Event::PaymentFailed`]).
					/// 
					/// [`PaymentId`]: crate::ln::channelmanager::PaymentId
					/// [`Event::PaymentSent`]: crate::util::events::Event::PaymentSent
					/// [`Event::PaymentFailed`]: crate::util::events::Event::PaymentFailed
					case DuplicatePayment
			

					internal init (value: LDKRetryableSendFailure) {
						switch value {
							
							case LDKRetryableSendFailure_PaymentExpired:
								self = .PaymentExpired
			
							case LDKRetryableSendFailure_RouteNotFound:
								self = .RouteNotFound
			
							case LDKRetryableSendFailure_DuplicatePayment:
								self = .DuplicatePayment
			
							default:
								Bindings.print("Error: Invalid value type for RetryableSendFailure! Aborting.", severity: .ERROR)
								abort()
				
						}
					}

					internal func getCValue() -> LDKRetryableSendFailure {
						switch self {
							
							case .PaymentExpired:
								return LDKRetryableSendFailure_PaymentExpired
			
							case .RouteNotFound:
								return LDKRetryableSendFailure_RouteNotFound
			
							case .DuplicatePayment:
								return LDKRetryableSendFailure_DuplicatePayment
			
						}
					}

				}

			}
		