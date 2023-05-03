
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Details of a channel, as returned by ChannelManager::list_channels and ChannelManager::list_usable_channels
			public typealias ChannelDetails = Bindings.ChannelDetails

			extension Bindings {
		

				/// Details of a channel, as returned by ChannelManager::list_channels and ChannelManager::list_usable_channels
				public class ChannelDetails: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKChannelDetails?

					internal init(cType: LDKChannelDetails, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKChannelDetails, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the ChannelDetails, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ChannelDetails_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The channel's ID (prior to funding transaction generation, this is a random 32 bytes,
					/// thereafter this is the txid of the funding transaction xor the funding transaction output).
					/// Note that this means this value is *not* persistent - it can change once during the
					/// lifetime of the channel.
					public func getChannelId() -> [UInt8]? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelDetails>) in
				ChannelDetails_get_channel_id(thisPtrPointer)
						}
				

						// cleanup
						
						guard let nativeCallResult = nativeCallResult else {
							return nil
						}
			

						
						// return value (do some wrapping)
						let returnValue = Bindings.UInt8Tuple32ToArray(tuple: nativeCallResult.pointee)
						

						return returnValue
					}
		
					/// The channel's ID (prior to funding transaction generation, this is a random 32 bytes,
					/// thereafter this is the txid of the funding transaction xor the funding transaction output).
					/// Note that this means this value is *not* persistent - it can change once during the
					/// lifetime of the channel.
					public func setChannelId(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = ThirtyTwoBytes(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelDetails>) in
				ChannelDetails_set_channel_id(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Parameters which apply to our counterparty. See individual fields for more information.
					public func getCounterparty() -> ChannelCounterparty {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelDetails>) in
				ChannelDetails_get_counterparty(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ChannelCounterparty(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)", anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// Parameters which apply to our counterparty. See individual fields for more information.
					public func setCounterparty(val: ChannelCounterparty) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelDetails>) in
				ChannelDetails_set_counterparty(thisPtrPointer, val.dynamicallyDangledClone().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The Channel's funding transaction output, if we've negotiated the funding transaction with
					/// our counterparty already.
					/// 
					/// Note that, if this has been set, `channel_id` will be equivalent to
					/// `funding_txo.unwrap().to_channel_id()`.
					/// 
					/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func getFundingTxo() -> OutPoint? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelDetails>) in
				ChannelDetails_get_funding_txo(thisPtrPointer)
						}
				

						// cleanup
						
				// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
				// Type group: RustStruct
				// Type: LDKOutPoint
			
					if nativeCallResult.inner == nil {
						return nil
					}

					let pointerValue = UInt(bitPattern: nativeCallResult.inner)
					if pointerValue == 0 {
						return nil
					}
				

						
						// return value (do some wrapping)
						let returnValue = OutPoint(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)", anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// The Channel's funding transaction output, if we've negotiated the funding transaction with
					/// our counterparty already.
					/// 
					/// Note that, if this has been set, `channel_id` will be equivalent to
					/// `funding_txo.unwrap().to_channel_id()`.
					/// 
					/// Note that val (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func setFundingTxo(val: OutPoint) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelDetails>) in
				ChannelDetails_set_funding_txo(thisPtrPointer, val.dynamicallyDangledClone().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The features which this channel operates with. See individual features for more info.
					/// 
					/// `None` until negotiation completes and the channel type is finalized.
					/// 
					/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func getChannelType() -> ChannelTypeFeatures? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelDetails>) in
				ChannelDetails_get_channel_type(thisPtrPointer)
						}
				

						// cleanup
						
				// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
				// Type group: RustStruct
				// Type: LDKChannelTypeFeatures
			
					if nativeCallResult.inner == nil {
						return nil
					}

					let pointerValue = UInt(bitPattern: nativeCallResult.inner)
					if pointerValue == 0 {
						return nil
					}
				

						
						// return value (do some wrapping)
						let returnValue = ChannelTypeFeatures(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)", anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// The features which this channel operates with. See individual features for more info.
					/// 
					/// `None` until negotiation completes and the channel type is finalized.
					/// 
					/// Note that val (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func setChannelType(val: ChannelTypeFeatures) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelDetails>) in
				ChannelDetails_set_channel_type(thisPtrPointer, val.dynamicallyDangledClone().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The position of the funding transaction in the chain. None if the funding transaction has
					/// not yet been confirmed and the channel fully opened.
					/// 
					/// Note that if [`inbound_scid_alias`] is set, it must be used for invoices and inbound
					/// payments instead of this. See [`get_inbound_payment_scid`].
					/// 
					/// For channels with [`confirmations_required`] set to `Some(0)`, [`outbound_scid_alias`] may
					/// be used in place of this in outbound routes. See [`get_outbound_payment_scid`].
					/// 
					/// [`inbound_scid_alias`]: Self::inbound_scid_alias
					/// [`outbound_scid_alias`]: Self::outbound_scid_alias
					/// [`get_inbound_payment_scid`]: Self::get_inbound_payment_scid
					/// [`get_outbound_payment_scid`]: Self::get_outbound_payment_scid
					/// [`confirmations_required`]: Self::confirmations_required
					public func getShortChannelId() -> UInt64? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelDetails>) in
				ChannelDetails_get_short_channel_id(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Option_u64Z(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)", anchor: self).getValue()
						

						return returnValue
					}
		
					/// The position of the funding transaction in the chain. None if the funding transaction has
					/// not yet been confirmed and the channel fully opened.
					/// 
					/// Note that if [`inbound_scid_alias`] is set, it must be used for invoices and inbound
					/// payments instead of this. See [`get_inbound_payment_scid`].
					/// 
					/// For channels with [`confirmations_required`] set to `Some(0)`, [`outbound_scid_alias`] may
					/// be used in place of this in outbound routes. See [`get_outbound_payment_scid`].
					/// 
					/// [`inbound_scid_alias`]: Self::inbound_scid_alias
					/// [`outbound_scid_alias`]: Self::outbound_scid_alias
					/// [`get_inbound_payment_scid`]: Self::get_inbound_payment_scid
					/// [`get_outbound_payment_scid`]: Self::get_outbound_payment_scid
					/// [`confirmations_required`]: Self::confirmations_required
					public func setShortChannelId(val: UInt64?) {
						// native call variable prep
						
						let valOption = Option_u64Z(some: val).danglingClone()
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelDetails>) in
				ChannelDetails_set_short_channel_id(thisPtrPointer, valOption.cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// An optional [`short_channel_id`] alias for this channel, randomly generated by us and
					/// usable in place of [`short_channel_id`] to reference the channel in outbound routes when
					/// the channel has not yet been confirmed (as long as [`confirmations_required`] is
					/// `Some(0)`).
					/// 
					/// This will be `None` as long as the channel is not available for routing outbound payments.
					/// 
					/// [`short_channel_id`]: Self::short_channel_id
					/// [`confirmations_required`]: Self::confirmations_required
					public func getOutboundScidAlias() -> UInt64? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelDetails>) in
				ChannelDetails_get_outbound_scid_alias(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Option_u64Z(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)", anchor: self).getValue()
						

						return returnValue
					}
		
					/// An optional [`short_channel_id`] alias for this channel, randomly generated by us and
					/// usable in place of [`short_channel_id`] to reference the channel in outbound routes when
					/// the channel has not yet been confirmed (as long as [`confirmations_required`] is
					/// `Some(0)`).
					/// 
					/// This will be `None` as long as the channel is not available for routing outbound payments.
					/// 
					/// [`short_channel_id`]: Self::short_channel_id
					/// [`confirmations_required`]: Self::confirmations_required
					public func setOutboundScidAlias(val: UInt64?) {
						// native call variable prep
						
						let valOption = Option_u64Z(some: val).danglingClone()
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelDetails>) in
				ChannelDetails_set_outbound_scid_alias(thisPtrPointer, valOption.cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// An optional [`short_channel_id`] alias for this channel, randomly generated by our
					/// counterparty and usable in place of [`short_channel_id`] in invoice route hints. Our
					/// counterparty will recognize the alias provided here in place of the [`short_channel_id`]
					/// when they see a payment to be routed to us.
					/// 
					/// Our counterparty may choose to rotate this value at any time, though will always recognize
					/// previous values for inbound payment forwarding.
					/// 
					/// [`short_channel_id`]: Self::short_channel_id
					public func getInboundScidAlias() -> UInt64? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelDetails>) in
				ChannelDetails_get_inbound_scid_alias(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Option_u64Z(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)", anchor: self).getValue()
						

						return returnValue
					}
		
					/// An optional [`short_channel_id`] alias for this channel, randomly generated by our
					/// counterparty and usable in place of [`short_channel_id`] in invoice route hints. Our
					/// counterparty will recognize the alias provided here in place of the [`short_channel_id`]
					/// when they see a payment to be routed to us.
					/// 
					/// Our counterparty may choose to rotate this value at any time, though will always recognize
					/// previous values for inbound payment forwarding.
					/// 
					/// [`short_channel_id`]: Self::short_channel_id
					public func setInboundScidAlias(val: UInt64?) {
						// native call variable prep
						
						let valOption = Option_u64Z(some: val).danglingClone()
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelDetails>) in
				ChannelDetails_set_inbound_scid_alias(thisPtrPointer, valOption.cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The value, in satoshis, of this channel as appears in the funding output
					public func getChannelValueSatoshis() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelDetails>) in
				ChannelDetails_get_channel_value_satoshis(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The value, in satoshis, of this channel as appears in the funding output
					public func setChannelValueSatoshis(val: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelDetails>) in
				ChannelDetails_set_channel_value_satoshis(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The value, in satoshis, that must always be held in the channel for us. This value ensures
					/// that if we broadcast a revoked state, our counterparty can punish us by claiming at least
					/// this value on chain.
					/// 
					/// This value is not included in [`outbound_capacity_msat`] as it can never be spent.
					/// 
					/// This value will be `None` for outbound channels until the counterparty accepts the channel.
					/// 
					/// [`outbound_capacity_msat`]: ChannelDetails::outbound_capacity_msat
					public func getUnspendablePunishmentReserve() -> UInt64? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelDetails>) in
				ChannelDetails_get_unspendable_punishment_reserve(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Option_u64Z(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)", anchor: self).getValue()
						

						return returnValue
					}
		
					/// The value, in satoshis, that must always be held in the channel for us. This value ensures
					/// that if we broadcast a revoked state, our counterparty can punish us by claiming at least
					/// this value on chain.
					/// 
					/// This value is not included in [`outbound_capacity_msat`] as it can never be spent.
					/// 
					/// This value will be `None` for outbound channels until the counterparty accepts the channel.
					/// 
					/// [`outbound_capacity_msat`]: ChannelDetails::outbound_capacity_msat
					public func setUnspendablePunishmentReserve(val: UInt64?) {
						// native call variable prep
						
						let valOption = Option_u64Z(some: val).danglingClone()
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelDetails>) in
				ChannelDetails_set_unspendable_punishment_reserve(thisPtrPointer, valOption.cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The `user_channel_id` passed in to create_channel, or a random value if the channel was
					/// inbound. This may be zero for inbound channels serialized with LDK versions prior to
					/// 0.0.113.
					public func getUserChannelId() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelDetails>) in
				ChannelDetails_get_user_channel_id(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = U128(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// The `user_channel_id` passed in to create_channel, or a random value if the channel was
					/// inbound. This may be zero for inbound channels serialized with LDK versions prior to
					/// 0.0.113.
					public func setUserChannelId(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = U128(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelDetails>) in
				ChannelDetails_set_user_channel_id(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Our total balance.  This is the amount we would get if we close the channel.
					/// This value is not exact. Due to various in-flight changes and feerate changes, exactly this
					/// amount is not likely to be recoverable on close.
					/// 
					/// This does not include any pending HTLCs which are not yet fully resolved (and, thus, whose
					/// balance is not available for inclusion in new outbound HTLCs). This further does not include
					/// any pending outgoing HTLCs which are awaiting some other resolution to be sent.
					/// This does not consider any on-chain fees.
					/// 
					/// See also [`ChannelDetails::outbound_capacity_msat`]
					public func getBalanceMsat() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelDetails>) in
				ChannelDetails_get_balance_msat(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Our total balance.  This is the amount we would get if we close the channel.
					/// This value is not exact. Due to various in-flight changes and feerate changes, exactly this
					/// amount is not likely to be recoverable on close.
					/// 
					/// This does not include any pending HTLCs which are not yet fully resolved (and, thus, whose
					/// balance is not available for inclusion in new outbound HTLCs). This further does not include
					/// any pending outgoing HTLCs which are awaiting some other resolution to be sent.
					/// This does not consider any on-chain fees.
					/// 
					/// See also [`ChannelDetails::outbound_capacity_msat`]
					public func setBalanceMsat(val: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelDetails>) in
				ChannelDetails_set_balance_msat(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The available outbound capacity for sending HTLCs to the remote peer. This does not include
					/// any pending HTLCs which are not yet fully resolved (and, thus, whose balance is not
					/// available for inclusion in new outbound HTLCs). This further does not include any pending
					/// outgoing HTLCs which are awaiting some other resolution to be sent.
					/// 
					/// See also [`ChannelDetails::balance_msat`]
					/// 
					/// This value is not exact. Due to various in-flight changes, feerate changes, and our
					/// conflict-avoidance policy, exactly this amount is not likely to be spendable. However, we
					/// should be able to spend nearly this amount.
					public func getOutboundCapacityMsat() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelDetails>) in
				ChannelDetails_get_outbound_capacity_msat(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The available outbound capacity for sending HTLCs to the remote peer. This does not include
					/// any pending HTLCs which are not yet fully resolved (and, thus, whose balance is not
					/// available for inclusion in new outbound HTLCs). This further does not include any pending
					/// outgoing HTLCs which are awaiting some other resolution to be sent.
					/// 
					/// See also [`ChannelDetails::balance_msat`]
					/// 
					/// This value is not exact. Due to various in-flight changes, feerate changes, and our
					/// conflict-avoidance policy, exactly this amount is not likely to be spendable. However, we
					/// should be able to spend nearly this amount.
					public func setOutboundCapacityMsat(val: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelDetails>) in
				ChannelDetails_set_outbound_capacity_msat(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The available outbound capacity for sending a single HTLC to the remote peer. This is
					/// similar to [`ChannelDetails::outbound_capacity_msat`] but it may be further restricted by
					/// the current state and per-HTLC limit(s). This is intended for use when routing, allowing us
					/// to use a limit as close as possible to the HTLC limit we can currently send.
					/// 
					/// See also [`ChannelDetails::balance_msat`] and [`ChannelDetails::outbound_capacity_msat`].
					public func getNextOutboundHtlcLimitMsat() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelDetails>) in
				ChannelDetails_get_next_outbound_htlc_limit_msat(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The available outbound capacity for sending a single HTLC to the remote peer. This is
					/// similar to [`ChannelDetails::outbound_capacity_msat`] but it may be further restricted by
					/// the current state and per-HTLC limit(s). This is intended for use when routing, allowing us
					/// to use a limit as close as possible to the HTLC limit we can currently send.
					/// 
					/// See also [`ChannelDetails::balance_msat`] and [`ChannelDetails::outbound_capacity_msat`].
					public func setNextOutboundHtlcLimitMsat(val: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelDetails>) in
				ChannelDetails_set_next_outbound_htlc_limit_msat(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The available inbound capacity for the remote peer to send HTLCs to us. This does not
					/// include any pending HTLCs which are not yet fully resolved (and, thus, whose balance is not
					/// available for inclusion in new inbound HTLCs).
					/// Note that there are some corner cases not fully handled here, so the actual available
					/// inbound capacity may be slightly higher than this.
					/// 
					/// This value is not exact. Due to various in-flight changes, feerate changes, and our
					/// counterparty's conflict-avoidance policy, exactly this amount is not likely to be spendable.
					/// However, our counterparty should be able to spend nearly this amount.
					public func getInboundCapacityMsat() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelDetails>) in
				ChannelDetails_get_inbound_capacity_msat(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The available inbound capacity for the remote peer to send HTLCs to us. This does not
					/// include any pending HTLCs which are not yet fully resolved (and, thus, whose balance is not
					/// available for inclusion in new inbound HTLCs).
					/// Note that there are some corner cases not fully handled here, so the actual available
					/// inbound capacity may be slightly higher than this.
					/// 
					/// This value is not exact. Due to various in-flight changes, feerate changes, and our
					/// counterparty's conflict-avoidance policy, exactly this amount is not likely to be spendable.
					/// However, our counterparty should be able to spend nearly this amount.
					public func setInboundCapacityMsat(val: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelDetails>) in
				ChannelDetails_set_inbound_capacity_msat(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The number of required confirmations on the funding transaction before the funding will be
					/// considered \"locked\". This number is selected by the channel fundee (i.e. us if
					/// [`is_outbound`] is *not* set), and can be selected for inbound channels with
					/// [`ChannelHandshakeConfig::minimum_depth`] or limited for outbound channels with
					/// [`ChannelHandshakeLimits::max_minimum_depth`].
					/// 
					/// This value will be `None` for outbound channels until the counterparty accepts the channel.
					/// 
					/// [`is_outbound`]: ChannelDetails::is_outbound
					/// [`ChannelHandshakeConfig::minimum_depth`]: crate::util::config::ChannelHandshakeConfig::minimum_depth
					/// [`ChannelHandshakeLimits::max_minimum_depth`]: crate::util::config::ChannelHandshakeLimits::max_minimum_depth
					public func getConfirmationsRequired() -> UInt32? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelDetails>) in
				ChannelDetails_get_confirmations_required(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Option_u32Z(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)", anchor: self).getValue()
						

						return returnValue
					}
		
					/// The number of required confirmations on the funding transaction before the funding will be
					/// considered \"locked\". This number is selected by the channel fundee (i.e. us if
					/// [`is_outbound`] is *not* set), and can be selected for inbound channels with
					/// [`ChannelHandshakeConfig::minimum_depth`] or limited for outbound channels with
					/// [`ChannelHandshakeLimits::max_minimum_depth`].
					/// 
					/// This value will be `None` for outbound channels until the counterparty accepts the channel.
					/// 
					/// [`is_outbound`]: ChannelDetails::is_outbound
					/// [`ChannelHandshakeConfig::minimum_depth`]: crate::util::config::ChannelHandshakeConfig::minimum_depth
					/// [`ChannelHandshakeLimits::max_minimum_depth`]: crate::util::config::ChannelHandshakeLimits::max_minimum_depth
					public func setConfirmationsRequired(val: UInt32?) {
						// native call variable prep
						
						let valOption = Option_u32Z(some: val).danglingClone()
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelDetails>) in
				ChannelDetails_set_confirmations_required(thisPtrPointer, valOption.cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The current number of confirmations on the funding transaction.
					/// 
					/// This value will be `None` for objects serialized with LDK versions prior to 0.0.113.
					public func getConfirmations() -> UInt32? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelDetails>) in
				ChannelDetails_get_confirmations(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Option_u32Z(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)", anchor: self).getValue()
						

						return returnValue
					}
		
					/// The current number of confirmations on the funding transaction.
					/// 
					/// This value will be `None` for objects serialized with LDK versions prior to 0.0.113.
					public func setConfirmations(val: UInt32?) {
						// native call variable prep
						
						let valOption = Option_u32Z(some: val).danglingClone()
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelDetails>) in
				ChannelDetails_set_confirmations(thisPtrPointer, valOption.cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The number of blocks (after our commitment transaction confirms) that we will need to wait
					/// until we can claim our funds after we force-close the channel. During this time our
					/// counterparty is allowed to punish us if we broadcasted a stale state. If our counterparty
					/// force-closes the channel and broadcasts a commitment transaction we do not have to wait any
					/// time to claim our non-HTLC-encumbered funds.
					/// 
					/// This value will be `None` for outbound channels until the counterparty accepts the channel.
					public func getForceCloseSpendDelay() -> UInt16? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelDetails>) in
				ChannelDetails_get_force_close_spend_delay(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Option_u16Z(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)", anchor: self).getValue()
						

						return returnValue
					}
		
					/// The number of blocks (after our commitment transaction confirms) that we will need to wait
					/// until we can claim our funds after we force-close the channel. During this time our
					/// counterparty is allowed to punish us if we broadcasted a stale state. If our counterparty
					/// force-closes the channel and broadcasts a commitment transaction we do not have to wait any
					/// time to claim our non-HTLC-encumbered funds.
					/// 
					/// This value will be `None` for outbound channels until the counterparty accepts the channel.
					public func setForceCloseSpendDelay(val: UInt16?) {
						// native call variable prep
						
						let valOption = Option_u16Z(some: val).danglingClone()
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelDetails>) in
				ChannelDetails_set_force_close_spend_delay(thisPtrPointer, valOption.cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// True if the channel was initiated (and thus funded) by us.
					public func getIsOutbound() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelDetails>) in
				ChannelDetails_get_is_outbound(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// True if the channel was initiated (and thus funded) by us.
					public func setIsOutbound(val: Bool) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelDetails>) in
				ChannelDetails_set_is_outbound(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// True if the channel is confirmed, channel_ready messages have been exchanged, and the
					/// channel is not currently being shut down. `channel_ready` message exchange implies the
					/// required confirmation count has been reached (and we were connected to the peer at some
					/// point after the funding transaction received enough confirmations). The required
					/// confirmation count is provided in [`confirmations_required`].
					/// 
					/// [`confirmations_required`]: ChannelDetails::confirmations_required
					public func getIsChannelReady() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelDetails>) in
				ChannelDetails_get_is_channel_ready(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// True if the channel is confirmed, channel_ready messages have been exchanged, and the
					/// channel is not currently being shut down. `channel_ready` message exchange implies the
					/// required confirmation count has been reached (and we were connected to the peer at some
					/// point after the funding transaction received enough confirmations). The required
					/// confirmation count is provided in [`confirmations_required`].
					/// 
					/// [`confirmations_required`]: ChannelDetails::confirmations_required
					public func setIsChannelReady(val: Bool) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelDetails>) in
				ChannelDetails_set_is_channel_ready(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// True if the channel is (a) confirmed and channel_ready messages have been exchanged, (b)
					/// the peer is connected, and (c) the channel is not currently negotiating a shutdown.
					/// 
					/// This is a strict superset of `is_channel_ready`.
					public func getIsUsable() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelDetails>) in
				ChannelDetails_get_is_usable(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// True if the channel is (a) confirmed and channel_ready messages have been exchanged, (b)
					/// the peer is connected, and (c) the channel is not currently negotiating a shutdown.
					/// 
					/// This is a strict superset of `is_channel_ready`.
					public func setIsUsable(val: Bool) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelDetails>) in
				ChannelDetails_set_is_usable(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// True if this channel is (or will be) publicly-announced.
					public func getIsPublic() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelDetails>) in
				ChannelDetails_get_is_public(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// True if this channel is (or will be) publicly-announced.
					public func setIsPublic(val: Bool) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelDetails>) in
				ChannelDetails_set_is_public(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The smallest value HTLC (in msat) we will accept, for this channel. This field
					/// is only `None` for `ChannelDetails` objects serialized prior to LDK 0.0.107
					public func getInboundHtlcMinimumMsat() -> UInt64? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelDetails>) in
				ChannelDetails_get_inbound_htlc_minimum_msat(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Option_u64Z(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)", anchor: self).getValue()
						

						return returnValue
					}
		
					/// The smallest value HTLC (in msat) we will accept, for this channel. This field
					/// is only `None` for `ChannelDetails` objects serialized prior to LDK 0.0.107
					public func setInboundHtlcMinimumMsat(val: UInt64?) {
						// native call variable prep
						
						let valOption = Option_u64Z(some: val).danglingClone()
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelDetails>) in
				ChannelDetails_set_inbound_htlc_minimum_msat(thisPtrPointer, valOption.cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The largest value HTLC (in msat) we currently will accept, for this channel.
					public func getInboundHtlcMaximumMsat() -> UInt64? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelDetails>) in
				ChannelDetails_get_inbound_htlc_maximum_msat(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Option_u64Z(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)", anchor: self).getValue()
						

						return returnValue
					}
		
					/// The largest value HTLC (in msat) we currently will accept, for this channel.
					public func setInboundHtlcMaximumMsat(val: UInt64?) {
						// native call variable prep
						
						let valOption = Option_u64Z(some: val).danglingClone()
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelDetails>) in
				ChannelDetails_set_inbound_htlc_maximum_msat(thisPtrPointer, valOption.cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Set of configurable parameters that affect channel operation.
					/// 
					/// This field is only `None` for `ChannelDetails` objects serialized prior to LDK 0.0.109.
					/// 
					/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func getConfig() -> ChannelConfig? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelDetails>) in
				ChannelDetails_get_config(thisPtrPointer)
						}
				

						// cleanup
						
				// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
				// Type group: RustStruct
				// Type: LDKChannelConfig
			
					if nativeCallResult.inner == nil {
						return nil
					}

					let pointerValue = UInt(bitPattern: nativeCallResult.inner)
					if pointerValue == 0 {
						return nil
					}
				

						
						// return value (do some wrapping)
						let returnValue = ChannelConfig(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)", anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// Set of configurable parameters that affect channel operation.
					/// 
					/// This field is only `None` for `ChannelDetails` objects serialized prior to LDK 0.0.109.
					/// 
					/// Note that val (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func setConfig(val: ChannelConfig) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelDetails>) in
				ChannelDetails_set_config(thisPtrPointer, val.dynamicallyDangledClone().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new ChannelDetails given each field
					public init(channelIdArg: [UInt8], counterpartyArg: ChannelCounterparty, fundingTxoArg: OutPoint, channelTypeArg: ChannelTypeFeatures, shortChannelIdArg: UInt64?, outboundScidAliasArg: UInt64?, inboundScidAliasArg: UInt64?, channelValueSatoshisArg: UInt64, unspendablePunishmentReserveArg: UInt64?, userChannelIdArg: [UInt8], balanceMsatArg: UInt64, outboundCapacityMsatArg: UInt64, nextOutboundHtlcLimitMsatArg: UInt64, inboundCapacityMsatArg: UInt64, confirmationsRequiredArg: UInt32?, confirmationsArg: UInt32?, forceCloseSpendDelayArg: UInt16?, isOutboundArg: Bool, isChannelReadyArg: Bool, isUsableArg: Bool, isPublicArg: Bool, inboundHtlcMinimumMsatArg: UInt64?, inboundHtlcMaximumMsatArg: UInt64?, configArg: ChannelConfig) {
						// native call variable prep
						
						let channelIdArgPrimitiveWrapper = ThirtyTwoBytes(value: channelIdArg)
				
						let shortChannelIdArgOption = Option_u64Z(some: shortChannelIdArg).danglingClone()
				
						let outboundScidAliasArgOption = Option_u64Z(some: outboundScidAliasArg).danglingClone()
				
						let inboundScidAliasArgOption = Option_u64Z(some: inboundScidAliasArg).danglingClone()
				
						let unspendablePunishmentReserveArgOption = Option_u64Z(some: unspendablePunishmentReserveArg).danglingClone()
				
						let userChannelIdArgPrimitiveWrapper = U128(value: userChannelIdArg)
				
						let confirmationsRequiredArgOption = Option_u32Z(some: confirmationsRequiredArg).danglingClone()
				
						let confirmationsArgOption = Option_u32Z(some: confirmationsArg).danglingClone()
				
						let forceCloseSpendDelayArgOption = Option_u16Z(some: forceCloseSpendDelayArg).danglingClone()
				
						let inboundHtlcMinimumMsatArgOption = Option_u64Z(some: inboundHtlcMinimumMsatArg).danglingClone()
				
						let inboundHtlcMaximumMsatArgOption = Option_u64Z(some: inboundHtlcMaximumMsatArg).danglingClone()
				

						// native method call
						let nativeCallResult = ChannelDetails_new(channelIdArgPrimitiveWrapper.cType!, counterpartyArg.dynamicallyDangledClone().cType!, fundingTxoArg.dynamicallyDangledClone().cType!, channelTypeArg.dynamicallyDangledClone().cType!, shortChannelIdArgOption.cType!, outboundScidAliasArgOption.cType!, inboundScidAliasArgOption.cType!, channelValueSatoshisArg, unspendablePunishmentReserveArgOption.cType!, userChannelIdArgPrimitiveWrapper.cType!, balanceMsatArg, outboundCapacityMsatArg, nextOutboundHtlcLimitMsatArg, inboundCapacityMsatArg, confirmationsRequiredArgOption.cType!, confirmationsArgOption.cType!, forceCloseSpendDelayArgOption.cType!, isOutboundArg, isChannelReadyArg, isUsableArg, isPublicArg, inboundHtlcMinimumMsatArgOption.cType!, inboundHtlcMaximumMsatArgOption.cType!, configArg.dynamicallyDangledClone().cType!)

						// cleanup
						
						// for elided types, we need this
						channelIdArgPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						userChannelIdArgPrimitiveWrapper.noOpRetain()
				
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = ChannelDetails(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)")
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0, instantiationContext: "#{swift_class_name}::\(#function):\(#line)")
				
			
					}
		
					/// Creates a copy of the ChannelDetails
					internal func clone() -> ChannelDetails {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKChannelDetails>) in
				ChannelDetails_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ChannelDetails(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Gets the current SCID which should be used to identify this channel for inbound payments.
					/// This should be used for providing invoice hints or in any other context where our
					/// counterparty will forward a payment to us.
					/// 
					/// This is either the [`ChannelDetails::inbound_scid_alias`], if set, or the
					/// [`ChannelDetails::short_channel_id`]. See those for more information.
					public func getInboundPaymentScid() -> UInt64? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelDetails>) in
				ChannelDetails_get_inbound_payment_scid(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Option_u64Z(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)", anchor: self).getValue()
						

						return returnValue
					}
		
					/// Gets the current SCID which should be used to identify this channel for outbound payments.
					/// This should be used in [`Route`]s to describe the first hop or in other contexts where
					/// we're sending or forwarding a payment outbound over this channel.
					/// 
					/// This is either the [`ChannelDetails::short_channel_id`], if set, or the
					/// [`ChannelDetails::outbound_scid_alias`]. See those for more information.
					public func getOutboundPaymentScid() -> UInt64? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelDetails>) in
				ChannelDetails_get_outbound_payment_scid(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Option_u64Z(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)", anchor: self).getValue()
						

						return returnValue
					}
		
					/// Serialize the ChannelDetails object into a byte array which can be read by ChannelDetails_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKChannelDetails>) in
				ChannelDetails_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a ChannelDetails from a byte array, created by ChannelDetails_write
					public class func read(ser: [UInt8]) -> Result_ChannelDetailsDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = ChannelDetails_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_ChannelDetailsDecodeErrorZ(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)")
						

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> ChannelDetails {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> ChannelDetails {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> ChannelDetails {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> ChannelDetails {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> ChannelDetails {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing ChannelDetails \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing ChannelDetails \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		