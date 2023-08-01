#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A wrapper on CommitmentTransaction indicating that the derived fields (the built bitcoin
/// transaction and the transaction creation keys) are trusted.
///
/// See trust() and verify() functions on CommitmentTransaction.
///
/// This structure implements Deref.
public typealias TrustedCommitmentTransaction = Bindings.TrustedCommitmentTransaction

extension Bindings {


	/// A wrapper on CommitmentTransaction indicating that the derived fields (the built bitcoin
	/// transaction and the transaction creation keys) are trusted.
	///
	/// See trust() and verify() functions on CommitmentTransaction.
	///
	/// This structure implements Deref.
	public class TrustedCommitmentTransaction: NativeTypeWrapper {

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

		internal var cType: LDKTrustedCommitmentTransaction?

		internal init(cType: LDKTrustedCommitmentTransaction, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKTrustedCommitmentTransaction, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKTrustedCommitmentTransaction, instantiationContext: String, anchor: NativeTypeWrapper,
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


		/// Frees any resources used by the TrustedCommitmentTransaction, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = TrustedCommitmentTransaction_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The transaction ID of the built Bitcoin transaction
		public func txid() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKTrustedCommitmentTransaction>) in
					TrustedCommitmentTransaction_txid(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ThirtyTwoBytes(
				cType: nativeCallResult,
				instantiationContext: "TrustedCommitmentTransaction.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// The pre-built Bitcoin commitment transaction
		public func builtTransaction() -> BuiltCommitmentTransaction {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKTrustedCommitmentTransaction>) in
					TrustedCommitmentTransaction_built_transaction(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = BuiltCommitmentTransaction(
				cType: nativeCallResult,
				instantiationContext: "TrustedCommitmentTransaction.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// The pre-calculated transaction creation public keys.
		public func keys() -> TxCreationKeys {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKTrustedCommitmentTransaction>) in
					TrustedCommitmentTransaction_keys(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = TxCreationKeys(
				cType: nativeCallResult,
				instantiationContext: "TrustedCommitmentTransaction.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Should anchors be used.
		public func channelTypeFeatures() -> ChannelTypeFeatures {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKTrustedCommitmentTransaction>) in
					TrustedCommitmentTransaction_channel_type_features(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ChannelTypeFeatures(
				cType: nativeCallResult,
				instantiationContext: "TrustedCommitmentTransaction.swift::\(#function):\(#line)", anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Get a signature for each HTLC which was included in the commitment transaction (ie for
		/// which HTLCOutputInCommitment::transaction_output_index.is_some()).
		///
		/// The returned Vec has one entry for each HTLC, and in the same order.
		///
		/// This function is only valid in the holder commitment context, it always uses EcdsaSighashType::All.
		public func getHtlcSigs(
			htlcBaseKey: [UInt8], channelParameters: DirectedChannelTransactionParameters, entropySource: EntropySource
		) -> Result_CVec_SignatureZNoneZ {
			// native call variable prep

			let tupledHtlcBaseKey = Bindings.arrayToUInt8Tuple32(array: htlcBaseKey)


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKTrustedCommitmentTransaction>) in

					withUnsafePointer(to: tupledHtlcBaseKey) {
						(tupledHtlcBaseKeyPointer: UnsafePointer<UInt8Tuple32>) in

						withUnsafePointer(to: channelParameters.cType!) {
							(channelParametersPointer: UnsafePointer<LDKDirectedChannelTransactionParameters>) in

							withUnsafePointer(to: entropySource.activate().cType!) {
								(entropySourcePointer: UnsafePointer<LDKEntropySource>) in
								TrustedCommitmentTransaction_get_htlc_sigs(
									thisArgPointer, tupledHtlcBaseKeyPointer, channelParametersPointer,
									entropySourcePointer)
							}

						}

					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_CVec_SignatureZNoneZ(
				cType: nativeCallResult,
				instantiationContext: "TrustedCommitmentTransaction.swift::\(#function):\(#line)", anchor: self
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


		internal func setCFreeability(freeable: Bool) -> TrustedCommitmentTransaction {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> TrustedCommitmentTransaction {
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
						"Freeing TrustedCommitmentTransaction \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing TrustedCommitmentTransaction \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

