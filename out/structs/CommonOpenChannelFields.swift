#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// Contains fields that are both common to [`open_channel`] and `open_channel2` messages.
///
/// [`open_channel`]: https://github.com/lightning/bolts/blob/master/02-peer-protocol.md#the-open_channel-message
public typealias CommonOpenChannelFields = Bindings.CommonOpenChannelFields

extension Bindings {


	/// Contains fields that are both common to [`open_channel`] and `open_channel2` messages.
	///
	/// [`open_channel`]: https://github.com/lightning/bolts/blob/master/02-peer-protocol.md#the-open_channel-message
	public class CommonOpenChannelFields: NativeTypeWrapper {

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

		internal var cType: LDKCommonOpenChannelFields?

		internal init(cType: LDKCommonOpenChannelFields, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKCommonOpenChannelFields, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKCommonOpenChannelFields, instantiationContext: String, anchor: NativeTypeWrapper,
			dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the CommonOpenChannelFields, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = CommonOpenChannelFields_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The genesis hash of the blockchain where the channel is to be opened
		public func getChainHash() -> [UInt8]? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCommonOpenChannelFields>) in
					CommonOpenChannelFields_get_chain_hash(thisPtrPointer)
				}


			// cleanup

			guard let nativeCallResult = nativeCallResult else {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = Bindings.UInt8Tuple32ToArray(tuple: nativeCallResult.pointee)


			return returnValue
		}

		/// The genesis hash of the blockchain where the channel is to be opened
		public func setChainHash(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = ThirtyTwoBytes(
				value: val, instantiationContext: "CommonOpenChannelFields.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKCommonOpenChannelFields>) in
					CommonOpenChannelFields_set_chain_hash(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// A temporary channel ID
		/// For V2 channels: derived using a zeroed out value for the channel acceptor's revocation basepoint
		/// For V1 channels: a temporary channel ID, until the funding outpoint is announced
		public func getTemporaryChannelId() -> ChannelId {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCommonOpenChannelFields>) in
					CommonOpenChannelFields_get_temporary_channel_id(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ChannelId(
				cType: nativeCallResult, instantiationContext: "CommonOpenChannelFields.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// A temporary channel ID
		/// For V2 channels: derived using a zeroed out value for the channel acceptor's revocation basepoint
		/// For V1 channels: a temporary channel ID, until the funding outpoint is announced
		public func setTemporaryChannelId(val: ChannelId) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKCommonOpenChannelFields>) in
					CommonOpenChannelFields_set_temporary_channel_id(
						thisPtrPointer, val.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// For V1 channels: The channel value
		/// For V2 channels: Part of the channel value contributed by the channel initiator
		public func getFundingSatoshis() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCommonOpenChannelFields>) in
					CommonOpenChannelFields_get_funding_satoshis(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// For V1 channels: The channel value
		/// For V2 channels: Part of the channel value contributed by the channel initiator
		public func setFundingSatoshis(val: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKCommonOpenChannelFields>) in
					CommonOpenChannelFields_set_funding_satoshis(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The threshold below which outputs on transactions broadcast by the channel initiator will be
		/// omitted
		public func getDustLimitSatoshis() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCommonOpenChannelFields>) in
					CommonOpenChannelFields_get_dust_limit_satoshis(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The threshold below which outputs on transactions broadcast by the channel initiator will be
		/// omitted
		public func setDustLimitSatoshis(val: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKCommonOpenChannelFields>) in
					CommonOpenChannelFields_set_dust_limit_satoshis(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The maximum inbound HTLC value in flight towards channel initiator, in milli-satoshi
		public func getMaxHtlcValueInFlightMsat() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCommonOpenChannelFields>) in
					CommonOpenChannelFields_get_max_htlc_value_in_flight_msat(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The maximum inbound HTLC value in flight towards channel initiator, in milli-satoshi
		public func setMaxHtlcValueInFlightMsat(val: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKCommonOpenChannelFields>) in
					CommonOpenChannelFields_set_max_htlc_value_in_flight_msat(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The minimum HTLC size incoming to channel initiator, in milli-satoshi
		public func getHtlcMinimumMsat() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCommonOpenChannelFields>) in
					CommonOpenChannelFields_get_htlc_minimum_msat(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The minimum HTLC size incoming to channel initiator, in milli-satoshi
		public func setHtlcMinimumMsat(val: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKCommonOpenChannelFields>) in
					CommonOpenChannelFields_set_htlc_minimum_msat(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The feerate for the commitment transaction set by the channel initiator until updated by
		/// [`UpdateFee`]
		public func getCommitmentFeerateSatPer1000Weight() -> UInt32 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCommonOpenChannelFields>) in
					CommonOpenChannelFields_get_commitment_feerate_sat_per_1000_weight(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The feerate for the commitment transaction set by the channel initiator until updated by
		/// [`UpdateFee`]
		public func setCommitmentFeerateSatPer1000Weight(val: UInt32) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKCommonOpenChannelFields>) in
					CommonOpenChannelFields_set_commitment_feerate_sat_per_1000_weight(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The number of blocks which the counterparty will have to wait to claim on-chain funds if they
		/// broadcast a commitment transaction
		public func getToSelfDelay() -> UInt16 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCommonOpenChannelFields>) in
					CommonOpenChannelFields_get_to_self_delay(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The number of blocks which the counterparty will have to wait to claim on-chain funds if they
		/// broadcast a commitment transaction
		public func setToSelfDelay(val: UInt16) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKCommonOpenChannelFields>) in
					CommonOpenChannelFields_set_to_self_delay(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The maximum number of inbound HTLCs towards channel initiator
		public func getMaxAcceptedHtlcs() -> UInt16 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCommonOpenChannelFields>) in
					CommonOpenChannelFields_get_max_accepted_htlcs(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The maximum number of inbound HTLCs towards channel initiator
		public func setMaxAcceptedHtlcs(val: UInt16) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKCommonOpenChannelFields>) in
					CommonOpenChannelFields_set_max_accepted_htlcs(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The channel initiator's key controlling the funding transaction
		public func getFundingPubkey() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCommonOpenChannelFields>) in
					CommonOpenChannelFields_get_funding_pubkey(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "CommonOpenChannelFields.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// The channel initiator's key controlling the funding transaction
		public func setFundingPubkey(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = PublicKey(
				value: val, instantiationContext: "CommonOpenChannelFields.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKCommonOpenChannelFields>) in
					CommonOpenChannelFields_set_funding_pubkey(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Used to derive a revocation key for transactions broadcast by counterparty
		public func getRevocationBasepoint() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCommonOpenChannelFields>) in
					CommonOpenChannelFields_get_revocation_basepoint(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "CommonOpenChannelFields.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Used to derive a revocation key for transactions broadcast by counterparty
		public func setRevocationBasepoint(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = PublicKey(
				value: val, instantiationContext: "CommonOpenChannelFields.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKCommonOpenChannelFields>) in
					CommonOpenChannelFields_set_revocation_basepoint(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// A payment key to channel initiator for transactions broadcast by counterparty
		public func getPaymentBasepoint() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCommonOpenChannelFields>) in
					CommonOpenChannelFields_get_payment_basepoint(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "CommonOpenChannelFields.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// A payment key to channel initiator for transactions broadcast by counterparty
		public func setPaymentBasepoint(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = PublicKey(
				value: val, instantiationContext: "CommonOpenChannelFields.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKCommonOpenChannelFields>) in
					CommonOpenChannelFields_set_payment_basepoint(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Used to derive a payment key to channel initiator for transactions broadcast by channel
		/// initiator
		public func getDelayedPaymentBasepoint() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCommonOpenChannelFields>) in
					CommonOpenChannelFields_get_delayed_payment_basepoint(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "CommonOpenChannelFields.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Used to derive a payment key to channel initiator for transactions broadcast by channel
		/// initiator
		public func setDelayedPaymentBasepoint(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = PublicKey(
				value: val, instantiationContext: "CommonOpenChannelFields.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKCommonOpenChannelFields>) in
					CommonOpenChannelFields_set_delayed_payment_basepoint(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Used to derive an HTLC payment key to channel initiator
		public func getHtlcBasepoint() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCommonOpenChannelFields>) in
					CommonOpenChannelFields_get_htlc_basepoint(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "CommonOpenChannelFields.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Used to derive an HTLC payment key to channel initiator
		public func setHtlcBasepoint(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = PublicKey(
				value: val, instantiationContext: "CommonOpenChannelFields.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKCommonOpenChannelFields>) in
					CommonOpenChannelFields_set_htlc_basepoint(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The first to-be-broadcast-by-channel-initiator transaction's per commitment point
		public func getFirstPerCommitmentPoint() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCommonOpenChannelFields>) in
					CommonOpenChannelFields_get_first_per_commitment_point(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "CommonOpenChannelFields.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// The first to-be-broadcast-by-channel-initiator transaction's per commitment point
		public func setFirstPerCommitmentPoint(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = PublicKey(
				value: val, instantiationContext: "CommonOpenChannelFields.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKCommonOpenChannelFields>) in
					CommonOpenChannelFields_set_first_per_commitment_point(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The channel flags to be used
		public func getChannelFlags() -> UInt8 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCommonOpenChannelFields>) in
					CommonOpenChannelFields_get_channel_flags(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The channel flags to be used
		public func setChannelFlags(val: UInt8) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKCommonOpenChannelFields>) in
					CommonOpenChannelFields_set_channel_flags(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Optionally, a request to pre-set the to-channel-initiator output's scriptPubkey for when we
		/// collaboratively close
		public func getShutdownScriptpubkey() -> [UInt8]? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCommonOpenChannelFields>) in
					CommonOpenChannelFields_get_shutdown_scriptpubkey(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_CVec_u8ZZ(
				cType: nativeCallResult, instantiationContext: "CommonOpenChannelFields.swift::\(#function):\(#line)",
				anchor: self
			)
			.getValue()


			return returnValue
		}

		/// Optionally, a request to pre-set the to-channel-initiator output's scriptPubkey for when we
		/// collaboratively close
		public func setShutdownScriptpubkey(val: [UInt8]?) {
			// native call variable prep

			let valOption = Option_CVec_u8ZZ(
				some: val, instantiationContext: "CommonOpenChannelFields.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKCommonOpenChannelFields>) in
					CommonOpenChannelFields_set_shutdown_scriptpubkey(thisPtrPointer, valOption.cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The channel type that this channel will represent
		///
		/// If this is `None`, we derive the channel type from the intersection of our
		/// feature bits with our counterparty's feature bits from the [`Init`] message.
		///
		/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func getChannelType() -> ChannelTypeFeatures? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCommonOpenChannelFields>) in
					CommonOpenChannelFields_get_channel_type(thisPtrPointer)
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
			let returnValue = ChannelTypeFeatures(
				cType: nativeCallResult, instantiationContext: "CommonOpenChannelFields.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// The channel type that this channel will represent
		///
		/// If this is `None`, we derive the channel type from the intersection of our
		/// feature bits with our counterparty's feature bits from the [`Init`] message.
		///
		/// Note that val (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func setChannelType(val: ChannelTypeFeatures) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKCommonOpenChannelFields>) in
					CommonOpenChannelFields_set_channel_type(thisPtrPointer, val.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new CommonOpenChannelFields given each field
		///
		/// Note that channel_type_arg (or a relevant inner pointer) may be NULL or all-0s to represent None
		public init(
			chainHashArg: [UInt8], temporaryChannelIdArg: ChannelId, fundingSatoshisArg: UInt64,
			dustLimitSatoshisArg: UInt64, maxHtlcValueInFlightMsatArg: UInt64, htlcMinimumMsatArg: UInt64,
			commitmentFeerateSatPer1000WeightArg: UInt32, toSelfDelayArg: UInt16, maxAcceptedHtlcsArg: UInt16,
			fundingPubkeyArg: [UInt8], revocationBasepointArg: [UInt8], paymentBasepointArg: [UInt8],
			delayedPaymentBasepointArg: [UInt8], htlcBasepointArg: [UInt8], firstPerCommitmentPointArg: [UInt8],
			channelFlagsArg: UInt8, shutdownScriptpubkeyArg: [UInt8]?, channelTypeArg: ChannelTypeFeatures
		) {
			// native call variable prep

			let chainHashArgPrimitiveWrapper = ThirtyTwoBytes(
				value: chainHashArg, instantiationContext: "CommonOpenChannelFields.swift::\(#function):\(#line)")

			let fundingPubkeyArgPrimitiveWrapper = PublicKey(
				value: fundingPubkeyArg, instantiationContext: "CommonOpenChannelFields.swift::\(#function):\(#line)")

			let revocationBasepointArgPrimitiveWrapper = PublicKey(
				value: revocationBasepointArg,
				instantiationContext: "CommonOpenChannelFields.swift::\(#function):\(#line)")

			let paymentBasepointArgPrimitiveWrapper = PublicKey(
				value: paymentBasepointArg, instantiationContext: "CommonOpenChannelFields.swift::\(#function):\(#line)"
			)

			let delayedPaymentBasepointArgPrimitiveWrapper = PublicKey(
				value: delayedPaymentBasepointArg,
				instantiationContext: "CommonOpenChannelFields.swift::\(#function):\(#line)")

			let htlcBasepointArgPrimitiveWrapper = PublicKey(
				value: htlcBasepointArg, instantiationContext: "CommonOpenChannelFields.swift::\(#function):\(#line)")

			let firstPerCommitmentPointArgPrimitiveWrapper = PublicKey(
				value: firstPerCommitmentPointArg,
				instantiationContext: "CommonOpenChannelFields.swift::\(#function):\(#line)")

			let shutdownScriptpubkeyArgOption = Option_CVec_u8ZZ(
				some: shutdownScriptpubkeyArg,
				instantiationContext: "CommonOpenChannelFields.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult = CommonOpenChannelFields_new(
				chainHashArgPrimitiveWrapper.cType!, temporaryChannelIdArg.dynamicallyDangledClone().cType!,
				fundingSatoshisArg, dustLimitSatoshisArg, maxHtlcValueInFlightMsatArg, htlcMinimumMsatArg,
				commitmentFeerateSatPer1000WeightArg, toSelfDelayArg, maxAcceptedHtlcsArg,
				fundingPubkeyArgPrimitiveWrapper.cType!, revocationBasepointArgPrimitiveWrapper.cType!,
				paymentBasepointArgPrimitiveWrapper.cType!, delayedPaymentBasepointArgPrimitiveWrapper.cType!,
				htlcBasepointArgPrimitiveWrapper.cType!, firstPerCommitmentPointArgPrimitiveWrapper.cType!,
				channelFlagsArg, shutdownScriptpubkeyArgOption.cType!, channelTypeArg.dynamicallyDangledClone().cType!)

			// cleanup

			// for elided types, we need this
			chainHashArgPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			fundingPubkeyArgPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			revocationBasepointArgPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			paymentBasepointArgPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			delayedPaymentBasepointArgPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			htlcBasepointArgPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			firstPerCommitmentPointArgPrimitiveWrapper.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = CommonOpenChannelFields(cType: nativeCallResult, instantiationContext: "CommonOpenChannelFields.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0,
					instantiationContext: "CommonOpenChannelFields.swift::\(#function):\(#line)")


		}

		/// Creates a copy of the CommonOpenChannelFields
		internal func clone() -> CommonOpenChannelFields {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCommonOpenChannelFields>) in
					CommonOpenChannelFields_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = CommonOpenChannelFields(
				cType: nativeCallResult, instantiationContext: "CommonOpenChannelFields.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Generates a non-cryptographic 64-bit hash of the CommonOpenChannelFields.
		public func hash() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKCommonOpenChannelFields>) in
					CommonOpenChannelFields_hash(oPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Checks if two CommonOpenChannelFieldss contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: CommonOpenChannelFields, b: CommonOpenChannelFields) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKCommonOpenChannelFields>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKCommonOpenChannelFields>) in
						CommonOpenChannelFields_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The [`ChannelParameters`] for this channel.
		public func channelParameters() -> ChannelParameters {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKCommonOpenChannelFields>) in
					CommonOpenChannelFields_channel_parameters(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ChannelParameters(
				cType: nativeCallResult, instantiationContext: "CommonOpenChannelFields.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}


		/// Indicates that this is the only struct which contains the same pointer.
		/// Rust functions which take ownership of an object provided via an argument require
		/// this to be true and invalidate the object pointed to by inner.
		public func isOwned() -> Bool {
			// return value (do some wrapping)
			let returnValue = self.cType!.is_owned

			return returnValue
		}


		internal func danglingClone() -> CommonOpenChannelFields {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> CommonOpenChannelFields {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> CommonOpenChannelFields {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> CommonOpenChannelFields {
			self.dangling = self.cType!.is_owned
			return self
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print(
						"Freeing CommonOpenChannelFields \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing CommonOpenChannelFields \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

