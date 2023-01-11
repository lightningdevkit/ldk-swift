
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			/// An enum representing the available verbosity levels of the logger.
			public typealias Level = Bindings.Level

			extension Bindings {

				/// An enum representing the available verbosity levels of the logger.
				public enum Level {

					
					/// Designates extremely verbose information, including gossip-induced messages
					case Gossip
			
					/// Designates very low priority, often extremely verbose, information
					case Trace
			
					/// Designates lower priority information
					case Debug
			
					/// Designates useful information
					case Info
			
					/// Designates hazardous situations
					case Warn
			
					/// Designates very serious errors
					case Error
			

					internal init (value: LDKLevel) {
						switch value {
							
							case LDKLevel_Gossip:
								self = .Gossip
			
							case LDKLevel_Trace:
								self = .Trace
			
							case LDKLevel_Debug:
								self = .Debug
			
							case LDKLevel_Info:
								self = .Info
			
							case LDKLevel_Warn:
								self = .Warn
			
							case LDKLevel_Error:
								self = .Error
			
							default:
								Bindings.print("Error: Invalid value type for Level! Aborting.", severity: .ERROR)
								abort()
				
						}
					}

					internal func getCValue() -> LDKLevel {
						switch self {
							
							case .Gossip:
								return LDKLevel_Gossip
			
							case .Trace:
								return LDKLevel_Trace
			
							case .Debug:
								return LDKLevel_Debug
			
							case .Info:
								return LDKLevel_Info
			
							case .Warn:
								return LDKLevel_Warn
			
							case .Error:
								return LDKLevel_Error
			
						}
					}

				}

			}
		