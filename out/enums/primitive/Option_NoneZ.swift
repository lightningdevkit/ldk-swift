
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			/// An enum which can either contain a  or not
			public typealias Option_NoneZ = Bindings.Option_NoneZ

			extension Bindings {

				/// An enum which can either contain a  or not
				public enum Option_NoneZ {

					
					/// When we're in this state, this COption_NoneZ contains a
					case Some
			
					/// When we're in this state, this COption_NoneZ contains nothing
					case None
			

					internal init (value: LDKCOption_NoneZ) {
						switch value {
							
							case LDKCOption_NoneZ_Some:
								self = .Some
			
							case LDKCOption_NoneZ_None:
								self = .None
			
							default:
								Bindings.print("Error: Invalid value type for Option_NoneZ! Aborting.", severity: .ERROR)
								abort()
				
						}
					}

					internal func getCValue() -> LDKCOption_NoneZ {
						switch self {
							
							case .Some:
								return LDKCOption_NoneZ_Some
			
							case .None:
								return LDKCOption_NoneZ_None
			
						}
					}

				}

			}
		