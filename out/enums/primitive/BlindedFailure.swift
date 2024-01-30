import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


/// Whether this blinded HTLC is being failed backwards by the introduction node or a blinded node,
/// which determines the failure message that should be used.
public typealias BlindedFailure = Bindings.BlindedFailure

extension Bindings {

	/// Whether this blinded HTLC is being failed backwards by the introduction node or a blinded node,
	/// which determines the failure message that should be used.
	public enum BlindedFailure {


		/// This HTLC is being failed backwards by the introduction node, and thus should be failed with
		/// [`msgs::UpdateFailHTLC`] and error code `0x8000|0x4000|24`.
		case FromIntroductionNode

		/// This HTLC is being failed backwards by a blinded node within the path, and thus should be
		/// failed with [`msgs::UpdateFailMalformedHTLC`] and error code `0x8000|0x4000|24`.
		case FromBlindedNode


		internal init(value: LDKBlindedFailure) {
			switch value {

				case LDKBlindedFailure_FromIntroductionNode:
					self = .FromIntroductionNode

				case LDKBlindedFailure_FromBlindedNode:
					self = .FromBlindedNode

				default:
					Bindings.print("Error: Invalid value type for BlindedFailure! Aborting.", severity: .ERROR)
					abort()

			}
		}

		internal func getCValue() -> LDKBlindedFailure {
			switch self {

				case .FromIntroductionNode:
					return LDKBlindedFailure_FromIntroductionNode

				case .FromBlindedNode:
					return LDKBlindedFailure_FromBlindedNode

			}
		}

	}

}
