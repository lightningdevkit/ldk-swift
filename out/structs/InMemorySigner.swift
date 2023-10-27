#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A simple implementation of [`WriteableEcdsaChannelSigner`] that just keeps the private keys in memory.
///
/// This implementation performs no policy checks and is insufficient by itself as
/// a secure external signer.
public typealias InMemorySigner = Bindings.InMemorySigner

extension Bindings {


	/// A simple implementation of [`WriteableEcdsaChannelSigner`] that just keeps the private keys in memory.
	///
	/// This implementation performs no policy checks and is insufficient by itself as
	/// a secure external signer.
	public class InMemorySigner: NativeTypeWrapper {

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

		internal var cType: LDKInMemorySigner?

		internal init(cType: LDKInMemorySigner, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKInMemorySigner, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKInMemorySigner, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the InMemorySigner, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = InMemorySigner_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Holder secret key in the 2-of-2 multisig script of a channel. This key also backs the
		/// holder's anchor output in a commitment transaction, if one is present.
		public func getFundingKey() -> [UInt8]? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKInMemorySigner>) in
					InMemorySigner_get_funding_key(thisPtrPointer)
				}


			// cleanup

			guard let nativeCallResult = nativeCallResult else {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = Bindings.UInt8Tuple32ToArray(tuple: nativeCallResult.pointee)


			return returnValue
		}

		/// Holder secret key in the 2-of-2 multisig script of a channel. This key also backs the
		/// holder's anchor output in a commitment transaction, if one is present.
		public func setFundingKey(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = SecretKey(
				value: val, instantiationContext: "InMemorySigner.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKInMemorySigner>) in
					InMemorySigner_set_funding_key(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Holder secret key for blinded revocation pubkey.
		public func getRevocationBaseKey() -> [UInt8]? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKInMemorySigner>) in
					InMemorySigner_get_revocation_base_key(thisPtrPointer)
				}


			// cleanup

			guard let nativeCallResult = nativeCallResult else {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = Bindings.UInt8Tuple32ToArray(tuple: nativeCallResult.pointee)


			return returnValue
		}

		/// Holder secret key for blinded revocation pubkey.
		public func setRevocationBaseKey(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = SecretKey(
				value: val, instantiationContext: "InMemorySigner.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKInMemorySigner>) in
					InMemorySigner_set_revocation_base_key(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Holder secret key used for our balance in counterparty-broadcasted commitment transactions.
		public func getPaymentKey() -> [UInt8]? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKInMemorySigner>) in
					InMemorySigner_get_payment_key(thisPtrPointer)
				}


			// cleanup

			guard let nativeCallResult = nativeCallResult else {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = Bindings.UInt8Tuple32ToArray(tuple: nativeCallResult.pointee)


			return returnValue
		}

		/// Holder secret key used for our balance in counterparty-broadcasted commitment transactions.
		public func setPaymentKey(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = SecretKey(
				value: val, instantiationContext: "InMemorySigner.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKInMemorySigner>) in
					InMemorySigner_set_payment_key(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Holder secret key used in an HTLC transaction.
		public func getDelayedPaymentBaseKey() -> [UInt8]? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKInMemorySigner>) in
					InMemorySigner_get_delayed_payment_base_key(thisPtrPointer)
				}


			// cleanup

			guard let nativeCallResult = nativeCallResult else {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = Bindings.UInt8Tuple32ToArray(tuple: nativeCallResult.pointee)


			return returnValue
		}

		/// Holder secret key used in an HTLC transaction.
		public func setDelayedPaymentBaseKey(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = SecretKey(
				value: val, instantiationContext: "InMemorySigner.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKInMemorySigner>) in
					InMemorySigner_set_delayed_payment_base_key(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Holder HTLC secret key used in commitment transaction HTLC outputs.
		public func getHtlcBaseKey() -> [UInt8]? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKInMemorySigner>) in
					InMemorySigner_get_htlc_base_key(thisPtrPointer)
				}


			// cleanup

			guard let nativeCallResult = nativeCallResult else {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = Bindings.UInt8Tuple32ToArray(tuple: nativeCallResult.pointee)


			return returnValue
		}

		/// Holder HTLC secret key used in commitment transaction HTLC outputs.
		public func setHtlcBaseKey(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = SecretKey(
				value: val, instantiationContext: "InMemorySigner.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKInMemorySigner>) in
					InMemorySigner_set_htlc_base_key(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Commitment seed.
		public func getCommitmentSeed() -> [UInt8]? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKInMemorySigner>) in
					InMemorySigner_get_commitment_seed(thisPtrPointer)
				}


			// cleanup

			guard let nativeCallResult = nativeCallResult else {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = Bindings.UInt8Tuple32ToArray(tuple: nativeCallResult.pointee)


			return returnValue
		}

		/// Commitment seed.
		public func setCommitmentSeed(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = ThirtyTwoBytes(
				value: val, instantiationContext: "InMemorySigner.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKInMemorySigner>) in
					InMemorySigner_set_commitment_seed(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the InMemorySigner
		internal func clone() -> InMemorySigner {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKInMemorySigner>) in
					InMemorySigner_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = InMemorySigner(
				cType: nativeCallResult, instantiationContext: "InMemorySigner.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Creates a new [`InMemorySigner`].
		public init(
			fundingKey: [UInt8], revocationBaseKey: [UInt8], paymentKey: [UInt8], delayedPaymentBaseKey: [UInt8],
			htlcBaseKey: [UInt8], commitmentSeed: [UInt8], channelValueSatoshis: UInt64, channelKeysId: [UInt8],
			randBytesUniqueStart: [UInt8]
		) {
			// native call variable prep

			let fundingKeyPrimitiveWrapper = SecretKey(
				value: fundingKey, instantiationContext: "InMemorySigner.swift::\(#function):\(#line)")

			let revocationBaseKeyPrimitiveWrapper = SecretKey(
				value: revocationBaseKey, instantiationContext: "InMemorySigner.swift::\(#function):\(#line)")

			let paymentKeyPrimitiveWrapper = SecretKey(
				value: paymentKey, instantiationContext: "InMemorySigner.swift::\(#function):\(#line)")

			let delayedPaymentBaseKeyPrimitiveWrapper = SecretKey(
				value: delayedPaymentBaseKey, instantiationContext: "InMemorySigner.swift::\(#function):\(#line)")

			let htlcBaseKeyPrimitiveWrapper = SecretKey(
				value: htlcBaseKey, instantiationContext: "InMemorySigner.swift::\(#function):\(#line)")

			let commitmentSeedPrimitiveWrapper = ThirtyTwoBytes(
				value: commitmentSeed, instantiationContext: "InMemorySigner.swift::\(#function):\(#line)")

			let channelKeysIdPrimitiveWrapper = ThirtyTwoBytes(
				value: channelKeysId, instantiationContext: "InMemorySigner.swift::\(#function):\(#line)")

			let randBytesUniqueStartPrimitiveWrapper = ThirtyTwoBytes(
				value: randBytesUniqueStart, instantiationContext: "InMemorySigner.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = InMemorySigner_new(
				fundingKeyPrimitiveWrapper.cType!, revocationBaseKeyPrimitiveWrapper.cType!,
				paymentKeyPrimitiveWrapper.cType!, delayedPaymentBaseKeyPrimitiveWrapper.cType!,
				htlcBaseKeyPrimitiveWrapper.cType!, commitmentSeedPrimitiveWrapper.cType!, channelValueSatoshis,
				channelKeysIdPrimitiveWrapper.cType!, randBytesUniqueStartPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			fundingKeyPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			revocationBaseKeyPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			paymentKeyPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			delayedPaymentBaseKeyPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			htlcBaseKeyPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			commitmentSeedPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			channelKeysIdPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			randBytesUniqueStartPrimitiveWrapper.noOpRetain()

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = InMemorySigner(cType: nativeCallResult, instantiationContext: "InMemorySigner.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0, instantiationContext: "InMemorySigner.swift::\(#function):\(#line)"
				)


		}

		/// Returns the counterparty's pubkeys.
		///
		/// Will return `None` if [`ChannelSigner::provide_channel_parameters`] has not been called.
		/// In general, this is safe to `unwrap` only in [`ChannelSigner`] implementation.
		///
		/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func counterpartyPubkeys() -> ChannelPublicKeys? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKInMemorySigner>) in
					InMemorySigner_counterparty_pubkeys(thisArgPointer)
				}


			// cleanup

			// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
			// Type group: RustStruct
			// Type: LDKChannelPublicKeys

			if nativeCallResult.inner == nil {
				return nil
			}

			let pointerValue = UInt(bitPattern: nativeCallResult.inner)
			if pointerValue == 0 {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = ChannelPublicKeys(
				cType: nativeCallResult, instantiationContext: "InMemorySigner.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Returns the `contest_delay` value specified by our counterparty and applied on holder-broadcastable
		/// transactions, i.e., the amount of time that we have to wait to recover our funds if we
		/// broadcast a transaction.
		///
		/// Will return `None` if [`ChannelSigner::provide_channel_parameters`] has not been called.
		/// In general, this is safe to `unwrap` only in [`ChannelSigner`] implementation.
		public func counterpartySelectedContestDelay() -> UInt16? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKInMemorySigner>) in
					InMemorySigner_counterparty_selected_contest_delay(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_u16Z(
				cType: nativeCallResult, instantiationContext: "InMemorySigner.swift::\(#function):\(#line)",
				anchor: self
			)
			.getValue()


			return returnValue
		}

		/// Returns the `contest_delay` value specified by us and applied on transactions broadcastable
		/// by our counterparty, i.e., the amount of time that they have to wait to recover their funds
		/// if they broadcast a transaction.
		///
		/// Will return `None` if [`ChannelSigner::provide_channel_parameters`] has not been called.
		/// In general, this is safe to `unwrap` only in [`ChannelSigner`] implementation.
		public func holderSelectedContestDelay() -> UInt16? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKInMemorySigner>) in
					InMemorySigner_holder_selected_contest_delay(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_u16Z(
				cType: nativeCallResult, instantiationContext: "InMemorySigner.swift::\(#function):\(#line)",
				anchor: self
			)
			.getValue()


			return returnValue
		}

		/// Returns whether the holder is the initiator.
		///
		/// Will return `None` if [`ChannelSigner::provide_channel_parameters`] has not been called.
		/// In general, this is safe to `unwrap` only in [`ChannelSigner`] implementation.
		public func isOutbound() -> Bool? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKInMemorySigner>) in
					InMemorySigner_is_outbound(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_boolZ(
				cType: nativeCallResult, instantiationContext: "InMemorySigner.swift::\(#function):\(#line)",
				anchor: self
			)
			.getValue()


			return returnValue
		}

		/// Funding outpoint
		///
		/// Will return `None` if [`ChannelSigner::provide_channel_parameters`] has not been called.
		/// In general, this is safe to `unwrap` only in [`ChannelSigner`] implementation.
		///
		/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func fundingOutpoint() -> OutPoint? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKInMemorySigner>) in
					InMemorySigner_funding_outpoint(thisArgPointer)
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
			let returnValue = OutPoint(
				cType: nativeCallResult, instantiationContext: "InMemorySigner.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Returns a [`ChannelTransactionParameters`] for this channel, to be used when verifying or
		/// building transactions.
		///
		/// Will return `None` if [`ChannelSigner::provide_channel_parameters`] has not been called.
		/// In general, this is safe to `unwrap` only in [`ChannelSigner`] implementation.
		///
		/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func getChannelParameters() -> ChannelTransactionParameters? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKInMemorySigner>) in
					InMemorySigner_get_channel_parameters(thisArgPointer)
				}


			// cleanup

			// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
			// Type group: RustStruct
			// Type: LDKChannelTransactionParameters

			if nativeCallResult.inner == nil {
				return nil
			}

			let pointerValue = UInt(bitPattern: nativeCallResult.inner)
			if pointerValue == 0 {
				return nil
			}


			// return value (do some wrapping)
			let returnValue = ChannelTransactionParameters(
				cType: nativeCallResult, instantiationContext: "InMemorySigner.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Returns the channel type features of the channel parameters. Should be helpful for
		/// determining a channel's category, i. e. legacy/anchors/taproot/etc.
		///
		/// Will return `None` if [`ChannelSigner::provide_channel_parameters`] has not been called.
		/// In general, this is safe to `unwrap` only in [`ChannelSigner`] implementation.
		///
		/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
		public func channelTypeFeatures() -> ChannelTypeFeatures? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKInMemorySigner>) in
					InMemorySigner_channel_type_features(thisArgPointer)
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
				cType: nativeCallResult, instantiationContext: "InMemorySigner.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Sign the single input of `spend_tx` at index `input_idx`, which spends the output described
		/// by `descriptor`, returning the witness stack for the input.
		///
		/// Returns an error if the input at `input_idx` does not exist, has a non-empty `script_sig`,
		/// is not spending the outpoint described by [`descriptor.outpoint`],
		/// or if an output descriptor `script_pubkey` does not match the one we can spend.
		///
		/// [`descriptor.outpoint`]: StaticPaymentOutputDescriptor::outpoint
		public func signCounterpartyPaymentInput(
			spendTx: [UInt8], inputIdx: UInt, descriptor: StaticPaymentOutputDescriptor
		) -> Result_CVec_CVec_u8ZZNoneZ {
			// native call variable prep

			let spendTxPrimitiveWrapper = Transaction(
				value: spendTx, instantiationContext: "InMemorySigner.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKInMemorySigner>) in

					withUnsafePointer(to: descriptor.cType!) {
						(descriptorPointer: UnsafePointer<LDKStaticPaymentOutputDescriptor>) in
						InMemorySigner_sign_counterparty_payment_input(
							thisArgPointer, spendTxPrimitiveWrapper.cType!, inputIdx, descriptorPointer)
					}

				}


			// cleanup

			// for elided types, we need this
			spendTxPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_CVec_CVec_u8ZZNoneZ(
				cType: nativeCallResult, instantiationContext: "InMemorySigner.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Sign the single input of `spend_tx` at index `input_idx` which spends the output
		/// described by `descriptor`, returning the witness stack for the input.
		///
		/// Returns an error if the input at `input_idx` does not exist, has a non-empty `script_sig`,
		/// is not spending the outpoint described by [`descriptor.outpoint`], does not have a
		/// sequence set to [`descriptor.to_self_delay`], or if an output descriptor
		/// `script_pubkey` does not match the one we can spend.
		///
		/// [`descriptor.outpoint`]: DelayedPaymentOutputDescriptor::outpoint
		/// [`descriptor.to_self_delay`]: DelayedPaymentOutputDescriptor::to_self_delay
		public func signDynamicP2wshInput(spendTx: [UInt8], inputIdx: UInt, descriptor: DelayedPaymentOutputDescriptor)
			-> Result_CVec_CVec_u8ZZNoneZ
		{
			// native call variable prep

			let spendTxPrimitiveWrapper = Transaction(
				value: spendTx, instantiationContext: "InMemorySigner.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKInMemorySigner>) in

					withUnsafePointer(to: descriptor.cType!) {
						(descriptorPointer: UnsafePointer<LDKDelayedPaymentOutputDescriptor>) in
						InMemorySigner_sign_dynamic_p2wsh_input(
							thisArgPointer, spendTxPrimitiveWrapper.cType!, inputIdx, descriptorPointer)
					}

				}


			// cleanup

			// for elided types, we need this
			spendTxPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_CVec_CVec_u8ZZNoneZ(
				cType: nativeCallResult, instantiationContext: "InMemorySigner.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Constructs a new EntropySource which calls the relevant methods on this_arg.
		/// This copies the `inner` pointer in this_arg and thus the returned EntropySource must be freed before this_arg is
		public func asEntropySource() -> EntropySource {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKInMemorySigner>) in
					InMemorySigner_as_EntropySource(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NativelyImplementedEntropySource(
				cType: nativeCallResult, instantiationContext: "InMemorySigner.swift::\(#function):\(#line)",
				anchor: self)


			return returnValue
		}

		/// Constructs a new ChannelSigner which calls the relevant methods on this_arg.
		/// This copies the `inner` pointer in this_arg and thus the returned ChannelSigner must be freed before this_arg is
		public func asChannelSigner() -> ChannelSigner {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKInMemorySigner>) in
					InMemorySigner_as_ChannelSigner(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NativelyImplementedChannelSigner(
				cType: nativeCallResult, instantiationContext: "InMemorySigner.swift::\(#function):\(#line)",
				anchor: self)


			return returnValue
		}

		/// Constructs a new EcdsaChannelSigner which calls the relevant methods on this_arg.
		/// This copies the `inner` pointer in this_arg and thus the returned EcdsaChannelSigner must be freed before this_arg is
		public func asEcdsaChannelSigner() -> EcdsaChannelSigner {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKInMemorySigner>) in
					InMemorySigner_as_EcdsaChannelSigner(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NativelyImplementedEcdsaChannelSigner(
				cType: nativeCallResult, instantiationContext: "InMemorySigner.swift::\(#function):\(#line)",
				anchor: self)


			return returnValue
		}

		/// Constructs a new WriteableEcdsaChannelSigner which calls the relevant methods on this_arg.
		/// This copies the `inner` pointer in this_arg and thus the returned WriteableEcdsaChannelSigner must be freed before this_arg is
		public func asWriteableEcdsaChannelSigner() -> WriteableEcdsaChannelSigner {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKInMemorySigner>) in
					InMemorySigner_as_WriteableEcdsaChannelSigner(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NativelyImplementedWriteableEcdsaChannelSigner(
				cType: nativeCallResult, instantiationContext: "InMemorySigner.swift::\(#function):\(#line)",
				anchor: self)


			return returnValue
		}

		/// Serialize the InMemorySigner object into a byte array which can be read by InMemorySigner_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKInMemorySigner>) in
					InMemorySigner_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "InMemorySigner.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a InMemorySigner from a byte array, created by InMemorySigner_write
		public class func read(ser: [UInt8], arg: EntropySource) -> Result_InMemorySignerDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "InMemorySigner.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = InMemorySigner_read(serPrimitiveWrapper.cType!, arg.activate().cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_InMemorySignerDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "InMemorySigner.swift::\(#function):\(#line)")


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


		internal func danglingClone() -> InMemorySigner {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> InMemorySigner {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> InMemorySigner {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> InMemorySigner {
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
						"Freeing InMemorySigner \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing InMemorySigner \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

