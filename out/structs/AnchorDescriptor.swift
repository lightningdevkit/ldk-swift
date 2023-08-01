#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A descriptor used to sign for a commitment transaction's anchor output.
public typealias AnchorDescriptor = Bindings.AnchorDescriptor

extension Bindings {


	/// A descriptor used to sign for a commitment transaction's anchor output.
	public class AnchorDescriptor: NativeTypeWrapper {

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

		internal var cType: LDKAnchorDescriptor?

		internal init(cType: LDKAnchorDescriptor, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKAnchorDescriptor, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKAnchorDescriptor, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the AnchorDescriptor, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = AnchorDescriptor_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The parameters required to derive the signer for the anchor input.
		public func getChannelDerivationParameters() -> ChannelDerivationParameters {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKAnchorDescriptor>) in
					AnchorDescriptor_get_channel_derivation_parameters(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ChannelDerivationParameters(
				cType: nativeCallResult, instantiationContext: "AnchorDescriptor.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// The parameters required to derive the signer for the anchor input.
		public func setChannelDerivationParameters(val: ChannelDerivationParameters) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKAnchorDescriptor>) in
					AnchorDescriptor_set_channel_derivation_parameters(
						thisPtrPointer, val.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// The transaction input's outpoint corresponding to the commitment transaction's anchor
		/// output.
		public func getOutpoint() -> OutPoint {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKAnchorDescriptor>) in
					AnchorDescriptor_get_outpoint(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = OutPoint(
				cType: nativeCallResult, instantiationContext: "AnchorDescriptor.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false)


			return returnValue
		}

		/// The transaction input's outpoint corresponding to the commitment transaction's anchor
		/// output.
		public func setOutpoint(val: OutPoint) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKAnchorDescriptor>) in
					AnchorDescriptor_set_outpoint(thisPtrPointer, val.dynamicallyDangledClone().cType!)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new AnchorDescriptor given each field
		public init(channelDerivationParametersArg: ChannelDerivationParameters, outpointArg: OutPoint) {
			// native call variable prep


			// native method call
			let nativeCallResult = AnchorDescriptor_new(
				channelDerivationParametersArg.dynamicallyDangledClone().cType!,
				outpointArg.dynamicallyDangledClone().cType!)

			// cleanup

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = AnchorDescriptor(cType: nativeCallResult, instantiationContext: "AnchorDescriptor.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0,
					instantiationContext: "AnchorDescriptor.swift::\(#function):\(#line)")


		}

		/// Creates a copy of the AnchorDescriptor
		internal func clone() -> AnchorDescriptor {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKAnchorDescriptor>) in
					AnchorDescriptor_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = AnchorDescriptor(
				cType: nativeCallResult, instantiationContext: "AnchorDescriptor.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Checks if two AnchorDescriptors contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		/// Two objects with NULL inner values will be considered "equal" here.
		public class func eq(a: AnchorDescriptor, b: AnchorDescriptor) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKAnchorDescriptor>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKAnchorDescriptor>) in
						AnchorDescriptor_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Returns the UTXO to be spent by the anchor input, which can be obtained via
		/// [`Self::unsigned_tx_input`].
		public func previousUtxo() -> TxOut {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKAnchorDescriptor>) in
					AnchorDescriptor_previous_utxo(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = TxOut(
				cType: nativeCallResult, instantiationContext: "AnchorDescriptor.swift::\(#function):\(#line)",
				anchor: self)


			return returnValue
		}

		/// Returns the unsigned transaction input spending the anchor output in the commitment
		/// transaction.
		public func unsignedTxInput() -> TxIn {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKAnchorDescriptor>) in
					AnchorDescriptor_unsigned_tx_input(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = TxIn(
				cType: nativeCallResult, instantiationContext: "AnchorDescriptor.swift::\(#function):\(#line)",
				anchor: self)


			return returnValue
		}

		/// Returns the witness script of the anchor output in the commitment transaction.
		public func witnessScript() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKAnchorDescriptor>) in
					AnchorDescriptor_witness_script(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "AnchorDescriptor.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Returns the fully signed witness required to spend the anchor output in the commitment
		/// transaction.
		public func txInputWitness(signature: [UInt8]) -> [UInt8] {
			// native call variable prep

			let signaturePrimitiveWrapper = Signature(
				value: signature, instantiationContext: "AnchorDescriptor.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKAnchorDescriptor>) in
					AnchorDescriptor_tx_input_witness(thisArgPointer, signaturePrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			signaturePrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Witness(
				cType: nativeCallResult, instantiationContext: "AnchorDescriptor.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Derives the channel signer required to sign the anchor input.
		public func deriveChannelSigner(signerProvider: SignerProvider) -> WriteableEcdsaChannelSigner {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKAnchorDescriptor>) in

					withUnsafePointer(to: signerProvider.activate().cType!) {
						(signerProviderPointer: UnsafePointer<LDKSignerProvider>) in
						AnchorDescriptor_derive_channel_signer(thisArgPointer, signerProviderPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NativelyImplementedWriteableEcdsaChannelSigner(
				cType: nativeCallResult, instantiationContext: "AnchorDescriptor.swift::\(#function):\(#line)",
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


		internal func danglingClone() -> AnchorDescriptor {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> AnchorDescriptor {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> AnchorDescriptor {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> AnchorDescriptor {
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
						"Freeing AnchorDescriptor \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing AnchorDescriptor \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

