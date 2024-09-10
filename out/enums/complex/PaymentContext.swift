import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


///
public typealias PaymentContext = Bindings.PaymentContext

extension Bindings {

	/// The context of an inbound payment, which is included in a [`BlindedPaymentPath`] via
	/// [`ReceiveTlvs`] and surfaced in [`PaymentPurpose`].
	///
	/// [`PaymentPurpose`]: crate::events::PaymentPurpose
	public class PaymentContext: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKPaymentContext?

		internal init(cType: LDKPaymentContext, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKPaymentContext, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKPaymentContext, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		public enum PaymentContextType {

			/// The payment context was unknown.
			case Unknown

			/// The payment was made for an invoice requested from a BOLT 12 [`Offer`].
			///
			/// [`Offer`]: crate::offers::offer::Offer
			case Bolt12Offer

			/// The payment was made for an invoice sent for a BOLT 12 [`Refund`].
			///
			/// [`Refund`]: crate::offers::refund::Refund
			case Bolt12Refund

		}

		public func getValueType() -> PaymentContextType {
			switch self.cType!.tag {
				case LDKPaymentContext_Unknown:
					return .Unknown

				case LDKPaymentContext_Bolt12Offer:
					return .Bolt12Offer

				case LDKPaymentContext_Bolt12Refund:
					return .Bolt12Refund

				default:
					Bindings.print("Error: Invalid value type for PaymentContext! Aborting.", severity: .ERROR)
					abort()
			}

		}


		/// Frees any resources used by the PaymentContext
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = PaymentContext_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the PaymentContext
		internal func clone() -> PaymentContext {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKPaymentContext>) in
					PaymentContext_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = PaymentContext(
				cType: nativeCallResult, instantiationContext: "PaymentContext.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new Unknown-variant PaymentContext
		public class func initWithUnknown(a: Bindings.UnknownPaymentContext) -> PaymentContext {
			// native call variable prep


			// native method call
			let nativeCallResult = PaymentContext_unknown(a.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = PaymentContext(
				cType: nativeCallResult, instantiationContext: "PaymentContext.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new Bolt12Offer-variant PaymentContext
		public class func initWithBolt12Offer(a: Bindings.Bolt12OfferContext) -> PaymentContext {
			// native call variable prep


			// native method call
			let nativeCallResult = PaymentContext_bolt12_offer(a.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = PaymentContext(
				cType: nativeCallResult, instantiationContext: "PaymentContext.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new Bolt12Refund-variant PaymentContext
		public class func initWithBolt12Refund(a: Bindings.Bolt12RefundContext) -> PaymentContext {
			// native call variable prep


			// native method call
			let nativeCallResult = PaymentContext_bolt12_refund(a.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = PaymentContext(
				cType: nativeCallResult, instantiationContext: "PaymentContext.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Checks if two PaymentContexts contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		public class func eq(a: PaymentContext, b: PaymentContext) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKPaymentContext>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKPaymentContext>) in
						PaymentContext_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Serialize the PaymentContext object into a byte array which can be read by PaymentContext_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKPaymentContext>) in
					PaymentContext_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "PaymentContext.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a PaymentContext from a byte array, created by PaymentContext_write
		public class func read(ser: [UInt8]) -> Result_PaymentContextDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "PaymentContext.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = PaymentContext_read(serPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_PaymentContextDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "PaymentContext.swift::\(#function):\(#line)")


			return returnValue
		}


		public func getValueAsUnknown() -> Bindings.UnknownPaymentContext? {
			if self.cType?.tag != LDKPaymentContext_Unknown {
				return nil
			}

			return UnknownPaymentContext(
				cType: self.cType!.unknown, instantiationContext: "PaymentContext.swift::\(#function):\(#line)",
				anchor: self)
		}

		public func getValueAsBolt12Offer() -> Bindings.Bolt12OfferContext? {
			if self.cType?.tag != LDKPaymentContext_Bolt12Offer {
				return nil
			}

			return Bolt12OfferContext(
				cType: self.cType!.bolt12_offer, instantiationContext: "PaymentContext.swift::\(#function):\(#line)",
				anchor: self)
		}

		public func getValueAsBolt12Refund() -> Bindings.Bolt12RefundContext? {
			if self.cType?.tag != LDKPaymentContext_Bolt12Refund {
				return nil
			}

			return Bolt12RefundContext(
				cType: self.cType!.bolt12_refund, instantiationContext: "PaymentContext.swift::\(#function):\(#line)",
				anchor: self)
		}


		internal func danglingClone() -> PaymentContext {
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
						"Freeing PaymentContext \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing PaymentContext \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}

}
