
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Optional channel limits which are applied during channel creation.
			/// 
			/// These limits are only applied to our counterparty's limits, not our own.
			/// 
			/// Use 0/`<type>::max_value()` as appropriate to skip checking.
			/// 
			/// Provides sane defaults for most configurations.
			/// 
			/// Most additional limits are disabled except those with which specify a default in individual
			/// field documentation. Note that this may result in barely-usable channels, but since they
			/// are applied mostly only to incoming channels that's not much of a problem.
			public typealias ChannelHandshakeLimits = Bindings.ChannelHandshakeLimits

			extension Bindings {
		

				/// Optional channel limits which are applied during channel creation.
				/// 
				/// These limits are only applied to our counterparty's limits, not our own.
				/// 
				/// Use 0/`<type>::max_value()` as appropriate to skip checking.
				/// 
				/// Provides sane defaults for most configurations.
				/// 
				/// Most additional limits are disabled except those with which specify a default in individual
				/// field documentation. Note that this may result in barely-usable channels, but since they
				/// are applied mostly only to incoming channels that's not much of a problem.
				public class ChannelHandshakeLimits: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					public static var enableDeinitLogging = true
					public static var suspendFreedom = false
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKChannelHandshakeLimits?

					internal init(cType: LDKChannelHandshakeLimits, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKChannelHandshakeLimits, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the ChannelHandshakeLimits, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ChannelHandshakeLimits_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Minimum allowed satoshis when a channel is funded. This is supplied by the sender and so
					/// only applies to inbound channels.
					/// 
					/// Default value: 0.
					public func getMinFundingSatoshis() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelHandshakeLimits>) in
				ChannelHandshakeLimits_get_min_funding_satoshis(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Minimum allowed satoshis when a channel is funded. This is supplied by the sender and so
					/// only applies to inbound channels.
					/// 
					/// Default value: 0.
					public func setMinFundingSatoshis(val: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelHandshakeLimits>) in
				ChannelHandshakeLimits_set_min_funding_satoshis(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Maximum allowed satoshis when a channel is funded. This is supplied by the sender and so
					/// only applies to inbound channels.
					/// 
					/// Default value: 2^24 - 1.
					public func getMaxFundingSatoshis() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelHandshakeLimits>) in
				ChannelHandshakeLimits_get_max_funding_satoshis(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Maximum allowed satoshis when a channel is funded. This is supplied by the sender and so
					/// only applies to inbound channels.
					/// 
					/// Default value: 2^24 - 1.
					public func setMaxFundingSatoshis(val: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelHandshakeLimits>) in
				ChannelHandshakeLimits_set_max_funding_satoshis(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The remote node sets a limit on the minimum size of HTLCs we can send to them. This allows
					/// you to limit the maximum minimum-size they can require.
					/// 
					/// Default value: u64::max_value.
					public func getMaxHtlcMinimumMsat() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelHandshakeLimits>) in
				ChannelHandshakeLimits_get_max_htlc_minimum_msat(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The remote node sets a limit on the minimum size of HTLCs we can send to them. This allows
					/// you to limit the maximum minimum-size they can require.
					/// 
					/// Default value: u64::max_value.
					public func setMaxHtlcMinimumMsat(val: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelHandshakeLimits>) in
				ChannelHandshakeLimits_set_max_htlc_minimum_msat(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The remote node sets a limit on the maximum value of pending HTLCs to them at any given
					/// time to limit their funds exposure to HTLCs. This allows you to set a minimum such value.
					/// 
					/// Default value: 0.
					public func getMinMaxHtlcValueInFlightMsat() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelHandshakeLimits>) in
				ChannelHandshakeLimits_get_min_max_htlc_value_in_flight_msat(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The remote node sets a limit on the maximum value of pending HTLCs to them at any given
					/// time to limit their funds exposure to HTLCs. This allows you to set a minimum such value.
					/// 
					/// Default value: 0.
					public func setMinMaxHtlcValueInFlightMsat(val: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelHandshakeLimits>) in
				ChannelHandshakeLimits_set_min_max_htlc_value_in_flight_msat(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The remote node will require we keep a certain amount in direct payment to ourselves at all
					/// time, ensuring that we are able to be punished if we broadcast an old state. This allows to
					/// you limit the amount which we will have to keep to ourselves (and cannot use for HTLCs).
					/// 
					/// Default value: u64::max_value.
					public func getMaxChannelReserveSatoshis() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelHandshakeLimits>) in
				ChannelHandshakeLimits_get_max_channel_reserve_satoshis(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The remote node will require we keep a certain amount in direct payment to ourselves at all
					/// time, ensuring that we are able to be punished if we broadcast an old state. This allows to
					/// you limit the amount which we will have to keep to ourselves (and cannot use for HTLCs).
					/// 
					/// Default value: u64::max_value.
					public func setMaxChannelReserveSatoshis(val: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelHandshakeLimits>) in
				ChannelHandshakeLimits_set_max_channel_reserve_satoshis(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The remote node sets a limit on the maximum number of pending HTLCs to them at any given
					/// time. This allows you to set a minimum such value.
					/// 
					/// Default value: 0.
					public func getMinMaxAcceptedHtlcs() -> UInt16 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelHandshakeLimits>) in
				ChannelHandshakeLimits_get_min_max_accepted_htlcs(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The remote node sets a limit on the maximum number of pending HTLCs to them at any given
					/// time. This allows you to set a minimum such value.
					/// 
					/// Default value: 0.
					public func setMinMaxAcceptedHtlcs(val: UInt16) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelHandshakeLimits>) in
				ChannelHandshakeLimits_set_min_max_accepted_htlcs(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Before a channel is usable the funding transaction will need to be confirmed by at least a
					/// certain number of blocks, specified by the node which is not the funder (as the funder can
					/// assume they aren't going to double-spend themselves).
					/// This config allows you to set a limit on the maximum amount of time to wait.
					/// 
					/// Default value: 144, or roughly one day and only applies to outbound channels.
					public func getMaxMinimumDepth() -> UInt32 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelHandshakeLimits>) in
				ChannelHandshakeLimits_get_max_minimum_depth(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Before a channel is usable the funding transaction will need to be confirmed by at least a
					/// certain number of blocks, specified by the node which is not the funder (as the funder can
					/// assume they aren't going to double-spend themselves).
					/// This config allows you to set a limit on the maximum amount of time to wait.
					/// 
					/// Default value: 144, or roughly one day and only applies to outbound channels.
					public func setMaxMinimumDepth(val: UInt32) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelHandshakeLimits>) in
				ChannelHandshakeLimits_set_max_minimum_depth(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Whether we implicitly trust funding transactions generated by us for our own outbound
					/// channels to not be double-spent.
					/// 
					/// If this is set, we assume that our own funding transactions are *never* double-spent, and
					/// thus we can trust them without any confirmations. This is generally a reasonable
					/// assumption, given we're the only ones who could ever double-spend it (assuming we have sole
					/// control of the signing keys).
					/// 
					/// You may wish to un-set this if you allow the user to (or do in an automated fashion)
					/// double-spend the funding transaction to RBF with an alternative channel open.
					/// 
					/// This only applies if our counterparty set their confirmations-required value to 0, and we
					/// always trust our own funding transaction at 1 confirmation irrespective of this value.
					/// Thus, this effectively acts as a `min_minimum_depth`, with the only possible values being
					/// `true` (0) and `false` (1).
					/// 
					/// Default value: true
					public func getTrustOwnFunding0conf() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelHandshakeLimits>) in
				ChannelHandshakeLimits_get_trust_own_funding_0conf(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Whether we implicitly trust funding transactions generated by us for our own outbound
					/// channels to not be double-spent.
					/// 
					/// If this is set, we assume that our own funding transactions are *never* double-spent, and
					/// thus we can trust them without any confirmations. This is generally a reasonable
					/// assumption, given we're the only ones who could ever double-spend it (assuming we have sole
					/// control of the signing keys).
					/// 
					/// You may wish to un-set this if you allow the user to (or do in an automated fashion)
					/// double-spend the funding transaction to RBF with an alternative channel open.
					/// 
					/// This only applies if our counterparty set their confirmations-required value to 0, and we
					/// always trust our own funding transaction at 1 confirmation irrespective of this value.
					/// Thus, this effectively acts as a `min_minimum_depth`, with the only possible values being
					/// `true` (0) and `false` (1).
					/// 
					/// Default value: true
					public func setTrustOwnFunding0conf(val: Bool) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelHandshakeLimits>) in
				ChannelHandshakeLimits_set_trust_own_funding_0conf(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Set to force an incoming channel to match our announced channel preference in
					/// [`ChannelHandshakeConfig::announced_channel`].
					/// 
					/// For a node which is not online reliably, this should be set to true and
					/// [`ChannelHandshakeConfig::announced_channel`] set to false, ensuring that no announced (aka public)
					/// channels will ever be opened.
					/// 
					/// Default value: true.
					public func getForceAnnouncedChannelPreference() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelHandshakeLimits>) in
				ChannelHandshakeLimits_get_force_announced_channel_preference(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Set to force an incoming channel to match our announced channel preference in
					/// [`ChannelHandshakeConfig::announced_channel`].
					/// 
					/// For a node which is not online reliably, this should be set to true and
					/// [`ChannelHandshakeConfig::announced_channel`] set to false, ensuring that no announced (aka public)
					/// channels will ever be opened.
					/// 
					/// Default value: true.
					public func setForceAnnouncedChannelPreference(val: Bool) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelHandshakeLimits>) in
				ChannelHandshakeLimits_set_force_announced_channel_preference(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Set to the amount of time we're willing to wait to claim money back to us.
					/// 
					/// Not checking this value would be a security issue, as our peer would be able to set it to
					/// max relative lock-time (a year) and we would \"lose\" money as it would be locked for a long time.
					/// 
					/// Default value: 2016, which we also enforce as a maximum value so you can tweak config to
					/// reduce the loss of having useless locked funds (if your peer accepts)
					public func getTheirToSelfDelay() -> UInt16 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelHandshakeLimits>) in
				ChannelHandshakeLimits_get_their_to_self_delay(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Set to the amount of time we're willing to wait to claim money back to us.
					/// 
					/// Not checking this value would be a security issue, as our peer would be able to set it to
					/// max relative lock-time (a year) and we would \"lose\" money as it would be locked for a long time.
					/// 
					/// Default value: 2016, which we also enforce as a maximum value so you can tweak config to
					/// reduce the loss of having useless locked funds (if your peer accepts)
					public func setTheirToSelfDelay(val: UInt16) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelHandshakeLimits>) in
				ChannelHandshakeLimits_set_their_to_self_delay(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new ChannelHandshakeLimits given each field
					public init(minFundingSatoshisArg: UInt64, maxFundingSatoshisArg: UInt64, maxHtlcMinimumMsatArg: UInt64, minMaxHtlcValueInFlightMsatArg: UInt64, maxChannelReserveSatoshisArg: UInt64, minMaxAcceptedHtlcsArg: UInt16, maxMinimumDepthArg: UInt32, trustOwnFunding0confArg: Bool, forceAnnouncedChannelPreferenceArg: Bool, theirToSelfDelayArg: UInt16) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ChannelHandshakeLimits_new(minFundingSatoshisArg, maxFundingSatoshisArg, maxHtlcMinimumMsatArg, minMaxHtlcValueInFlightMsatArg, maxChannelReserveSatoshisArg, minMaxAcceptedHtlcsArg, maxMinimumDepthArg, trustOwnFunding0confArg, forceAnnouncedChannelPreferenceArg, theirToSelfDelayArg)

						// cleanup
						
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = ChannelHandshakeLimits(cType: nativeCallResult, instantiationContext: "ChannelHandshakeLimits.swift::\(#function):\(#line)")
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0, instantiationContext: "ChannelHandshakeLimits.swift::\(#function):\(#line)")
				
			
					}
		
					/// Creates a copy of the ChannelHandshakeLimits
					internal func clone() -> ChannelHandshakeLimits {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKChannelHandshakeLimits>) in
				ChannelHandshakeLimits_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ChannelHandshakeLimits(cType: nativeCallResult, instantiationContext: "ChannelHandshakeLimits.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Creates a "default" ChannelHandshakeLimits. See struct and individual field documentaiton for details on which values are used.
					public class func initWithDefault() -> ChannelHandshakeLimits {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ChannelHandshakeLimits_default()

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ChannelHandshakeLimits(cType: nativeCallResult, instantiationContext: "ChannelHandshakeLimits.swift::\(#function):\(#line)")
						

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> ChannelHandshakeLimits {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> ChannelHandshakeLimits {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> ChannelHandshakeLimits {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> ChannelHandshakeLimits {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> ChannelHandshakeLimits {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing ChannelHandshakeLimits \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing ChannelHandshakeLimits \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

				}

				
			}
		
		