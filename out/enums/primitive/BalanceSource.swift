import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


/// Indicates whether the balance is derived from a cooperative close, a force-close
/// (for holder or counterparty), or whether it is for an HTLC.
public typealias BalanceSource = Bindings.BalanceSource

extension Bindings {

	/// Indicates whether the balance is derived from a cooperative close, a force-close
	/// (for holder or counterparty), or whether it is for an HTLC.
	public enum BalanceSource {


		/// The channel was force closed by the holder.
		case HolderForceClosed

		/// The channel was force closed by the counterparty.
		case CounterpartyForceClosed

		/// The channel was cooperatively closed.
		case CoopClose

		/// This balance is the result of an HTLC.
		case Htlc


		internal init(value: LDKBalanceSource) {
			switch value {

				case LDKBalanceSource_HolderForceClosed:
					self = .HolderForceClosed

				case LDKBalanceSource_CounterpartyForceClosed:
					self = .CounterpartyForceClosed

				case LDKBalanceSource_CoopClose:
					self = .CoopClose

				case LDKBalanceSource_Htlc:
					self = .Htlc

				default:
					Bindings.print("Error: Invalid value type for BalanceSource! Aborting.", severity: .ERROR)
					abort()

			}
		}

		internal func getCValue() -> LDKBalanceSource {
			switch self {

				case .HolderForceClosed:
					return LDKBalanceSource_HolderForceClosed

				case .CounterpartyForceClosed:
					return LDKBalanceSource_CounterpartyForceClosed

				case .CoopClose:
					return LDKBalanceSource_CoopClose

				case .Htlc:
					return LDKBalanceSource_Htlc

			}
		}

	}

}
