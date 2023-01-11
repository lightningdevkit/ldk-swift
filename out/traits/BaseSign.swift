
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			// necessary for abort() calls
			import Foundation

			/// A trait to sign Lightning channel transactions as described in
			/// [BOLT 3](https://github.com/lightning/bolts/blob/master/03-transactions.md).
			/// 
			/// Signing services could be implemented on a hardware wallet and should implement signing
			/// policies in order to be secure. Please refer to the [VLS Policy
			/// Controls](https://gitlab.com/lightning-signer/validating-lightning-signer/-/blob/main/docs/policy-controls.md)
			/// for an example of such policies.
			public typealias BaseSign = Bindings.BaseSign

			extension Bindings {

				/// A trait to sign Lightning channel transactions as described in
				/// [BOLT 3](https://github.com/lightning/bolts/blob/master/03-transactions.md).
				/// 
				/// Signing services could be implemented on a hardware wallet and should implement signing
				/// policies in order to be secure. Please refer to the [VLS Policy
				/// Controls](https://gitlab.com/lightning-signer/validating-lightning-signer/-/blob/main/docs/policy-controls.md)
				/// for an example of such policies.
				open class BaseSign: NativeTraitWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKBaseSign?

					internal init(cType: LDKBaseSign) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKBaseSign, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init(pubkeys: ChannelPublicKeys) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						super.init(conflictAvoidingVariableName: 0)

						let thisArg = Bindings.instanceToPointer(instance: self)

						

						
						func getPerCommitmentPointLambda(this_arg: UnsafeRawPointer?, idx: UInt64) -> LDKPublicKey {
							let instance: BaseSign = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "BaseSign::getPerCommitmentPointLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.getPerCommitmentPoint(idx: idx)

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = PublicKey(value: swiftCallbackResult).dangle().cType!

							return returnValue
						}
		
						func releaseCommitmentSecretLambda(this_arg: UnsafeRawPointer?, idx: UInt64) -> LDKThirtyTwoBytes {
							let instance: BaseSign = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "BaseSign::releaseCommitmentSecretLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.releaseCommitmentSecret(idx: idx)

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = ThirtyTwoBytes(value: swiftCallbackResult).dangle().cType!

							return returnValue
						}
		
						func validateHolderCommitmentLambda(this_arg: UnsafeRawPointer?, holder_tx: UnsafePointer<LDKHolderCommitmentTransaction>, preimages: LDKCVec_PaymentPreimageZ) -> LDKCResult_NoneNoneZ {
							let instance: BaseSign = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "BaseSign::validateHolderCommitmentLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.validateHolderCommitment(holderTx: HolderCommitmentTransaction(cType: holder_tx.pointee).dangle().clone(), preimages: Vec_PaymentPreimageZ(cType: preimages).getValue())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func channelKeysIdLambda(this_arg: UnsafeRawPointer?) -> LDKThirtyTwoBytes {
							let instance: BaseSign = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "BaseSign::channelKeysIdLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.channelKeysId()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = ThirtyTwoBytes(value: swiftCallbackResult).dangle().cType!

							return returnValue
						}
		
						func signCounterpartyCommitmentLambda(this_arg: UnsafeRawPointer?, commitment_tx: UnsafePointer<LDKCommitmentTransaction>, preimages: LDKCVec_PaymentPreimageZ) -> LDKCResult_C2Tuple_SignatureCVec_SignatureZZNoneZ {
							let instance: BaseSign = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "BaseSign::signCounterpartyCommitmentLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.signCounterpartyCommitment(commitmentTx: CommitmentTransaction(cType: commitment_tx.pointee).dangle().clone(), preimages: Vec_PaymentPreimageZ(cType: preimages).getValue())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func validateCounterpartyRevocationLambda(this_arg: UnsafeRawPointer?, idx: UInt64, secret: UnsafePointer<UInt8Tuple32>?) -> LDKCResult_NoneNoneZ {
							let instance: BaseSign = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "BaseSign::validateCounterpartyRevocationLambda")

							// Swift callback variable prep
							
							var secretPointee: [UInt8]? = nil
							if let secretUnwrapped = secret {
								secretPointee = Bindings.UInt8Tuple32ToArray(tuple: secretUnwrapped.pointee)
							}
						

							// Swift callback call
							let swiftCallbackResult = instance.validateCounterpartyRevocation(idx: idx, secret: secretPointee)

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func signHolderCommitmentAndHtlcsLambda(this_arg: UnsafeRawPointer?, commitment_tx: UnsafePointer<LDKHolderCommitmentTransaction>) -> LDKCResult_C2Tuple_SignatureCVec_SignatureZZNoneZ {
							let instance: BaseSign = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "BaseSign::signHolderCommitmentAndHtlcsLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.signHolderCommitmentAndHtlcs(commitmentTx: HolderCommitmentTransaction(cType: commitment_tx.pointee).dangle().clone())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func signJusticeRevokedOutputLambda(this_arg: UnsafeRawPointer?, justice_tx: LDKTransaction, input: UInt, amount: UInt64, per_commitment_key: UnsafePointer<UInt8Tuple32>?) -> LDKCResult_SignatureNoneZ {
							let instance: BaseSign = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "BaseSign::signJusticeRevokedOutputLambda")

							// Swift callback variable prep
							
							var per_commitment_keyPointee: [UInt8]? = nil
							if let per_commitment_keyUnwrapped = per_commitment_key {
								per_commitment_keyPointee = Bindings.UInt8Tuple32ToArray(tuple: per_commitment_keyUnwrapped.pointee)
							}
						

							// Swift callback call
							let swiftCallbackResult = instance.signJusticeRevokedOutput(justiceTx: Transaction(cType: justice_tx).getValue(), input: input, amount: amount, perCommitmentKey: per_commitment_keyPointee)

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func signJusticeRevokedHtlcLambda(this_arg: UnsafeRawPointer?, justice_tx: LDKTransaction, input: UInt, amount: UInt64, per_commitment_key: UnsafePointer<UInt8Tuple32>?, htlc: UnsafePointer<LDKHTLCOutputInCommitment>) -> LDKCResult_SignatureNoneZ {
							let instance: BaseSign = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "BaseSign::signJusticeRevokedHtlcLambda")

							// Swift callback variable prep
							
							var per_commitment_keyPointee: [UInt8]? = nil
							if let per_commitment_keyUnwrapped = per_commitment_key {
								per_commitment_keyPointee = Bindings.UInt8Tuple32ToArray(tuple: per_commitment_keyUnwrapped.pointee)
							}
						

							// Swift callback call
							let swiftCallbackResult = instance.signJusticeRevokedHtlc(justiceTx: Transaction(cType: justice_tx).getValue(), input: input, amount: amount, perCommitmentKey: per_commitment_keyPointee, htlc: HTLCOutputInCommitment(cType: htlc.pointee).dangle().clone())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func signCounterpartyHtlcTransactionLambda(this_arg: UnsafeRawPointer?, htlc_tx: LDKTransaction, input: UInt, amount: UInt64, per_commitment_point: LDKPublicKey, htlc: UnsafePointer<LDKHTLCOutputInCommitment>) -> LDKCResult_SignatureNoneZ {
							let instance: BaseSign = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "BaseSign::signCounterpartyHtlcTransactionLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.signCounterpartyHtlcTransaction(htlcTx: Transaction(cType: htlc_tx).getValue(), input: input, amount: amount, perCommitmentPoint: PublicKey(cType: per_commitment_point).getValue(), htlc: HTLCOutputInCommitment(cType: htlc.pointee).dangle().clone())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func signClosingTransactionLambda(this_arg: UnsafeRawPointer?, closing_tx: UnsafePointer<LDKClosingTransaction>) -> LDKCResult_SignatureNoneZ {
							let instance: BaseSign = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "BaseSign::signClosingTransactionLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.signClosingTransaction(closingTx: ClosingTransaction(cType: closing_tx.pointee).dangle().clone())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func signHolderAnchorInputLambda(this_arg: UnsafeRawPointer?, anchor_tx: LDKTransaction, input: UInt) -> LDKCResult_SignatureNoneZ {
							let instance: BaseSign = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "BaseSign::signHolderAnchorInputLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.signHolderAnchorInput(anchorTx: Transaction(cType: anchor_tx).getValue(), input: input)

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func signChannelAnnouncementLambda(this_arg: UnsafeRawPointer?, msg: UnsafePointer<LDKUnsignedChannelAnnouncement>) -> LDKCResult_C2Tuple_SignatureSignatureZNoneZ {
							let instance: BaseSign = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "BaseSign::signChannelAnnouncementLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.signChannelAnnouncement(msg: UnsignedChannelAnnouncement(cType: msg.pointee).dangle().clone())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func provideChannelParametersLambda(this_arg: UnsafeMutableRawPointer?, channel_parameters: UnsafePointer<LDKChannelTransactionParameters>) -> Void {
							let instance: BaseSign = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "BaseSign::provideChannelParametersLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.provideChannelParameters(channelParameters: ChannelTransactionParameters(cType: channel_parameters.pointee).dangle().clone())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func freeLambda(this_arg: UnsafeMutableRawPointer?) -> Void {
							let instance: BaseSign = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "BaseSign::freeLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.free()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		

						self.cType = LDKBaseSign(							
							this_arg: thisArg,
							get_per_commitment_point: getPerCommitmentPointLambda,
							release_commitment_secret: releaseCommitmentSecretLambda,
							validate_holder_commitment: validateHolderCommitmentLambda,
							pubkeys: pubkeys.dynamicallyDangledClone().cType!,
							set_pubkeys: nil,
							channel_keys_id: channelKeysIdLambda,
							sign_counterparty_commitment: signCounterpartyCommitmentLambda,
							validate_counterparty_revocation: validateCounterpartyRevocationLambda,
							sign_holder_commitment_and_htlcs: signHolderCommitmentAndHtlcsLambda,
							sign_justice_revoked_output: signJusticeRevokedOutputLambda,
							sign_justice_revoked_htlc: signJusticeRevokedHtlcLambda,
							sign_counterparty_htlc_transaction: signCounterpartyHtlcTransactionLambda,
							sign_closing_transaction: signClosingTransactionLambda,
							sign_holder_anchor_input: signHolderAnchorInputLambda,
							sign_channel_announcement: signChannelAnnouncementLambda,
							provide_channel_parameters: provideChannelParametersLambda,
							free: freeLambda
						)
					}

					
					/// Gets the per-commitment point for a specific commitment number
					/// 
					/// Note that the commitment number starts at `(1 << 48) - 1` and counts backwards.
					open func getPerCommitmentPoint(idx: UInt64) -> [UInt8] {
						
						Bindings.print("Error: BaseSign::getPerCommitmentPoint MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Gets the commitment secret for a specific commitment number as part of the revocation process
					/// 
					/// An external signer implementation should error here if the commitment was already signed
					/// and should refuse to sign it in the future.
					/// 
					/// May be called more than once for the same index.
					/// 
					/// Note that the commitment number starts at `(1 << 48) - 1` and counts backwards.
					open func releaseCommitmentSecret(idx: UInt64) -> [UInt8] {
						
						Bindings.print("Error: BaseSign::releaseCommitmentSecret MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Validate the counterparty's signatures on the holder commitment transaction and HTLCs.
					/// 
					/// This is required in order for the signer to make sure that releasing a commitment
					/// secret won't leave us without a broadcastable holder transaction.
					/// Policy checks should be implemented in this function, including checking the amount
					/// sent to us and checking the HTLCs.
					/// 
					/// The preimages of outgoing HTLCs that were fulfilled since the last commitment are provided.
					/// A validating signer should ensure that an HTLC output is removed only when the matching
					/// preimage is provided, or when the value to holder is restored.
					/// 
					/// Note that all the relevant preimages will be provided, but there may also be additional
					/// irrelevant or duplicate preimages.
					open func validateHolderCommitment(holderTx: HolderCommitmentTransaction, preimages: [[UInt8]]) -> Result_NoneNoneZ {
						
						Bindings.print("Error: BaseSign::validateHolderCommitment MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Returns an arbitrary identifier describing the set of keys which are provided back to you in
					/// some [`SpendableOutputDescriptor`] types. This should be sufficient to identify this
					/// [`BaseSign`] object uniquely and lookup or re-derive its keys.
					open func channelKeysId() -> [UInt8] {
						
						Bindings.print("Error: BaseSign::channelKeysId MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
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
					open func signCounterpartyCommitment(commitmentTx: CommitmentTransaction, preimages: [[UInt8]]) -> Result_C2Tuple_SignatureCVec_SignatureZZNoneZ {
						
						Bindings.print("Error: BaseSign::signCounterpartyCommitment MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Validate the counterparty's revocation.
					/// 
					/// This is required in order for the signer to make sure that the state has moved
					/// forward and it is safe to sign the next counterparty commitment.
					open func validateCounterpartyRevocation(idx: UInt64, secret: [UInt8]?) -> Result_NoneNoneZ {
						
						Bindings.print("Error: BaseSign::validateCounterpartyRevocation MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
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
					open func signHolderCommitmentAndHtlcs(commitmentTx: HolderCommitmentTransaction) -> Result_C2Tuple_SignatureCVec_SignatureZZNoneZ {
						
						Bindings.print("Error: BaseSign::signHolderCommitmentAndHtlcs MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
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
					open func signJusticeRevokedOutput(justiceTx: [UInt8], input: UInt, amount: UInt64, perCommitmentKey: [UInt8]?) -> Result_SignatureNoneZ {
						
						Bindings.print("Error: BaseSign::signJusticeRevokedOutput MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
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
					open func signJusticeRevokedHtlc(justiceTx: [UInt8], input: UInt, amount: UInt64, perCommitmentKey: [UInt8]?, htlc: HTLCOutputInCommitment) -> Result_SignatureNoneZ {
						
						Bindings.print("Error: BaseSign::signJusticeRevokedHtlc MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
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
					open func signCounterpartyHtlcTransaction(htlcTx: [UInt8], input: UInt, amount: UInt64, perCommitmentPoint: [UInt8], htlc: HTLCOutputInCommitment) -> Result_SignatureNoneZ {
						
						Bindings.print("Error: BaseSign::signCounterpartyHtlcTransaction MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Create a signature for a (proposed) closing transaction.
					/// 
					/// Note that, due to rounding, there may be one \"missing\" satoshi, and either party may have
					/// chosen to forgo their output as dust.
					open func signClosingTransaction(closingTx: ClosingTransaction) -> Result_SignatureNoneZ {
						
						Bindings.print("Error: BaseSign::signClosingTransaction MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Computes the signature for a commitment transaction's anchor output used as an
					/// input within `anchor_tx`, which spends the commitment transaction, at index `input`.
					open func signHolderAnchorInput(anchorTx: [UInt8], input: UInt) -> Result_SignatureNoneZ {
						
						Bindings.print("Error: BaseSign::signHolderAnchorInput MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Signs a channel announcement message with our funding key and our node secret key (aka
					/// node_id or network_key), proving it comes from one of the channel participants.
					/// 
					/// The first returned signature should be from our node secret key, the second from our
					/// funding key.
					/// 
					/// Note that if this fails or is rejected, the channel will not be publicly announced and
					/// our counterparty may (though likely will not) close the channel on us for violating the
					/// protocol.
					open func signChannelAnnouncement(msg: UnsignedChannelAnnouncement) -> Result_C2Tuple_SignatureSignatureZNoneZ {
						
						Bindings.print("Error: BaseSign::signChannelAnnouncement MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Set the counterparty static channel data, including basepoints,
					/// `counterparty_selected`/`holder_selected_contest_delay` and funding outpoint. Since these
					/// are static channel data, they MUST NOT be allowed to change to different values once set,
					/// as LDK may call this method more than once.
					/// 
					/// channel_parameters.is_populated() MUST be true.
					open func provideChannelParameters(channelParameters: ChannelTransactionParameters) -> Void {
						
						Bindings.print("Error: BaseSign::provideChannelParameters MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
					internal func free() -> Void {
						
				// TODO: figure out something smarter
				return; // the semicolon is necessary because Swift is whitespace-agnostic
			
						Bindings.print("Error: BaseSign::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		

					

					
					/// Returns the holder's channel public keys and basepoints.
					public func getPubkeys() -> ChannelPublicKeys {
						// return value (do some wrapping)
						let returnValue = ChannelPublicKeys(cType: self.cType!.pubkeys, anchor: self)

						return returnValue;
					}
		

					internal func dangle(_ shouldDangle: Bool = true) -> BaseSign {
        				self.dangling = shouldDangle
						return self
					}

					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing BaseSign \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing BaseSign \(self.instanceNumber) due to dangle.")
						}
					}
				}

				internal class NativelyImplementedBaseSign: BaseSign {
					
					/// Gets the per-commitment point for a specific commitment number
					/// 
					/// Note that the commitment number starts at `(1 << 48) - 1` and counts backwards.
					public override func getPerCommitmentPoint(idx: UInt64) -> [UInt8] {
						// native call variable prep
						

						

						// native method call
						let nativeCallResult = self.cType!.get_per_commitment_point(self.cType!.this_arg, idx)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = PublicKey(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// Gets the commitment secret for a specific commitment number as part of the revocation process
					/// 
					/// An external signer implementation should error here if the commitment was already signed
					/// and should refuse to sign it in the future.
					/// 
					/// May be called more than once for the same index.
					/// 
					/// Note that the commitment number starts at `(1 << 48) - 1` and counts backwards.
					public override func releaseCommitmentSecret(idx: UInt64) -> [UInt8] {
						// native call variable prep
						

						

						// native method call
						let nativeCallResult = self.cType!.release_commitment_secret(self.cType!.this_arg, idx)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = ThirtyTwoBytes(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// Validate the counterparty's signatures on the holder commitment transaction and HTLCs.
					/// 
					/// This is required in order for the signer to make sure that releasing a commitment
					/// secret won't leave us without a broadcastable holder transaction.
					/// Policy checks should be implemented in this function, including checking the amount
					/// sent to us and checking the HTLCs.
					/// 
					/// The preimages of outgoing HTLCs that were fulfilled since the last commitment are provided.
					/// A validating signer should ensure that an HTLC output is removed only when the matching
					/// preimage is provided, or when the value to holder is restored.
					/// 
					/// Note that all the relevant preimages will be provided, but there may also be additional
					/// irrelevant or duplicate preimages.
					public override func validateHolderCommitment(holderTx: HolderCommitmentTransaction, preimages: [[UInt8]]) -> Result_NoneNoneZ {
						// native call variable prep
						
						let preimagesVector = Vec_PaymentPreimageZ(array: preimages).dangle()
				

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: holderTx.cType!) { (holderTxPointer: UnsafePointer<LDKHolderCommitmentTransaction>) in
				self.cType!.validate_holder_commitment(self.cType!.this_arg, holderTxPointer, preimagesVector.cType!)
						}
				

						// cleanup
						
						// preimagesVector.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = Result_NoneNoneZ(cType: nativeCallResult)

						return returnValue
					}
		
					/// Returns an arbitrary identifier describing the set of keys which are provided back to you in
					/// some [`SpendableOutputDescriptor`] types. This should be sufficient to identify this
					/// [`BaseSign`] object uniquely and lookup or re-derive its keys.
					public override func channelKeysId() -> [UInt8] {
						// native call variable prep
						

						

						// native method call
						let nativeCallResult = self.cType!.channel_keys_id(self.cType!.this_arg)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = ThirtyTwoBytes(cType: nativeCallResult).getValue()

						return returnValue
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
					public override func signCounterpartyCommitment(commitmentTx: CommitmentTransaction, preimages: [[UInt8]]) -> Result_C2Tuple_SignatureCVec_SignatureZZNoneZ {
						// native call variable prep
						
						let preimagesVector = Vec_PaymentPreimageZ(array: preimages).dangle()
				

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: commitmentTx.cType!) { (commitmentTxPointer: UnsafePointer<LDKCommitmentTransaction>) in
				self.cType!.sign_counterparty_commitment(self.cType!.this_arg, commitmentTxPointer, preimagesVector.cType!)
						}
				

						// cleanup
						
						// preimagesVector.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = Result_C2Tuple_SignatureCVec_SignatureZZNoneZ(cType: nativeCallResult)

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
						let nativeCallResult = self.cType!.validate_counterparty_revocation(self.cType!.this_arg, idx, tupledSecretPointer)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_NoneNoneZ(cType: nativeCallResult)

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
					public override func signHolderCommitmentAndHtlcs(commitmentTx: HolderCommitmentTransaction) -> Result_C2Tuple_SignatureCVec_SignatureZZNoneZ {
						// native call variable prep
						

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: commitmentTx.cType!) { (commitmentTxPointer: UnsafePointer<LDKHolderCommitmentTransaction>) in
				self.cType!.sign_holder_commitment_and_htlcs(self.cType!.this_arg, commitmentTxPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_C2Tuple_SignatureCVec_SignatureZZNoneZ(cType: nativeCallResult)

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
					public override func signJusticeRevokedOutput(justiceTx: [UInt8], input: UInt, amount: UInt64, perCommitmentKey: [UInt8]?) -> Result_SignatureNoneZ {
						// native call variable prep
						
						let justiceTxPrimitiveWrapper = Transaction(value: justiceTx).dangle()
				
					var tupledPerCommitmentKeyPointer: UnsafeMutablePointer<UInt8Tuple32>? = nil
					if let perCommitmentKey = perCommitmentKey {
						
						let tupledPerCommitmentKey = Bindings.arrayToUInt8Tuple32(array: perCommitmentKey)
					
						tupledPerCommitmentKeyPointer = UnsafeMutablePointer<UInt8Tuple32>.allocate(capacity: 1)
						tupledPerCommitmentKeyPointer!.initialize(to: tupledPerCommitmentKey)
					}
				

						

						// native method call
						let nativeCallResult = self.cType!.sign_justice_revoked_output(self.cType!.this_arg, justiceTxPrimitiveWrapper.cType!, input, amount, tupledPerCommitmentKeyPointer)

						// cleanup
						
						// for elided types, we need this
						justiceTxPrimitiveWrapper.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = Result_SignatureNoneZ(cType: nativeCallResult)

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
					public override func signJusticeRevokedHtlc(justiceTx: [UInt8], input: UInt, amount: UInt64, perCommitmentKey: [UInt8]?, htlc: HTLCOutputInCommitment) -> Result_SignatureNoneZ {
						// native call variable prep
						
						let justiceTxPrimitiveWrapper = Transaction(value: justiceTx).dangle()
				
					var tupledPerCommitmentKeyPointer: UnsafeMutablePointer<UInt8Tuple32>? = nil
					if let perCommitmentKey = perCommitmentKey {
						
						let tupledPerCommitmentKey = Bindings.arrayToUInt8Tuple32(array: perCommitmentKey)
					
						tupledPerCommitmentKeyPointer = UnsafeMutablePointer<UInt8Tuple32>.allocate(capacity: 1)
						tupledPerCommitmentKeyPointer!.initialize(to: tupledPerCommitmentKey)
					}
				

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: htlc.cType!) { (htlcPointer: UnsafePointer<LDKHTLCOutputInCommitment>) in
				self.cType!.sign_justice_revoked_htlc(self.cType!.this_arg, justiceTxPrimitiveWrapper.cType!, input, amount, tupledPerCommitmentKeyPointer, htlcPointer)
						}
				

						// cleanup
						
						// for elided types, we need this
						justiceTxPrimitiveWrapper.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = Result_SignatureNoneZ(cType: nativeCallResult)

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
					public override func signCounterpartyHtlcTransaction(htlcTx: [UInt8], input: UInt, amount: UInt64, perCommitmentPoint: [UInt8], htlc: HTLCOutputInCommitment) -> Result_SignatureNoneZ {
						// native call variable prep
						
						let htlcTxPrimitiveWrapper = Transaction(value: htlcTx).dangle()
				
						let perCommitmentPointPrimitiveWrapper = PublicKey(value: perCommitmentPoint)
				

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: htlc.cType!) { (htlcPointer: UnsafePointer<LDKHTLCOutputInCommitment>) in
				self.cType!.sign_counterparty_htlc_transaction(self.cType!.this_arg, htlcTxPrimitiveWrapper.cType!, input, amount, perCommitmentPointPrimitiveWrapper.cType!, htlcPointer)
						}
				

						// cleanup
						
						// for elided types, we need this
						htlcTxPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						perCommitmentPointPrimitiveWrapper.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = Result_SignatureNoneZ(cType: nativeCallResult)

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
						let returnValue = Result_SignatureNoneZ(cType: nativeCallResult)

						return returnValue
					}
		
					/// Computes the signature for a commitment transaction's anchor output used as an
					/// input within `anchor_tx`, which spends the commitment transaction, at index `input`.
					public override func signHolderAnchorInput(anchorTx: [UInt8], input: UInt) -> Result_SignatureNoneZ {
						// native call variable prep
						
						let anchorTxPrimitiveWrapper = Transaction(value: anchorTx).dangle()
				

						

						// native method call
						let nativeCallResult = self.cType!.sign_holder_anchor_input(self.cType!.this_arg, anchorTxPrimitiveWrapper.cType!, input)

						// cleanup
						
						// for elided types, we need this
						anchorTxPrimitiveWrapper.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = Result_SignatureNoneZ(cType: nativeCallResult)

						return returnValue
					}
		
					/// Signs a channel announcement message with our funding key and our node secret key (aka
					/// node_id or network_key), proving it comes from one of the channel participants.
					/// 
					/// The first returned signature should be from our node secret key, the second from our
					/// funding key.
					/// 
					/// Note that if this fails or is rejected, the channel will not be publicly announced and
					/// our counterparty may (though likely will not) close the channel on us for violating the
					/// protocol.
					public override func signChannelAnnouncement(msg: UnsignedChannelAnnouncement) -> Result_C2Tuple_SignatureSignatureZNoneZ {
						// native call variable prep
						

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: msg.cType!) { (msgPointer: UnsafePointer<LDKUnsignedChannelAnnouncement>) in
				self.cType!.sign_channel_announcement(self.cType!.this_arg, msgPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_C2Tuple_SignatureSignatureZNoneZ(cType: nativeCallResult)

						return returnValue
					}
		
					/// Set the counterparty static channel data, including basepoints,
					/// `counterparty_selected`/`holder_selected_contest_delay` and funding outpoint. Since these
					/// are static channel data, they MUST NOT be allowed to change to different values once set,
					/// as LDK may call this method more than once.
					/// 
					/// channel_parameters.is_populated() MUST be true.
					public override func provideChannelParameters(channelParameters: ChannelTransactionParameters) {
						// native call variable prep
						

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: channelParameters.cType!) { (channelParametersPointer: UnsafePointer<LDKChannelTransactionParameters>) in
				self.cType!.provide_channel_parameters(self.cType!.this_arg, channelParametersPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
					public override func free() {
						// native call variable prep
						

						
				// natively wrapped traits may not necessarily be properly initialized
				// for now just don't free these things
				// self.cType?.free(self.cType?.this_arg)
				return;
			

						// native method call
						let nativeCallResult = self.cType!.free(self.cType!.this_arg)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
				}

			}
		