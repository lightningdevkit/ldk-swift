#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// An accept_channel2 message to be sent by or received from the channel accepter.
///
/// Used in V2 channel establishment
public typealias AcceptChannelV2 = Bindings.AcceptChannelV2

extension Bindings {


	/// An accept_channel2 message to be sent by or received from the channel accepter.
	///
	/// Used in V2 channel establishment
	public class AcceptChannelV2: NativeTypeWrapper {

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

		internal var cType: LDKAcceptChannelV2?

		internal init(cType: LDKAcceptChannelV2, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKAcceptChannelV2, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKAcceptChannelV2, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the AcceptChannelV2, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = AcceptChannelV2_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The same `temporary_channel_id` received from the initiator's `open_channel2` message.
		public func getTemporaryChannelId() -> [UInt8]? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_get_temporary_channel_id(thisPtrPointer)
				}


			// cleanup

			guard let nativeCallResult = nativeCallResult else {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = Bindings.UInt8Tuple32ToArray(tuple: nativeCallResult.pointee)


			return returnValue
		}

		/// The same `temporary_channel_id` received from the initiator's `open_channel2` message.
		public func setTemporaryChannelId(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = ThirtyTwoBytes(
				value: val, instantiationContext: "AcceptChannelV2.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_set_temporary_channel_id(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Part of the channel value contributed by the channel acceptor
		public func getFundingSatoshis() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_get_funding_satoshis(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Part of the channel value contributed by the channel acceptor
		public func setFundingSatoshis(val: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_set_funding_satoshis(thisPtrPointer, val)
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
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_get_dust_limit_satoshis(thisPtrPointer)
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
					(thisPtrPointer: UnsafeMutablePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_set_dust_limit_satoshis(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The maximum inbound HTLC value in flight towards channel acceptor, in milli-satoshi
		public func getMaxHtlcValueInFlightMsat() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_get_max_htlc_value_in_flight_msat(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The maximum inbound HTLC value in flight towards channel acceptor, in milli-satoshi
		public func setMaxHtlcValueInFlightMsat(val: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_set_max_htlc_value_in_flight_msat(thisPtrPointer, val)
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
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_get_htlc_minimum_msat(thisPtrPointer)
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
					(thisPtrPointer: UnsafeMutablePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_set_htlc_minimum_msat(thisPtrPointer, val)
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
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_get_minimum_depth(thisPtrPointer)
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
					(thisPtrPointer: UnsafeMutablePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_set_minimum_depth(thisPtrPointer, val)
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
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_get_to_self_delay(thisPtrPointer)
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
					(thisPtrPointer: UnsafeMutablePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_set_to_self_delay(thisPtrPointer, val)
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
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_get_max_accepted_htlcs(thisPtrPointer)
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
					(thisPtrPointer: UnsafeMutablePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_set_max_accepted_htlcs(thisPtrPointer, val)
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
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_get_funding_pubkey(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "AcceptChannelV2.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// The channel acceptor's key controlling the funding transaction
		public func setFundingPubkey(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = PublicKey(
				value: val, instantiationContext: "AcceptChannelV2.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_set_funding_pubkey(thisPtrPointer, valPrimitiveWrapper.cType!)
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
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_get_revocation_basepoint(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "AcceptChannelV2.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Used to derive a revocation key for transactions broadcast by counterparty
		public func setRevocationBasepoint(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = PublicKey(
				value: val, instantiationContext: "AcceptChannelV2.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_set_revocation_basepoint(thisPtrPointer, valPrimitiveWrapper.cType!)
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
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_get_payment_basepoint(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "AcceptChannelV2.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// A payment key to channel acceptor for transactions broadcast by counterparty
		public func setPaymentBasepoint(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = PublicKey(
				value: val, instantiationContext: "AcceptChannelV2.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_set_payment_basepoint(thisPtrPointer, valPrimitiveWrapper.cType!)
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
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_get_delayed_payment_basepoint(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "AcceptChannelV2.swift::\(#function):\(#line)",
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
				value: val, instantiationContext: "AcceptChannelV2.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_set_delayed_payment_basepoint(thisPtrPointer, valPrimitiveWrapper.cType!)
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
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_get_htlc_basepoint(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "AcceptChannelV2.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Used to derive an HTLC payment key to channel acceptor for transactions broadcast by counterparty
		public func setHtlcBasepoint(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = PublicKey(
				value: val, instantiationContext: "AcceptChannelV2.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_set_htlc_basepoint(thisPtrPointer, valPrimitiveWrapper.cType!)
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
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_get_first_per_commitment_point(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "AcceptChannelV2.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// The first to-be-broadcast-by-channel-acceptor transaction's per commitment point
		public func setFirstPerCommitmentPoint(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = PublicKey(
				value: val, instantiationContext: "AcceptChannelV2.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_set_first_per_commitment_point(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The second to-be-broadcast-by-channel-acceptor transaction's per commitment point
		public func getSecondPerCommitmentPoint() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_get_second_per_commitment_point(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "AcceptChannelV2.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// The second to-be-broadcast-by-channel-acceptor transaction's per commitment point
		public func setSecondPerCommitmentPoint(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = PublicKey(
				value: val, instantiationContext: "AcceptChannelV2.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_set_second_per_commitment_point(thisPtrPointer, valPrimitiveWrapper.cType!)
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
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_get_shutdown_scriptpubkey(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_CVec_u8ZZ(
				cType: nativeCallResult, instantiationContext: "AcceptChannelV2.swift::\(#function):\(#line)",
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
				some: val, instantiationContext: "AcceptChannelV2.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_set_shutdown_scriptpubkey(thisPtrPointer, valOption.cType!)
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
		/// This is required to match the equivalent field in [`OpenChannelV2::channel_type`].
		///
		/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func getChannelType() -> ChannelTypeFeatures? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_get_channel_type(thisPtrPointer)
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
				cType: nativeCallResult, instantiationContext: "AcceptChannelV2.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// The channel type that this channel will represent. If none is set, we derive the channel
		/// type from the intersection of our feature bits with our counterparty's feature bits from
		/// the Init message.
		///
		/// This is required to match the equivalent field in [`OpenChannelV2::channel_type`].
		///
		/// Note that val (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func setChannelType(val: ChannelTypeFeatures) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_set_channel_type(thisPtrPointer, val.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Optionally, a requirement that only confirmed inputs can be added
		public func getRequireConfirmedInputs() -> Option_NoneZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_get_require_confirmed_inputs(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_NoneZ(value: nativeCallResult)


			return returnValue
		}

		/// Optionally, a requirement that only confirmed inputs can be added
		@available(
			*, deprecated,
			message: "This method passes the following non-cloneable, but freeable objects by value: `val`."
		)
		public func setRequireConfirmedInputs(val: Option_NoneZ) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_set_require_confirmed_inputs(thisPtrPointer, val.getCValue())
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new AcceptChannelV2 given each field
		///
		/// Note that channel_type_arg (or a relevant inner pointer) may be NULL or all-0s to represent None
		@available(
			*, deprecated,
			message:
				"This method passes the following non-cloneable, but freeable objects by value: `requireConfirmedInputsArg`."
		)
		public init(
			temporaryChannelIdArg: [UInt8], fundingSatoshisArg: UInt64, dustLimitSatoshisArg: UInt64,
			maxHtlcValueInFlightMsatArg: UInt64, htlcMinimumMsatArg: UInt64, minimumDepthArg: UInt32,
			toSelfDelayArg: UInt16, maxAcceptedHtlcsArg: UInt16, fundingPubkeyArg: [UInt8],
			revocationBasepointArg: [UInt8], paymentBasepointArg: [UInt8], delayedPaymentBasepointArg: [UInt8],
			htlcBasepointArg: [UInt8], firstPerCommitmentPointArg: [UInt8], secondPerCommitmentPointArg: [UInt8],
			shutdownScriptpubkeyArg: [UInt8]?, channelTypeArg: ChannelTypeFeatures,
			requireConfirmedInputsArg: Option_NoneZ
		) {
			// native call variable prep

			let temporaryChannelIdArgPrimitiveWrapper = ThirtyTwoBytes(
				value: temporaryChannelIdArg, instantiationContext: "AcceptChannelV2.swift::\(#function):\(#line)")

			let fundingPubkeyArgPrimitiveWrapper = PublicKey(
				value: fundingPubkeyArg, instantiationContext: "AcceptChannelV2.swift::\(#function):\(#line)")

			let revocationBasepointArgPrimitiveWrapper = PublicKey(
				value: revocationBasepointArg, instantiationContext: "AcceptChannelV2.swift::\(#function):\(#line)")

			let paymentBasepointArgPrimitiveWrapper = PublicKey(
				value: paymentBasepointArg, instantiationContext: "AcceptChannelV2.swift::\(#function):\(#line)")

			let delayedPaymentBasepointArgPrimitiveWrapper = PublicKey(
				value: delayedPaymentBasepointArg, instantiationContext: "AcceptChannelV2.swift::\(#function):\(#line)")

			let htlcBasepointArgPrimitiveWrapper = PublicKey(
				value: htlcBasepointArg, instantiationContext: "AcceptChannelV2.swift::\(#function):\(#line)")

			let firstPerCommitmentPointArgPrimitiveWrapper = PublicKey(
				value: firstPerCommitmentPointArg, instantiationContext: "AcceptChannelV2.swift::\(#function):\(#line)")

			let secondPerCommitmentPointArgPrimitiveWrapper = PublicKey(
				value: secondPerCommitmentPointArg, instantiationContext: "AcceptChannelV2.swift::\(#function):\(#line)"
			)

			let shutdownScriptpubkeyArgOption = Option_CVec_u8ZZ(
				some: shutdownScriptpubkeyArg, instantiationContext: "AcceptChannelV2.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult = AcceptChannelV2_new(
				temporaryChannelIdArgPrimitiveWrapper.cType!, fundingSatoshisArg, dustLimitSatoshisArg,
				maxHtlcValueInFlightMsatArg, htlcMinimumMsatArg, minimumDepthArg, toSelfDelayArg, maxAcceptedHtlcsArg,
				fundingPubkeyArgPrimitiveWrapper.cType!, revocationBasepointArgPrimitiveWrapper.cType!,
				paymentBasepointArgPrimitiveWrapper.cType!, delayedPaymentBasepointArgPrimitiveWrapper.cType!,
				htlcBasepointArgPrimitiveWrapper.cType!, firstPerCommitmentPointArgPrimitiveWrapper.cType!,
				secondPerCommitmentPointArgPrimitiveWrapper.cType!, shutdownScriptpubkeyArgOption.cType!,
				channelTypeArg.dynamicallyDangledClone().cType!, requireConfirmedInputsArg.getCValue())

			// cleanup

			// for elided types, we need this
			temporaryChannelIdArgPrimitiveWrapper.noOpRetain()

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

			// for elided types, we need this
			secondPerCommitmentPointArgPrimitiveWrapper.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = AcceptChannelV2(cType: nativeCallResult, instantiationContext: "AcceptChannelV2.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0,
					instantiationContext: "AcceptChannelV2.swift::\(#function):\(#line)")


		}

		/// Creates a copy of the AcceptChannelV2
		internal func clone() -> AcceptChannelV2 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = AcceptChannelV2(
				cType: nativeCallResult, instantiationContext: "AcceptChannelV2.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Checks if two AcceptChannelV2s contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: AcceptChannelV2, b: AcceptChannelV2) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKAcceptChannelV2>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKAcceptChannelV2>) in
						AcceptChannelV2_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Serialize the AcceptChannelV2 object into a byte array which can be read by AcceptChannelV2_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKAcceptChannelV2>) in
					AcceptChannelV2_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "AcceptChannelV2.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a AcceptChannelV2 from a byte array, created by AcceptChannelV2_write
		public class func read(ser: [UInt8]) -> Result_AcceptChannelV2DecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "AcceptChannelV2.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = AcceptChannelV2_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_AcceptChannelV2DecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "AcceptChannelV2.swift::\(#function):\(#line)")


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


		internal func danglingClone() -> AcceptChannelV2 {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> AcceptChannelV2 {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> AcceptChannelV2 {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> AcceptChannelV2 {
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
						"Freeing AcceptChannelV2 \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing AcceptChannelV2 \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

