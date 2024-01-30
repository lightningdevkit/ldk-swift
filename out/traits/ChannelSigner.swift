// necessary for abort() calls
import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


/// A trait to handle Lightning channel key material without concretizing the channel type or
/// the signature mechanism.
public typealias ChannelSigner = Bindings.ChannelSigner

extension Bindings {

	/// A trait to handle Lightning channel key material without concretizing the channel type or
	/// the signature mechanism.
	open class ChannelSigner: NativeTraitWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKChannelSigner?

		internal init(cType: LDKChannelSigner, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKChannelSigner, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKChannelSigner, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		public init(pubkeys: ChannelPublicKeys) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0, instantiationContext: "ChannelSigner.swift::\(#function):\(#line)")

			let thisArg = Bindings.instanceToPointer(instance: self)


			func getPerCommitmentPointLambda(this_arg: UnsafeRawPointer?, idx: UInt64) -> LDKPublicKey {
				let instance: ChannelSigner = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "ChannelSigner::getPerCommitmentPointLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.getPerCommitmentPoint(idx: idx)

				// cleanup


				// return value (do some wrapping)
				let returnValue = PublicKey(
					value: swiftCallbackResult,
					instantiationContext: "ChannelSigner.swift::init()::\(#function):\(#line)"
				)
				.dangleRecursively().cType!

				return returnValue
			}

			func releaseCommitmentSecretLambda(this_arg: UnsafeRawPointer?, idx: UInt64) -> LDKThirtyTwoBytes {
				let instance: ChannelSigner = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "ChannelSigner::releaseCommitmentSecretLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.releaseCommitmentSecret(idx: idx)

				// cleanup


				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					value: swiftCallbackResult,
					instantiationContext: "ChannelSigner.swift::init()::\(#function):\(#line)"
				)
				.dangleRecursively().cType!

				return returnValue
			}

			func validateHolderCommitmentLambda(
				this_arg: UnsafeRawPointer?, holder_tx: UnsafePointer<LDKHolderCommitmentTransaction>,
				outbound_htlc_preimages: LDKCVec_ThirtyTwoBytesZ
			) -> LDKCResult_NoneNoneZ {
				let instance: ChannelSigner = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "ChannelSigner::validateHolderCommitmentLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.validateHolderCommitment(
					holderTx: HolderCommitmentTransaction(
						cType: holder_tx.pointee,
						instantiationContext: "ChannelSigner.swift::init()::\(#function):\(#line)"
					)
					.dangle().clone(),
					outboundHtlcPreimages: Vec_ThirtyTwoBytesZ(
						cType: outbound_htlc_preimages,
						instantiationContext: "ChannelSigner.swift::init()::\(#function):\(#line)"
					)
					.getValue())

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult.danglingClone().cType!

				return returnValue
			}

			func validateCounterpartyRevocationLambda(
				this_arg: UnsafeRawPointer?, idx: UInt64, secret: UnsafePointer<UInt8Tuple32>?
			) -> LDKCResult_NoneNoneZ {
				let instance: ChannelSigner = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "ChannelSigner::validateCounterpartyRevocationLambda")

				// Swift callback variable prep

				var secretPointee: [UInt8]? = nil
				if let secretUnwrapped = secret {
					secretPointee = Bindings.UInt8Tuple32ToArray(tuple: secretUnwrapped.pointee)
				}


				// Swift callback call
				let swiftCallbackResult = instance.validateCounterpartyRevocation(idx: idx, secret: secretPointee)

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult.danglingClone().cType!

				return returnValue
			}

			func channelKeysIdLambda(this_arg: UnsafeRawPointer?) -> LDKThirtyTwoBytes {
				let instance: ChannelSigner = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "ChannelSigner::channelKeysIdLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.channelKeysId()

				// cleanup


				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					value: swiftCallbackResult,
					instantiationContext: "ChannelSigner.swift::init()::\(#function):\(#line)"
				)
				.dangleRecursively().cType!

				return returnValue
			}

			func provideChannelParametersLambda(
				this_arg: UnsafeMutableRawPointer?, channel_parameters: UnsafePointer<LDKChannelTransactionParameters>
			) {
				let instance: ChannelSigner = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "ChannelSigner::provideChannelParametersLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.provideChannelParameters(
					channelParameters: ChannelTransactionParameters(
						cType: channel_parameters.pointee,
						instantiationContext: "ChannelSigner.swift::init()::\(#function):\(#line)"
					)
					.dangle().clone())

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult

				return returnValue
			}

			func freeLambda(this_arg: UnsafeMutableRawPointer?) {
				let instance: ChannelSigner = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "ChannelSigner::freeLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.free()

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult

				return returnValue
			}


			self.cType = LDKChannelSigner(
				this_arg: thisArg,
				get_per_commitment_point: getPerCommitmentPointLambda,
				release_commitment_secret: releaseCommitmentSecretLambda,
				validate_holder_commitment: validateHolderCommitmentLambda,
				validate_counterparty_revocation: validateCounterpartyRevocationLambda,
				pubkeys: pubkeys.dynamicallyDangledClone().cType!,
				set_pubkeys: nil,
				channel_keys_id: channelKeysIdLambda,
				provide_channel_parameters: provideChannelParametersLambda,
				free: freeLambda
			)
		}


		/// Gets the per-commitment point for a specific commitment number
		///
		/// Note that the commitment number starts at `(1 << 48) - 1` and counts backwards.
		open func getPerCommitmentPoint(idx: UInt64) -> [UInt8] {

			Bindings.print(
				"Error: ChannelSigner::getPerCommitmentPoint MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
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

			Bindings.print(
				"Error: ChannelSigner::releaseCommitmentSecret MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Validate the counterparty's signatures on the holder commitment transaction and HTLCs.
		///
		/// This is required in order for the signer to make sure that releasing a commitment
		/// secret won't leave us without a broadcastable holder transaction.
		/// Policy checks should be implemented in this function, including checking the amount
		/// sent to us and checking the HTLCs.
		///
		/// The preimages of outbound HTLCs that were fulfilled since the last commitment are provided.
		/// A validating signer should ensure that an HTLC output is removed only when the matching
		/// preimage is provided, or when the value to holder is restored.
		///
		/// Note that all the relevant preimages will be provided, but there may also be additional
		/// irrelevant or duplicate preimages.
		open func validateHolderCommitment(holderTx: HolderCommitmentTransaction, outboundHtlcPreimages: [[UInt8]])
			-> Result_NoneNoneZ
		{

			Bindings.print(
				"Error: ChannelSigner::validateHolderCommitment MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Validate the counterparty's revocation.
		///
		/// This is required in order for the signer to make sure that the state has moved
		/// forward and it is safe to sign the next counterparty commitment.
		open func validateCounterpartyRevocation(idx: UInt64, secret: [UInt8]?) -> Result_NoneNoneZ {

			Bindings.print(
				"Error: ChannelSigner::validateCounterpartyRevocation MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Returns an arbitrary identifier describing the set of keys which are provided back to you in
		/// some [`SpendableOutputDescriptor`] types. This should be sufficient to identify this
		/// [`EcdsaChannelSigner`] object uniquely and lookup or re-derive its keys.
		open func channelKeysId() -> [UInt8] {

			Bindings.print(
				"Error: ChannelSigner::channelKeysId MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Set the counterparty static channel data, including basepoints,
		/// `counterparty_selected`/`holder_selected_contest_delay` and funding outpoint.
		///
		/// This data is static, and will never change for a channel once set. For a given [`ChannelSigner`]
		/// instance, LDK will call this method exactly once - either immediately after construction
		/// (not including if done via [`SignerProvider::read_chan_signer`]) or when the funding
		/// information has been generated.
		///
		/// channel_parameters.is_populated() MUST be true.
		open func provideChannelParameters(channelParameters: ChannelTransactionParameters) {

			Bindings.print(
				"Error: ChannelSigner::provideChannelParameters MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Frees any resources associated with this object given its this_arg pointer.
		/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
		internal func free() {

			// TODO: figure out something smarter
			return ()  // the empty tuple (aka Void) is necessary because Swift is whitespace-agnostic

			Bindings.print(
				"Error: ChannelSigner::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}


		/// Returns the holder's channel public keys and basepoints.
		public func getPubkeys() -> ChannelPublicKeys {
			// return value (do some wrapping)
			let returnValue = ChannelPublicKeys(
				cType: self.cType!.pubkeys, instantiationContext: "ChannelSigner.swift::\(#function):\(#line)",
				anchor: self)

			return returnValue
		}


		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print(
						"Freeing ChannelSigner \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}
				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing ChannelSigner \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}
	}

	internal class NativelyImplementedChannelSigner: ChannelSigner {

		/// Gets the per-commitment point for a specific commitment number
		///
		/// Note that the commitment number starts at `(1 << 48) - 1` and counts backwards.
		public override func getPerCommitmentPoint(idx: UInt64) -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult = self.cType!.get_per_commitment_point(self.cType!.this_arg, idx)

			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "ChannelSigner.swift::\(#function):\(#line)"
			)
			.getValue()

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
			let returnValue = ThirtyTwoBytes(
				cType: nativeCallResult, instantiationContext: "ChannelSigner.swift::\(#function):\(#line)"
			)
			.getValue()

			return returnValue
		}

		/// Validate the counterparty's signatures on the holder commitment transaction and HTLCs.
		///
		/// This is required in order for the signer to make sure that releasing a commitment
		/// secret won't leave us without a broadcastable holder transaction.
		/// Policy checks should be implemented in this function, including checking the amount
		/// sent to us and checking the HTLCs.
		///
		/// The preimages of outbound HTLCs that were fulfilled since the last commitment are provided.
		/// A validating signer should ensure that an HTLC output is removed only when the matching
		/// preimage is provided, or when the value to holder is restored.
		///
		/// Note that all the relevant preimages will be provided, but there may also be additional
		/// irrelevant or duplicate preimages.
		public override func validateHolderCommitment(
			holderTx: HolderCommitmentTransaction, outboundHtlcPreimages: [[UInt8]]
		) -> Result_NoneNoneZ {
			// native call variable prep

			let outboundHtlcPreimagesVector = Vec_ThirtyTwoBytesZ(
				array: outboundHtlcPreimages, instantiationContext: "ChannelSigner.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: holderTx.cType!) {
					(holderTxPointer: UnsafePointer<LDKHolderCommitmentTransaction>) in
					self.cType!
						.validate_holder_commitment(
							self.cType!.this_arg, holderTxPointer, outboundHtlcPreimagesVector.cType!)
				}


			// cleanup

			// outboundHtlcPreimagesVector.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_NoneNoneZ(
				cType: nativeCallResult, instantiationContext: "ChannelSigner.swift::\(#function):\(#line)")

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
				cType: nativeCallResult, instantiationContext: "ChannelSigner.swift::\(#function):\(#line)")

			return returnValue
		}

		/// Returns an arbitrary identifier describing the set of keys which are provided back to you in
		/// some [`SpendableOutputDescriptor`] types. This should be sufficient to identify this
		/// [`EcdsaChannelSigner`] object uniquely and lookup or re-derive its keys.
		public override func channelKeysId() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult = self.cType!.channel_keys_id(self.cType!.this_arg)

			// cleanup


			// return value (do some wrapping)
			let returnValue = ThirtyTwoBytes(
				cType: nativeCallResult, instantiationContext: "ChannelSigner.swift::\(#function):\(#line)"
			)
			.getValue()

			return returnValue
		}

		/// Set the counterparty static channel data, including basepoints,
		/// `counterparty_selected`/`holder_selected_contest_delay` and funding outpoint.
		///
		/// This data is static, and will never change for a channel once set. For a given [`ChannelSigner`]
		/// instance, LDK will call this method exactly once - either immediately after construction
		/// (not including if done via [`SignerProvider::read_chan_signer`]) or when the funding
		/// information has been generated.
		///
		/// channel_parameters.is_populated() MUST be true.
		public override func provideChannelParameters(channelParameters: ChannelTransactionParameters) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: channelParameters.cType!) {
					(channelParametersPointer: UnsafePointer<LDKChannelTransactionParameters>) in
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
