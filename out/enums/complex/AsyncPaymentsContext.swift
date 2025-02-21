import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


///
public typealias AsyncPaymentsContext = Bindings.AsyncPaymentsContext

extension Bindings {

	/// Contains data specific to an [`AsyncPaymentsMessage`].
	///
	/// [`AsyncPaymentsMessage`]: crate::onion_message::async_payments::AsyncPaymentsMessage
	public class AsyncPaymentsContext: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKAsyncPaymentsContext?

		internal init(cType: LDKAsyncPaymentsContext, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKAsyncPaymentsContext, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKAsyncPaymentsContext, instantiationContext: String, anchor: NativeTypeWrapper,
			dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		public enum AsyncPaymentsContextType {

			/// Context contained within the reply [`BlindedMessagePath`] we put in outbound
			/// [`HeldHtlcAvailable`] messages, provided back to us in corresponding [`ReleaseHeldHtlc`]
			/// messages.
			///
			/// [`HeldHtlcAvailable`]: crate::onion_message::async_payments::HeldHtlcAvailable
			/// [`ReleaseHeldHtlc`]: crate::onion_message::async_payments::ReleaseHeldHtlc
			case OutboundPayment

		}

		public func getValueType() -> AsyncPaymentsContextType {
			switch self.cType!.tag {
				case LDKAsyncPaymentsContext_OutboundPayment:
					return .OutboundPayment

				default:
					Bindings.print("Error: Invalid value type for AsyncPaymentsContext! Aborting.", severity: .ERROR)
					abort()
			}

		}


		/// Frees any resources used by the AsyncPaymentsContext
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = AsyncPaymentsContext_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the AsyncPaymentsContext
		internal func clone() -> AsyncPaymentsContext {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKAsyncPaymentsContext>) in
					AsyncPaymentsContext_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = AsyncPaymentsContext(
				cType: nativeCallResult, instantiationContext: "AsyncPaymentsContext.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new OutboundPayment-variant AsyncPaymentsContext
		public class func initWithOutboundPayment(paymentId: [UInt8], nonce: Bindings.Nonce, hmac: [UInt8])
			-> AsyncPaymentsContext
		{
			// native call variable prep

			let paymentIdPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentId, instantiationContext: "AsyncPaymentsContext.swift::\(#function):\(#line)")

			let hmacPrimitiveWrapper = ThirtyTwoBytes(
				value: hmac, instantiationContext: "AsyncPaymentsContext.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = AsyncPaymentsContext_outbound_payment(
				paymentIdPrimitiveWrapper.cType!, nonce.dynamicallyDangledClone().cType!, hmacPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			paymentIdPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			hmacPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = AsyncPaymentsContext(
				cType: nativeCallResult, instantiationContext: "AsyncPaymentsContext.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Serialize the AsyncPaymentsContext object into a byte array which can be read by AsyncPaymentsContext_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKAsyncPaymentsContext>) in
					AsyncPaymentsContext_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "AsyncPaymentsContext.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a AsyncPaymentsContext from a byte array, created by AsyncPaymentsContext_write
		public class func read(ser: [UInt8]) -> Result_AsyncPaymentsContextDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "AsyncPaymentsContext.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = AsyncPaymentsContext_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_AsyncPaymentsContextDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "AsyncPaymentsContext.swift::\(#function):\(#line)")


			return returnValue
		}


		public func getValueAsOutboundPayment() -> OutboundPayment? {
			if self.cType?.tag != LDKAsyncPaymentsContext_OutboundPayment {
				return nil
			}

			return AsyncPaymentsContext_LDKOutboundPayment_Body(
				cType: self.cType!.outbound_payment,
				instantiationContext: "AsyncPaymentsContext.swift::\(#function):\(#line)", anchor: self)
		}


		internal func danglingClone() -> AsyncPaymentsContext {
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
						"Freeing AsyncPaymentsContext \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing AsyncPaymentsContext \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


		///
		internal typealias AsyncPaymentsContext_LDKOutboundPayment_Body = OutboundPayment


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

			internal var cType: LDKAsyncPaymentsContext_LDKOutboundPayment_Body?

			internal init(cType: LDKAsyncPaymentsContext_LDKOutboundPayment_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKAsyncPaymentsContext_LDKOutboundPayment_Body, instantiationContext: String,
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
				cType: LDKAsyncPaymentsContext_LDKOutboundPayment_Body, instantiationContext: String,
				anchor: NativeTypeWrapper, dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// ID used when payment to the originating [`Offer`] was initiated. Useful for us to identify
			/// which of our pending outbound payments should be released to its often-offline payee.
			///
			/// [`Offer`]: crate::offers::offer::Offer
			public func getPaymentId() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					cType: self.cType!.payment_id,
					instantiationContext: "AsyncPaymentsContext.swift::\(#function):\(#line)", anchor: self
				)
				.getValue()

				return returnValue
			}

			/// A nonce used for authenticating that a [`ReleaseHeldHtlc`] message is valid for a preceding
			/// [`HeldHtlcAvailable`] message.
			///
			/// [`ReleaseHeldHtlc`]: crate::onion_message::async_payments::ReleaseHeldHtlc
			/// [`HeldHtlcAvailable`]: crate::onion_message::async_payments::HeldHtlcAvailable
			public func getNonce() -> Bindings.Nonce {
				// return value (do some wrapping)
				let returnValue = Bindings.Nonce(
					cType: self.cType!.nonce, instantiationContext: "AsyncPaymentsContext.swift::\(#function):\(#line)",
					anchor: self)

				return returnValue
			}

			/// Authentication code for the [`PaymentId`].
			///
			/// Prevents the recipient from being able to deanonymize us by creating a blinded path to us
			/// containing the expected [`PaymentId`].
			public func getHmac() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					cType: self.cType!.hmac, instantiationContext: "AsyncPaymentsContext.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()

				return returnValue
			}


		}


	}

}
