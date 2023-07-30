// necessary for abort() calls
import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


/// A trait that can handle cryptographic operations at the scope level of a node.
public typealias NodeSigner = Bindings.NodeSigner

extension Bindings {

	/// A trait that can handle cryptographic operations at the scope level of a node.
	open class NodeSigner: NativeTraitWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKNodeSigner?

		internal init(cType: LDKNodeSigner, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKNodeSigner, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKNodeSigner, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		public init() {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super.init(conflictAvoidingVariableName: 0, instantiationContext: "NodeSigner.swift::\(#function):\(#line)")

			let thisArg = Bindings.instanceToPointer(instance: self)


			func getInboundPaymentKeyMaterialLambda(this_arg: UnsafeRawPointer?) -> LDKThirtyTwoBytes {
				let instance: NodeSigner = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "NodeSigner::getInboundPaymentKeyMaterialLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.getInboundPaymentKeyMaterial()

				// cleanup


				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					value: swiftCallbackResult, instantiationContext: "NodeSigner.swift::init()::\(#function):\(#line)"
				)
				.dangleRecursively().cType!

				return returnValue
			}

			func getNodeIdLambda(this_arg: UnsafeRawPointer?, recipient: LDKRecipient) -> LDKCResult_PublicKeyNoneZ {
				let instance: NodeSigner = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "NodeSigner::getNodeIdLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.getNodeId(recipient: Recipient(value: recipient))

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult.dangleRecursively().cType!

				return returnValue
			}

			func ecdhLambda(
				this_arg: UnsafeRawPointer?, recipient: LDKRecipient, other_key: LDKPublicKey, tweak: LDKCOption_ScalarZ
			) -> LDKCResult_SharedSecretNoneZ {
				let instance: NodeSigner = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "NodeSigner::ecdhLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.ecdh(
					recipient: Recipient(value: recipient),
					otherKey: PublicKey(
						cType: other_key, instantiationContext: "NodeSigner.swift::init()::\(#function):\(#line)"
					)
					.getValue(),
					tweak: Option_ScalarZ(
						cType: tweak, instantiationContext: "NodeSigner.swift::init()::\(#function):\(#line)"
					)
					.getValue())

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult.dangleRecursively().cType!

				return returnValue
			}

			func signInvoiceLambda(
				this_arg: UnsafeRawPointer?, hrp_bytes: LDKu8slice, invoice_data: LDKCVec_U5Z, recipient: LDKRecipient
			) -> LDKCResult_RecoverableSignatureNoneZ {
				let instance: NodeSigner = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "NodeSigner::signInvoiceLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.signInvoice(
					hrpBytes: u8slice(
						cType: hrp_bytes, instantiationContext: "NodeSigner.swift::init()::\(#function):\(#line)"
					)
					.dangle().getValue(),
					invoiceData: Vec_U5Z(
						cType: invoice_data, instantiationContext: "NodeSigner.swift::init()::\(#function):\(#line)"
					)
					.getValue(), recipient: Recipient(value: recipient))

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult.dangleRecursively().cType!

				return returnValue
			}

			func signGossipMessageLambda(this_arg: UnsafeRawPointer?, msg: LDKUnsignedGossipMessage)
				-> LDKCResult_SignatureNoneZ
			{
				let instance: NodeSigner = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "NodeSigner::signGossipMessageLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.signGossipMessage(
					msg: UnsignedGossipMessage(
						cType: msg, instantiationContext: "NodeSigner.swift::init()::\(#function):\(#line)"))

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult.dangleRecursively().cType!

				return returnValue
			}

			func freeLambda(this_arg: UnsafeMutableRawPointer?) {
				let instance: NodeSigner = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "NodeSigner::freeLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.free()

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult

				return returnValue
			}


			self.cType = LDKNodeSigner(
				this_arg: thisArg,
				get_inbound_payment_key_material: getInboundPaymentKeyMaterialLambda,
				get_node_id: getNodeIdLambda,
				ecdh: ecdhLambda,
				sign_invoice: signInvoiceLambda,
				sign_gossip_message: signGossipMessageLambda,
				free: freeLambda
			)
		}


		/// Get secret key material as bytes for use in encrypting and decrypting inbound payment data.
		///
		/// If the implementor of this trait supports [phantom node payments], then every node that is
		/// intended to be included in the phantom invoice route hints must return the same value from
		/// this method.
		///
		/// This method must return the same value each time it is called.
		///
		/// [phantom node payments]: PhantomKeysManager
		open func getInboundPaymentKeyMaterial() -> [UInt8] {

			Bindings.print(
				"Error: NodeSigner::getInboundPaymentKeyMaterial MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Get node id based on the provided [`Recipient`].
		///
		/// This method must return the same value each time it is called with a given [`Recipient`]
		/// parameter.
		///
		/// Errors if the [`Recipient`] variant is not supported by the implementation.
		open func getNodeId(recipient: Recipient) -> Result_PublicKeyNoneZ {

			Bindings.print(
				"Error: NodeSigner::getNodeId MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Gets the ECDH shared secret of our node secret and `other_key`, multiplying by `tweak` if
		/// one is provided. Note that this tweak can be applied to `other_key` instead of our node
		/// secret, though this is less efficient.
		///
		/// Note that if this fails while attempting to forward an HTLC, LDK will panic. The error
		/// should be resolved to allow LDK to resume forwarding HTLCs.
		///
		/// Errors if the [`Recipient`] variant is not supported by the implementation.
		open func ecdh(recipient: Recipient, otherKey: [UInt8], tweak: [UInt8]?) -> Result_SharedSecretNoneZ {

			Bindings.print(
				"Error: NodeSigner::ecdh MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Sign an invoice.
		///
		/// By parameterizing by the raw invoice bytes instead of the hash, we allow implementors of
		/// this trait to parse the invoice and make sure they're signing what they expect, rather than
		/// blindly signing the hash.
		///
		/// The `hrp_bytes` are ASCII bytes, while the `invoice_data` is base32.
		///
		/// The secret key used to sign the invoice is dependent on the [`Recipient`].
		///
		/// Errors if the [`Recipient`] variant is not supported by the implementation.
		open func signInvoice(hrpBytes: [UInt8], invoiceData: [UInt8], recipient: Recipient)
			-> Result_RecoverableSignatureNoneZ
		{

			Bindings.print(
				"Error: NodeSigner::signInvoice MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Sign a gossip message.
		///
		/// Note that if this fails, LDK may panic and the message will not be broadcast to the network
		/// or a possible channel counterparty. If LDK panics, the error should be resolved to allow the
		/// message to be broadcast, as otherwise it may prevent one from receiving funds over the
		/// corresponding channel.
		open func signGossipMessage(msg: UnsignedGossipMessage) -> Result_SignatureNoneZ {

			Bindings.print(
				"Error: NodeSigner::signGossipMessage MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Frees any resources associated with this object given its this_arg pointer.
		/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
		internal func free() {

			// TODO: figure out something smarter
			return  // the semicolon is necessary because Swift is whitespace-agnostic

			Bindings.print(
				"Error: NodeSigner::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}


		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print("Freeing NodeSigner \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}
				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing NodeSigner \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}
	}

	internal class NativelyImplementedNodeSigner: NodeSigner {

		/// Get secret key material as bytes for use in encrypting and decrypting inbound payment data.
		///
		/// If the implementor of this trait supports [phantom node payments], then every node that is
		/// intended to be included in the phantom invoice route hints must return the same value from
		/// this method.
		///
		/// This method must return the same value each time it is called.
		///
		/// [phantom node payments]: PhantomKeysManager
		public override func getInboundPaymentKeyMaterial() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult = self.cType!.get_inbound_payment_key_material(self.cType!.this_arg)

			// cleanup


			// return value (do some wrapping)
			let returnValue = ThirtyTwoBytes(
				cType: nativeCallResult, instantiationContext: "NodeSigner.swift::\(#function):\(#line)"
			)
			.getValue()

			return returnValue
		}

		/// Get node id based on the provided [`Recipient`].
		///
		/// This method must return the same value each time it is called with a given [`Recipient`]
		/// parameter.
		///
		/// Errors if the [`Recipient`] variant is not supported by the implementation.
		public override func getNodeId(recipient: Recipient) -> Result_PublicKeyNoneZ {
			// native call variable prep


			// native method call
			let nativeCallResult = self.cType!.get_node_id(self.cType!.this_arg, recipient.getCValue())

			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_PublicKeyNoneZ(
				cType: nativeCallResult, instantiationContext: "NodeSigner.swift::\(#function):\(#line)")

			return returnValue
		}

		/// Gets the ECDH shared secret of our node secret and `other_key`, multiplying by `tweak` if
		/// one is provided. Note that this tweak can be applied to `other_key` instead of our node
		/// secret, though this is less efficient.
		///
		/// Note that if this fails while attempting to forward an HTLC, LDK will panic. The error
		/// should be resolved to allow LDK to resume forwarding HTLCs.
		///
		/// Errors if the [`Recipient`] variant is not supported by the implementation.
		public override func ecdh(recipient: Recipient, otherKey: [UInt8], tweak: [UInt8]?) -> Result_SharedSecretNoneZ
		{
			// native call variable prep

			let otherKeyPrimitiveWrapper = PublicKey(
				value: otherKey, instantiationContext: "NodeSigner.swift::\(#function):\(#line)")

			let tweakOption = Option_ScalarZ(
				some: tweak, instantiationContext: "NodeSigner.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult = self.cType!
				.ecdh(self.cType!.this_arg, recipient.getCValue(), otherKeyPrimitiveWrapper.cType!, tweakOption.cType!)

			// cleanup

			// for elided types, we need this
			otherKeyPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_SharedSecretNoneZ(
				cType: nativeCallResult, instantiationContext: "NodeSigner.swift::\(#function):\(#line)")

			return returnValue
		}

		/// Sign an invoice.
		///
		/// By parameterizing by the raw invoice bytes instead of the hash, we allow implementors of
		/// this trait to parse the invoice and make sure they're signing what they expect, rather than
		/// blindly signing the hash.
		///
		/// The `hrp_bytes` are ASCII bytes, while the `invoice_data` is base32.
		///
		/// The secret key used to sign the invoice is dependent on the [`Recipient`].
		///
		/// Errors if the [`Recipient`] variant is not supported by the implementation.
		public override func signInvoice(hrpBytes: [UInt8], invoiceData: [UInt8], recipient: Recipient)
			-> Result_RecoverableSignatureNoneZ
		{
			// native call variable prep

			let hrpBytesPrimitiveWrapper = u8slice(
				value: hrpBytes, instantiationContext: "NodeSigner.swift::\(#function):\(#line)")

			let invoiceDataVector = Vec_U5Z(
				array: invoiceData, instantiationContext: "NodeSigner.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = self.cType!
				.sign_invoice(
					self.cType!.this_arg, hrpBytesPrimitiveWrapper.cType!, invoiceDataVector.cType!,
					recipient.getCValue())

			// cleanup

			// for elided types, we need this
			hrpBytesPrimitiveWrapper.noOpRetain()

			// invoiceDataVector.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_RecoverableSignatureNoneZ(
				cType: nativeCallResult, instantiationContext: "NodeSigner.swift::\(#function):\(#line)")

			return returnValue
		}

		/// Sign a gossip message.
		///
		/// Note that if this fails, LDK may panic and the message will not be broadcast to the network
		/// or a possible channel counterparty. If LDK panics, the error should be resolved to allow the
		/// message to be broadcast, as otherwise it may prevent one from receiving funds over the
		/// corresponding channel.
		public override func signGossipMessage(msg: UnsignedGossipMessage) -> Result_SignatureNoneZ {
			// native call variable prep


			// native method call
			let nativeCallResult = self.cType!.sign_gossip_message(self.cType!.this_arg, msg.danglingClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_SignatureNoneZ(
				cType: nativeCallResult, instantiationContext: "NodeSigner.swift::\(#function):\(#line)")

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
