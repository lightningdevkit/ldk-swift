import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


/// An enum representing the possible Bitcoin or test networks which we can run on
public typealias Network = Bindings.Network

extension Bindings {

	/// An enum representing the possible Bitcoin or test networks which we can run on
	public enum Network {


		/// The main Bitcoin blockchain.
		case Bitcoin

		/// The testnet3 blockchain.
		case Testnet

		/// A local test blockchain.
		case Regtest

		/// A blockchain on which blocks are signed instead of mined.
		case Signet


		internal init(value: LDKNetwork) {
			switch value {

				case LDKNetwork_Bitcoin:
					self = .Bitcoin

				case LDKNetwork_Testnet:
					self = .Testnet

				case LDKNetwork_Regtest:
					self = .Regtest

				case LDKNetwork_Signet:
					self = .Signet

				default:
					Bindings.print("Error: Invalid value type for Network! Aborting.", severity: .ERROR)
					abort()

			}
		}

		internal func getCValue() -> LDKNetwork {
			switch self {

				case .Bitcoin:
					return LDKNetwork_Bitcoin

				case .Testnet:
					return LDKNetwork_Testnet

				case .Regtest:
					return LDKNetwork_Regtest

				case .Signet:
					return LDKNetwork_Signet

			}
		}

	}

}
