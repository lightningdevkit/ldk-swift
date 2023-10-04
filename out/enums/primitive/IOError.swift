
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			/// Represents an IO Error. Note that some information is lost in the conversion from Rust.
			public typealias IOError = Bindings.IOError

			extension Bindings {

				/// Represents an IO Error. Note that some information is lost in the conversion from Rust.
				public enum IOError {

					
					/// 
					case NotFound
			
					/// 
					case PermissionDenied
			
					/// 
					case ConnectionRefused
			
					/// 
					case ConnectionReset
			
					/// 
					case ConnectionAborted
			
					/// 
					case NotConnected
			
					/// 
					case AddrInUse
			
					/// 
					case AddrNotAvailable
			
					/// 
					case BrokenPipe
			
					/// 
					case AlreadyExists
			
					/// 
					case WouldBlock
			
					/// 
					case InvalidInput
			
					/// 
					case InvalidData
			
					/// 
					case TimedOut
			
					/// 
					case WriteZero
			
					/// 
					case Interrupted
			
					/// 
					case Other
			
					/// 
					case UnexpectedEof
			

					internal init (value: LDKIOError) {
						switch value {
							
							case LDKIOError_NotFound:
								self = .NotFound
			
							case LDKIOError_PermissionDenied:
								self = .PermissionDenied
			
							case LDKIOError_ConnectionRefused:
								self = .ConnectionRefused
			
							case LDKIOError_ConnectionReset:
								self = .ConnectionReset
			
							case LDKIOError_ConnectionAborted:
								self = .ConnectionAborted
			
							case LDKIOError_NotConnected:
								self = .NotConnected
			
							case LDKIOError_AddrInUse:
								self = .AddrInUse
			
							case LDKIOError_AddrNotAvailable:
								self = .AddrNotAvailable
			
							case LDKIOError_BrokenPipe:
								self = .BrokenPipe
			
							case LDKIOError_AlreadyExists:
								self = .AlreadyExists
			
							case LDKIOError_WouldBlock:
								self = .WouldBlock
			
							case LDKIOError_InvalidInput:
								self = .InvalidInput
			
							case LDKIOError_InvalidData:
								self = .InvalidData
			
							case LDKIOError_TimedOut:
								self = .TimedOut
			
							case LDKIOError_WriteZero:
								self = .WriteZero
			
							case LDKIOError_Interrupted:
								self = .Interrupted
			
							case LDKIOError_Other:
								self = .Other
			
							case LDKIOError_UnexpectedEof:
								self = .UnexpectedEof
			
			default:
				Bindings.print("Error: Invalid value type for IOError! Aborting.", severity: .ERROR)
				abort()
		
						}
					}

					internal func getCValue() -> LDKIOError {
						switch self {
							
							case .NotFound:
								return LDKIOError_NotFound
			
							case .PermissionDenied:
								return LDKIOError_PermissionDenied
			
							case .ConnectionRefused:
								return LDKIOError_ConnectionRefused
			
							case .ConnectionReset:
								return LDKIOError_ConnectionReset
			
							case .ConnectionAborted:
								return LDKIOError_ConnectionAborted
			
							case .NotConnected:
								return LDKIOError_NotConnected
			
							case .AddrInUse:
								return LDKIOError_AddrInUse
			
							case .AddrNotAvailable:
								return LDKIOError_AddrNotAvailable
			
							case .BrokenPipe:
								return LDKIOError_BrokenPipe
			
							case .AlreadyExists:
								return LDKIOError_AlreadyExists
			
							case .WouldBlock:
								return LDKIOError_WouldBlock
			
							case .InvalidInput:
								return LDKIOError_InvalidInput
			
							case .InvalidData:
								return LDKIOError_InvalidData
			
							case .TimedOut:
								return LDKIOError_TimedOut
			
							case .WriteZero:
								return LDKIOError_WriteZero
			
							case .Interrupted:
								return LDKIOError_Interrupted
			
							case .Other:
								return LDKIOError_Other
			
							case .UnexpectedEof:
								return LDKIOError_UnexpectedEof
			
						}
					}

				}

			}
		