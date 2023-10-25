#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A descriptor used to sign for a commitment transaction's HTLC output.
public typealias HTLCDescriptor = Bindings.HTLCDescriptor

extension Bindings {


	/// A descriptor used to sign for a commitment transaction's HTLC output.
	public class HTLCDescriptor: NativeTypeWrapper {

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

		internal var cType: LDKHTLCDescriptor?

		internal init(cType: LDKHTLCDescriptor, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKHTLCDescriptor, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKHTLCDescriptor, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the HTLCDescriptor, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = HTLCDescriptor_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The parameters required to derive the signer for the HTLC input.
		public func getChannelDerivationParameters() -> ChannelDerivationParameters {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKHTLCDescriptor>) in
					HTLCDescriptor_get_channel_derivation_parameters(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ChannelDerivationParameters(
				cType: nativeCallResult, instantiationContext: "HTLCDescriptor.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// The parameters required to derive the signer for the HTLC input.
		public func setChannelDerivationParameters(val: ChannelDerivationParameters) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKHTLCDescriptor>) in
					HTLCDescriptor_set_channel_derivation_parameters(
						thisPtrPointer, val.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The number of the commitment transaction in which the HTLC output lives.
		public func getPerCommitmentNumber() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKHTLCDescriptor>) in
					HTLCDescriptor_get_per_commitment_number(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The number of the commitment transaction in which the HTLC output lives.
		public func setPerCommitmentNumber(val: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKHTLCDescriptor>) in
					HTLCDescriptor_set_per_commitment_number(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The key tweak corresponding to the number of the commitment transaction in which the HTLC
		/// output lives. This tweak is applied to all the basepoints for both parties in the channel to
		/// arrive at unique keys per commitment.
		///
		/// See <https://github.com/lightning/bolts/blob/master/03-transactions.md#keys> for more info.
		public func getPerCommitmentPoint() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKHTLCDescriptor>) in
					HTLCDescriptor_get_per_commitment_point(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PublicKey(
				cType: nativeCallResult, instantiationContext: "HTLCDescriptor.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// The key tweak corresponding to the number of the commitment transaction in which the HTLC
		/// output lives. This tweak is applied to all the basepoints for both parties in the channel to
		/// arrive at unique keys per commitment.
		///
		/// See <https://github.com/lightning/bolts/blob/master/03-transactions.md#keys> for more info.
		public func setPerCommitmentPoint(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = PublicKey(
				value: val, instantiationContext: "HTLCDescriptor.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKHTLCDescriptor>) in
					HTLCDescriptor_set_per_commitment_point(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The feerate to use on the HTLC claiming transaction. This is always `0` for HTLCs
		/// originating from a channel supporting anchor outputs, otherwise it is the channel's
		/// negotiated feerate at the time the commitment transaction was built.
		public func getFeeratePerKw() -> UInt32 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKHTLCDescriptor>) in
					HTLCDescriptor_get_feerate_per_kw(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The feerate to use on the HTLC claiming transaction. This is always `0` for HTLCs
		/// originating from a channel supporting anchor outputs, otherwise it is the channel's
		/// negotiated feerate at the time the commitment transaction was built.
		public func setFeeratePerKw(val: UInt32) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKHTLCDescriptor>) in
					HTLCDescriptor_set_feerate_per_kw(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The details of the HTLC as it appears in the commitment transaction.
		public func getHtlc() -> HTLCOutputInCommitment {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKHTLCDescriptor>) in
					HTLCDescriptor_get_htlc(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = HTLCOutputInCommitment(
				cType: nativeCallResult, instantiationContext: "HTLCDescriptor.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// The details of the HTLC as it appears in the commitment transaction.
		public func setHtlc(val: HTLCOutputInCommitment) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKHTLCDescriptor>) in
					HTLCDescriptor_set_htlc(thisPtrPointer, val.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The preimage, if `Some`, to claim the HTLC output with. If `None`, the timeout path must be
		/// taken.
		public func getPreimage() -> [UInt8]? {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKHTLCDescriptor>) in
					HTLCDescriptor_get_preimage(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_ThirtyTwoBytesZ(
				cType: nativeCallResult, instantiationContext: "HTLCDescriptor.swift::\(#function):\(#line)",
				anchor: self
			)
			.getValue()


			return returnValue
		}

		/// The preimage, if `Some`, to claim the HTLC output with. If `None`, the timeout path must be
		/// taken.
		public func setPreimage(val: [UInt8]?) {
			// native call variable prep

			let valOption = Option_ThirtyTwoBytesZ(
				some: val, instantiationContext: "HTLCDescriptor.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKHTLCDescriptor>) in
					HTLCDescriptor_set_preimage(thisPtrPointer, valOption.cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The counterparty's signature required to spend the HTLC output.
		public func getCounterpartySig() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKHTLCDescriptor>) in
					HTLCDescriptor_get_counterparty_sig(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ECDSASignature(
				cType: nativeCallResult, instantiationContext: "HTLCDescriptor.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// The counterparty's signature required to spend the HTLC output.
		public func setCounterpartySig(val: [UInt8]) {
			// native call variable prep

			let valPrimitiveWrapper = ECDSASignature(
				value: val, instantiationContext: "HTLCDescriptor.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKHTLCDescriptor>) in
					HTLCDescriptor_set_counterparty_sig(thisPtrPointer, valPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			valPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the HTLCDescriptor
		internal func clone() -> HTLCDescriptor {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKHTLCDescriptor>) in
					HTLCDescriptor_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = HTLCDescriptor(
				cType: nativeCallResult, instantiationContext: "HTLCDescriptor.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Checks if two HTLCDescriptors contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: HTLCDescriptor, b: HTLCDescriptor) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKHTLCDescriptor>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKHTLCDescriptor>) in
						HTLCDescriptor_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Serialize the HTLCDescriptor object into a byte array which can be read by HTLCDescriptor_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKHTLCDescriptor>) in
					HTLCDescriptor_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "HTLCDescriptor.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a HTLCDescriptor from a byte array, created by HTLCDescriptor_write
		public class func read(ser: [UInt8]) -> Result_HTLCDescriptorDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "HTLCDescriptor.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = HTLCDescriptor_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_HTLCDescriptorDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "HTLCDescriptor.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Returns the outpoint of the HTLC output in the commitment transaction. This is the outpoint
		/// being spent by the HTLC input in the HTLC transaction.
		public func outpoint() -> OutPoint {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKHTLCDescriptor>) in
					HTLCDescriptor_outpoint(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = OutPoint(
				cType: nativeCallResult, instantiationContext: "HTLCDescriptor.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// Returns the UTXO to be spent by the HTLC input, which can be obtained via
		/// [`Self::unsigned_tx_input`].
		public func previousUtxo() -> TxOut {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKHTLCDescriptor>) in
					HTLCDescriptor_previous_utxo(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = TxOut(
				cType: nativeCallResult, instantiationContext: "HTLCDescriptor.swift::\(#function):\(#line)",
				anchor: self)


			return returnValue
		}

		/// Returns the unsigned transaction input spending the HTLC output in the commitment
		/// transaction.
		public func unsignedTxInput() -> TxIn {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKHTLCDescriptor>) in
					HTLCDescriptor_unsigned_tx_input(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = TxIn(
				cType: nativeCallResult, instantiationContext: "HTLCDescriptor.swift::\(#function):\(#line)",
				anchor: self)


			return returnValue
		}

		/// Returns the delayed output created as a result of spending the HTLC output in the commitment
		/// transaction.
		public func txOutput() -> TxOut {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKHTLCDescriptor>) in
					HTLCDescriptor_tx_output(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = TxOut(
				cType: nativeCallResult, instantiationContext: "HTLCDescriptor.swift::\(#function):\(#line)",
				anchor: self)


			return returnValue
		}

		/// Returns the witness script of the HTLC output in the commitment transaction.
		public func witnessScript() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKHTLCDescriptor>) in
					HTLCDescriptor_witness_script(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "HTLCDescriptor.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Returns the fully signed witness required to spend the HTLC output in the commitment
		/// transaction.
		public func txInputWitness(signature: [UInt8], witnessScript: [UInt8]) -> [UInt8] {
			// native call variable prep

			let signaturePrimitiveWrapper = ECDSASignature(
				value: signature, instantiationContext: "HTLCDescriptor.swift::\(#function):\(#line)")

			let witnessScriptPrimitiveWrapper = u8slice(
				value: witnessScript, instantiationContext: "HTLCDescriptor.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKHTLCDescriptor>) in
					HTLCDescriptor_tx_input_witness(
						thisArgPointer, signaturePrimitiveWrapper.cType!, witnessScriptPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			signaturePrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			witnessScriptPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Witness(
				cType: nativeCallResult, instantiationContext: "HTLCDescriptor.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Derives the channel signer required to sign the HTLC input.
		public func deriveChannelSigner(signerProvider: SignerProvider) -> WriteableEcdsaChannelSigner {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKHTLCDescriptor>) in

					withUnsafePointer(to: signerProvider.activate().cType!) {
						(signerProviderPointer: UnsafePointer<LDKSignerProvider>) in
						HTLCDescriptor_derive_channel_signer(thisArgPointer, signerProviderPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NativelyImplementedWriteableEcdsaChannelSigner(
				cType: nativeCallResult, instantiationContext: "HTLCDescriptor.swift::\(#function):\(#line)",
				anchor: self)


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


		internal func danglingClone() -> HTLCDescriptor {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> HTLCDescriptor {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> HTLCDescriptor {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> HTLCDescriptor {
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
						"Freeing HTLCDescriptor \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing HTLCDescriptor \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

