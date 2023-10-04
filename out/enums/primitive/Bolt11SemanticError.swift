
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			/// Errors that may occur when converting a [`RawBolt11Invoice`] to a [`Bolt11Invoice`]. They relate to
			/// the requirements sections in BOLT #11
			public typealias Bolt11SemanticError = Bindings.Bolt11SemanticError

			extension Bindings {

				/// Errors that may occur when converting a [`RawBolt11Invoice`] to a [`Bolt11Invoice`]. They relate to
				/// the requirements sections in BOLT #11
				public enum Bolt11SemanticError {

					
					/// The invoice is missing the mandatory payment hash
					case NoPaymentHash
			
					/// The invoice has multiple payment hashes which isn't allowed
					case MultiplePaymentHashes
			
					/// No description or description hash are part of the invoice
					case NoDescription
			
					/// The invoice contains multiple descriptions and/or description hashes which isn't allowed
					case MultipleDescriptions
			
					/// The invoice is missing the mandatory payment secret, which all modern lightning nodes
					/// should provide.
					case NoPaymentSecret
			
					/// The invoice contains multiple payment secrets
					case MultiplePaymentSecrets
			
					/// The invoice's features are invalid
					case InvalidFeatures
			
					/// The recovery id doesn't fit the signature/pub key
					case InvalidRecoveryId
			
					/// The invoice's signature is invalid
					case InvalidSignature
			
					/// The invoice's amount was not a whole number of millisatoshis
					case ImpreciseAmount
			

					internal init (value: LDKBolt11SemanticError) {
						switch value {
							
							case LDKBolt11SemanticError_NoPaymentHash:
								self = .NoPaymentHash
			
							case LDKBolt11SemanticError_MultiplePaymentHashes:
								self = .MultiplePaymentHashes
			
							case LDKBolt11SemanticError_NoDescription:
								self = .NoDescription
			
							case LDKBolt11SemanticError_MultipleDescriptions:
								self = .MultipleDescriptions
			
							case LDKBolt11SemanticError_NoPaymentSecret:
								self = .NoPaymentSecret
			
							case LDKBolt11SemanticError_MultiplePaymentSecrets:
								self = .MultiplePaymentSecrets
			
							case LDKBolt11SemanticError_InvalidFeatures:
								self = .InvalidFeatures
			
							case LDKBolt11SemanticError_InvalidRecoveryId:
								self = .InvalidRecoveryId
			
							case LDKBolt11SemanticError_InvalidSignature:
								self = .InvalidSignature
			
							case LDKBolt11SemanticError_ImpreciseAmount:
								self = .ImpreciseAmount
			
			default:
				Bindings.print("Error: Invalid value type for Bolt11SemanticError! Aborting.", severity: .ERROR)
				abort()
		
						}
					}

					internal func getCValue() -> LDKBolt11SemanticError {
						switch self {
							
							case .NoPaymentHash:
								return LDKBolt11SemanticError_NoPaymentHash
			
							case .MultiplePaymentHashes:
								return LDKBolt11SemanticError_MultiplePaymentHashes
			
							case .NoDescription:
								return LDKBolt11SemanticError_NoDescription
			
							case .MultipleDescriptions:
								return LDKBolt11SemanticError_MultipleDescriptions
			
							case .NoPaymentSecret:
								return LDKBolt11SemanticError_NoPaymentSecret
			
							case .MultiplePaymentSecrets:
								return LDKBolt11SemanticError_MultiplePaymentSecrets
			
							case .InvalidFeatures:
								return LDKBolt11SemanticError_InvalidFeatures
			
							case .InvalidRecoveryId:
								return LDKBolt11SemanticError_InvalidRecoveryId
			
							case .InvalidSignature:
								return LDKBolt11SemanticError_InvalidSignature
			
							case .ImpreciseAmount:
								return LDKBolt11SemanticError_ImpreciseAmount
			
						}
					}

				}

			}
		