import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


///
public typealias OffersMessage = Bindings.OffersMessage

extension Bindings {

	/// Possible BOLT 12 Offers messages sent and received via an [`OnionMessage`].
	///
	/// [`OnionMessage`]: crate::ln::msgs::OnionMessage
	public class OffersMessage: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKOffersMessage?

		internal init(cType: LDKOffersMessage, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKOffersMessage, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKOffersMessage, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		public enum OffersMessageType {

			/// A request for a [`Bolt12Invoice`] for a particular [`Offer`].
			///
			/// [`Offer`]: crate::offers::offer::Offer
			case InvoiceRequest

			/// A [`Bolt12Invoice`] sent in response to an [`InvoiceRequest`] or a [`Refund`].
			///
			/// [`Refund`]: crate::offers::refund::Refund
			case Invoice

			/// An error from handling an [`OffersMessage`].
			case InvoiceError

		}

		public func getValueType() -> OffersMessageType {
			switch self.cType!.tag {
				case LDKOffersMessage_InvoiceRequest:
					return .InvoiceRequest

				case LDKOffersMessage_Invoice:
					return .Invoice

				case LDKOffersMessage_InvoiceError:
					return .InvoiceError

				default:
					Bindings.print("Error: Invalid value type for OffersMessage! Aborting.", severity: .ERROR)
					abort()
			}

		}


		/// Frees any resources used by the OffersMessage
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = OffersMessage_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the OffersMessage
		internal func clone() -> OffersMessage {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKOffersMessage>) in
					OffersMessage_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = OffersMessage(
				cType: nativeCallResult, instantiationContext: "OffersMessage.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new InvoiceRequest-variant OffersMessage
		public class func initWithInvoiceRequest(a: Bindings.InvoiceRequest) -> OffersMessage {
			// native call variable prep


			// native method call
			let nativeCallResult = OffersMessage_invoice_request(a.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = OffersMessage(
				cType: nativeCallResult, instantiationContext: "OffersMessage.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new Invoice-variant OffersMessage
		public class func initWithInvoice(a: Bindings.Bolt12Invoice) -> OffersMessage {
			// native call variable prep


			// native method call
			let nativeCallResult = OffersMessage_invoice(a.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = OffersMessage(
				cType: nativeCallResult, instantiationContext: "OffersMessage.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new InvoiceError-variant OffersMessage
		public class func initWithInvoiceError(a: Bindings.InvoiceError) -> OffersMessage {
			// native call variable prep


			// native method call
			let nativeCallResult = OffersMessage_invoice_error(a.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = OffersMessage(
				cType: nativeCallResult, instantiationContext: "OffersMessage.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Returns whether `tlv_type` corresponds to a TLV record for Offers.
		public class func isKnownType(tlvType: UInt64) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult = OffersMessage_is_known_type(tlvType)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new OnionMessageContents which calls the relevant methods on this_arg.
		/// This copies the `inner` pointer in this_arg and thus the returned OnionMessageContents must be freed before this_arg is
		public func asOnionMessageContents() -> Bindings.OnionMessageContents {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKOffersMessage>) in
					OffersMessage_as_OnionMessageContents(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = NativelyImplementedOnionMessageContents(
				cType: nativeCallResult, instantiationContext: "OffersMessage.swift::\(#function):\(#line)",
				anchor: self)


			return returnValue
		}

		/// Serialize the OffersMessage object into a byte array which can be read by OffersMessage_read
		public func write() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKOffersMessage>) in
					OffersMessage_write(objPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: nativeCallResult, instantiationContext: "OffersMessage.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle(false).getValue()


			return returnValue
		}

		/// Read a OffersMessage from a byte array, created by OffersMessage_write
		public class func read(ser: [UInt8], argA: UInt64, argB: Bindings.Logger) -> Result_OffersMessageDecodeErrorZ {
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "OffersMessage.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: argB.activate().cType!) { (argBPointer: UnsafePointer<LDKLogger>) in
					OffersMessage_read(serPrimitiveWrapper.cType!, argA, argBPointer)
				}


			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_OffersMessageDecodeErrorZ(
				cType: nativeCallResult, instantiationContext: "OffersMessage.swift::\(#function):\(#line)")


			return returnValue
		}


		public func getValueAsInvoiceRequest() -> Bindings.InvoiceRequest? {
			if self.cType?.tag != LDKOffersMessage_InvoiceRequest {
				return nil
			}

			return InvoiceRequest(
				cType: self.cType!.invoice_request, instantiationContext: "OffersMessage.swift::\(#function):\(#line)",
				anchor: self)
		}

		public func getValueAsInvoice() -> Bindings.Bolt12Invoice? {
			if self.cType?.tag != LDKOffersMessage_Invoice {
				return nil
			}

			return Bolt12Invoice(
				cType: self.cType!.invoice, instantiationContext: "OffersMessage.swift::\(#function):\(#line)",
				anchor: self)
		}

		public func getValueAsInvoiceError() -> Bindings.InvoiceError? {
			if self.cType?.tag != LDKOffersMessage_InvoiceError {
				return nil
			}

			return InvoiceError(
				cType: self.cType!.invoice_error, instantiationContext: "OffersMessage.swift::\(#function):\(#line)",
				anchor: self)
		}


		internal func danglingClone() -> OffersMessage {
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
						"Freeing OffersMessage \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing OffersMessage \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}

}
