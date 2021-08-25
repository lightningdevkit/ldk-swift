public class NetAddress: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKNetAddress?

	

    public init(pointer: LDKNetAddress){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

    /* OPTION_METHODS_START */

				public enum NetAddressValueType {
					case IPv4, IPv6, OnionV2, OnionV3
				}
				
				public func getValueType() -> NetAddressValueType? {
					switch self.cOpaqueStruct?.tag {
                    
					case LDKNetAddress_IPv4:
						return .IPv4
					case LDKNetAddress_IPv6:
						return .IPv6
					case LDKNetAddress_OnionV2:
						return .OnionV2
					case LDKNetAddress_OnionV3:
						return .OnionV3
                    default:
                        return nil
                    }
				}
				
				
					public func getValueAsIPv4() -> IPv4? {
						if self.cOpaqueStruct?.tag != LDKNetAddress_IPv4 {
							return nil
						}
						return IPv4(pointer: self.cOpaqueStruct!.i_pv4)
					}
				
					public func getValueAsIPv6() -> IPv6? {
						if self.cOpaqueStruct?.tag != LDKNetAddress_IPv6 {
							return nil
						}
						return IPv6(pointer: self.cOpaqueStruct!.i_pv6)
					}
				
					public func getValueAsOnionV2() -> OnionV2? {
						if self.cOpaqueStruct?.tag != LDKNetAddress_OnionV2 {
							return nil
						}
						return OnionV2(pointer: self.cOpaqueStruct!.onion_v2)
					}
				
					public func getValueAsOnionV3() -> OnionV3? {
						if self.cOpaqueStruct?.tag != LDKNetAddress_OnionV3 {
							return nil
						}
						return OnionV3(pointer: self.cOpaqueStruct!.onion_v3)
					}
				
			
    internal func free() -> Void {
    	
        return NetAddress_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> NetAddress {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing NetAddress \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing NetAddress \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> NetAddress {
    	
        return NetAddress(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKNetAddress>) in
NetAddress_clone(origPointer)
});
    }

					internal func danglingClone() -> NetAddress {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public class func ipv4(addr: [UInt8], port: UInt16) -> NetAddress {
    	
        return NetAddress(pointer: NetAddress_ipv4(Bindings.new_LDKFourBytes(array: addr), port));
    }

    public class func ipv6(addr: [UInt8], port: UInt16) -> NetAddress {
    	
        return NetAddress(pointer: NetAddress_ipv6(Bindings.new_LDKSixteenBytes(array: addr), port));
    }

    public class func onion_v2(addr: [UInt8], port: UInt16) -> NetAddress {
    	
        return NetAddress(pointer: NetAddress_onion_v2(Bindings.new_LDKTenBytes(array: addr), port));
    }

    public class func onion_v3(ed25519_pubkey: [UInt8], checksum: UInt16, version: UInt8, port: UInt16) -> NetAddress {
    	
        return NetAddress(pointer: NetAddress_onion_v3(Bindings.new_LDKThirtyTwoBytes(array: ed25519_pubkey), checksum, version, port));
    }

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKNetAddress>) in
NetAddress_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_NetAddressDecodeErrorZ {
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_NetAddressDecodeErrorZ(pointer: NetAddress_read(serWrapper.cOpaqueStruct!));
    }

    /* OPTION_METHODS_END */

	

			public class IPv4 {
				
				
				var cOpaqueStruct: LDKNetAddress_LDKIPv4_Body?;
				fileprivate init(pointer: LDKNetAddress_LDKIPv4_Body) {
					self.cOpaqueStruct = pointer
				}
			
				
				
					public func getAddr() -> [UInt8] {
						return Bindings.LDKFourBytes_to_array(nativeType: self.cOpaqueStruct!.addr)
					}
				
					public func getPort() -> UInt16 {
						return self.cOpaqueStruct!.port
					}
				
				
			}
		

			public class IPv6 {
				
				
				var cOpaqueStruct: LDKNetAddress_LDKIPv6_Body?;
				fileprivate init(pointer: LDKNetAddress_LDKIPv6_Body) {
					self.cOpaqueStruct = pointer
				}
			
				
				
					public func getAddr() -> [UInt8] {
						return Bindings.LDKSixteenBytes_to_array(nativeType: self.cOpaqueStruct!.addr)
					}
				
					public func getPort() -> UInt16 {
						return self.cOpaqueStruct!.port
					}
				
				
			}
		

			public class OnionV2 {
				
				
				var cOpaqueStruct: LDKNetAddress_LDKOnionV2_Body?;
				fileprivate init(pointer: LDKNetAddress_LDKOnionV2_Body) {
					self.cOpaqueStruct = pointer
				}
			
				
				
					public func getAddr() -> [UInt8] {
						return Bindings.LDKTenBytes_to_array(nativeType: self.cOpaqueStruct!.addr)
					}
				
					public func getPort() -> UInt16 {
						return self.cOpaqueStruct!.port
					}
				
				
			}
		

			public class OnionV3 {
				
				
				var cOpaqueStruct: LDKNetAddress_LDKOnionV3_Body?;
				fileprivate init(pointer: LDKNetAddress_LDKOnionV3_Body) {
					self.cOpaqueStruct = pointer
				}
			
				
				
					public func getEd25519_pubkey() -> [UInt8] {
						return Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.ed25519_pubkey)
					}
				
					public func getChecksum() -> UInt16 {
						return self.cOpaqueStruct!.checksum
					}
				
					public func getVersion() -> UInt8 {
						return self.cOpaqueStruct!.version
					}
				
					public func getPort() -> UInt16 {
						return self.cOpaqueStruct!.port
					}
				
				
			}
		
}
