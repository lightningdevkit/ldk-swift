#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// An [`open_channel`] message to be sent to or received from a peer.
///
/// Used in V1 channel establishment
///
/// [`open_channel`]: https://github.com/lightning/bolts/blob/master/02-peer-protocol.md#the-open_channel-message
public typealias OpenChannel = Bindings.OpenChannel

extension Bindings {


	/// An [`open_channel`] message to be sent to or received from a peer.
	///
	/// Used in V1 channel establishment
	///
	/// [`open_channel`]: https://github.com/lightning/bolts/blob/master/02-peer-protocol.md#the-open_channel-message
	public class OpenChannel: NativeTypeWrapper {

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

		internal var cType: LDKOpenChannel?

		internal init(cType: LDKOpenChannel, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKOpenChannel, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKOpenChannel, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the OpenChannel, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = OpenChannel_free(self.cType!)

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
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKOpenChannel>) in
					OpenChannel_get_chain_hash(thisPtrPointer)
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
				value: val, instantiationContext: "OpenChannel.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKOpenChannel>) in
					OpenChannel_set_chain_hash(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// A temporary channel ID, until the funding outpoint is announced
		public func getTemporaryChannelId() -> [UInt8]? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKOpenChannel>) in
					OpenChannel_get_temporary_channel_id(thisPtrPointer)
				}


			// cleanup

			guard let nativeCallResult = nativeCallResult else {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = Bindings.UInt8Tuple32ToArray(tuple: nativeCallResult.pointee)


			return returnValue
		}

		/// A temporary channel ID, until the funding outpoint is announced
		public func setTemporaryChannelId(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = ThirtyTwoBytes(
				value: val, instantiationContext: "OpenChannel.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKOpenChannel>) in
					OpenChannel_set_temporary_channel_id(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The channel value
		public func getFundingSatoshis() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKOpenChannel>) in
					OpenChannel_get_funding_satoshis(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The channel value
		public func setFundingSatoshis(val: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKOpenChannel>) in
					OpenChannel_set_funding_satoshis(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The amount to push to the counterparty as part of the open, in milli-satoshi
		public func getPushMsat() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKOpenChannel>) in
					OpenChannel_get_push_msat(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The amount to push to the counterparty as part of the open, in milli-satoshi
		public func setPushMsat(val: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKOpenChannel>) in
					OpenChannel_set_push_msat(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The threshold below which outputs on transactions broadcast by sender will be omitted
		public func getDustLimitSatoshis() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKOpenChannel>) in
					OpenChannel_get_dust_limit_satoshis(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The threshold below which outputs on transactions broadcast by sender will be omitted
		public func setDustLimitSatoshis(val: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKOpenChannel>) in
					OpenChannel_set_dust_limit_satoshis(thisPtrPointer, val)
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
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKOpenChannel>) in
					OpenChannel_get_max_htlc_value_in_flight_msat(thisPtrPointer)
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
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKOpenChannel>) in
					OpenChannel_set_max_htlc_value_in_flight_msat(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The minimum value unencumbered by HTLCs for the counterparty to keep in the channel
		public func getChannelReserveSatoshis() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKOpenChannel>) in
					OpenChannel_get_channel_reserve_satoshis(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The minimum value unencumbered by HTLCs for the counterparty to keep in the channel
		public func setChannelReserveSatoshis(val: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKOpenChannel>) in
					OpenChannel_set_channel_reserve_satoshis(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The minimum HTLC size incoming to sender, in milli-satoshi
		public func getHtlcMinimumMsat() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKOpenChannel>) in
					OpenChannel_get_htlc_minimum_msat(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The minimum HTLC size incoming to sender, in milli-satoshi
		public func setHtlcMinimumMsat(val: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKOpenChannel>) in
					OpenChannel_set_htlc_minimum_msat(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The feerate per 1000-weight of sender generated transactions, until updated by
		/// [`UpdateFee`]
		public func getFeeratePerKw() -> UInt32 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKOpenChannel>) in
					OpenChannel_get_feerate_per_kw(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The feerate per 1000-weight of sender generated transactions, until updated by
		/// [`UpdateFee`]
		public func setFeeratePerKw(val: UInt32) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKOpenChannel>) in
					OpenChannel_set_feerate_per_kw(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The number of blocks which the counterparty will have to wait to claim on-chain funds if
		/// they broadcast a commitment transaction
		public func getToSelfDelay() -> UInt16 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKOpenChannel>) in
					OpenChannel_get_to_self_delay(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The number of blocks which the counterparty will have to wait to claim on-chain funds if
		/// they broadcast a commitment transaction
		public func setToSelfDelay(val: UInt16) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKOpenChannel>) in
					OpenChannel_set_to_self_delay(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The maximum number of inbound HTLCs towards sender
		public func getMaxAcceptedHtlcs() -> UInt16 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKOpenChannel>) in
					OpenChannel_get_max_accepted_htlcs(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The maximum number of inbound HTLCs towards sender
		public func setMaxAcceptedHtlcs(val: UInt16) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKOpenChannel>) in
					OpenChannel_set_max_accepted_htlcs(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The sender's key controlling the funding transaction
		public func getFundingPubkey() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKOpenChannel>) in
					OpenChannel_get_funding_pubkey(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "OpenChannel.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// The sender's key controlling the funding transaction
		public func setFundingPubkey(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = PublicKey(
				value: val, instantiationContext: "OpenChannel.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKOpenChannel>) in
					OpenChannel_set_funding_pubkey(thisPtrPointer, valPrimitiveWrapper.cType!)
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
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKOpenChannel>) in
					OpenChannel_get_revocation_basepoint(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "OpenChannel.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Used to derive a revocation key for transactions broadcast by counterparty
		public func setRevocationBasepoint(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = PublicKey(
				value: val, instantiationContext: "OpenChannel.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKOpenChannel>) in
					OpenChannel_set_revocation_basepoint(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// A payment key to sender for transactions broadcast by counterparty
		public func getPaymentPoint() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKOpenChannel>) in
					OpenChannel_get_payment_point(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "OpenChannel.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// A payment key to sender for transactions broadcast by counterparty
		public func setPaymentPoint(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = PublicKey(
				value: val, instantiationContext: "OpenChannel.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKOpenChannel>) in
					OpenChannel_set_payment_point(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Used to derive a payment key to sender for transactions broadcast by sender
		public func getDelayedPaymentBasepoint() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKOpenChannel>) in
					OpenChannel_get_delayed_payment_basepoint(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "OpenChannel.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Used to derive a payment key to sender for transactions broadcast by sender
		public func setDelayedPaymentBasepoint(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = PublicKey(
				value: val, instantiationContext: "OpenChannel.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKOpenChannel>) in
					OpenChannel_set_delayed_payment_basepoint(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Used to derive an HTLC payment key to sender
		public func getHtlcBasepoint() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKOpenChannel>) in
					OpenChannel_get_htlc_basepoint(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "OpenChannel.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Used to derive an HTLC payment key to sender
		public func setHtlcBasepoint(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = PublicKey(
				value: val, instantiationContext: "OpenChannel.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKOpenChannel>) in
					OpenChannel_set_htlc_basepoint(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The first to-be-broadcast-by-sender transaction's per commitment point
		public func getFirstPerCommitmentPoint() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKOpenChannel>) in
					OpenChannel_get_first_per_commitment_point(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "OpenChannel.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// The first to-be-broadcast-by-sender transaction's per commitment point
		public func setFirstPerCommitmentPoint(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = PublicKey(
				value: val, instantiationContext: "OpenChannel.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKOpenChannel>) in
					OpenChannel_set_first_per_commitment_point(thisPtrPointer, valPrimitiveWrapper.cType!)
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
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKOpenChannel>) in
					OpenChannel_get_channel_flags(thisPtrPointer)
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
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKOpenChannel>) in
					OpenChannel_set_channel_flags(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// A request to pre-set the to-sender output's `scriptPubkey` for when we collaboratively close
		public func getShutdownScriptpubkey() -> [UInt8]? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKOpenChannel>) in
					OpenChannel_get_shutdown_scriptpubkey(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_ScriptZ(
				cType: nativeCallResult, instantiationContext: "OpenChannel.swift::\(#function):\(#line)", anchor: self
			)
			.getValue()


			return returnValue
		}

		/// A request to pre-set the to-sender output's `scriptPubkey` for when we collaboratively close
		public func setShutdownScriptpubkey(val: [UInt8]?) {
			// native call variable prep

			let valOption = Option_ScriptZ(some: val, instantiationContext: "OpenChannel.swift::\(#function):\(#line)")
				.danglingClone()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKOpenChannel>) in
					OpenChannel_set_shutdown_scriptpubkey(thisPtrPointer, valOption.cType!)
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
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKOpenChannel>) in
					OpenChannel_get_channel_type(thisPtrPointer)
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
				cType: nativeCallResult, instantiationContext: "OpenChannel.swift::\(#function):\(#line)", anchor: self
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
				withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKOpenChannel>) in
					OpenChannel_set_channel_type(thisPtrPointer, val.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new OpenChannel given each field
		public init(
			chainHashArg: [UInt8], temporaryChannelIdArg: [UInt8], fundingSatoshisArg: UInt64, pushMsatArg: UInt64,
			dustLimitSatoshisArg: UInt64, maxHtlcValueInFlightMsatArg: UInt64, channelReserveSatoshisArg: UInt64,
			htlcMinimumMsatArg: UInt64, feeratePerKwArg: UInt32, toSelfDelayArg: UInt16, maxAcceptedHtlcsArg: UInt16,
			fundingPubkeyArg: [UInt8], revocationBasepointArg: [UInt8], paymentPointArg: [UInt8],
			delayedPaymentBasepointArg: [UInt8], htlcBasepointArg: [UInt8], firstPerCommitmentPointArg: [UInt8],
			channelFlagsArg: UInt8, shutdownScriptpubkeyArg: [UInt8]?, channelTypeArg: ChannelTypeFeatures
		) {
			// native call variable prep

			let chainHashArgPrimitiveWrapper = ThirtyTwoBytes(
				value: chainHashArg, instantiationContext: "OpenChannel.swift::\(#function):\(#line)")

			let temporaryChannelIdArgPrimitiveWrapper = ThirtyTwoBytes(
				value: temporaryChannelIdArg, instantiationContext: "OpenChannel.swift::\(#function):\(#line)")

			let fundingPubkeyArgPrimitiveWrapper = PublicKey(
				value: fundingPubkeyArg, instantiationContext: "OpenChannel.swift::\(#function):\(#line)")

			let revocationBasepointArgPrimitiveWrapper = PublicKey(
				value: revocationBasepointArg, instantiationContext: "OpenChannel.swift::\(#function):\(#line)")

			let paymentPointArgPrimitiveWrapper = PublicKey(
				value: paymentPointArg, instantiationContext: "OpenChannel.swift::\(#function):\(#line)")

			let delayedPaymentBasepointArgPrimitiveWrapper = PublicKey(
				value: delayedPaymentBasepointArg, instantiationContext: "OpenChannel.swift::\(#function):\(#line)")

			let htlcBasepointArgPrimitiveWrapper = PublicKey(
				value: htlcBasepointArg, instantiationContext: "OpenChannel.swift::\(#function):\(#line)")

			let firstPerCommitmentPointArgPrimitiveWrapper = PublicKey(
				value: firstPerCommitmentPointArg, instantiationContext: "OpenChannel.swift::\(#function):\(#line)")

			let shutdownScriptpubkeyArgOption = Option_ScriptZ(
				some: shutdownScriptpubkeyArg, instantiationContext: "OpenChannel.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult = OpenChannel_new(
				chainHashArgPrimitiveWrapper.cType!, temporaryChannelIdArgPrimitiveWrapper.cType!, fundingSatoshisArg,
				pushMsatArg, dustLimitSatoshisArg, maxHtlcValueInFlightMsatArg, channelReserveSatoshisArg,
				htlcMinimumMsatArg, feeratePerKwArg, toSelfDelayArg, maxAcceptedHtlcsArg,
				fundingPubkeyArgPrimitiveWrapper.cType!, revocationBasepointArgPrimitiveWrapper.cType!,
				paymentPointArgPrimitiveWrapper.cType!, delayedPaymentBasepointArgPrimitiveWrapper.cType!,
				htlcBasepointArgPrimitiveWrapper.cType!, firstPerCommitmentPointArgPrimitiveWrapper.cType!,
				channelFlagsArg, shutdownScriptpubkeyArgOption.cType!, channelTypeArg.dynamicallyDangledClone().cType!)

			// cleanup

			// for elided types, we need this
			chainHashArgPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			temporaryChannelIdArgPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			fundingPubkeyArgPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			revocationBasepointArgPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			paymentPointArgPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			delayedPaymentBasepointArgPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			htlcBasepointArgPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			firstPerCommitmentPointArgPrimitiveWrapper.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = OpenChannel(cType: nativeCallResult, instantiationContext: "OpenChannel.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(conflictAvoidingVariableName: 0, instantiationContext: "OpenChannel.swift::\(#function):\(#line)")


		}

		/// Creates a copy of the OpenChannel
		internal func clone() -> OpenChannel {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKOpenChannel>) in
					OpenChannel_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = OpenChannel(
				cType: nativeCallResult, instantiationContext: "OpenChannel.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Checks if two OpenChannels contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: OpenChannel, b: OpenChannel) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKOpenChannel>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKOpenChannel>) in
						OpenChannel_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Serialize the OpenChannel object into a byte array which can be read by OpenChannel_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKOpenChannel>) in
					OpenChannel_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "OpenChannel.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a OpenChannel from a byte array, created by OpenChannel_write
		public class func read(ser: [UInt8]) -> Result_OpenChannelDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "OpenChannel.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = OpenChannel_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_OpenChannelDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "OpenChannel.swift::\(#function):\(#line)")


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


		internal func danglingClone() -> OpenChannel {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> OpenChannel {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> OpenChannel {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> OpenChannel {
			self.dangling = self.cType!.is_owned
			return self
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print("Freeing OpenChannel \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing OpenChannel \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

