
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Options which apply on a per-channel basis and may change at runtime or based on negotiation
			/// with our counterparty.
			public typealias ChannelConfig = Bindings.ChannelConfig

			extension Bindings {
		

				/// Options which apply on a per-channel basis and may change at runtime or based on negotiation
				/// with our counterparty.
				public class ChannelConfig: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKChannelConfig?

					internal init(cType: LDKChannelConfig, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKChannelConfig, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the ChannelConfig, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ChannelConfig_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Amount (in millionths of a satoshi) charged per satoshi for payments forwarded outbound
					/// over the channel.
					/// This may be allowed to change at runtime in a later update, however doing so must result in
					/// update messages sent to notify all nodes of our updated relay fee.
					/// 
					/// Default value: 0.
					public func getForwardingFeeProportionalMillionths() -> UInt32 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelConfig>) in
				ChannelConfig_get_forwarding_fee_proportional_millionths(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Amount (in millionths of a satoshi) charged per satoshi for payments forwarded outbound
					/// over the channel.
					/// This may be allowed to change at runtime in a later update, however doing so must result in
					/// update messages sent to notify all nodes of our updated relay fee.
					/// 
					/// Default value: 0.
					public func setForwardingFeeProportionalMillionths(val: UInt32) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelConfig>) in
				ChannelConfig_set_forwarding_fee_proportional_millionths(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Amount (in milli-satoshi) charged for payments forwarded outbound over the channel, in
					/// excess of [`forwarding_fee_proportional_millionths`].
					/// This may be allowed to change at runtime in a later update, however doing so must result in
					/// update messages sent to notify all nodes of our updated relay fee.
					/// 
					/// The default value of a single satoshi roughly matches the market rate on many routing nodes
					/// as of July 2021. Adjusting it upwards or downwards may change whether nodes route through
					/// this node.
					/// 
					/// Default value: 1000.
					/// 
					/// [`forwarding_fee_proportional_millionths`]: ChannelConfig::forwarding_fee_proportional_millionths
					public func getForwardingFeeBaseMsat() -> UInt32 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelConfig>) in
				ChannelConfig_get_forwarding_fee_base_msat(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Amount (in milli-satoshi) charged for payments forwarded outbound over the channel, in
					/// excess of [`forwarding_fee_proportional_millionths`].
					/// This may be allowed to change at runtime in a later update, however doing so must result in
					/// update messages sent to notify all nodes of our updated relay fee.
					/// 
					/// The default value of a single satoshi roughly matches the market rate on many routing nodes
					/// as of July 2021. Adjusting it upwards or downwards may change whether nodes route through
					/// this node.
					/// 
					/// Default value: 1000.
					/// 
					/// [`forwarding_fee_proportional_millionths`]: ChannelConfig::forwarding_fee_proportional_millionths
					public func setForwardingFeeBaseMsat(val: UInt32) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelConfig>) in
				ChannelConfig_set_forwarding_fee_base_msat(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The difference in the CLTV value between incoming HTLCs and an outbound HTLC forwarded over
					/// the channel this config applies to.
					/// 
					/// This is analogous to [`ChannelHandshakeConfig::our_to_self_delay`] but applies to in-flight
					/// HTLC balance when a channel appears on-chain whereas
					/// [`ChannelHandshakeConfig::our_to_self_delay`] applies to the remaining
					/// (non-HTLC-encumbered) balance.
					/// 
					/// Thus, for HTLC-encumbered balances to be enforced on-chain when a channel is force-closed,
					/// we (or one of our watchtowers) MUST be online to check for broadcast of the current
					/// commitment transaction at least once per this many blocks (minus some margin to allow us
					/// enough time to broadcast and confirm a transaction, possibly with time in between to RBF
					/// the spending transaction).
					/// 
					/// Default value: 72 (12 hours at an average of 6 blocks/hour).
					/// Minimum value: [`MIN_CLTV_EXPIRY_DELTA`], any values less than this will be treated as
					/// [`MIN_CLTV_EXPIRY_DELTA`] instead.
					/// 
					/// [`MIN_CLTV_EXPIRY_DELTA`]: crate::ln::channelmanager::MIN_CLTV_EXPIRY_DELTA
					public func getCltvExpiryDelta() -> UInt16 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelConfig>) in
				ChannelConfig_get_cltv_expiry_delta(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The difference in the CLTV value between incoming HTLCs and an outbound HTLC forwarded over
					/// the channel this config applies to.
					/// 
					/// This is analogous to [`ChannelHandshakeConfig::our_to_self_delay`] but applies to in-flight
					/// HTLC balance when a channel appears on-chain whereas
					/// [`ChannelHandshakeConfig::our_to_self_delay`] applies to the remaining
					/// (non-HTLC-encumbered) balance.
					/// 
					/// Thus, for HTLC-encumbered balances to be enforced on-chain when a channel is force-closed,
					/// we (or one of our watchtowers) MUST be online to check for broadcast of the current
					/// commitment transaction at least once per this many blocks (minus some margin to allow us
					/// enough time to broadcast and confirm a transaction, possibly with time in between to RBF
					/// the spending transaction).
					/// 
					/// Default value: 72 (12 hours at an average of 6 blocks/hour).
					/// Minimum value: [`MIN_CLTV_EXPIRY_DELTA`], any values less than this will be treated as
					/// [`MIN_CLTV_EXPIRY_DELTA`] instead.
					/// 
					/// [`MIN_CLTV_EXPIRY_DELTA`]: crate::ln::channelmanager::MIN_CLTV_EXPIRY_DELTA
					public func setCltvExpiryDelta(val: UInt16) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelConfig>) in
				ChannelConfig_set_cltv_expiry_delta(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Limit our total exposure to in-flight HTLCs which are burned to fees as they are too
					/// small to claim on-chain.
					/// 
					/// When an HTLC present in one of our channels is below a \"dust\" threshold, the HTLC will
					/// not be claimable on-chain, instead being turned into additional miner fees if either
					/// party force-closes the channel. Because the threshold is per-HTLC, our total exposure
					/// to such payments may be sustantial if there are many dust HTLCs present when the
					/// channel is force-closed.
					/// 
					/// The dust threshold for each HTLC is based on the `dust_limit_satoshis` for each party in a
					/// channel negotiated throughout the channel open process, along with the fees required to have
					/// a broadcastable HTLC spending transaction. When a channel supports anchor outputs
					/// (specifically the zero fee HTLC transaction variant), this threshold no longer takes into
					/// account the HTLC transaction fee as it is zero.
					/// 
					/// This limit is applied for sent, forwarded, and received HTLCs and limits the total
					/// exposure across all three types per-channel. Setting this too low may prevent the
					/// sending or receipt of low-value HTLCs on high-traffic nodes, and this limit is very
					/// important to prevent stealing of dust HTLCs by miners.
					/// 
					/// Default value: 5_000_000 msat.
					public func getMaxDustHtlcExposureMsat() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelConfig>) in
				ChannelConfig_get_max_dust_htlc_exposure_msat(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Limit our total exposure to in-flight HTLCs which are burned to fees as they are too
					/// small to claim on-chain.
					/// 
					/// When an HTLC present in one of our channels is below a \"dust\" threshold, the HTLC will
					/// not be claimable on-chain, instead being turned into additional miner fees if either
					/// party force-closes the channel. Because the threshold is per-HTLC, our total exposure
					/// to such payments may be sustantial if there are many dust HTLCs present when the
					/// channel is force-closed.
					/// 
					/// The dust threshold for each HTLC is based on the `dust_limit_satoshis` for each party in a
					/// channel negotiated throughout the channel open process, along with the fees required to have
					/// a broadcastable HTLC spending transaction. When a channel supports anchor outputs
					/// (specifically the zero fee HTLC transaction variant), this threshold no longer takes into
					/// account the HTLC transaction fee as it is zero.
					/// 
					/// This limit is applied for sent, forwarded, and received HTLCs and limits the total
					/// exposure across all three types per-channel. Setting this too low may prevent the
					/// sending or receipt of low-value HTLCs on high-traffic nodes, and this limit is very
					/// important to prevent stealing of dust HTLCs by miners.
					/// 
					/// Default value: 5_000_000 msat.
					public func setMaxDustHtlcExposureMsat(val: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelConfig>) in
				ChannelConfig_set_max_dust_htlc_exposure_msat(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The additional fee we're willing to pay to avoid waiting for the counterparty's
					/// `to_self_delay` to reclaim funds.
					/// 
					/// When we close a channel cooperatively with our counterparty, we negotiate a fee for the
					/// closing transaction which both sides find acceptable, ultimately paid by the channel
					/// funder/initiator.
					/// 
					/// When we are the funder, because we have to pay the channel closing fee, we bound the
					/// acceptable fee by our [`Background`] and [`Normal`] fees, with the upper bound increased by
					/// this value. Because the on-chain fee we'd pay to force-close the channel is kept near our
					/// [`Normal`] feerate during normal operation, this value represents the additional fee we're
					/// willing to pay in order to avoid waiting for our counterparty's to_self_delay to reclaim our
					/// funds.
					/// 
					/// When we are not the funder, we require the closing transaction fee pay at least our
					/// [`Background`] fee estimate, but allow our counterparty to pay as much fee as they like.
					/// Thus, this value is ignored when we are not the funder.
					/// 
					/// Default value: 1000 satoshis.
					/// 
					/// [`Normal`]: crate::chain::chaininterface::ConfirmationTarget::Normal
					/// [`Background`]: crate::chain::chaininterface::ConfirmationTarget::Background
					public func getForceCloseAvoidanceMaxFeeSatoshis() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelConfig>) in
				ChannelConfig_get_force_close_avoidance_max_fee_satoshis(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The additional fee we're willing to pay to avoid waiting for the counterparty's
					/// `to_self_delay` to reclaim funds.
					/// 
					/// When we close a channel cooperatively with our counterparty, we negotiate a fee for the
					/// closing transaction which both sides find acceptable, ultimately paid by the channel
					/// funder/initiator.
					/// 
					/// When we are the funder, because we have to pay the channel closing fee, we bound the
					/// acceptable fee by our [`Background`] and [`Normal`] fees, with the upper bound increased by
					/// this value. Because the on-chain fee we'd pay to force-close the channel is kept near our
					/// [`Normal`] feerate during normal operation, this value represents the additional fee we're
					/// willing to pay in order to avoid waiting for our counterparty's to_self_delay to reclaim our
					/// funds.
					/// 
					/// When we are not the funder, we require the closing transaction fee pay at least our
					/// [`Background`] fee estimate, but allow our counterparty to pay as much fee as they like.
					/// Thus, this value is ignored when we are not the funder.
					/// 
					/// Default value: 1000 satoshis.
					/// 
					/// [`Normal`]: crate::chain::chaininterface::ConfirmationTarget::Normal
					/// [`Background`]: crate::chain::chaininterface::ConfirmationTarget::Background
					public func setForceCloseAvoidanceMaxFeeSatoshis(val: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelConfig>) in
				ChannelConfig_set_force_close_avoidance_max_fee_satoshis(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new ChannelConfig given each field
					public init(forwardingFeeProportionalMillionthsArg: UInt32, forwardingFeeBaseMsatArg: UInt32, cltvExpiryDeltaArg: UInt16, maxDustHtlcExposureMsatArg: UInt64, forceCloseAvoidanceMaxFeeSatoshisArg: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ChannelConfig_new(forwardingFeeProportionalMillionthsArg, forwardingFeeBaseMsatArg, cltvExpiryDeltaArg, maxDustHtlcExposureMsatArg, forceCloseAvoidanceMaxFeeSatoshisArg)

						// cleanup
						
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = ChannelConfig(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)")
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0, instantiationContext: "#{swift_class_name}::\(#function):\(#line)")
				
			
					}
		
					/// Creates a copy of the ChannelConfig
					internal func clone() -> ChannelConfig {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKChannelConfig>) in
				ChannelConfig_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ChannelConfig(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Checks if two ChannelConfigs contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public class func eq(a: ChannelConfig, b: ChannelConfig) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKChannelConfig>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKChannelConfig>) in
				ChannelConfig_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a "default" ChannelConfig. See struct and individual field documentaiton for details on which values are used.
					public class func initWithDefault() -> ChannelConfig {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ChannelConfig_default()

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ChannelConfig(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Serialize the ChannelConfig object into a byte array which can be read by ChannelConfig_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKChannelConfig>) in
				ChannelConfig_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a ChannelConfig from a byte array, created by ChannelConfig_write
					public class func read(ser: [UInt8]) -> Result_ChannelConfigDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = ChannelConfig_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_ChannelConfigDecodeErrorZ(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)")
						

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> ChannelConfig {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> ChannelConfig {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> ChannelConfig {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> ChannelConfig {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> ChannelConfig {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing ChannelConfig \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing ChannelConfig \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		