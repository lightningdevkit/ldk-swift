
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Top-level config which holds ChannelHandshakeLimits and ChannelConfig.
			/// 
			/// Default::default() provides sane defaults for most configurations
			/// (but currently with 0 relay fees!)
			public typealias UserConfig = Bindings.UserConfig

			extension Bindings {
		

				/// Top-level config which holds ChannelHandshakeLimits and ChannelConfig.
				/// 
				/// Default::default() provides sane defaults for most configurations
				/// (but currently with 0 relay fees!)
				public class UserConfig: NativeTypeWrapper {

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

					internal var cType: LDKUserConfig?

					internal init(cType: LDKUserConfig, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKUserConfig, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKUserConfig, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the UserConfig, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = UserConfig_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Channel handshake config that we propose to our counterparty.
					public func getChannelHandshakeConfig() -> ChannelHandshakeConfig {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUserConfig>) in
				UserConfig_get_channel_handshake_config(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ChannelHandshakeConfig(cType: nativeCallResult, instantiationContext: "UserConfig.swift::\(#function):\(#line)", anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// Channel handshake config that we propose to our counterparty.
					public func setChannelHandshakeConfig(val: ChannelHandshakeConfig) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUserConfig>) in
				UserConfig_set_channel_handshake_config(thisPtrPointer, val.dynamicallyDangledClone().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Limits applied to our counterparty's proposed channel handshake config settings.
					public func getChannelHandshakeLimits() -> ChannelHandshakeLimits {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUserConfig>) in
				UserConfig_get_channel_handshake_limits(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ChannelHandshakeLimits(cType: nativeCallResult, instantiationContext: "UserConfig.swift::\(#function):\(#line)", anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// Limits applied to our counterparty's proposed channel handshake config settings.
					public func setChannelHandshakeLimits(val: ChannelHandshakeLimits) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUserConfig>) in
				UserConfig_set_channel_handshake_limits(thisPtrPointer, val.dynamicallyDangledClone().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Channel config which affects behavior during channel lifetime.
					public func getChannelConfig() -> ChannelConfig {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUserConfig>) in
				UserConfig_get_channel_config(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ChannelConfig(cType: nativeCallResult, instantiationContext: "UserConfig.swift::\(#function):\(#line)", anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// Channel config which affects behavior during channel lifetime.
					public func setChannelConfig(val: ChannelConfig) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUserConfig>) in
				UserConfig_set_channel_config(thisPtrPointer, val.dynamicallyDangledClone().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// If this is set to false, we will reject any HTLCs which were to be forwarded over private
					/// channels. This prevents us from taking on HTLC-forwarding risk when we intend to run as a
					/// node which is not online reliably.
					/// 
					/// For nodes which are not online reliably, you should set all channels to *not* be announced
					/// (using [`ChannelHandshakeConfig::announced_channel`] and
					/// [`ChannelHandshakeLimits::force_announced_channel_preference`]) and set this to false to
					/// ensure you are not exposed to any forwarding risk.
					/// 
					/// Note that because you cannot change a channel's announced state after creation, there is no
					/// way to disable forwarding on public channels retroactively. Thus, in order to change a node
					/// from a publicly-announced forwarding node to a private non-forwarding node you must close
					/// all your channels and open new ones. For privacy, you should also change your node_id
					/// (swapping all private and public key material for new ones) at that time.
					/// 
					/// Default value: false.
					public func getAcceptForwardsToPrivChannels() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUserConfig>) in
				UserConfig_get_accept_forwards_to_priv_channels(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// If this is set to false, we will reject any HTLCs which were to be forwarded over private
					/// channels. This prevents us from taking on HTLC-forwarding risk when we intend to run as a
					/// node which is not online reliably.
					/// 
					/// For nodes which are not online reliably, you should set all channels to *not* be announced
					/// (using [`ChannelHandshakeConfig::announced_channel`] and
					/// [`ChannelHandshakeLimits::force_announced_channel_preference`]) and set this to false to
					/// ensure you are not exposed to any forwarding risk.
					/// 
					/// Note that because you cannot change a channel's announced state after creation, there is no
					/// way to disable forwarding on public channels retroactively. Thus, in order to change a node
					/// from a publicly-announced forwarding node to a private non-forwarding node you must close
					/// all your channels and open new ones. For privacy, you should also change your node_id
					/// (swapping all private and public key material for new ones) at that time.
					/// 
					/// Default value: false.
					public func setAcceptForwardsToPrivChannels(val: Bool) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUserConfig>) in
				UserConfig_set_accept_forwards_to_priv_channels(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// If this is set to false, we do not accept inbound requests to open a new channel.
					/// Default value: true.
					public func getAcceptInboundChannels() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUserConfig>) in
				UserConfig_get_accept_inbound_channels(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// If this is set to false, we do not accept inbound requests to open a new channel.
					/// Default value: true.
					public func setAcceptInboundChannels(val: Bool) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUserConfig>) in
				UserConfig_set_accept_inbound_channels(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// If this is set to true, the user needs to manually accept inbound requests to open a new
					/// channel.
					/// 
					/// When set to true, [`Event::OpenChannelRequest`] will be triggered once a request to open a
					/// new inbound channel is received through a [`msgs::OpenChannel`] message. In that case, a
					/// [`msgs::AcceptChannel`] message will not be sent back to the counterparty node unless the
					/// user explicitly chooses to accept the request.
					/// 
					/// Default value: false.
					/// 
					/// [`Event::OpenChannelRequest`]: crate::util::events::Event::OpenChannelRequest
					/// [`msgs::OpenChannel`]: crate::ln::msgs::OpenChannel
					/// [`msgs::AcceptChannel`]: crate::ln::msgs::AcceptChannel
					public func getManuallyAcceptInboundChannels() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUserConfig>) in
				UserConfig_get_manually_accept_inbound_channels(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// If this is set to true, the user needs to manually accept inbound requests to open a new
					/// channel.
					/// 
					/// When set to true, [`Event::OpenChannelRequest`] will be triggered once a request to open a
					/// new inbound channel is received through a [`msgs::OpenChannel`] message. In that case, a
					/// [`msgs::AcceptChannel`] message will not be sent back to the counterparty node unless the
					/// user explicitly chooses to accept the request.
					/// 
					/// Default value: false.
					/// 
					/// [`Event::OpenChannelRequest`]: crate::util::events::Event::OpenChannelRequest
					/// [`msgs::OpenChannel`]: crate::ln::msgs::OpenChannel
					/// [`msgs::AcceptChannel`]: crate::ln::msgs::AcceptChannel
					public func setManuallyAcceptInboundChannels(val: Bool) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUserConfig>) in
				UserConfig_set_manually_accept_inbound_channels(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// If this is set to true, LDK will intercept HTLCs that are attempting to be forwarded over
					/// fake short channel ids generated via [`ChannelManager::get_intercept_scid`]. Upon HTLC
					/// intercept, LDK will generate an [`Event::HTLCIntercepted`] which MUST be handled by the user.
					/// 
					/// Setting this to true may break backwards compatibility with LDK versions < 0.0.113.
					/// 
					/// Default value: false.
					/// 
					/// [`ChannelManager::get_intercept_scid`]: crate::ln::channelmanager::ChannelManager::get_intercept_scid
					/// [`Event::HTLCIntercepted`]: crate::util::events::Event::HTLCIntercepted
					public func getAcceptInterceptHtlcs() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUserConfig>) in
				UserConfig_get_accept_intercept_htlcs(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// If this is set to true, LDK will intercept HTLCs that are attempting to be forwarded over
					/// fake short channel ids generated via [`ChannelManager::get_intercept_scid`]. Upon HTLC
					/// intercept, LDK will generate an [`Event::HTLCIntercepted`] which MUST be handled by the user.
					/// 
					/// Setting this to true may break backwards compatibility with LDK versions < 0.0.113.
					/// 
					/// Default value: false.
					/// 
					/// [`ChannelManager::get_intercept_scid`]: crate::ln::channelmanager::ChannelManager::get_intercept_scid
					/// [`Event::HTLCIntercepted`]: crate::util::events::Event::HTLCIntercepted
					public func setAcceptInterceptHtlcs(val: Bool) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUserConfig>) in
				UserConfig_set_accept_intercept_htlcs(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new UserConfig given each field
					public init(channelHandshakeConfigArg: ChannelHandshakeConfig, channelHandshakeLimitsArg: ChannelHandshakeLimits, channelConfigArg: ChannelConfig, acceptForwardsToPrivChannelsArg: Bool, acceptInboundChannelsArg: Bool, manuallyAcceptInboundChannelsArg: Bool, acceptInterceptHtlcsArg: Bool) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = UserConfig_new(channelHandshakeConfigArg.dynamicallyDangledClone().cType!, channelHandshakeLimitsArg.dynamicallyDangledClone().cType!, channelConfigArg.dynamicallyDangledClone().cType!, acceptForwardsToPrivChannelsArg, acceptInboundChannelsArg, manuallyAcceptInboundChannelsArg, acceptInterceptHtlcsArg)

						// cleanup
						
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = UserConfig(cType: nativeCallResult, instantiationContext: "UserConfig.swift::\(#function):\(#line)")
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0, instantiationContext: "UserConfig.swift::\(#function):\(#line)")
				
			
					}
		
					/// Creates a copy of the UserConfig
					internal func clone() -> UserConfig {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKUserConfig>) in
				UserConfig_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = UserConfig(cType: nativeCallResult, instantiationContext: "UserConfig.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Creates a "default" UserConfig. See struct and individual field documentaiton for details on which values are used.
					public class func initWithDefault() -> UserConfig {
						// native call variable prep
						

						// native method call
						let nativeCallResult = UserConfig_default()

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = UserConfig(cType: nativeCallResult, instantiationContext: "UserConfig.swift::\(#function):\(#line)")
						

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> UserConfig {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> UserConfig {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> UserConfig {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> UserConfig {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> UserConfig {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing UserConfig \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing UserConfig \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

				}

				
			}
		
		