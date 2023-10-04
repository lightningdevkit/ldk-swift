
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			/// Errors that may occur when constructing a new [`RawBolt11Invoice`] or [`Bolt11Invoice`]
			public typealias CreationError = Bindings.CreationError

			extension Bindings {

				/// Errors that may occur when constructing a new [`RawBolt11Invoice`] or [`Bolt11Invoice`]
				public enum CreationError {

					
					/// The supplied description string was longer than 639 __bytes__ (see [`Description::new`])
					case DescriptionTooLong
			
					/// The specified route has too many hops and can't be encoded
					case RouteTooLong
			
					/// The Unix timestamp of the supplied date is less than zero or greater than 35-bits
					case TimestampOutOfBounds
			
					/// The supplied millisatoshi amount was greater than the total bitcoin supply.
					case InvalidAmount
			
					/// Route hints were required for this invoice and were missing. Applies to
					/// [phantom invoices].
					/// 
					/// [phantom invoices]: crate::utils::create_phantom_invoice
					case MissingRouteHints
			
					/// The provided `min_final_cltv_expiry_delta` was less than [`MIN_FINAL_CLTV_EXPIRY_DELTA`].
					/// 
					/// [`MIN_FINAL_CLTV_EXPIRY_DELTA`]: lightning::ln::channelmanager::MIN_FINAL_CLTV_EXPIRY_DELTA
					case MinFinalCltvExpiryDeltaTooShort
			

					internal init (value: LDKCreationError) {
						switch value {
							
							case LDKCreationError_DescriptionTooLong:
								self = .DescriptionTooLong
			
							case LDKCreationError_RouteTooLong:
								self = .RouteTooLong
			
							case LDKCreationError_TimestampOutOfBounds:
								self = .TimestampOutOfBounds
			
							case LDKCreationError_InvalidAmount:
								self = .InvalidAmount
			
							case LDKCreationError_MissingRouteHints:
								self = .MissingRouteHints
			
							case LDKCreationError_MinFinalCltvExpiryDeltaTooShort:
								self = .MinFinalCltvExpiryDeltaTooShort
			
			default:
				Bindings.print("Error: Invalid value type for CreationError! Aborting.", severity: .ERROR)
				abort()
		
						}
					}

					internal func getCValue() -> LDKCreationError {
						switch self {
							
							case .DescriptionTooLong:
								return LDKCreationError_DescriptionTooLong
			
							case .RouteTooLong:
								return LDKCreationError_RouteTooLong
			
							case .TimestampOutOfBounds:
								return LDKCreationError_TimestampOutOfBounds
			
							case .InvalidAmount:
								return LDKCreationError_InvalidAmount
			
							case .MissingRouteHints:
								return LDKCreationError_MissingRouteHints
			
							case .MinFinalCltvExpiryDeltaTooShort:
								return LDKCreationError_MinFinalCltvExpiryDeltaTooShort
			
						}
					}

				}

			}
		