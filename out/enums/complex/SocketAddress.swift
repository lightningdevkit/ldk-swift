
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			/// 
			public typealias SocketAddress = Bindings.SocketAddress

			extension Bindings {

				/// An address which can be used to connect to a remote peer.
				public class SocketAddress: NativeTypeWrapper {

					
					/// Set to false to suppress an individual type's deinit log statements.
					/// Only applicable when log threshold is set to `.Debug`.
					public static var enableDeinitLogging = true

					/// Set to true to suspend the freeing of this type's associated Rust memory.
					/// Should only ever be used for debugging purposes, and will likely be
					/// deprecated soon.
					public static var suspendFreedom = false

					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKSocketAddress?

					internal init(cType: LDKSocketAddress, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKSocketAddress, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKSocketAddress, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					public enum SocketAddressType {
						
						/// An IPv4 address and port on which the peer is listening.
						case TcpIpV4
			
						/// An IPv6 address and port on which the peer is listening.
						case TcpIpV6
			
						/// An old-style Tor onion address/port on which the peer is listening.
						/// 
						/// This field is deprecated and the Tor network generally no longer supports V2 Onion
						/// addresses. Thus, the details are not parsed here.
						case OnionV2
			
						/// A new-style Tor onion address/port on which the peer is listening.
						/// 
						/// To create the human-readable \"hostname\", concatenate the ED25519 pubkey, checksum, and version,
						/// wrap as base32 and append \".onion\".
						case OnionV3
			
						/// A hostname/port on which the peer is listening.
						case Hostname
			
					}

					public func getValueType() -> SocketAddressType {
						switch self.cType!.tag {
							case LDKSocketAddress_TcpIpV4:
								return .TcpIpV4
			
							case LDKSocketAddress_TcpIpV6:
								return .TcpIpV6
			
							case LDKSocketAddress_OnionV2:
								return .OnionV2
			
							case LDKSocketAddress_OnionV3:
								return .OnionV3
			
							case LDKSocketAddress_Hostname:
								return .Hostname
			
							default:
								Bindings.print("Error: Invalid value type for SocketAddress! Aborting.", severity: .ERROR)
								abort()
						}
		
					}

					
					/// Frees any resources used by the SocketAddress
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = SocketAddress_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the SocketAddress
					internal func clone() -> SocketAddress {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKSocketAddress>) in
				SocketAddress_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = SocketAddress(cType: nativeCallResult, instantiationContext: "SocketAddress.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new TcpIpV4-variant SocketAddress
					public class func initWithTcpIpV4(addr: [UInt8], port: UInt16) -> SocketAddress {
						// native call variable prep
						
						let addrPrimitiveWrapper = FourBytes(value: addr, instantiationContext: "SocketAddress.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = SocketAddress_tcp_ip_v4(addrPrimitiveWrapper.cType!, port)

						// cleanup
						
						// for elided types, we need this
						addrPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = SocketAddress(cType: nativeCallResult, instantiationContext: "SocketAddress.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new TcpIpV6-variant SocketAddress
					public class func initWithTcpIpV6(addr: [UInt8], port: UInt16) -> SocketAddress {
						// native call variable prep
						
						let addrPrimitiveWrapper = SixteenBytes(value: addr, instantiationContext: "SocketAddress.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = SocketAddress_tcp_ip_v6(addrPrimitiveWrapper.cType!, port)

						// cleanup
						
						// for elided types, we need this
						addrPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = SocketAddress(cType: nativeCallResult, instantiationContext: "SocketAddress.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new OnionV2-variant SocketAddress
					public class func initWithOnionV2(a: [UInt8]) -> SocketAddress {
						// native call variable prep
						
						let aPrimitiveWrapper = TwelveBytes(value: a, instantiationContext: "SocketAddress.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = SocketAddress_onion_v2(aPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						aPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = SocketAddress(cType: nativeCallResult, instantiationContext: "SocketAddress.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new OnionV3-variant SocketAddress
					public class func initWithOnionV3(ed25519Pubkey: [UInt8], checksum: UInt16, version: UInt8, port: UInt16) -> SocketAddress {
						// native call variable prep
						
						let ed25519PubkeyPrimitiveWrapper = ThirtyTwoBytes(value: ed25519Pubkey, instantiationContext: "SocketAddress.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = SocketAddress_onion_v3(ed25519PubkeyPrimitiveWrapper.cType!, checksum, version, port)

						// cleanup
						
						// for elided types, we need this
						ed25519PubkeyPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = SocketAddress(cType: nativeCallResult, instantiationContext: "SocketAddress.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new Hostname-variant SocketAddress
					public class func initWithHostname(hostname: Bindings.Hostname, port: UInt16) -> SocketAddress {
						// native call variable prep
						

						// native method call
						let nativeCallResult = SocketAddress_hostname(hostname.dynamicallyDangledClone().cType!, port)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = SocketAddress(cType: nativeCallResult, instantiationContext: "SocketAddress.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Checks if two SocketAddresss contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					public class func eq(a: SocketAddress, b: SocketAddress) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKSocketAddress>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKSocketAddress>) in
				SocketAddress_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Serialize the SocketAddress object into a byte array which can be read by SocketAddress_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKSocketAddress>) in
				SocketAddress_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, instantiationContext: "SocketAddress.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a SocketAddress from a byte array, created by SocketAddress_write
					public class func read(ser: [UInt8]) -> Result_SocketAddressDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser, instantiationContext: "SocketAddress.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = SocketAddress_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_SocketAddressDecodeErrorZ(cType: nativeCallResult, instantiationContext: "SocketAddress.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Read a SocketAddress object from a string
					public class func fromStr(s: String) -> Result_SocketAddressSocketAddressParseErrorZ {
						// native call variable prep
						
						let sPrimitiveWrapper = Str(value: s, instantiationContext: "SocketAddress.swift::\(#function):\(#line)").dangle()
				

						// native method call
						let nativeCallResult = SocketAddress_from_str(sPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						sPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_SocketAddressSocketAddressParseErrorZ(cType: nativeCallResult, instantiationContext: "SocketAddress.swift::\(#function):\(#line)")
						

						return returnValue
					}
		

					
					public func getValueAsTcpIpV4() -> TcpIpV4? {
						if self.cType?.tag != LDKSocketAddress_TcpIpV4 {
							return nil
						}

						return SocketAddress_LDKTcpIpV4_Body(cType: self.cType!.tcp_ip_v4, instantiationContext: "SocketAddress.swift::\(#function):\(#line)", anchor: self)
					}
			
					public func getValueAsTcpIpV6() -> TcpIpV6? {
						if self.cType?.tag != LDKSocketAddress_TcpIpV6 {
							return nil
						}

						return SocketAddress_LDKTcpIpV6_Body(cType: self.cType!.tcp_ip_v6, instantiationContext: "SocketAddress.swift::\(#function):\(#line)", anchor: self)
					}
			
					public func getValueAsOnionV2() -> [UInt8]? {
						if self.cType?.tag != LDKSocketAddress_OnionV2 {
							return nil
						}

						return TwelveBytes(cType: self.cType!.onion_v2, instantiationContext: "SocketAddress.swift::\(#function):\(#line)", anchor: self).getValue()
					}
			
					public func getValueAsOnionV3() -> OnionV3? {
						if self.cType?.tag != LDKSocketAddress_OnionV3 {
							return nil
						}

						return SocketAddress_LDKOnionV3_Body(cType: self.cType!.onion_v3, instantiationContext: "SocketAddress.swift::\(#function):\(#line)", anchor: self)
					}
			
					public func getValueAsHostname() -> Hostname? {
						if self.cType?.tag != LDKSocketAddress_Hostname {
							return nil
						}

						return SocketAddress_LDKHostname_Body(cType: self.cType!.hostname, instantiationContext: "SocketAddress.swift::\(#function):\(#line)", anchor: self)
					}
			

					
					internal func danglingClone() -> SocketAddress {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing SocketAddress \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing SocketAddress \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

					
					
					/// 
					internal typealias SocketAddress_LDKTcpIpV4_Body = TcpIpV4
			

					/// 
					public class TcpIpV4: NativeTypeWrapper {

						

						
						/// Set to false to suppress an individual type's deinit log statements.
						/// Only applicable when log threshold is set to `.Debug`.
						public static var enableDeinitLogging = true

						/// Set to true to suspend the freeing of this type's associated Rust memory.
						/// Should only ever be used for debugging purposes, and will likely be
						/// deprecated soon.
						public static var suspendFreedom = false

						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKSocketAddress_LDKTcpIpV4_Body?

						internal init(cType: LDKSocketAddress_LDKTcpIpV4_Body, instantiationContext: String) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						}

						internal init(cType: LDKSocketAddress_LDKTcpIpV4_Body, instantiationContext: String, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}

						internal init(cType: LDKSocketAddress_LDKTcpIpV4_Body, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
							self.dangling = dangle
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The 4-byte IPv4 address
						public func getAddr() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = FourBytes(cType: self.cType!.addr, instantiationContext: "SocketAddress.swift::\(#function):\(#line)", anchor: self).getValue()

							return returnValue;
						}
		
						/// The port on which the node is listening
						public func getPort() -> UInt16 {
							// return value (do some wrapping)
							let returnValue = self.cType!.port

							return returnValue;
						}
		

											

					}

					
		
					
					/// 
					internal typealias SocketAddress_LDKTcpIpV6_Body = TcpIpV6
			

					/// 
					public class TcpIpV6: NativeTypeWrapper {

						

						
						/// Set to false to suppress an individual type's deinit log statements.
						/// Only applicable when log threshold is set to `.Debug`.
						public static var enableDeinitLogging = true

						/// Set to true to suspend the freeing of this type's associated Rust memory.
						/// Should only ever be used for debugging purposes, and will likely be
						/// deprecated soon.
						public static var suspendFreedom = false

						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKSocketAddress_LDKTcpIpV6_Body?

						internal init(cType: LDKSocketAddress_LDKTcpIpV6_Body, instantiationContext: String) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						}

						internal init(cType: LDKSocketAddress_LDKTcpIpV6_Body, instantiationContext: String, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}

						internal init(cType: LDKSocketAddress_LDKTcpIpV6_Body, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
							self.dangling = dangle
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The 16-byte IPv6 address
						public func getAddr() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = SixteenBytes(cType: self.cType!.addr, instantiationContext: "SocketAddress.swift::\(#function):\(#line)", anchor: self).getValue()

							return returnValue;
						}
		
						/// The port on which the node is listening
						public func getPort() -> UInt16 {
							// return value (do some wrapping)
							let returnValue = self.cType!.port

							return returnValue;
						}
		

											

					}

					
		
					
					/// 
					internal typealias SocketAddress_LDKOnionV3_Body = OnionV3
			

					/// 
					public class OnionV3: NativeTypeWrapper {

						

						
						/// Set to false to suppress an individual type's deinit log statements.
						/// Only applicable when log threshold is set to `.Debug`.
						public static var enableDeinitLogging = true

						/// Set to true to suspend the freeing of this type's associated Rust memory.
						/// Should only ever be used for debugging purposes, and will likely be
						/// deprecated soon.
						public static var suspendFreedom = false

						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKSocketAddress_LDKOnionV3_Body?

						internal init(cType: LDKSocketAddress_LDKOnionV3_Body, instantiationContext: String) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						}

						internal init(cType: LDKSocketAddress_LDKOnionV3_Body, instantiationContext: String, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}

						internal init(cType: LDKSocketAddress_LDKOnionV3_Body, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
							self.dangling = dangle
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The ed25519 long-term public key of the peer
						public func getEd25519Pubkey() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = ThirtyTwoBytes(cType: self.cType!.ed25519_pubkey, instantiationContext: "SocketAddress.swift::\(#function):\(#line)", anchor: self).getValue()

							return returnValue;
						}
		
						/// The checksum of the pubkey and version, as included in the onion address
						public func getChecksum() -> UInt16 {
							// return value (do some wrapping)
							let returnValue = self.cType!.checksum

							return returnValue;
						}
		
						/// The version byte, as defined by the Tor Onion v3 spec.
						public func getVersion() -> UInt8 {
							// return value (do some wrapping)
							let returnValue = self.cType!.version

							return returnValue;
						}
		
						/// The port on which the node is listening
						public func getPort() -> UInt16 {
							// return value (do some wrapping)
							let returnValue = self.cType!.port

							return returnValue;
						}
		

											

					}

					
		
					
					/// 
					internal typealias SocketAddress_LDKHostname_Body = Hostname
			

					/// 
					public class Hostname: NativeTypeWrapper {

						

						
						/// Set to false to suppress an individual type's deinit log statements.
						/// Only applicable when log threshold is set to `.Debug`.
						public static var enableDeinitLogging = true

						/// Set to true to suspend the freeing of this type's associated Rust memory.
						/// Should only ever be used for debugging purposes, and will likely be
						/// deprecated soon.
						public static var suspendFreedom = false

						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKSocketAddress_LDKHostname_Body?

						internal init(cType: LDKSocketAddress_LDKHostname_Body, instantiationContext: String) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						}

						internal init(cType: LDKSocketAddress_LDKHostname_Body, instantiationContext: String, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}

						internal init(cType: LDKSocketAddress_LDKHostname_Body, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
							self.dangling = dangle
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The hostname on which the node is listening.
						public func getHostname() -> Bindings.Hostname {
							// return value (do some wrapping)
							let returnValue = Bindings.Hostname(cType: self.cType!.hostname, instantiationContext: "SocketAddress.swift::\(#function):\(#line)", anchor: self)

							return returnValue;
						}
		
						/// The port on which the node is listening.
						public func getPort() -> UInt16 {
							// return value (do some wrapping)
							let returnValue = self.cType!.port

							return returnValue;
						}
		

											

					}

					
		

				}

			}
		