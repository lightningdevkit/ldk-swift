// necessary for abort() calls
import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


/// A trait to sign Lightning channel transactions as described in
/// [BOLT 3](https://github.com/lightning/bolts/blob/master/03-transactions.md).
///
/// Signing services could be implemented on a hardware wallet and should implement signing
/// policies in order to be secure. Please refer to the [VLS Policy
/// Controls](https://gitlab.com/lightning-signer/validating-lightning-signer/-/blob/main/docs/policy-controls.md)
/// for an example of such policies.
public typealias EcdsaChannelSigner = Bindings.EcdsaChannelSigner

extension Bindings {

	/// A trait to sign Lightning channel transactions as described in
	/// [BOLT 3](https://github.com/lightning/bolts/blob/master/03-transactions.md).
	///
	/// Signing services could be implemented on a hardware wallet and should implement signing
	/// policies in order to be secure. Please refer to the [VLS Policy
	/// Controls](https://gitlab.com/lightning-signer/validating-lightning-signer/-/blob/main/docs/policy-controls.md)
	/// for an example of such policies.
	open class EcdsaChannelSigner: NativeTraitWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKEcdsaChannelSigner?

		internal init(cType: LDKEcdsaChannelSigner, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKEcdsaChannelSigner, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKEcdsaChannelSigner, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		public init(channelSigner: ChannelSigner) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0,
					instantiationContext: "EcdsaChannelSigner.swift::\(#function):\(#line)")

			let thisArg = Bindings.instanceToPointer(instance: self)


			func signCounterpartyCommitmentLambda(
				this_arg: UnsafeRawPointer?, commitment_tx: UnsafePointer<LDKCommitmentTransaction>,
				preimages: LDKCVec_PaymentPreimageZ
			) -> LDKCResult_C2Tuple_SignatureCVec_SignatureZZNoneZ {
				let instance: EcdsaChannelSigner = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "EcdsaChannelSigner::signCounterpartyCommitmentLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.signCounterpartyCommitment(
					commitmentTx: CommitmentTransaction(
						cType: commitment_tx.pointee,
						instantiationContext: "EcdsaChannelSigner.swift::init()::\(#function):\(#line)"
					)
					.dangle().clone(),
					preimages: Vec_PaymentPreimageZ(
						cType: preimages,
						instantiationContext: "EcdsaChannelSigner.swift::init()::\(#function):\(#line)"
					)
					.getValue())

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult.dangle().cType!

				return returnValue
			}

			func validateCounterpartyRevocationLambda(
				this_arg: UnsafeRawPointer?, idx: UInt64, secret: UnsafePointer<UInt8Tuple32>?
			) -> LDKCResult_NoneNoneZ {
				let instance: EcdsaChannelSigner = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "EcdsaChannelSigner::validateCounterpartyRevocationLambda")

				// Swift callback variable prep

				var secretPointee: [UInt8]? = nil
				if let secretUnwrapped = secret {
					secretPointee = Bindings.UInt8Tuple32ToArray(tuple: secretUnwrapped.pointee)
				}


				// Swift callback call
				let swiftCallbackResult = instance.validateCounterpartyRevocation(idx: idx, secret: secretPointee)

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult.dangle().cType!

				return returnValue
			}

			func signHolderCommitmentAndHtlcsLambda(
				this_arg: UnsafeRawPointer?, commitment_tx: UnsafePointer<LDKHolderCommitmentTransaction>
			) -> LDKCResult_C2Tuple_SignatureCVec_SignatureZZNoneZ {
				let instance: EcdsaChannelSigner = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "EcdsaChannelSigner::signHolderCommitmentAndHtlcsLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.signHolderCommitmentAndHtlcs(
					commitmentTx: HolderCommitmentTransaction(
						cType: commitment_tx.pointee,
						instantiationContext: "EcdsaChannelSigner.swift::init()::\(#function):\(#line)"
					)
					.dangle().clone())

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult.dangle().cType!

				return returnValue
			}

			func signJusticeRevokedOutputLambda(
				this_arg: UnsafeRawPointer?, justice_tx: LDKTransaction, input: UInt, amount: UInt64,
				per_commitment_key: UnsafePointer<UInt8Tuple32>?
			) -> LDKCResult_SignatureNoneZ {
				let instance: EcdsaChannelSigner = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "EcdsaChannelSigner::signJusticeRevokedOutputLambda")

				// Swift callback variable prep

				var per_commitment_keyPointee: [UInt8]? = nil
				if let per_commitment_keyUnwrapped = per_commitment_key {
					per_commitment_keyPointee = Bindings.UInt8Tuple32ToArray(tuple: per_commitment_keyUnwrapped.pointee)
				}


				// Swift callback call
				let swiftCallbackResult = instance.signJusticeRevokedOutput(
					justiceTx: Transaction(
						cType: justice_tx,
						instantiationContext: "EcdsaChannelSigner.swift::init()::\(#function):\(#line)"
					)
					.getValue(), input: input, amount: amount, perCommitmentKey: per_commitment_keyPointee)

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult.dangle().cType!

				return returnValue
			}

			func signJusticeRevokedHtlcLambda(
				this_arg: UnsafeRawPointer?, justice_tx: LDKTransaction, input: UInt, amount: UInt64,
				per_commitment_key: UnsafePointer<UInt8Tuple32>?, htlc: UnsafePointer<LDKHTLCOutputInCommitment>
			) -> LDKCResult_SignatureNoneZ {
				let instance: EcdsaChannelSigner = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "EcdsaChannelSigner::signJusticeRevokedHtlcLambda")

				// Swift callback variable prep

				var per_commitment_keyPointee: [UInt8]? = nil
				if let per_commitment_keyUnwrapped = per_commitment_key {
					per_commitment_keyPointee = Bindings.UInt8Tuple32ToArray(tuple: per_commitment_keyUnwrapped.pointee)
				}


				// Swift callback call
				let swiftCallbackResult = instance.signJusticeRevokedHtlc(
					justiceTx: Transaction(
						cType: justice_tx,
						instantiationContext: "EcdsaChannelSigner.swift::init()::\(#function):\(#line)"
					)
					.getValue(), input: input, amount: amount, perCommitmentKey: per_commitment_keyPointee,
					htlc: HTLCOutputInCommitment(
						cType: htlc.pointee,
						instantiationContext: "EcdsaChannelSigner.swift::init()::\(#function):\(#line)"
					)
					.dangle().clone())

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult.dangle().cType!

				return returnValue
			}

			func signCounterpartyHtlcTransactionLambda(
				this_arg: UnsafeRawPointer?, htlc_tx: LDKTransaction, input: UInt, amount: UInt64,
				per_commitment_point: LDKPublicKey, htlc: UnsafePointer<LDKHTLCOutputInCommitment>
			) -> LDKCResult_SignatureNoneZ {
				let instance: EcdsaChannelSigner = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "EcdsaChannelSigner::signCounterpartyHtlcTransactionLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.signCounterpartyHtlcTransaction(
					htlcTx: Transaction(
						cType: htlc_tx, instantiationContext: "EcdsaChannelSigner.swift::init()::\(#function):\(#line)"
					)
					.getValue(), input: input, amount: amount,
					perCommitmentPoint: PublicKey(
						cType: per_commitment_point,
						instantiationContext: "EcdsaChannelSigner.swift::init()::\(#function):\(#line)"
					)
					.getValue(),
					htlc: HTLCOutputInCommitment(
						cType: htlc.pointee,
						instantiationContext: "EcdsaChannelSigner.swift::init()::\(#function):\(#line)"
					)
					.dangle().clone())

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult.dangle().cType!

				return returnValue
			}

			func signClosingTransactionLambda(
				this_arg: UnsafeRawPointer?, closing_tx: UnsafePointer<LDKClosingTransaction>
			) -> LDKCResult_SignatureNoneZ {
				let instance: EcdsaChannelSigner = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "EcdsaChannelSigner::signClosingTransactionLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.signClosingTransaction(
					closingTx: ClosingTransaction(
						cType: closing_tx.pointee,
						instantiationContext: "EcdsaChannelSigner.swift::init()::\(#function):\(#line)"
					)
					.dangle().clone())

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult.dangle().cType!

				return returnValue
			}

			func signHolderAnchorInputLambda(this_arg: UnsafeRawPointer?, anchor_tx: LDKTransaction, input: UInt)
				-> LDKCResult_SignatureNoneZ
			{
				let instance: EcdsaChannelSigner = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "EcdsaChannelSigner::signHolderAnchorInputLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.signHolderAnchorInput(
					anchorTx: Transaction(
						cType: anchor_tx,
						instantiationContext: "EcdsaChannelSigner.swift::init()::\(#function):\(#line)"
					)
					.getValue(), input: input)

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult.dangle().cType!

				return returnValue
			}

			func signChannelAnnouncementWithFundingKeyLambda(
				this_arg: UnsafeRawPointer?, msg: UnsafePointer<LDKUnsignedChannelAnnouncement>
			) -> LDKCResult_SignatureNoneZ {
				let instance: EcdsaChannelSigner = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "EcdsaChannelSigner::signChannelAnnouncementWithFundingKeyLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.signChannelAnnouncementWithFundingKey(
					msg: UnsignedChannelAnnouncement(
						cType: msg.pointee,
						instantiationContext: "EcdsaChannelSigner.swift::init()::\(#function):\(#line)"
					)
					.dangle().clone())

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult.dangle().cType!

				return returnValue
			}

			func freeLambda(this_arg: UnsafeMutableRawPointer?) {
				let instance: EcdsaChannelSigner = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "EcdsaChannelSigner::freeLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.free()

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult

				return returnValue
			}


			self.cType = LDKEcdsaChannelSigner(
				this_arg: thisArg,
				sign_counterparty_commitment: signCounterpartyCommitmentLambda,
				validate_counterparty_revocation: validateCounterpartyRevocationLambda,
				sign_holder_commitment_and_htlcs: signHolderCommitmentAndHtlcsLambda,
				sign_justice_revoked_output: signJusticeRevokedOutputLambda,
				sign_justice_revoked_htlc: signJusticeRevokedHtlcLambda,
				sign_counterparty_htlc_transaction: signCounterpartyHtlcTransactionLambda,
				sign_closing_transaction: signClosingTransactionLambda,
				sign_holder_anchor_input: signHolderAnchorInputLambda,
				sign_channel_announcement_with_funding_key: signChannelAnnouncementWithFundingKeyLambda,
				ChannelSigner: channelSigner.activate().cType!,
				free: freeLambda
			)
		}


		/// Create a signature for a counterparty's commitment transaction and associated HTLC transactions.
		///
		/// Note that if signing fails or is rejected, the channel will be force-closed.
		///
		/// Policy checks should be implemented in this function, including checking the amount
		/// sent to us and checking the HTLCs.
		///
		/// The preimages of outgoing HTLCs that were fulfilled since the last commitment are provided.
		/// A validating signer should ensure that an HTLC output is removed only when the matching
		/// preimage is provided, or when the value to holder is restored.
		///
		/// Note that all the relevant preimages will be provided, but there may also be additional
		/// irrelevant or duplicate preimages.
		open func signCounterpartyCommitment(commitmentTx: CommitmentTransaction, preimages: [[UInt8]])
			-> Result_C2Tuple_SignatureCVec_SignatureZZNoneZ
		{

			Bindings.print(
				"Error: EcdsaChannelSigner::signCounterpartyCommitment MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Validate the counterparty's revocation.
		///
		/// This is required in order for the signer to make sure that the state has moved
		/// forward and it is safe to sign the next counterparty commitment.
		open func validateCounterpartyRevocation(idx: UInt64, secret: [UInt8]?) -> Result_NoneNoneZ {

			Bindings.print(
				"Error: EcdsaChannelSigner::validateCounterpartyRevocation MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Creates a signature for a holder's commitment transaction and its claiming HTLC transactions.
		///
		/// This will be called
		/// - with a non-revoked `commitment_tx`.
		/// - with the latest `commitment_tx` when we initiate a force-close.
		/// - with the previous `commitment_tx`, just to get claiming HTLC
		/// signatures, if we are reacting to a [`ChannelMonitor`]
		/// [replica](https://github.com/lightningdevkit/rust-lightning/blob/main/GLOSSARY.md#monitor-replicas)
		/// that decided to broadcast before it had been updated to the latest `commitment_tx`.
		///
		/// This may be called multiple times for the same transaction.
		///
		/// An external signer implementation should check that the commitment has not been revoked.
		///
		/// [`ChannelMonitor`]: crate::chain::channelmonitor::ChannelMonitor
		open func signHolderCommitmentAndHtlcs(commitmentTx: HolderCommitmentTransaction)
			-> Result_C2Tuple_SignatureCVec_SignatureZZNoneZ
		{

			Bindings.print(
				"Error: EcdsaChannelSigner::signHolderCommitmentAndHtlcs MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Create a signature for the given input in a transaction spending an HTLC transaction output
		/// or a commitment transaction `to_local` output when our counterparty broadcasts an old state.
		///
		/// A justice transaction may claim multiple outputs at the same time if timelocks are
		/// similar, but only a signature for the input at index `input` should be signed for here.
		/// It may be called multiple times for same output(s) if a fee-bump is needed with regards
		/// to an upcoming timelock expiration.
		///
		/// Amount is value of the output spent by this input, committed to in the BIP 143 signature.
		///
		/// `per_commitment_key` is revocation secret which was provided by our counterparty when they
		/// revoked the state which they eventually broadcast. It's not a _holder_ secret key and does
		/// not allow the spending of any funds by itself (you need our holder `revocation_secret` to do
		/// so).
		open func signJusticeRevokedOutput(justiceTx: [UInt8], input: UInt, amount: UInt64, perCommitmentKey: [UInt8]?)
			-> Result_SignatureNoneZ
		{

			Bindings.print(
				"Error: EcdsaChannelSigner::signJusticeRevokedOutput MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Create a signature for the given input in a transaction spending a commitment transaction
		/// HTLC output when our counterparty broadcasts an old state.
		///
		/// A justice transaction may claim multiple outputs at the same time if timelocks are
		/// similar, but only a signature for the input at index `input` should be signed for here.
		/// It may be called multiple times for same output(s) if a fee-bump is needed with regards
		/// to an upcoming timelock expiration.
		///
		/// `amount` is the value of the output spent by this input, committed to in the BIP 143
		/// signature.
		///
		/// `per_commitment_key` is revocation secret which was provided by our counterparty when they
		/// revoked the state which they eventually broadcast. It's not a _holder_ secret key and does
		/// not allow the spending of any funds by itself (you need our holder revocation_secret to do
		/// so).
		///
		/// `htlc` holds HTLC elements (hash, timelock), thus changing the format of the witness script
		/// (which is committed to in the BIP 143 signatures).
		open func signJusticeRevokedHtlc(
			justiceTx: [UInt8], input: UInt, amount: UInt64, perCommitmentKey: [UInt8]?, htlc: HTLCOutputInCommitment
		) -> Result_SignatureNoneZ {

			Bindings.print(
				"Error: EcdsaChannelSigner::signJusticeRevokedHtlc MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Create a signature for a claiming transaction for a HTLC output on a counterparty's commitment
		/// transaction, either offered or received.
		///
		/// Such a transaction may claim multiples offered outputs at same time if we know the
		/// preimage for each when we create it, but only the input at index `input` should be
		/// signed for here. It may be called multiple times for same output(s) if a fee-bump is
		/// needed with regards to an upcoming timelock expiration.
		///
		/// `witness_script` is either an offered or received script as defined in BOLT3 for HTLC
		/// outputs.
		///
		/// `amount` is value of the output spent by this input, committed to in the BIP 143 signature.
		///
		/// `per_commitment_point` is the dynamic point corresponding to the channel state
		/// detected onchain. It has been generated by our counterparty and is used to derive
		/// channel state keys, which are then included in the witness script and committed to in the
		/// BIP 143 signature.
		open func signCounterpartyHtlcTransaction(
			htlcTx: [UInt8], input: UInt, amount: UInt64, perCommitmentPoint: [UInt8], htlc: HTLCOutputInCommitment
		) -> Result_SignatureNoneZ {

			Bindings.print(
				"Error: EcdsaChannelSigner::signCounterpartyHtlcTransaction MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Create a signature for a (proposed) closing transaction.
		///
		/// Note that, due to rounding, there may be one \"missing\" satoshi, and either party may have
		/// chosen to forgo their output as dust.
		open func signClosingTransaction(closingTx: ClosingTransaction) -> Result_SignatureNoneZ {

			Bindings.print(
				"Error: EcdsaChannelSigner::signClosingTransaction MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Computes the signature for a commitment transaction's anchor output used as an
		/// input within `anchor_tx`, which spends the commitment transaction, at index `input`.
		open func signHolderAnchorInput(anchorTx: [UInt8], input: UInt) -> Result_SignatureNoneZ {

			Bindings.print(
				"Error: EcdsaChannelSigner::signHolderAnchorInput MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Signs a channel announcement message with our funding key proving it comes from one of the
		/// channel participants.
		///
		/// Channel announcements also require a signature from each node's network key. Our node
		/// signature is computed through [`NodeSigner::sign_gossip_message`].
		///
		/// Note that if this fails or is rejected, the channel will not be publicly announced and
		/// our counterparty may (though likely will not) close the channel on us for violating the
		/// protocol.
		open func signChannelAnnouncementWithFundingKey(msg: UnsignedChannelAnnouncement) -> Result_SignatureNoneZ {

			Bindings.print(
				"Error: EcdsaChannelSigner::signChannelAnnouncementWithFundingKey MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Frees any resources associated with this object given its this_arg pointer.
		/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
		internal func free() {

			// TODO: figure out something smarter
			return  // the semicolon is necessary because Swift is whitespace-agnostic

			Bindings.print(
				"Error: EcdsaChannelSigner::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}


		/// Implementation of ChannelSigner for this object.
		public func getChannelSigner() -> ChannelSigner {
			// return value (do some wrapping)
			let returnValue = NativelyImplementedChannelSigner(
				cType: self.cType!.ChannelSigner,
				instantiationContext: "EcdsaChannelSigner.swift::\(#function):\(#line)", anchor: self)

			return returnValue
		}


		internal func dangle(_ shouldDangle: Bool = true) -> EcdsaChannelSigner {
			self.dangling = shouldDangle
			return self
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print(
						"Freeing EcdsaChannelSigner \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}
				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing EcdsaChannelSigner \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}
	}

	internal class NativelyImplementedEcdsaChannelSigner: EcdsaChannelSigner {

		/// Create a signature for a counterparty's commitment transaction and associated HTLC transactions.
		///
		/// Note that if signing fails or is rejected, the channel will be force-closed.
		///
		/// Policy checks should be implemented in this function, including checking the amount
		/// sent to us and checking the HTLCs.
		///
		/// The preimages of outgoing HTLCs that were fulfilled since the last commitment are provided.
		/// A validating signer should ensure that an HTLC output is removed only when the matching
		/// preimage is provided, or when the value to holder is restored.
		///
		/// Note that all the relevant preimages will be provided, but there may also be additional
		/// irrelevant or duplicate preimages.
		public override func signCounterpartyCommitment(commitmentTx: CommitmentTransaction, preimages: [[UInt8]])
			-> Result_C2Tuple_SignatureCVec_SignatureZZNoneZ
		{
			// native call variable prep

			let preimagesVector = Vec_PaymentPreimageZ(
				array: preimages, instantiationContext: "EcdsaChannelSigner.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: commitmentTx.cType!) {
					(commitmentTxPointer: UnsafePointer<LDKCommitmentTransaction>) in
					self.cType!
						.sign_counterparty_commitment(self.cType!.this_arg, commitmentTxPointer, preimagesVector.cType!)
				}


			// cleanup

			// preimagesVector.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_C2Tuple_SignatureCVec_SignatureZZNoneZ(
				cType: nativeCallResult, instantiationContext: "EcdsaChannelSigner.swift::\(#function):\(#line)")

			return returnValue
		}

		/// Validate the counterparty's revocation.
		///
		/// This is required in order for the signer to make sure that the state has moved
		/// forward and it is safe to sign the next counterparty commitment.
		public override func validateCounterpartyRevocation(idx: UInt64, secret: [UInt8]?) -> Result_NoneNoneZ {
			// native call variable prep

			var tupledSecretPointer: UnsafeMutablePointer<UInt8Tuple32>? = nil
			if let secret = secret {

				let tupledSecret = Bindings.arrayToUInt8Tuple32(array: secret)

				tupledSecretPointer = UnsafeMutablePointer<UInt8Tuple32>.allocate(capacity: 1)
				tupledSecretPointer!.initialize(to: tupledSecret)
			}


			// native method call
			let nativeCallResult = self.cType!
				.validate_counterparty_revocation(self.cType!.this_arg, idx, tupledSecretPointer)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_NoneNoneZ(
				cType: nativeCallResult, instantiationContext: "EcdsaChannelSigner.swift::\(#function):\(#line)")

			return returnValue
		}

		/// Creates a signature for a holder's commitment transaction and its claiming HTLC transactions.
		///
		/// This will be called
		/// - with a non-revoked `commitment_tx`.
		/// - with the latest `commitment_tx` when we initiate a force-close.
		/// - with the previous `commitment_tx`, just to get claiming HTLC
		/// signatures, if we are reacting to a [`ChannelMonitor`]
		/// [replica](https://github.com/lightningdevkit/rust-lightning/blob/main/GLOSSARY.md#monitor-replicas)
		/// that decided to broadcast before it had been updated to the latest `commitment_tx`.
		///
		/// This may be called multiple times for the same transaction.
		///
		/// An external signer implementation should check that the commitment has not been revoked.
		///
		/// [`ChannelMonitor`]: crate::chain::channelmonitor::ChannelMonitor
		public override func signHolderCommitmentAndHtlcs(commitmentTx: HolderCommitmentTransaction)
			-> Result_C2Tuple_SignatureCVec_SignatureZZNoneZ
		{
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: commitmentTx.cType!) {
					(commitmentTxPointer: UnsafePointer<LDKHolderCommitmentTransaction>) in
					self.cType!.sign_holder_commitment_and_htlcs(self.cType!.this_arg, commitmentTxPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_C2Tuple_SignatureCVec_SignatureZZNoneZ(
				cType: nativeCallResult, instantiationContext: "EcdsaChannelSigner.swift::\(#function):\(#line)")

			return returnValue
		}

		/// Create a signature for the given input in a transaction spending an HTLC transaction output
		/// or a commitment transaction `to_local` output when our counterparty broadcasts an old state.
		///
		/// A justice transaction may claim multiple outputs at the same time if timelocks are
		/// similar, but only a signature for the input at index `input` should be signed for here.
		/// It may be called multiple times for same output(s) if a fee-bump is needed with regards
		/// to an upcoming timelock expiration.
		///
		/// Amount is value of the output spent by this input, committed to in the BIP 143 signature.
		///
		/// `per_commitment_key` is revocation secret which was provided by our counterparty when they
		/// revoked the state which they eventually broadcast. It's not a _holder_ secret key and does
		/// not allow the spending of any funds by itself (you need our holder `revocation_secret` to do
		/// so).
		public override func signJusticeRevokedOutput(
			justiceTx: [UInt8], input: UInt, amount: UInt64, perCommitmentKey: [UInt8]?
		) -> Result_SignatureNoneZ {
			// native call variable prep

			let justiceTxPrimitiveWrapper = Transaction(
				value: justiceTx, instantiationContext: "EcdsaChannelSigner.swift::\(#function):\(#line)"
			)
			.dangle()

			var tupledPerCommitmentKeyPointer: UnsafeMutablePointer<UInt8Tuple32>? = nil
			if let perCommitmentKey = perCommitmentKey {

				let tupledPerCommitmentKey = Bindings.arrayToUInt8Tuple32(array: perCommitmentKey)

				tupledPerCommitmentKeyPointer = UnsafeMutablePointer<UInt8Tuple32>.allocate(capacity: 1)
				tupledPerCommitmentKeyPointer!.initialize(to: tupledPerCommitmentKey)
			}


			// native method call
			let nativeCallResult = self.cType!
				.sign_justice_revoked_output(
					self.cType!.this_arg, justiceTxPrimitiveWrapper.cType!, input, amount, tupledPerCommitmentKeyPointer
				)

			// cleanup

			// for elided types, we need this
			justiceTxPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_SignatureNoneZ(
				cType: nativeCallResult, instantiationContext: "EcdsaChannelSigner.swift::\(#function):\(#line)")

			return returnValue
		}

		/// Create a signature for the given input in a transaction spending a commitment transaction
		/// HTLC output when our counterparty broadcasts an old state.
		///
		/// A justice transaction may claim multiple outputs at the same time if timelocks are
		/// similar, but only a signature for the input at index `input` should be signed for here.
		/// It may be called multiple times for same output(s) if a fee-bump is needed with regards
		/// to an upcoming timelock expiration.
		///
		/// `amount` is the value of the output spent by this input, committed to in the BIP 143
		/// signature.
		///
		/// `per_commitment_key` is revocation secret which was provided by our counterparty when they
		/// revoked the state which they eventually broadcast. It's not a _holder_ secret key and does
		/// not allow the spending of any funds by itself (you need our holder revocation_secret to do
		/// so).
		///
		/// `htlc` holds HTLC elements (hash, timelock), thus changing the format of the witness script
		/// (which is committed to in the BIP 143 signatures).
		public override func signJusticeRevokedHtlc(
			justiceTx: [UInt8], input: UInt, amount: UInt64, perCommitmentKey: [UInt8]?, htlc: HTLCOutputInCommitment
		) -> Result_SignatureNoneZ {
			// native call variable prep

			let justiceTxPrimitiveWrapper = Transaction(
				value: justiceTx, instantiationContext: "EcdsaChannelSigner.swift::\(#function):\(#line)"
			)
			.dangle()

			var tupledPerCommitmentKeyPointer: UnsafeMutablePointer<UInt8Tuple32>? = nil
			if let perCommitmentKey = perCommitmentKey {

				let tupledPerCommitmentKey = Bindings.arrayToUInt8Tuple32(array: perCommitmentKey)

				tupledPerCommitmentKeyPointer = UnsafeMutablePointer<UInt8Tuple32>.allocate(capacity: 1)
				tupledPerCommitmentKeyPointer!.initialize(to: tupledPerCommitmentKey)
			}


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: htlc.cType!) { (htlcPointer: UnsafePointer<LDKHTLCOutputInCommitment>) in
					self.cType!
						.sign_justice_revoked_htlc(
							self.cType!.this_arg, justiceTxPrimitiveWrapper.cType!, input, amount,
							tupledPerCommitmentKeyPointer, htlcPointer)
				}


			// cleanup

			// for elided types, we need this
			justiceTxPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_SignatureNoneZ(
				cType: nativeCallResult, instantiationContext: "EcdsaChannelSigner.swift::\(#function):\(#line)")

			return returnValue
		}

		/// Create a signature for a claiming transaction for a HTLC output on a counterparty's commitment
		/// transaction, either offered or received.
		///
		/// Such a transaction may claim multiples offered outputs at same time if we know the
		/// preimage for each when we create it, but only the input at index `input` should be
		/// signed for here. It may be called multiple times for same output(s) if a fee-bump is
		/// needed with regards to an upcoming timelock expiration.
		///
		/// `witness_script` is either an offered or received script as defined in BOLT3 for HTLC
		/// outputs.
		///
		/// `amount` is value of the output spent by this input, committed to in the BIP 143 signature.
		///
		/// `per_commitment_point` is the dynamic point corresponding to the channel state
		/// detected onchain. It has been generated by our counterparty and is used to derive
		/// channel state keys, which are then included in the witness script and committed to in the
		/// BIP 143 signature.
		public override func signCounterpartyHtlcTransaction(
			htlcTx: [UInt8], input: UInt, amount: UInt64, perCommitmentPoint: [UInt8], htlc: HTLCOutputInCommitment
		) -> Result_SignatureNoneZ {
			// native call variable prep

			let htlcTxPrimitiveWrapper = Transaction(
				value: htlcTx, instantiationContext: "EcdsaChannelSigner.swift::\(#function):\(#line)"
			)
			.dangle()

			let perCommitmentPointPrimitiveWrapper = PublicKey(
				value: perCommitmentPoint, instantiationContext: "EcdsaChannelSigner.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: htlc.cType!) { (htlcPointer: UnsafePointer<LDKHTLCOutputInCommitment>) in
					self.cType!
						.sign_counterparty_htlc_transaction(
							self.cType!.this_arg, htlcTxPrimitiveWrapper.cType!, input, amount,
							perCommitmentPointPrimitiveWrapper.cType!, htlcPointer)
				}


			// cleanup

			// for elided types, we need this
			htlcTxPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			perCommitmentPointPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_SignatureNoneZ(
				cType: nativeCallResult, instantiationContext: "EcdsaChannelSigner.swift::\(#function):\(#line)")

			return returnValue
		}

		/// Create a signature for a (proposed) closing transaction.
		///
		/// Note that, due to rounding, there may be one \"missing\" satoshi, and either party may have
		/// chosen to forgo their output as dust.
		public override func signClosingTransaction(closingTx: ClosingTransaction) -> Result_SignatureNoneZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: closingTx.cType!) { (closingTxPointer: UnsafePointer<LDKClosingTransaction>) in
					self.cType!.sign_closing_transaction(self.cType!.this_arg, closingTxPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_SignatureNoneZ(
				cType: nativeCallResult, instantiationContext: "EcdsaChannelSigner.swift::\(#function):\(#line)")

			return returnValue
		}

		/// Computes the signature for a commitment transaction's anchor output used as an
		/// input within `anchor_tx`, which spends the commitment transaction, at index `input`.
		public override func signHolderAnchorInput(anchorTx: [UInt8], input: UInt) -> Result_SignatureNoneZ {
			// native call variable prep

			let anchorTxPrimitiveWrapper = Transaction(
				value: anchorTx, instantiationContext: "EcdsaChannelSigner.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = self.cType!
				.sign_holder_anchor_input(self.cType!.this_arg, anchorTxPrimitiveWrapper.cType!, input)

			// cleanup

			// for elided types, we need this
			anchorTxPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_SignatureNoneZ(
				cType: nativeCallResult, instantiationContext: "EcdsaChannelSigner.swift::\(#function):\(#line)")

			return returnValue
		}

		/// Signs a channel announcement message with our funding key proving it comes from one of the
		/// channel participants.
		///
		/// Channel announcements also require a signature from each node's network key. Our node
		/// signature is computed through [`NodeSigner::sign_gossip_message`].
		///
		/// Note that if this fails or is rejected, the channel will not be publicly announced and
		/// our counterparty may (though likely will not) close the channel on us for violating the
		/// protocol.
		public override func signChannelAnnouncementWithFundingKey(msg: UnsignedChannelAnnouncement)
			-> Result_SignatureNoneZ
		{
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: msg.cType!) { (msgPointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
					self.cType!.sign_channel_announcement_with_funding_key(self.cType!.this_arg, msgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_SignatureNoneZ(
				cType: nativeCallResult, instantiationContext: "EcdsaChannelSigner.swift::\(#function):\(#line)")

			return returnValue
		}

		/// Frees any resources associated with this object given its this_arg pointer.
		/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
		public override func free() {
			// native call variable prep


			// natively wrapped traits may not necessarily be properly initialized
			// for now just don't free these things
			// self.cType?.free(self.cType?.this_arg)
			return


			// native method call
			let nativeCallResult = self.cType!.free(self.cType!.this_arg)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult

			return returnValue
		}

	}

}
