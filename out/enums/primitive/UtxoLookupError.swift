
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			/// An error when accessing the chain via [`UtxoLookup`].
			public typealias UtxoLookupError = Bindings.UtxoLookupError

			extension Bindings {

				/// An error when accessing the chain via [`UtxoLookup`].
				public enum UtxoLookupError {

					
					/// The requested chain is unknown.
					case UnknownChain
			
					/// The requested transaction doesn't exist or hasn't confirmed.
					case UnknownTx
			

					internal init (value: LDKUtxoLookupError) {
						switch value {
							
							case LDKUtxoLookupError_UnknownChain:
								self = .UnknownChain
			
							case LDKUtxoLookupError_UnknownTx:
								self = .UnknownTx
			
							default:
								Bindings.print("Error: Invalid value type for UtxoLookupError! Aborting.", severity: .ERROR)
								abort()
				
						}
					}

					internal func getCValue() -> LDKUtxoLookupError {
						switch self {
							
							case .UnknownChain:
								return LDKUtxoLookupError_UnknownChain
			
							case .UnknownTx:
								return LDKUtxoLookupError_UnknownTx
			
						}
					}

				}

			}
		