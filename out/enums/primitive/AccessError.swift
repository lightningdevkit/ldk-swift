
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			/// An error when accessing the chain via [`Access`].
			public typealias AccessError = Bindings.AccessError

			extension Bindings {

				/// An error when accessing the chain via [`Access`].
				public enum AccessError {

					
					/// The requested chain is unknown.
					case UnknownChain
			
					/// The requested transaction doesn't exist or hasn't confirmed.
					case UnknownTx
			

					internal init (value: LDKAccessError) {
						switch value {
							
							case LDKAccessError_UnknownChain:
								self = .UnknownChain
			
							case LDKAccessError_UnknownTx:
								self = .UnknownTx
			
							default:
								Bindings.print("Error: Invalid value type for AccessError! Aborting.", severity: .ERROR)
								abort()
				
						}
					}

					internal func getCValue() -> LDKAccessError {
						switch self {
							
							case .UnknownChain:
								return LDKAccessError_UnknownChain
			
							case .UnknownTx:
								return LDKAccessError_UnknownTx
			
						}
					}

				}

			}
		