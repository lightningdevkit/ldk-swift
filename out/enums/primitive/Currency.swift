
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			/// Enum representing the crypto currencies (or networks) supported by this library
			public typealias Currency = Bindings.Currency

			extension Bindings {

				/// Enum representing the crypto currencies (or networks) supported by this library
				public enum Currency {

					
					/// Bitcoin mainnet
					case Bitcoin
			
					/// Bitcoin testnet
					case BitcoinTestnet
			
					/// Bitcoin regtest
					case Regtest
			
					/// Bitcoin simnet
					case Simnet
			
					/// Bitcoin signet
					case Signet
			

					internal init (value: LDKCurrency) {
						switch value {
							
							case LDKCurrency_Bitcoin:
								self = .Bitcoin
			
							case LDKCurrency_BitcoinTestnet:
								self = .BitcoinTestnet
			
							case LDKCurrency_Regtest:
								self = .Regtest
			
							case LDKCurrency_Simnet:
								self = .Simnet
			
							case LDKCurrency_Signet:
								self = .Signet
			
			default:
				Bindings.print("Error: Invalid value type for Currency! Aborting.", severity: .ERROR)
				abort()
		
						}
					}

					internal func getCValue() -> LDKCurrency {
						switch self {
							
							case .Bitcoin:
								return LDKCurrency_Bitcoin
			
							case .BitcoinTestnet:
								return LDKCurrency_BitcoinTestnet
			
							case .Regtest:
								return LDKCurrency_Regtest
			
							case .Simnet:
								return LDKCurrency_Simnet
			
							case .Signet:
								return LDKCurrency_Signet
			
						}
					}

				}

			}
		