import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


/// Error when interpreting a TLV stream as a specific type.
public typealias Bolt12SemanticError = Bindings.Bolt12SemanticError

extension Bindings {

	/// Error when interpreting a TLV stream as a specific type.
	public enum Bolt12SemanticError {


		/// The current [`std::time::SystemTime`] is past the offer or invoice's expiration.
		case AlreadyExpired

		/// The provided chain hash does not correspond to a supported chain.
		case UnsupportedChain

		/// A chain was provided but was not expected.
		case UnexpectedChain

		/// An amount was expected but was missing.
		case MissingAmount

		/// The amount exceeded the total bitcoin supply.
		case InvalidAmount

		/// An amount was provided but was not sufficient in value.
		case InsufficientAmount

		/// An amount was provided but was not expected.
		case UnexpectedAmount

		/// A currency was provided that is not supported.
		case UnsupportedCurrency

		/// A feature was required but is unknown.
		case UnknownRequiredFeatures

		/// Features were provided but were not expected.
		case UnexpectedFeatures

		/// A required description was not provided.
		case MissingDescription

		/// A signing pubkey was not provided.
		case MissingSigningPubkey

		/// A signing pubkey was provided but a different one was expected.
		case InvalidSigningPubkey

		/// A signing pubkey was provided but was not expected.
		case UnexpectedSigningPubkey

		/// A quantity was expected but was missing.
		case MissingQuantity

		/// An unsupported quantity was provided.
		case InvalidQuantity

		/// A quantity or quantity bounds was provided but was not expected.
		case UnexpectedQuantity

		/// Metadata could not be used to verify the offers message.
		case InvalidMetadata

		/// Metadata was provided but was not expected.
		case UnexpectedMetadata

		/// Payer metadata was expected but was missing.
		case MissingPayerMetadata

		/// A payer id was expected but was missing.
		case MissingPayerId

		/// Blinded paths were expected but were missing.
		case MissingPaths

		/// The blinded payinfo given does not match the number of blinded path hops.
		case InvalidPayInfo

		/// An invoice creation time was expected but was missing.
		case MissingCreationTime

		/// An invoice payment hash was expected but was missing.
		case MissingPaymentHash

		/// A signature was expected but was missing.
		case MissingSignature


		internal init(value: LDKBolt12SemanticError) {
			switch value {

				case LDKBolt12SemanticError_AlreadyExpired:
					self = .AlreadyExpired

				case LDKBolt12SemanticError_UnsupportedChain:
					self = .UnsupportedChain

				case LDKBolt12SemanticError_UnexpectedChain:
					self = .UnexpectedChain

				case LDKBolt12SemanticError_MissingAmount:
					self = .MissingAmount

				case LDKBolt12SemanticError_InvalidAmount:
					self = .InvalidAmount

				case LDKBolt12SemanticError_InsufficientAmount:
					self = .InsufficientAmount

				case LDKBolt12SemanticError_UnexpectedAmount:
					self = .UnexpectedAmount

				case LDKBolt12SemanticError_UnsupportedCurrency:
					self = .UnsupportedCurrency

				case LDKBolt12SemanticError_UnknownRequiredFeatures:
					self = .UnknownRequiredFeatures

				case LDKBolt12SemanticError_UnexpectedFeatures:
					self = .UnexpectedFeatures

				case LDKBolt12SemanticError_MissingDescription:
					self = .MissingDescription

				case LDKBolt12SemanticError_MissingSigningPubkey:
					self = .MissingSigningPubkey

				case LDKBolt12SemanticError_InvalidSigningPubkey:
					self = .InvalidSigningPubkey

				case LDKBolt12SemanticError_UnexpectedSigningPubkey:
					self = .UnexpectedSigningPubkey

				case LDKBolt12SemanticError_MissingQuantity:
					self = .MissingQuantity

				case LDKBolt12SemanticError_InvalidQuantity:
					self = .InvalidQuantity

				case LDKBolt12SemanticError_UnexpectedQuantity:
					self = .UnexpectedQuantity

				case LDKBolt12SemanticError_InvalidMetadata:
					self = .InvalidMetadata

				case LDKBolt12SemanticError_UnexpectedMetadata:
					self = .UnexpectedMetadata

				case LDKBolt12SemanticError_MissingPayerMetadata:
					self = .MissingPayerMetadata

				case LDKBolt12SemanticError_MissingPayerId:
					self = .MissingPayerId

				case LDKBolt12SemanticError_MissingPaths:
					self = .MissingPaths

				case LDKBolt12SemanticError_InvalidPayInfo:
					self = .InvalidPayInfo

				case LDKBolt12SemanticError_MissingCreationTime:
					self = .MissingCreationTime

				case LDKBolt12SemanticError_MissingPaymentHash:
					self = .MissingPaymentHash

				case LDKBolt12SemanticError_MissingSignature:
					self = .MissingSignature

				default:
					Bindings.print("Error: Invalid value type for Bolt12SemanticError! Aborting.", severity: .ERROR)
					abort()

			}
		}

		internal func getCValue() -> LDKBolt12SemanticError {
			switch self {

				case .AlreadyExpired:
					return LDKBolt12SemanticError_AlreadyExpired

				case .UnsupportedChain:
					return LDKBolt12SemanticError_UnsupportedChain

				case .UnexpectedChain:
					return LDKBolt12SemanticError_UnexpectedChain

				case .MissingAmount:
					return LDKBolt12SemanticError_MissingAmount

				case .InvalidAmount:
					return LDKBolt12SemanticError_InvalidAmount

				case .InsufficientAmount:
					return LDKBolt12SemanticError_InsufficientAmount

				case .UnexpectedAmount:
					return LDKBolt12SemanticError_UnexpectedAmount

				case .UnsupportedCurrency:
					return LDKBolt12SemanticError_UnsupportedCurrency

				case .UnknownRequiredFeatures:
					return LDKBolt12SemanticError_UnknownRequiredFeatures

				case .UnexpectedFeatures:
					return LDKBolt12SemanticError_UnexpectedFeatures

				case .MissingDescription:
					return LDKBolt12SemanticError_MissingDescription

				case .MissingSigningPubkey:
					return LDKBolt12SemanticError_MissingSigningPubkey

				case .InvalidSigningPubkey:
					return LDKBolt12SemanticError_InvalidSigningPubkey

				case .UnexpectedSigningPubkey:
					return LDKBolt12SemanticError_UnexpectedSigningPubkey

				case .MissingQuantity:
					return LDKBolt12SemanticError_MissingQuantity

				case .InvalidQuantity:
					return LDKBolt12SemanticError_InvalidQuantity

				case .UnexpectedQuantity:
					return LDKBolt12SemanticError_UnexpectedQuantity

				case .InvalidMetadata:
					return LDKBolt12SemanticError_InvalidMetadata

				case .UnexpectedMetadata:
					return LDKBolt12SemanticError_UnexpectedMetadata

				case .MissingPayerMetadata:
					return LDKBolt12SemanticError_MissingPayerMetadata

				case .MissingPayerId:
					return LDKBolt12SemanticError_MissingPayerId

				case .MissingPaths:
					return LDKBolt12SemanticError_MissingPaths

				case .InvalidPayInfo:
					return LDKBolt12SemanticError_InvalidPayInfo

				case .MissingCreationTime:
					return LDKBolt12SemanticError_MissingCreationTime

				case .MissingPaymentHash:
					return LDKBolt12SemanticError_MissingPaymentHash

				case .MissingSignature:
					return LDKBolt12SemanticError_MissingSignature

			}
		}

	}

}
