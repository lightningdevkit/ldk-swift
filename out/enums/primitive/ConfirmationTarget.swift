import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


/// An enum that represents the priority at which we want a transaction to confirm used for feerate
/// estimation.
public typealias ConfirmationTarget = Bindings.ConfirmationTarget

extension Bindings {

	/// An enum that represents the priority at which we want a transaction to confirm used for feerate
	/// estimation.
	public enum ConfirmationTarget {


		/// We'd like a transaction to confirm in the future, but don't want to commit most of the fees
		/// required to do so yet. The remaining fees will come via a Child-Pays-For-Parent (CPFP) fee
		/// bump of the transaction.
		///
		/// The feerate returned should be the absolute minimum feerate required to enter most node
		/// mempools across the network. Note that if you are not able to obtain this feerate estimate,
		/// you should likely use the furthest-out estimate allowed by your fee estimator.
		case MempoolMinimum

		/// We are happy with a transaction confirming slowly, at least within a day or so worth of
		/// blocks.
		case Background

		/// We'd like a transaction to confirm without major delayed, i.e., within the next 12-24 blocks.
		case Normal

		/// We'd like a transaction to confirm in the next few blocks.
		case HighPriority


		internal init(value: LDKConfirmationTarget) {
			switch value {

				case LDKConfirmationTarget_MempoolMinimum:
					self = .MempoolMinimum

				case LDKConfirmationTarget_Background:
					self = .Background

				case LDKConfirmationTarget_Normal:
					self = .Normal

				case LDKConfirmationTarget_HighPriority:
					self = .HighPriority

				default:
					Bindings.print("Error: Invalid value type for ConfirmationTarget! Aborting.", severity: .ERROR)
					abort()

			}
		}

		internal func getCValue() -> LDKConfirmationTarget {
			switch self {

				case .MempoolMinimum:
					return LDKConfirmationTarget_MempoolMinimum

				case .Background:
					return LDKConfirmationTarget_Background

				case .Normal:
					return LDKConfirmationTarget_Normal

				case .HighPriority:
					return LDKConfirmationTarget_HighPriority

			}
		}

	}

}
