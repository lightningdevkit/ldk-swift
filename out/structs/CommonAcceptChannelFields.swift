#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// Contains fields that are both common to [`accept_channel`] and [`accept_channel2`] messages.
///
/// [`accept_channel`]: https://github.com/lightning/bolts/blob/master/02-peer-protocol.md#the-accept_channel-message
/// [`accept_channel2`]: https://github.com/lightning/bolts/blob/master/02-peer-protocol.md#the-accept_channel2-message
public typealias CommonAcceptChannelFields = Bindings.CommonAcceptChannelFields

extension Bindings {


	/// Contains fields that are both common to [`accept_channel`] and [`accept_channel2`] messages.
	///
	/// [`accept_channel`]: https://github.com/lightning/bolts/blob/master/02-peer-protocol.md#the-accept_channel-message
	/// [`accept_channel2`]: https://github.com/lightning/bolts/blob/master/02-peer-protocol.md#the-accept_channel2-message
	public class CommonAcceptChannelFields: NativeTypeWrapper {

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

		internal var cType: LDKCommonAcceptChannelFields?

		internal init(cType: LDKCommonAcceptChannelFields, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKCommonAcceptChannelFields, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKCommonAcceptChannelFields, instantiationContext: String, anchor: NativeTypeWrapper,
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


		/// Frees any resources used by the CommonAcceptChannelFields, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = CommonAcceptChannelFields_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The same `temporary_channel_id` received from the initiator's `open_channel2` or `open_channel` message.
		public func getTemporaryChannelId() -> ChannelId {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCommonAcceptChannelFields>) in
					CommonAcceptChannelFields_get_temporary_channel_id(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ChannelId(
				cType: nativeCallResult, instantiationContext: "CommonAcceptChannelFields.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// The same `temporary_channel_id` received from the initiator's `open_channel2` or `open_channel` message.
		public func setTemporaryChannelId(val: ChannelId) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKCommonAcceptChannelFields>) in
					CommonAcceptChannelFields_set_temporary_channel_id(
						thisPtrPointer, val.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The threshold below which outputs on transactions broadcast by the channel acceptor will be
		/// omitted
		public func getDustLimitSatoshis() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCommonAcceptChannelFields>) in
					CommonAcceptChannelFields_get_dust_limit_satoshis(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The threshold below which outputs on transactions broadcast by the channel acceptor will be
		/// omitted
		public func setDustLimitSatoshis(val: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKCommonAcceptChannelFields>) in
					CommonAcceptChannelFields_set_dust_limit_satoshis(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The maximum inbound HTLC value in flight towards sender, in milli-satoshi
		public func getMaxHtlcValueInFlightMsat() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCommonAcceptChannelFields>) in
					CommonAcceptChannelFields_get_max_htlc_value_in_flight_msat(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The maximum inbound HTLC value in flight towards sender, in milli-satoshi
		public func setMaxHtlcValueInFlightMsat(val: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKCommonAcceptChannelFields>) in
					CommonAcceptChannelFields_set_max_htlc_value_in_flight_msat(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The minimum HTLC size incoming to channel acceptor, in milli-satoshi
		public func getHtlcMinimumMsat() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCommonAcceptChannelFields>) in
					CommonAcceptChannelFields_get_htlc_minimum_msat(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The minimum HTLC size incoming to channel acceptor, in milli-satoshi
		public func setHtlcMinimumMsat(val: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKCommonAcceptChannelFields>) in
					CommonAcceptChannelFields_set_htlc_minimum_msat(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Minimum depth of the funding transaction before the channel is considered open
		public func getMinimumDepth() -> UInt32 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCommonAcceptChannelFields>) in
					CommonAcceptChannelFields_get_minimum_depth(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Minimum depth of the funding transaction before the channel is considered open
		public func setMinimumDepth(val: UInt32) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKCommonAcceptChannelFields>) in
					CommonAcceptChannelFields_set_minimum_depth(thisPtrPointer, val)
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
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCommonAcceptChannelFields>) in
					CommonAcceptChannelFields_get_to_self_delay(thisPtrPointer)
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
					(thisPtrPointer: UnsafeMutablePointer<LDKCommonAcceptChannelFields>) in
					CommonAcceptChannelFields_set_to_self_delay(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The maximum number of inbound HTLCs towards channel acceptor
		public func getMaxAcceptedHtlcs() -> UInt16 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCommonAcceptChannelFields>) in
					CommonAcceptChannelFields_get_max_accepted_htlcs(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The maximum number of inbound HTLCs towards channel acceptor
		public func setMaxAcceptedHtlcs(val: UInt16) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKCommonAcceptChannelFields>) in
					CommonAcceptChannelFields_set_max_accepted_htlcs(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The channel acceptor's key controlling the funding transaction
		public func getFundingPubkey() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCommonAcceptChannelFields>) in
					CommonAcceptChannelFields_get_funding_pubkey(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "CommonAcceptChannelFields.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// The channel acceptor's key controlling the funding transaction
		public func setFundingPubkey(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = PublicKey(
				value: val, instantiationContext: "CommonAcceptChannelFields.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKCommonAcceptChannelFields>) in
					CommonAcceptChannelFields_set_funding_pubkey(thisPtrPointer, valPrimitiveWrapper.cType!)
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
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCommonAcceptChannelFields>) in
					CommonAcceptChannelFields_get_revocation_basepoint(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "CommonAcceptChannelFields.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Used to derive a revocation key for transactions broadcast by counterparty
		public func setRevocationBasepoint(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = PublicKey(
				value: val, instantiationContext: "CommonAcceptChannelFields.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKCommonAcceptChannelFields>) in
					CommonAcceptChannelFields_set_revocation_basepoint(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// A payment key to channel acceptor for transactions broadcast by counterparty
		public func getPaymentBasepoint() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCommonAcceptChannelFields>) in
					CommonAcceptChannelFields_get_payment_basepoint(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "CommonAcceptChannelFields.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// A payment key to channel acceptor for transactions broadcast by counterparty
		public func setPaymentBasepoint(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = PublicKey(
				value: val, instantiationContext: "CommonAcceptChannelFields.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKCommonAcceptChannelFields>) in
					CommonAcceptChannelFields_set_payment_basepoint(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Used to derive a payment key to channel acceptor for transactions broadcast by channel
		/// acceptor
		public func getDelayedPaymentBasepoint() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCommonAcceptChannelFields>) in
					CommonAcceptChannelFields_get_delayed_payment_basepoint(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "CommonAcceptChannelFields.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Used to derive a payment key to channel acceptor for transactions broadcast by channel
		/// acceptor
		public func setDelayedPaymentBasepoint(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = PublicKey(
				value: val, instantiationContext: "CommonAcceptChannelFields.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKCommonAcceptChannelFields>) in
					CommonAcceptChannelFields_set_delayed_payment_basepoint(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Used to derive an HTLC payment key to channel acceptor for transactions broadcast by counterparty
		public func getHtlcBasepoint() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCommonAcceptChannelFields>) in
					CommonAcceptChannelFields_get_htlc_basepoint(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "CommonAcceptChannelFields.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Used to derive an HTLC payment key to channel acceptor for transactions broadcast by counterparty
		public func setHtlcBasepoint(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = PublicKey(
				value: val, instantiationContext: "CommonAcceptChannelFields.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKCommonAcceptChannelFields>) in
					CommonAcceptChannelFields_set_htlc_basepoint(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The first to-be-broadcast-by-channel-acceptor transaction's per commitment point
		public func getFirstPerCommitmentPoint() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCommonAcceptChannelFields>) in
					CommonAcceptChannelFields_get_first_per_commitment_point(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "CommonAcceptChannelFields.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// The first to-be-broadcast-by-channel-acceptor transaction's per commitment point
		public func setFirstPerCommitmentPoint(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = PublicKey(
				value: val, instantiationContext: "CommonAcceptChannelFields.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKCommonAcceptChannelFields>) in
					CommonAcceptChannelFields_set_first_per_commitment_point(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Optionally, a request to pre-set the to-channel-acceptor output's scriptPubkey for when we
		/// collaboratively close
		public func getShutdownScriptpubkey() -> [UInt8]? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCommonAcceptChannelFields>) in
					CommonAcceptChannelFields_get_shutdown_scriptpubkey(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_CVec_u8ZZ(
				cType: nativeCallResult, instantiationContext: "CommonAcceptChannelFields.swift::\(#function):\(#line)",
				anchor: self
			)
			.getValue()


			return returnValue
		}

		/// Optionally, a request to pre-set the to-channel-acceptor output's scriptPubkey for when we
		/// collaboratively close
		public func setShutdownScriptpubkey(val: [UInt8]?) {
			// native call variable prep

			let valOption = Option_CVec_u8ZZ(
				some: val, instantiationContext: "CommonAcceptChannelFields.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKCommonAcceptChannelFields>) in
					CommonAcceptChannelFields_set_shutdown_scriptpubkey(thisPtrPointer, valOption.cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The channel type that this channel will represent. If none is set, we derive the channel
		/// type from the intersection of our feature bits with our counterparty's feature bits from
		/// the Init message.
		///
		/// This is required to match the equivalent field in [`OpenChannel`] or [`OpenChannelV2`]'s
		/// [`CommonOpenChannelFields::channel_type`].
		///
		/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func getChannelType() -> ChannelTypeFeatures? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCommonAcceptChannelFields>) in
					CommonAcceptChannelFields_get_channel_type(thisPtrPointer)
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
				cType: nativeCallResult, instantiationContext: "CommonAcceptChannelFields.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// The channel type that this channel will represent. If none is set, we derive the channel
		/// type from the intersection of our feature bits with our counterparty's feature bits from
		/// the Init message.
		///
		/// This is required to match the equivalent field in [`OpenChannel`] or [`OpenChannelV2`]'s
		/// [`CommonOpenChannelFields::channel_type`].
		///
		/// Note that val (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func setChannelType(val: ChannelTypeFeatures) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKCommonAcceptChannelFields>) in
					CommonAcceptChannelFields_set_channel_type(thisPtrPointer, val.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new CommonAcceptChannelFields given each field
		///
		/// Note that channel_type_arg (or a relevant inner pointer) may be NULL or all-0s to represent None
		public init(
			temporaryChannelIdArg: ChannelId, dustLimitSatoshisArg: UInt64, maxHtlcValueInFlightMsatArg: UInt64,
			htlcMinimumMsatArg: UInt64, minimumDepthArg: UInt32, toSelfDelayArg: UInt16, maxAcceptedHtlcsArg: UInt16,
			fundingPubkeyArg: [UInt8], revocationBasepointArg: [UInt8], paymentBasepointArg: [UInt8],
			delayedPaymentBasepointArg: [UInt8], htlcBasepointArg: [UInt8], firstPerCommitmentPointArg: [UInt8],
			shutdownScriptpubkeyArg: [UInt8]?, channelTypeArg: ChannelTypeFeatures
		) {
			// native call variable prep

			let fundingPubkeyArgPrimitiveWrapper = PublicKey(
				value: fundingPubkeyArg, instantiationContext: "CommonAcceptChannelFields.swift::\(#function):\(#line)")

			let revocationBasepointArgPrimitiveWrapper = PublicKey(
				value: revocationBasepointArg,
				instantiationContext: "CommonAcceptChannelFields.swift::\(#function):\(#line)")

			let paymentBasepointArgPrimitiveWrapper = PublicKey(
				value: paymentBasepointArg,
				instantiationContext: "CommonAcceptChannelFields.swift::\(#function):\(#line)")

			let delayedPaymentBasepointArgPrimitiveWrapper = PublicKey(
				value: delayedPaymentBasepointArg,
				instantiationContext: "CommonAcceptChannelFields.swift::\(#function):\(#line)")

			let htlcBasepointArgPrimitiveWrapper = PublicKey(
				value: htlcBasepointArg, instantiationContext: "CommonAcceptChannelFields.swift::\(#function):\(#line)")

			let firstPerCommitmentPointArgPrimitiveWrapper = PublicKey(
				value: firstPerCommitmentPointArg,
				instantiationContext: "CommonAcceptChannelFields.swift::\(#function):\(#line)")

			let shutdownScriptpubkeyArgOption = Option_CVec_u8ZZ(
				some: shutdownScriptpubkeyArg,
				instantiationContext: "CommonAcceptChannelFields.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult = CommonAcceptChannelFields_new(
				temporaryChannelIdArg.dynamicallyDangledClone().cType!, dustLimitSatoshisArg,
				maxHtlcValueInFlightMsatArg, htlcMinimumMsatArg, minimumDepthArg, toSelfDelayArg, maxAcceptedHtlcsArg,
				fundingPubkeyArgPrimitiveWrapper.cType!, revocationBasepointArgPrimitiveWrapper.cType!,
				paymentBasepointArgPrimitiveWrapper.cType!, delayedPaymentBasepointArgPrimitiveWrapper.cType!,
				htlcBasepointArgPrimitiveWrapper.cType!, firstPerCommitmentPointArgPrimitiveWrapper.cType!,
				shutdownScriptpubkeyArgOption.cType!, channelTypeArg.dynamicallyDangledClone().cType!)

			// cleanup

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
						let returnValue = CommonAcceptChannelFields(cType: nativeCallResult, instantiationContext: "CommonAcceptChannelFields.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0,
					instantiationContext: "CommonAcceptChannelFields.swift::\(#function):\(#line)")


		}

		/// Creates a copy of the CommonAcceptChannelFields
		internal func clone() -> CommonAcceptChannelFields {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCommonAcceptChannelFields>) in
					CommonAcceptChannelFields_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = CommonAcceptChannelFields(
				cType: nativeCallResult, instantiationContext: "CommonAcceptChannelFields.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Generates a non-cryptographic 64-bit hash of the CommonAcceptChannelFields.
		public func hash() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKCommonAcceptChannelFields>) in
					CommonAcceptChannelFields_hash(oPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Checks if two CommonAcceptChannelFieldss contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: CommonAcceptChannelFields, b: CommonAcceptChannelFields) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKCommonAcceptChannelFields>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKCommonAcceptChannelFields>) in
						CommonAcceptChannelFields_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


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


		internal func danglingClone() -> CommonAcceptChannelFields {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> CommonAcceptChannelFields {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> CommonAcceptChannelFields {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> CommonAcceptChannelFields {
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
						"Freeing CommonAcceptChannelFields \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing CommonAcceptChannelFields \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

