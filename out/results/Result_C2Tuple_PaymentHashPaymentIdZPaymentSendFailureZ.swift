#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A CResult_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ represents the result of a fallible operation,
/// containing a crate::c_types::derived::C2Tuple_PaymentHashPaymentIdZ on success and a crate::lightning::ln::outbound_payment::PaymentSendFailure on failure.
/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
public typealias Result_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ = Bindings
	.Result_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ

extension Bindings {

	/// A CResult_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ represents the result of a fallible operation,
	/// containing a crate::c_types::derived::C2Tuple_PaymentHashPaymentIdZ on success and a crate::lightning::ln::outbound_payment::PaymentSendFailure on failure.
	/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
	public class Result_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKCResult_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ?

		internal init(cType: LDKCResult_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ, instantiationContext: String)
		{
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(
			cType: LDKCResult_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ, instantiationContext: String,
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
			cType: LDKCResult_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ, instantiationContext: String,
			anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Creates a new CResult_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ in the success state.
		public class func initWithOk(o: ([UInt8], [UInt8])) -> Result_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ {
			// native call variable prep

			let oTuple = Tuple_PaymentHashPaymentIdZ(
				tuple: o,
				instantiationContext:
					"Result_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult = CResult_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ_ok(oTuple.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ(
				cType: nativeCallResult,
				instantiationContext:
					"Result_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Creates a new CResult_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ in the error state.
		public class func initWithErr(e: PaymentSendFailure) -> Result_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ
		{
			// native call variable prep


			// native method call
			let nativeCallResult = CResult_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ_err(
				e.danglingClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ(
				cType: nativeCallResult,
				instantiationContext:
					"Result_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Frees any resources used by the CResult_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = CResult_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a new CResult_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ which has the same data as `orig`
		/// but with all dynamically-allocated buffers duplicated in new buffers.
		internal func clone() -> Result_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) {
					(origPointer: UnsafePointer<LDKCResult_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ>) in
					CResult_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ(
				cType: nativeCallResult,
				instantiationContext:
					"Result_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ.swift::\(#function):\(#line)")


			return returnValue
		}


		public func isOk() -> Bool {
			return self.cType?.result_ok == true
		}


		public func getError() -> PaymentSendFailure? {
			if self.cType?.result_ok == false {
				return PaymentSendFailure(
					cType: self.cType!.contents.err.pointee,
					instantiationContext:
						"Result_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ.swift::\(#function):\(#line)",
					anchor: self)
			}
			return nil
		}


		public func getValue() -> ([UInt8], [UInt8])? {
			if self.cType?.result_ok == true {
				return Tuple_PaymentHashPaymentIdZ(
					cType: self.cType!.contents.result.pointee,
					instantiationContext:
						"Result_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()
			}
			return nil
		}


		internal func danglingClone() -> Result_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ {
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
						"Freeing Result_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Result_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}

}
