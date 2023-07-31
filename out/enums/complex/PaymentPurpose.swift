import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


///
public typealias PaymentPurpose = Bindings.PaymentPurpose

extension Bindings {

	/// Some information provided on receipt of payment depends on whether the payment received is a
	/// spontaneous payment or a \"conventional\" lightning payment that's paying an invoice.
	public class PaymentPurpose: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKPaymentPurpose?

		internal init(cType: LDKPaymentPurpose, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKPaymentPurpose, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKPaymentPurpose, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		public enum PaymentPurposeType {

			/// Information for receiving a payment that we generated an invoice for.
			case InvoicePayment

			/// Because this is a spontaneous payment, the payer generated their own preimage rather than us
			/// (the payee) providing a preimage.
			case SpontaneousPayment

		}

		public func getValueType() -> PaymentPurposeType {
			switch self.cType!.tag {
				case LDKPaymentPurpose_InvoicePayment:
					return .InvoicePayment

				case LDKPaymentPurpose_SpontaneousPayment:
					return .SpontaneousPayment

				default:
					Bindings.print("Error: Invalid value type for PaymentPurpose! Aborting.", severity: .ERROR)
					abort()
			}

		}


		/// Frees any resources used by the PaymentPurpose
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = PaymentPurpose_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the PaymentPurpose
		internal func clone() -> PaymentPurpose {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKPaymentPurpose>) in
					PaymentPurpose_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PaymentPurpose(
				cType: nativeCallResult, instantiationContext: "PaymentPurpose.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new InvoicePayment-variant PaymentPurpose
		public class func initWithInvoicePayment(paymentPreimage: [UInt8]?, paymentSecret: [UInt8]) -> PaymentPurpose {
			// native call variable prep

			let paymentPreimageOption = Option_PaymentPreimageZ(
				some: paymentPreimage, instantiationContext: "PaymentPurpose.swift::\(#function):\(#line)"
			)
			.danglingClone()

			let paymentSecretPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentSecret, instantiationContext: "PaymentPurpose.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = PaymentPurpose_invoice_payment(
				paymentPreimageOption.cType!, paymentSecretPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			paymentSecretPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = PaymentPurpose(
				cType: nativeCallResult, instantiationContext: "PaymentPurpose.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new SpontaneousPayment-variant PaymentPurpose
		public class func initWithSpontaneousPayment(a: [UInt8]) -> PaymentPurpose {
			// native call variable prep

			let aPrimitiveWrapper = ThirtyTwoBytes(
				value: a, instantiationContext: "PaymentPurpose.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = PaymentPurpose_spontaneous_payment(aPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			aPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = PaymentPurpose(
				cType: nativeCallResult, instantiationContext: "PaymentPurpose.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Checks if two PaymentPurposes contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		public class func eq(a: PaymentPurpose, b: PaymentPurpose) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKPaymentPurpose>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKPaymentPurpose>) in
						PaymentPurpose_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Serialize the PaymentPurpose object into a byte array which can be read by PaymentPurpose_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKPaymentPurpose>) in
					PaymentPurpose_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "PaymentPurpose.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a PaymentPurpose from a byte array, created by PaymentPurpose_write
		public class func read(ser: [UInt8]) -> Result_PaymentPurposeDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "PaymentPurpose.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = PaymentPurpose_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_PaymentPurposeDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "PaymentPurpose.swift::\(#function):\(#line)")


			return returnValue
		}


		public func getValueAsInvoicePayment() -> InvoicePayment? {
			if self.cType?.tag != LDKPaymentPurpose_InvoicePayment {
				return nil
			}

			return PaymentPurpose_LDKInvoicePayment_Body(
				cType: self.cType!.invoice_payment, instantiationContext: "PaymentPurpose.swift::\(#function):\(#line)",
				anchor: self)
		}

		public func getValueAsSpontaneousPayment() -> [UInt8]? {
			if self.cType?.tag != LDKPaymentPurpose_SpontaneousPayment {
				return nil
			}

			return ThirtyTwoBytes(
				cType: self.cType!.spontaneous_payment,
				instantiationContext: "PaymentPurpose.swift::\(#function):\(#line)", anchor: self
			)
			.getValue()
		}


		internal func danglingClone() -> PaymentPurpose {
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
						"Freeing PaymentPurpose \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing PaymentPurpose \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


		///
		internal typealias PaymentPurpose_LDKInvoicePayment_Body = InvoicePayment


		///
		public class InvoicePayment: NativeTypeWrapper {


			/// Set to false to suppress an individual type's deinit log statements.
			/// Only applicable when log threshold is set to `.Debug`.
			public static var enableDeinitLogging = true

			/// Set to true to suspend the freeing of this type's associated Rust memory.
			/// Should only ever be used for debugging purposes, and will likely be
			/// deprecated soon.
			public static var suspendFreedom = false

			private static var instanceCounter: UInt = 0
			internal let instanceNumber: UInt

			internal var cType: LDKPaymentPurpose_LDKInvoicePayment_Body?

			internal init(cType: LDKPaymentPurpose_LDKInvoicePayment_Body, instantiationContext: String) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			}

			internal init(
				cType: LDKPaymentPurpose_LDKInvoicePayment_Body, instantiationContext: String, anchor: NativeTypeWrapper
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = true
				try! self.addAnchor(anchor: anchor)
			}

			internal init(
				cType: LDKPaymentPurpose_LDKInvoicePayment_Body, instantiationContext: String,
				anchor: NativeTypeWrapper, dangle: Bool = false
			) {
				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				self.cType = cType

				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				self.dangling = dangle
				try! self.addAnchor(anchor: anchor)
			}


			/// The preimage to the payment_hash, if the payment hash (and secret) were fetched via
			/// [`ChannelManager::create_inbound_payment`]. If provided, this can be handed directly to
			/// [`ChannelManager::claim_funds`].
			///
			/// [`ChannelManager::create_inbound_payment`]: crate::ln::channelmanager::ChannelManager::create_inbound_payment
			/// [`ChannelManager::claim_funds`]: crate::ln::channelmanager::ChannelManager::claim_funds
			public func getPaymentPreimage() -> [UInt8]? {
				// return value (do some wrapping)
				let returnValue = Option_PaymentPreimageZ(
					cType: self.cType!.payment_preimage,
					instantiationContext: "PaymentPurpose.swift::\(#function):\(#line)", anchor: self
				)
				.getValue()

				return returnValue
			}

			/// The \"payment secret\". This authenticates the sender to the recipient, preventing a
			/// number of deanonymization attacks during the routing process.
			/// It is provided here for your reference, however its accuracy is enforced directly by
			/// [`ChannelManager`] using the values you previously provided to
			/// [`ChannelManager::create_inbound_payment`] or
			/// [`ChannelManager::create_inbound_payment_for_hash`].
			///
			/// [`ChannelManager`]: crate::ln::channelmanager::ChannelManager
			/// [`ChannelManager::create_inbound_payment`]: crate::ln::channelmanager::ChannelManager::create_inbound_payment
			/// [`ChannelManager::create_inbound_payment_for_hash`]: crate::ln::channelmanager::ChannelManager::create_inbound_payment_for_hash
			public func getPaymentSecret() -> [UInt8] {
				// return value (do some wrapping)
				let returnValue = ThirtyTwoBytes(
					cType: self.cType!.payment_secret,
					instantiationContext: "PaymentPurpose.swift::\(#function):\(#line)", anchor: self
				)
				.getValue()

				return returnValue
			}


		}


	}

}
