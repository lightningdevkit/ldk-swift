
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			/// Describes the type of HTLC claim as determined by analyzing the witness.
			public typealias HTLCClaim = Bindings.HTLCClaim

			extension Bindings {

				/// Describes the type of HTLC claim as determined by analyzing the witness.
				public enum HTLCClaim {

					
					/// Claims an offered output on a commitment transaction through the timeout path.
					case OfferedTimeout
			
					/// Claims an offered output on a commitment transaction through the success path.
					case OfferedPreimage
			
					/// Claims an accepted output on a commitment transaction through the timeout path.
					case AcceptedTimeout
			
					/// Claims an accepted output on a commitment transaction through the success path.
					case AcceptedPreimage
			
					/// Claims an offered/accepted output on a commitment transaction through the revocation path.
					case Revocation
			

					internal init (value: LDKHTLCClaim) {
						switch value {
							
							case LDKHTLCClaim_OfferedTimeout:
								self = .OfferedTimeout
			
							case LDKHTLCClaim_OfferedPreimage:
								self = .OfferedPreimage
			
							case LDKHTLCClaim_AcceptedTimeout:
								self = .AcceptedTimeout
			
							case LDKHTLCClaim_AcceptedPreimage:
								self = .AcceptedPreimage
			
							case LDKHTLCClaim_Revocation:
								self = .Revocation
			
							default:
								Bindings.print("Error: Invalid value type for HTLCClaim! Aborting.", severity: .ERROR)
								abort()
				
						}
					}

					internal func getCValue() -> LDKHTLCClaim {
						switch self {
							
							case .OfferedTimeout:
								return LDKHTLCClaim_OfferedTimeout
			
							case .OfferedPreimage:
								return LDKHTLCClaim_OfferedPreimage
			
							case .AcceptedTimeout:
								return LDKHTLCClaim_AcceptedTimeout
			
							case .AcceptedPreimage:
								return LDKHTLCClaim_AcceptedPreimage
			
							case .Revocation:
								return LDKHTLCClaim_Revocation
			
						}
					}

				}

			}
		