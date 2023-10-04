
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			/// Specifies the recipient of an invoice.
			/// 
			/// This indicates to [`NodeSigner::sign_invoice`] what node secret key should be used to sign
			/// the invoice.
			public typealias Recipient = Bindings.Recipient

			extension Bindings {

				/// Specifies the recipient of an invoice.
				/// 
				/// This indicates to [`NodeSigner::sign_invoice`] what node secret key should be used to sign
				/// the invoice.
				public enum Recipient {

					
					/// The invoice should be signed with the local node secret key.
					case Node
			
					/// The invoice should be signed with the phantom node secret key. This secret key must be the
					/// same for all nodes participating in the [phantom node payment].
					/// 
					/// [phantom node payment]: PhantomKeysManager
					case PhantomNode
			

					internal init (value: LDKRecipient) {
						switch value {
							
							case LDKRecipient_Node:
								self = .Node
			
							case LDKRecipient_PhantomNode:
								self = .PhantomNode
			
			default:
				Bindings.print("Error: Invalid value type for Recipient! Aborting.", severity: .ERROR)
				abort()
		
						}
					}

					internal func getCValue() -> LDKRecipient {
						switch self {
							
							case .Node:
								return LDKRecipient_Node
			
							case .PhantomNode:
								return LDKRecipient_PhantomNode
			
						}
					}

				}

			}
		