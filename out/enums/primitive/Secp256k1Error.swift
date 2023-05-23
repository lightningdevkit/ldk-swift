import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


/// Represents an error returned from libsecp256k1 during validation of some secp256k1 data
public typealias Secp256k1Error = Bindings.Secp256k1Error

extension Bindings {

	/// Represents an error returned from libsecp256k1 during validation of some secp256k1 data
	public enum Secp256k1Error {


		/// Signature failed verification
		case IncorrectSignature

		/// Badly sized message ("messages" are actually fixed-sized digests; see the MESSAGE_SIZE constant)
		case InvalidMessage

		/// Bad public key
		case InvalidPublicKey

		/// Bad signature
		case InvalidSignature

		/// Bad secret key
		case InvalidSecretKey

		/// Bad shared secret.
		case InvalidSharedSecret

		/// Bad recovery id
		case InvalidRecoveryId

		/// Invalid tweak for add_assign or mul_assign
		case InvalidTweak

		/// Didn't pass enough memory to context creation with preallocated memory
		case NotEnoughMemory

		/// Bad set of public keys.
		case InvalidPublicKeySum

		/// The only valid parity values are 0 or 1.
		case InvalidParityValue


		internal init(value: LDKSecp256k1Error) {
			switch value {

				case LDKSecp256k1Error_IncorrectSignature:
					self = .IncorrectSignature

				case LDKSecp256k1Error_InvalidMessage:
					self = .InvalidMessage

				case LDKSecp256k1Error_InvalidPublicKey:
					self = .InvalidPublicKey

				case LDKSecp256k1Error_InvalidSignature:
					self = .InvalidSignature

				case LDKSecp256k1Error_InvalidSecretKey:
					self = .InvalidSecretKey

				case LDKSecp256k1Error_InvalidSharedSecret:
					self = .InvalidSharedSecret

				case LDKSecp256k1Error_InvalidRecoveryId:
					self = .InvalidRecoveryId

				case LDKSecp256k1Error_InvalidTweak:
					self = .InvalidTweak

				case LDKSecp256k1Error_NotEnoughMemory:
					self = .NotEnoughMemory

				case LDKSecp256k1Error_InvalidPublicKeySum:
					self = .InvalidPublicKeySum

				case LDKSecp256k1Error_InvalidParityValue:
					self = .InvalidParityValue

				default:
					Bindings.print("Error: Invalid value type for Secp256k1Error! Aborting.", severity: .ERROR)
					abort()

			}
		}

		internal func getCValue() -> LDKSecp256k1Error {
			switch self {

				case .IncorrectSignature:
					return LDKSecp256k1Error_IncorrectSignature

				case .InvalidMessage:
					return LDKSecp256k1Error_InvalidMessage

				case .InvalidPublicKey:
					return LDKSecp256k1Error_InvalidPublicKey

				case .InvalidSignature:
					return LDKSecp256k1Error_InvalidSignature

				case .InvalidSecretKey:
					return LDKSecp256k1Error_InvalidSecretKey

				case .InvalidSharedSecret:
					return LDKSecp256k1Error_InvalidSharedSecret

				case .InvalidRecoveryId:
					return LDKSecp256k1Error_InvalidRecoveryId

				case .InvalidTweak:
					return LDKSecp256k1Error_InvalidTweak

				case .NotEnoughMemory:
					return LDKSecp256k1Error_NotEnoughMemory

				case .InvalidPublicKeySum:
					return LDKSecp256k1Error_InvalidPublicKeySum

				case .InvalidParityValue:
					return LDKSecp256k1Error_InvalidParityValue

			}
		}

	}

}
