
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			/// [`SocketAddress`] error variants
			public typealias SocketAddressParseError = Bindings.SocketAddressParseError

			extension Bindings {

				/// [`SocketAddress`] error variants
				public enum SocketAddressParseError {

					
					/// Socket address (IPv4/IPv6) parsing error
					case SocketAddrParse
			
					/// Invalid input format
					case InvalidInput
			
					/// Invalid port
					case InvalidPort
			
					/// Invalid onion v3 address
					case InvalidOnionV3
			

					internal init (value: LDKSocketAddressParseError) {
						switch value {
							
							case LDKSocketAddressParseError_SocketAddrParse:
								self = .SocketAddrParse
			
							case LDKSocketAddressParseError_InvalidInput:
								self = .InvalidInput
			
							case LDKSocketAddressParseError_InvalidPort:
								self = .InvalidPort
			
							case LDKSocketAddressParseError_InvalidOnionV3:
								self = .InvalidOnionV3
			
			default:
				Bindings.print("Error: Invalid value type for SocketAddressParseError! Aborting.", severity: .ERROR)
				abort()
		
						}
					}

					internal func getCValue() -> LDKSocketAddressParseError {
						switch self {
							
							case .SocketAddrParse:
								return LDKSocketAddressParseError_SocketAddrParse
			
							case .InvalidInput:
								return LDKSocketAddressParseError_InvalidInput
			
							case .InvalidPort:
								return LDKSocketAddressParseError_InvalidPort
			
							case .InvalidOnionV3:
								return LDKSocketAddressParseError_InvalidOnionV3
			
						}
					}

				}

			}
		