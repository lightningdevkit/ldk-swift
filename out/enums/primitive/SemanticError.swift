import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


/// Errors that may occur when converting a [`RawInvoice`] to an [`Invoice`]. They relate to the
/// requirements sections in BOLT #11
public typealias SemanticError = Bindings.SemanticError

extension Bindings {

	/// Errors that may occur when converting a [`RawInvoice`] to an [`Invoice`]. They relate to the
	/// requirements sections in BOLT #11
	public enum SemanticError {


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


		internal init(value: LDKSemanticError) {
			switch value {

				case LDKSemanticError_NoPaymentHash:
					self = .NoPaymentHash

				case LDKSemanticError_MultiplePaymentHashes:
					self = .MultiplePaymentHashes

				case LDKSemanticError_NoDescription:
					self = .NoDescription

				case LDKSemanticError_MultipleDescriptions:
					self = .MultipleDescriptions

				case LDKSemanticError_NoPaymentSecret:
					self = .NoPaymentSecret

				case LDKSemanticError_MultiplePaymentSecrets:
					self = .MultiplePaymentSecrets

				case LDKSemanticError_InvalidFeatures:
					self = .InvalidFeatures

				case LDKSemanticError_InvalidRecoveryId:
					self = .InvalidRecoveryId

				case LDKSemanticError_InvalidSignature:
					self = .InvalidSignature

				case LDKSemanticError_ImpreciseAmount:
					self = .ImpreciseAmount

				default:
					Bindings.print("Error: Invalid value type for SemanticError! Aborting.", severity: .ERROR)
					abort()

			}
		}

		internal func getCValue() -> LDKSemanticError {
			switch self {

				case .NoPaymentHash:
					return LDKSemanticError_NoPaymentHash

				case .MultiplePaymentHashes:
					return LDKSemanticError_MultiplePaymentHashes

				case .NoDescription:
					return LDKSemanticError_NoDescription

				case .MultipleDescriptions:
					return LDKSemanticError_MultipleDescriptions

				case .NoPaymentSecret:
					return LDKSemanticError_NoPaymentSecret

				case .MultiplePaymentSecrets:
					return LDKSemanticError_MultiplePaymentSecrets

				case .InvalidFeatures:
					return LDKSemanticError_InvalidFeatures

				case .InvalidRecoveryId:
					return LDKSemanticError_InvalidRecoveryId

				case .InvalidSignature:
					return LDKSemanticError_InvalidSignature

				case .ImpreciseAmount:
					return LDKSemanticError_ImpreciseAmount

			}
		}

	}

}
