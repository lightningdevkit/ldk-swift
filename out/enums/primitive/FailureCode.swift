
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			/// This enum is used to specify which error data to send to peers when failing back an HTLC
			/// using [`ChannelManager::fail_htlc_backwards_with_reason`].
			/// 
			/// For more info on failure codes, see <https://github.com/lightning/bolts/blob/master/04-onion-routing.md#failure-messages>.
			public typealias FailureCode = Bindings.FailureCode

			extension Bindings {

				/// This enum is used to specify which error data to send to peers when failing back an HTLC
				/// using [`ChannelManager::fail_htlc_backwards_with_reason`].
				/// 
				/// For more info on failure codes, see <https://github.com/lightning/bolts/blob/master/04-onion-routing.md#failure-messages>.
				public enum FailureCode {

					
					/// We had a temporary error processing the payment. Useful if no other error codes fit
					/// and you want to indicate that the payer may want to retry.
					case TemporaryNodeFailure
			
					/// We have a required feature which was not in this onion. For example, you may require
					/// some additional metadata that was not provided with this payment.
					case RequiredNodeFeatureMissing
			
					/// You may wish to use this when a `payment_preimage` is unknown, or the CLTV expiry of
					/// the HTLC is too close to the current block height for safe handling.
					/// Using this failure code in [`ChannelManager::fail_htlc_backwards_with_reason`] is
					/// equivalent to calling [`ChannelManager::fail_htlc_backwards`].
					case IncorrectOrUnknownPaymentDetails
			

					internal init (value: LDKFailureCode) {
						switch value {
							
							case LDKFailureCode_TemporaryNodeFailure:
								self = .TemporaryNodeFailure
			
							case LDKFailureCode_RequiredNodeFeatureMissing:
								self = .RequiredNodeFeatureMissing
			
							case LDKFailureCode_IncorrectOrUnknownPaymentDetails:
								self = .IncorrectOrUnknownPaymentDetails
			
							default:
								Bindings.print("Error: Invalid value type for FailureCode! Aborting.", severity: .ERROR)
								abort()
				
						}
					}

					internal func getCValue() -> LDKFailureCode {
						switch self {
							
							case .TemporaryNodeFailure:
								return LDKFailureCode_TemporaryNodeFailure
			
							case .RequiredNodeFeatureMissing:
								return LDKFailureCode_RequiredNodeFeatureMissing
			
							case .IncorrectOrUnknownPaymentDetails:
								return LDKFailureCode_IncorrectOrUnknownPaymentDetails
			
						}
					}

				}

			}
		