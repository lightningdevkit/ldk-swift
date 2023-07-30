import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


///
public typealias SpendableOutputDescriptor = Bindings.SpendableOutputDescriptor

extension Bindings {

	/// Describes the necessary information to spend a spendable output.
	///
	/// When on-chain outputs are created by LDK (which our counterparty is not able to claim at any
	/// point in the future) a [`SpendableOutputs`] event is generated which you must track and be able
	/// to spend on-chain. The information needed to do this is provided in this enum, including the
	/// outpoint describing which `txid` and output `index` is available, the full output which exists
	/// at that `txid`/`index`, and any keys or other information required to sign.
	///
	/// [`SpendableOutputs`]: crate::events::Event::SpendableOutputs
	public class SpendableOutputDescriptor: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKSpendableOutputDescriptor?

		internal init(cType: LDKSpendableOutputDescriptor, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKSpendableOutputDescriptor, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKSpendableOutputDescriptor, instantiationContext: String, anchor: NativeTypeWrapper,
			dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		public enum SpendableOutputDescriptorType {

			/// An output to a script which was provided via [`SignerProvider`] directly, either from
			/// [`get_destination_script`] or [`get_shutdown_scriptpubkey`], thus you should already
			/// know how to spend it. No secret keys are provided as LDK was never given any key.
			/// These may include outputs from a transaction punishing our counterparty or claiming an HTLC
			/// on-chain using the payment preimage or after it has timed out.
			///
			/// [`get_shutdown_scriptpubkey`]: SignerProvider::get_shutdown_scriptpubkey
			/// [`get_destination_script`]: SignerProvider::get_shutdown_scriptpubkey
			case StaticOutput

			/// An output to a P2WSH script which can be spent with a single signature after an `OP_CSV`
			/// delay.
			///
			/// The witness in the spending input should be:
			/// ```bitcoin
			/// <BIP 143 signature> <empty vector> (MINIMALIF standard rule) <provided witnessScript>
			/// ```
			///
			/// Note that the `nSequence` field in the spending input must be set to
			/// [`DelayedPaymentOutputDescriptor::to_self_delay`] (which means the transaction is not
			/// broadcastable until at least [`DelayedPaymentOutputDescriptor::to_self_delay`] blocks after
			/// the outpoint confirms, see [BIP
			/// 68](https://github.com/bitcoin/bips/blob/master/bip-0068.mediawiki)). Also note that LDK
			/// won't generate a [`SpendableOutputDescriptor`] until the corresponding block height
			/// is reached.
			///
			/// These are generally the result of a \"revocable\" output to us, spendable only by us unless
			/// it is an output from an old state which we broadcast (which should never happen).
			///
			/// To derive the delayed payment key which is used to sign this input, you must pass the
			/// holder [`InMemorySigner::delayed_payment_base_key`] (i.e., the private key which corresponds to the
			/// [`ChannelPublicKeys::delayed_payment_basepoint`] in [`ChannelSigner::pubkeys`]) and the provided
			/// [`DelayedPaymentOutputDescriptor::per_commitment_point`] to [`chan_utils::derive_private_key`]. The public key can be
			/// generated without the secret key using [`chan_utils::derive_public_key`] and only the
			/// [`ChannelPublicKeys::delayed_payment_basepoint`] which appears in [`ChannelSigner::pubkeys`].
			///
			/// To derive the [`DelayedPaymentOutputDescriptor::revocation_pubkey`] provided here (which is
			/// used in the witness script generation), you must pass the counterparty
			/// [`ChannelPublicKeys::revocation_basepoint`] (which appears in the call to
			/// [`ChannelSigner::provide_channel_parameters`]) and the provided
			/// [`DelayedPaymentOutputDescriptor::per_commitment_point`] to
			/// [`chan_utils::derive_public_revocation_key`].
			///
			/// The witness script which is hashed and included in the output `script_pubkey` may be
			/// regenerated by passing the [`DelayedPaymentOutputDescriptor::revocation_pubkey`] (derived
			/// as explained above), our delayed payment pubkey (derived as explained above), and the
			/// [`DelayedPaymentOutputDescriptor::to_self_delay`] contained here to
			/// [`chan_utils::get_revokeable_redeemscript`].
			case DelayedPaymentOutput

			/// An output to a P2WPKH, spendable exclusively by our payment key (i.e., the private key
			/// which corresponds to the `payment_point` in [`ChannelSigner::pubkeys`]). The witness
			/// in the spending input is, thus, simply:
			/// ```bitcoin
			/// <BIP 143 signature> <payment key>
			/// ```
			///
			/// These are generally the result of our counterparty having broadcast the current state,
			/// allowing us to claim the non-HTLC-encumbered outputs immediately.
			case StaticPaymentOutput

		}

		public func getValueType() -> SpendableOutputDescriptorType {
			switch self.cType!.tag {
				case LDKSpendableOutputDescriptor_StaticOutput:
					return .StaticOutput

				case LDKSpendableOutputDescriptor_DelayedPaymentOutput:
					return .DelayedPaymentOutput

				case LDKSpendableOutputDescriptor_StaticPaymentOutput:
					return .StaticPaymentOutput

				default:
					Bindings.print(
						"Error: Invalid value type for SpendableOutputDescriptor! Aborting.", severity: .ERROR)
					abort()
			}

		}


		/// Frees any resources used by the SpendableOutputDescriptor
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = SpendableOutputDescriptor_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the SpendableOutputDescriptor
		internal func clone() -> SpendableOutputDescriptor {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKSpendableOutputDescriptor>) in
					SpendableOutputDescriptor_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = SpendableOutputDescriptor(
				cType: nativeCallResult, instantiationContext: "SpendableOutputDescriptor.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new StaticOutput-variant SpendableOutputDescriptor
		public class func initWithStaticOutput(outpoint: Bindings.OutPoint, output: Bindings.TxOut)
			-> SpendableOutputDescriptor
		{
			// native call variable prep


			// native method call
			let nativeCallResult = SpendableOutputDescriptor_static_output(
				outpoint.dynamicallyDangledClone().cType!, output.danglingClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = SpendableOutputDescriptor(
				cType: nativeCallResult, instantiationContext: "SpendableOutputDescriptor.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new DelayedPaymentOutput-variant SpendableOutputDescriptor
		public class func initWithDelayedPaymentOutput(a: Bindings.DelayedPaymentOutputDescriptor)
			-> SpendableOutputDescriptor
		{
			// native call variable prep


			// native method call
			let nativeCallResult = SpendableOutputDescriptor_delayed_payment_output(a.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = SpendableOutputDescriptor(
				cType: nativeCallResult, instantiationContext: "SpendableOutputDescriptor.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new StaticPaymentOutput-variant SpendableOutputDescriptor
		public class func initWithStaticPaymentOutput(a: Bindings.StaticPaymentOutputDescriptor)
			-> SpendableOutputDescriptor
		{
			// native call variable prep


			// native method call
			let nativeCallResult = SpendableOutputDescriptor_static_payment_output(a.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = SpendableOutputDescriptor(
				cType: nativeCallResult, instantiationContext: "SpendableOutputDescriptor.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Checks if two SpendableOutputDescriptors contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		public class func eq(a: SpendableOutputDescriptor, b: SpendableOutputDescriptor) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKSpendableOutputDescriptor>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKSpendableOutputDescriptor>) in
						SpendableOutputDescriptor_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Serialize the SpendableOutputDescriptor object into a byte array which can be read by SpendableOutputDescriptor_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKSpendableOutputDescriptor>) in
					SpendableOutputDescriptor_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "SpendableOutputDescriptor.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a SpendableOutputDescriptor from a byte array, created by SpendableOutputDescriptor_write
		public class func read(ser: [UInt8]) -> Result_SpendableOutputDescriptorDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "SpendableOutputDescriptor.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = SpendableOutputDescriptor_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_SpendableOutputDescriptorDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "SpendableOutputDescriptor.swift::\(#function):\(#line)")


			return returnValue
		}


		public func getValueAsStaticOutput() -> StaticOutput? {
			if self.cType?.tag != LDKSpendableOutputDescriptor_StaticOutput {
				return nil
			}

			return SpendableOutputDescriptor_LDKStaticOutput_Body(
				cType: self.cType!.static_output,
				instantiationContext: "SpendableOutputDescriptor.swift::\(#function):\(#line)", anchor: self)
		}

		public func getValueAsDelayedPaymentOutput() -> Bindings.DelayedPaymentOutputDescriptor? {
			if self.cType?.tag != LDKSpendableOutputDescriptor_DelayedPaymentOutput {
				return nil
			}

			return DelayedPaymentOutputDescriptor(
				cType: self.cType!.delayed_payment_output,
				instantiationContext: "SpendableOutputDescriptor.swift::\(#function):\(#line)", anchor: self)
		}

		public func getValueAsStaticPaymentOutput() -> Bindings.StaticPaymentOutputDescriptor? {
			if self.cType?.tag != LDKSpendableOutputDescriptor_StaticPaymentOutput {
				return nil
			}

			return StaticPaymentOutputDescriptor(
				cType: self.cType!.static_payment_output,
				instantiationContext: "SpendableOutputDescriptor.swift::\(#function):\(#line)", anchor: self)
		}


		internal func dangle(_ shouldDangle: Bool = true) -> SpendableOutputDescriptor {
			self.dangling = shouldDangle
			return self
		}

		internal func dangleRecursively() -> SpendableOutputDescriptor {
			self.dangling = true
			for currentAnchor in self.anchors {
				currentAnchor.dangleRecursively()
			}
			return self
		}


		internal func danglingClone() -> SpendableOutputDescriptor {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print(
						"Freeing SpendableOutputDescriptor \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing SpendableOutputDescriptor \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


		///
		internal typealias SpendableOutputDescriptor_LDKStaticOutput_Body = StaticOutput


		///
		public class StaticOutput: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKSpendableOutputDescriptor_LDKStaticOutput_Body?

			internal init(cType: LDKSpendableOutputDescriptor_LDKStaticOutput_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKSpendableOutputDescriptor_LDKStaticOutput_Body, instantiationContext: String,
				anchor: NativeTypeWrapper
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKSpendableOutputDescriptor_LDKStaticOutput_Body, instantiationContext: String,
				anchor: NativeTypeWrapper, dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// The outpoint which is spendable.
			public func getOutpoint() -> Bindings.OutPoint {
				// return value (do some wrapping)
				let returnValue = Bindings.OutPoint(
					cType: self.cType!.outpoint,
					instantiationContext: "SpendableOutputDescriptor.swift::\(#function):\(#line)", anchor: self)

				return returnValue
			}

			/// The output which is referenced by the given outpoint.
			public func getOutput() -> Bindings.TxOut {
				// return value (do some wrapping)
				let returnValue = Bindings.TxOut(
					cType: self.cType!.output,
					instantiationContext: "SpendableOutputDescriptor.swift::\(#function):\(#line)", anchor: self)

				return returnValue
			}


			internal func dangle(_ shouldDangle: Bool = true) -> StaticOutput {
				self.dangling = shouldDangle
				return self
			}

			internal func dangleRecursively() -> StaticOutput {
				self.dangling = true
				for currentAnchor in self.anchors {
					currentAnchor.dangleRecursively()
				}
				return self
			}


		}


	}

}
