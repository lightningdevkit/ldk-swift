import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


///
public typealias OffersContext = Bindings.OffersContext

extension Bindings {

	/// Contains data specific to an [`OffersMessage`].
	///
	/// [`OffersMessage`]: crate::onion_message::offers::OffersMessage
	public class OffersContext: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKOffersContext?

		internal init(cType: LDKOffersContext, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKOffersContext, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKOffersContext, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		public enum OffersContextType {

			/// Context used by a [`BlindedMessagePath`] within an [`Offer`].
			///
			/// This variant is intended to be received when handling an [`InvoiceRequest`].
			///
			/// [`Offer`]: crate::offers::offer::Offer
			/// [`InvoiceRequest`]: crate::offers::invoice_request::InvoiceRequest
			case InvoiceRequest

			/// Context used by a [`BlindedMessagePath`] within a [`Refund`] or as a reply path for an
			/// [`InvoiceRequest`].
			///
			/// This variant is intended to be received when handling a [`Bolt12Invoice`] or an
			/// [`InvoiceError`].
			///
			/// [`Refund`]: crate::offers::refund::Refund
			/// [`InvoiceRequest`]: crate::offers::invoice_request::InvoiceRequest
			/// [`Bolt12Invoice`]: crate::offers::invoice::Bolt12Invoice
			/// [`InvoiceError`]: crate::offers::invoice_error::InvoiceError
			case OutboundPayment

			/// Context used by a [`BlindedMessagePath`] as a reply path for a [`Bolt12Invoice`].
			///
			/// This variant is intended to be received when handling an [`InvoiceError`].
			///
			/// [`Bolt12Invoice`]: crate::offers::invoice::Bolt12Invoice
			/// [`InvoiceError`]: crate::offers::invoice_error::InvoiceError
			case InboundPayment

		}

		public func getValueType() -> OffersContextType {
			switch self.cType!.tag {
				case LDKOffersContext_InvoiceRequest:
					return .InvoiceRequest

				case LDKOffersContext_OutboundPayment:
					return .OutboundPayment

				case LDKOffersContext_InboundPayment:
					return .InboundPayment

				default:
					Bindings.print("Error: Invalid value type for OffersContext! Aborting.", severity: .ERROR)
					abort()
			}

		}


		/// Frees any resources used by the OffersContext
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = OffersContext_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the OffersContext
		internal func clone() -> OffersContext {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKOffersContext>) in
					OffersContext_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = OffersContext(
				cType: nativeCallResult, instantiationContext: "OffersContext.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new InvoiceRequest-variant OffersContext
		public class func initWithInvoiceRequest(nonce: Bindings.Nonce) -> OffersContext {
			// native call variable prep


			// native method call
			let nativeCallResult = OffersContext_invoice_request(nonce.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = OffersContext(
				cType: nativeCallResult, instantiationContext: "OffersContext.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new OutboundPayment-variant OffersContext
		public class func initWithOutboundPayment(paymentId: [UInt8], nonce: Bindings.Nonce, hmac: [UInt8])
			-> OffersContext
		{
			// native call variable prep

			let paymentIdPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentId, instantiationContext: "OffersContext.swift::\(#function):\(#line)")

			let hmacPrimitiveWrapper = ThirtyTwoBytes(
				value: hmac, instantiationContext: "OffersContext.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = OffersContext_outbound_payment(
				paymentIdPrimitiveWrapper.cType!, nonce.dynamicallyDangledClone().cType!, hmacPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			paymentIdPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			hmacPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = OffersContext(
				cType: nativeCallResult, instantiationContext: "OffersContext.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new InboundPayment-variant OffersContext
		public class func initWithInboundPayment(paymentHash: [UInt8]) -> OffersContext {
			// native call variable prep

			let paymentHashPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentHash, instantiationContext: "OffersContext.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = OffersContext_inbound_payment(paymentHashPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			paymentHashPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = OffersContext(
				cType: nativeCallResult, instantiationContext: "OffersContext.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Checks if two OffersContexts contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		public class func eq(a: OffersContext, b: OffersContext) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKOffersContext>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKOffersContext>) in
						OffersContext_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Serialize the OffersContext object into a byte array which can be read by OffersContext_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKOffersContext>) in
					OffersContext_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "OffersContext.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a OffersContext from a byte array, created by OffersContext_write
		public class func read(ser: [UInt8]) -> Result_OffersContextDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "OffersContext.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = OffersContext_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_OffersContextDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "OffersContext.swift::\(#function):\(#line)")


			return returnValue
		}


		public func getValueAsInvoiceRequest() -> InvoiceRequest? {
			if self.cType?.tag != LDKOffersContext_InvoiceRequest {
				return nil
			}

			return OffersContext_LDKInvoiceRequest_Body(
				cType: self.cType!.invoice_request, instantiationContext: "OffersContext.swift::\(#function):\(#line)",
				anchor: self)
		}

		public func getValueAsOutboundPayment() -> OutboundPayment? {
			if self.cType?.tag != LDKOffersContext_OutboundPayment {
				return nil
			}

			return OffersContext_LDKOutboundPayment_Body(
				cType: self.cType!.outbound_payment, instantiationContext: "OffersContext.swift::\(#function):\(#line)",
				anchor: self)
		}

		public func getValueAsInboundPayment() -> InboundPayment? {
			if self.cType?.tag != LDKOffersContext_InboundPayment {
				return nil
			}

			return OffersContext_LDKInboundPayment_Body(
				cType: self.cType!.inbound_payment, instantiationContext: "OffersContext.swift::\(#function):\(#line)",
				anchor: self)
		}


		internal func danglingClone() -> OffersContext {
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
						"Freeing OffersContext \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing OffersContext \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


		///
		internal typealias OffersContext_LDKInvoiceRequest_Body = InvoiceRequest


		///
		public class InvoiceRequest: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKOffersContext_LDKInvoiceRequest_Body?

			internal init(cType: LDKOffersContext_LDKInvoiceRequest_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKOffersContext_LDKInvoiceRequest_Body, instantiationContext: String, anchor: NativeTypeWrapper
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKOffersContext_LDKInvoiceRequest_Body, instantiationContext: String, anchor: NativeTypeWrapper,
				dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// A nonce used for authenticating that an [`InvoiceRequest`] is for a valid [`Offer`] and
			/// for deriving the offer's signing keys.
			///
			/// [`InvoiceRequest`]: crate::offers::invoice_request::InvoiceRequest
			/// [`Offer`]: crate::offers::offer::Offer
			public func getNonce() -> Bindings.Nonce {
				// return value (do some wrapping)
				let returnValue = Bindings.Nonce(
					cType: self.cType!.nonce, instantiationContext: "OffersContext.swift::\(#function):\(#line)",
					anchor: self)

				return returnValue
			}


		}


		///
		internal typealias OffersContext_LDKOutboundPayment_Body = OutboundPayment


		///
		public class OutboundPayment: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKOffersContext_LDKOutboundPayment_Body?

			internal init(cType: LDKOffersContext_LDKOutboundPayment_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKOffersContext_LDKOutboundPayment_Body, instantiationContext: String, anchor: NativeTypeWrapper
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKOffersContext_LDKOutboundPayment_Body, instantiationContext: String,
				anchor: NativeTypeWrapper, dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// Payment ID used when creating a [`Refund`] or [`InvoiceRequest`].
			///
			/// [`Refund`]: crate::offers::refund::Refund
			/// [`InvoiceRequest`]: crate::offers::invoice_request::InvoiceRequest
			public func getPaymentId() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					cType: self.cType!.payment_id, instantiationContext: "OffersContext.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}

			/// A nonce used for authenticating that a [`Bolt12Invoice`] is for a valid [`Refund`] or
			/// [`InvoiceRequest`] and for deriving their signing keys.
			///
			/// [`Bolt12Invoice`]: crate::offers::invoice::Bolt12Invoice
			/// [`Refund`]: crate::offers::refund::Refund
			/// [`InvoiceRequest`]: crate::offers::invoice_request::InvoiceRequest
			public func getNonce() -> Bindings.Nonce {
				// return value (do some wrapping)
				let returnValue = Bindings.Nonce(
					cType: self.cType!.nonce, instantiationContext: "OffersContext.swift::\(#function):\(#line)",
					anchor: self)

				return returnValue
			}

			/// Authentication code for the [`PaymentId`], which should be checked when the context is
			/// used with an [`InvoiceError`].
			///
			/// [`InvoiceError`]: crate::offers::invoice_error::InvoiceError
			///
			/// Note that this (or a relevant inner pointer) may be NULL or all-0s to represent None
			public func getHmac() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					cType: self.cType!.hmac, instantiationContext: "OffersContext.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}


		}


		///
		internal typealias OffersContext_LDKInboundPayment_Body = InboundPayment


		///
		public class InboundPayment: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKOffersContext_LDKInboundPayment_Body?

			internal init(cType: LDKOffersContext_LDKInboundPayment_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKOffersContext_LDKInboundPayment_Body, instantiationContext: String, anchor: NativeTypeWrapper
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKOffersContext_LDKInboundPayment_Body, instantiationContext: String, anchor: NativeTypeWrapper,
				dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// The same payment hash as [`Bolt12Invoice::payment_hash`].
			///
			/// [`Bolt12Invoice::payment_hash`]: crate::offers::invoice::Bolt12Invoice::payment_hash
			public func getPaymentHash() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					cType: self.cType!.payment_hash, instantiationContext: "OffersContext.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}


		}


	}

}
