
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Information about an HTLC that is part of a payment that can be claimed.
			public typealias ClaimedHTLC = Bindings.ClaimedHTLC

			extension Bindings {
		

				/// Information about an HTLC that is part of a payment that can be claimed.
				public class ClaimedHTLC: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					/// Set to false to suppress an individual type's deinit log statements.
					/// Only applicable when log threshold is set to `.Debug`.
					public static var enableDeinitLogging = true

					/// Set to true to suspend the freeing of this type's associated Rust memory.
					/// Should only ever be used for debugging purposes, and will likely be
					/// deprecated soon.
					public static var suspendFreedom = false

					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKClaimedHTLC?

					internal init(cType: LDKClaimedHTLC, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKClaimedHTLC, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKClaimedHTLC, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the ClaimedHTLC, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ClaimedHTLC_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The `channel_id` of the channel over which the HTLC was received.
					public func getChannelId() -> [UInt8]? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKClaimedHTLC>) in
				ClaimedHTLC_get_channel_id(thisPtrPointer)
						}
				

						// cleanup
						
						guard let nativeCallResult = nativeCallResult else {
							return nil
						}
			

						
						// return value (do some wrapping)
						let returnValue = Bindings.UInt8Tuple32ToArray(tuple: nativeCallResult.pointee)
						

						return returnValue
					}
		
					/// The `channel_id` of the channel over which the HTLC was received.
					public func setChannelId(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = ThirtyTwoBytes(value: val, instantiationContext: "ClaimedHTLC.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKClaimedHTLC>) in
				ClaimedHTLC_set_channel_id(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The `user_channel_id` of the channel over which the HTLC was received. This is the value
					/// passed in to [`ChannelManager::create_channel`] for outbound channels, or to
					/// [`ChannelManager::accept_inbound_channel`] for inbound channels if
					/// [`UserConfig::manually_accept_inbound_channels`] config flag is set to true. Otherwise
					/// `user_channel_id` will be randomized for an inbound channel.
					/// 
					/// This field will be zero for a payment that was serialized prior to LDK version 0.0.117. (This
					/// should only happen in the case that a payment was claimable prior to LDK version 0.0.117, but
					/// was not actually claimed until after upgrading.)
					/// 
					/// [`ChannelManager::create_channel`]: crate::ln::channelmanager::ChannelManager::create_channel
					/// [`ChannelManager::accept_inbound_channel`]: crate::ln::channelmanager::ChannelManager::accept_inbound_channel
					/// [`UserConfig::manually_accept_inbound_channels`]: crate::util::config::UserConfig::manually_accept_inbound_channels
					public func getUserChannelId() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKClaimedHTLC>) in
				ClaimedHTLC_get_user_channel_id(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = U128(cType: nativeCallResult, instantiationContext: "ClaimedHTLC.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// The `user_channel_id` of the channel over which the HTLC was received. This is the value
					/// passed in to [`ChannelManager::create_channel`] for outbound channels, or to
					/// [`ChannelManager::accept_inbound_channel`] for inbound channels if
					/// [`UserConfig::manually_accept_inbound_channels`] config flag is set to true. Otherwise
					/// `user_channel_id` will be randomized for an inbound channel.
					/// 
					/// This field will be zero for a payment that was serialized prior to LDK version 0.0.117. (This
					/// should only happen in the case that a payment was claimable prior to LDK version 0.0.117, but
					/// was not actually claimed until after upgrading.)
					/// 
					/// [`ChannelManager::create_channel`]: crate::ln::channelmanager::ChannelManager::create_channel
					/// [`ChannelManager::accept_inbound_channel`]: crate::ln::channelmanager::ChannelManager::accept_inbound_channel
					/// [`UserConfig::manually_accept_inbound_channels`]: crate::util::config::UserConfig::manually_accept_inbound_channels
					public func setUserChannelId(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = U128(value: val, instantiationContext: "ClaimedHTLC.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKClaimedHTLC>) in
				ClaimedHTLC_set_user_channel_id(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The block height at which this HTLC expires.
					public func getCltvExpiry() -> UInt32 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKClaimedHTLC>) in
				ClaimedHTLC_get_cltv_expiry(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The block height at which this HTLC expires.
					public func setCltvExpiry(val: UInt32) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKClaimedHTLC>) in
				ClaimedHTLC_set_cltv_expiry(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The amount (in msats) of this part of an MPP.
					public func getValueMsat() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKClaimedHTLC>) in
				ClaimedHTLC_get_value_msat(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The amount (in msats) of this part of an MPP.
					public func setValueMsat(val: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKClaimedHTLC>) in
				ClaimedHTLC_set_value_msat(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new ClaimedHTLC given each field
					public init(channelIdArg: [UInt8], userChannelIdArg: [UInt8], cltvExpiryArg: UInt32, valueMsatArg: UInt64) {
						// native call variable prep
						
						let channelIdArgPrimitiveWrapper = ThirtyTwoBytes(value: channelIdArg, instantiationContext: "ClaimedHTLC.swift::\(#function):\(#line)")
				
						let userChannelIdArgPrimitiveWrapper = U128(value: userChannelIdArg, instantiationContext: "ClaimedHTLC.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = ClaimedHTLC_new(channelIdArgPrimitiveWrapper.cType!, userChannelIdArgPrimitiveWrapper.cType!, cltvExpiryArg, valueMsatArg)

						// cleanup
						
						// for elided types, we need this
						channelIdArgPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						userChannelIdArgPrimitiveWrapper.noOpRetain()
				
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = ClaimedHTLC(cType: nativeCallResult, instantiationContext: "ClaimedHTLC.swift::\(#function):\(#line)")
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0, instantiationContext: "ClaimedHTLC.swift::\(#function):\(#line)")
				
			
					}
		
					/// Creates a copy of the ClaimedHTLC
					internal func clone() -> ClaimedHTLC {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKClaimedHTLC>) in
				ClaimedHTLC_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ClaimedHTLC(cType: nativeCallResult, instantiationContext: "ClaimedHTLC.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Checks if two ClaimedHTLCs contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public class func eq(a: ClaimedHTLC, b: ClaimedHTLC) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKClaimedHTLC>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKClaimedHTLC>) in
				ClaimedHTLC_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Serialize the ClaimedHTLC object into a byte array which can be read by ClaimedHTLC_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKClaimedHTLC>) in
				ClaimedHTLC_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, instantiationContext: "ClaimedHTLC.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a ClaimedHTLC from a byte array, created by ClaimedHTLC_write
					public class func read(ser: [UInt8]) -> Result_ClaimedHTLCDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser, instantiationContext: "ClaimedHTLC.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = ClaimedHTLC_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_ClaimedHTLCDecodeErrorZ(cType: nativeCallResult, instantiationContext: "ClaimedHTLC.swift::\(#function):\(#line)")
						

						return returnValue
					}
		

					
					/// Indicates that this is the only struct which contains the same pointer.
					/// Rust functions which take ownership of an object provided via an argument require
					/// this to be true and invalidate the object pointed to by inner.
					public func isOwned() -> Bool {
						// return value (do some wrapping)
						let returnValue = self.cType!.is_owned

						return returnValue;
					}
		

					
					internal func danglingClone() -> ClaimedHTLC {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> ClaimedHTLC {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> ClaimedHTLC {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> ClaimedHTLC {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing ClaimedHTLC \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing ClaimedHTLC \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

				}

				
			}
		
		