import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


///
public typealias Bolt12PaymentError = Bindings.Bolt12PaymentError

extension Bindings {

	/// An error when attempting to pay a [`Bolt12Invoice`].
	public class Bolt12PaymentError: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKBolt12PaymentError?

		internal init(cType: LDKBolt12PaymentError, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKBolt12PaymentError, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKBolt12PaymentError, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		public enum Bolt12PaymentErrorType {

			/// The invoice was not requested.
			case UnexpectedInvoice

			/// Payment for an invoice with the corresponding [`PaymentId`] was already initiated.
			case DuplicateInvoice

			/// The invoice was valid for the corresponding [`PaymentId`], but required unknown features.
			case UnknownRequiredFeatures

			/// The invoice was valid for the corresponding [`PaymentId`], but sending the payment failed.
			case SendingFailed

		}

		public func getValueType() -> Bolt12PaymentErrorType {
			switch self.cType!.tag {
				case LDKBolt12PaymentError_UnexpectedInvoice:
					return .UnexpectedInvoice

				case LDKBolt12PaymentError_DuplicateInvoice:
					return .DuplicateInvoice

				case LDKBolt12PaymentError_UnknownRequiredFeatures:
					return .UnknownRequiredFeatures

				case LDKBolt12PaymentError_SendingFailed:
					return .SendingFailed

				default:
					Bindings.print("Error: Invalid value type for Bolt12PaymentError! Aborting.", severity: .ERROR)
					abort()
			}

		}


		/// Frees any resources used by the Bolt12PaymentError
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = Bolt12PaymentError_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the Bolt12PaymentError
		internal func clone() -> Bolt12PaymentError {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKBolt12PaymentError>) in
					Bolt12PaymentError_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Bolt12PaymentError(
				cType: nativeCallResult, instantiationContext: "Bolt12PaymentError.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new UnexpectedInvoice-variant Bolt12PaymentError
		public class func initWithUnexpectedInvoice() -> Bolt12PaymentError {
			// native call variable prep


			// native method call
			let nativeCallResult = Bolt12PaymentError_unexpected_invoice()

			// cleanup


			// return value (do some wrapping)
			let returnValue = Bolt12PaymentError(
				cType: nativeCallResult, instantiationContext: "Bolt12PaymentError.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new DuplicateInvoice-variant Bolt12PaymentError
		public class func initWithDuplicateInvoice() -> Bolt12PaymentError {
			// native call variable prep


			// native method call
			let nativeCallResult = Bolt12PaymentError_duplicate_invoice()

			// cleanup


			// return value (do some wrapping)
			let returnValue = Bolt12PaymentError(
				cType: nativeCallResult, instantiationContext: "Bolt12PaymentError.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new UnknownRequiredFeatures-variant Bolt12PaymentError
		public class func initWithUnknownRequiredFeatures() -> Bolt12PaymentError {
			// native call variable prep


			// native method call
			let nativeCallResult = Bolt12PaymentError_unknown_required_features()

			// cleanup


			// return value (do some wrapping)
			let returnValue = Bolt12PaymentError(
				cType: nativeCallResult, instantiationContext: "Bolt12PaymentError.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Utility method to constructs a new SendingFailed-variant Bolt12PaymentError
		public class func initWithSendingFailed(a: RetryableSendFailure) -> Bolt12PaymentError {
			// native call variable prep


			// native method call
			let nativeCallResult = Bolt12PaymentError_sending_failed(a.getCValue())

			// cleanup


			// return value (do some wrapping)
			let returnValue = Bolt12PaymentError(
				cType: nativeCallResult, instantiationContext: "Bolt12PaymentError.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Checks if two Bolt12PaymentErrors contain equal inner contents.
		/// This ignores pointers and is_owned flags and looks at the values in fields.
		public class func eq(a: Bolt12PaymentError, b: Bolt12PaymentError) -> Bool {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKBolt12PaymentError>) in

					withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKBolt12PaymentError>) in
						Bolt12PaymentError_eq(aPointer, bPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}


		public func getValueAsSendingFailed() -> RetryableSendFailure? {
			if self.cType?.tag != LDKBolt12PaymentError_SendingFailed {
				return nil
			}

			return RetryableSendFailure(value: self.cType!.sending_failed)
		}


		internal func danglingClone() -> Bolt12PaymentError {
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
						"Freeing Bolt12PaymentError \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Bolt12PaymentError \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}

}
