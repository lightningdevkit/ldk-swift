
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			/// SI prefixes for the human readable part
			public typealias SiPrefix = Bindings.SiPrefix

			extension Bindings {

				/// SI prefixes for the human readable part
				public enum SiPrefix {

					
					/// 10^-3
					case Milli
			
					/// 10^-6
					case Micro
			
					/// 10^-9
					case Nano
			
					/// 10^-12
					case Pico
			

					internal init (value: LDKSiPrefix) {
						switch value {
							
							case LDKSiPrefix_Milli:
								self = .Milli
			
							case LDKSiPrefix_Micro:
								self = .Micro
			
							case LDKSiPrefix_Nano:
								self = .Nano
			
							case LDKSiPrefix_Pico:
								self = .Pico
			
			default:
				Bindings.print("Error: Invalid value type for SiPrefix! Aborting.", severity: .ERROR)
				abort()
		
						}
					}

					internal func getCValue() -> LDKSiPrefix {
						switch self {
							
							case .Milli:
								return LDKSiPrefix_Milli
			
							case .Micro:
								return LDKSiPrefix_Micro
			
							case .Nano:
								return LDKSiPrefix_Nano
			
							case .Pico:
								return LDKSiPrefix_Pico
			
						}
					}

				}

			}
		