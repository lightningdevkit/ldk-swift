#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A CResult_NonePaymentErrorZ represents the result of a fallible operation,
/// containing a () on success and a crate::lightning_invoice::payment::PaymentError on failure.
/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
public typealias Result_NonePaymentErrorZ = Bindings.Result_NonePaymentErrorZ

extension Bindings {

	/// A CResult_NonePaymentErrorZ represents the result of a fallible operation,
	/// containing a () on success and a crate::lightning_invoice::payment::PaymentError on failure.
	/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
	public class Result_NonePaymentErrorZ: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKCResult_NonePaymentErrorZ?

		internal init(cType: LDKCResult_NonePaymentErrorZ, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKCResult_NonePaymentErrorZ, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKCResult_NonePaymentErrorZ, instantiationContext: String, anchor: NativeTypeWrapper,
			dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Creates a new CResult_NonePaymentErrorZ in the success state.
		public class func initWithOk() -> Result_NonePaymentErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult = CResult_NonePaymentErrorZ_ok()

			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_NonePaymentErrorZ(
				cType: nativeCallResult, instantiationContext: "Result_NonePaymentErrorZ.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Creates a new CResult_NonePaymentErrorZ in the error state.
		public class func initWithErr(e: PaymentError) -> Result_NonePaymentErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult = CResult_NonePaymentErrorZ_err(e.danglingClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_NonePaymentErrorZ(
				cType: nativeCallResult, instantiationContext: "Result_NonePaymentErrorZ.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Frees any resources used by the CResult_NonePaymentErrorZ.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = CResult_NonePaymentErrorZ_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a new CResult_NonePaymentErrorZ which has the same data as `orig`
		/// but with all dynamically-allocated buffers duplicated in new buffers.
		internal func clone() -> Result_NonePaymentErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_NonePaymentErrorZ>) in
					CResult_NonePaymentErrorZ_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_NonePaymentErrorZ(
				cType: nativeCallResult, instantiationContext: "Result_NonePaymentErrorZ.swift::\(#function):\(#line)")


			return returnValue
		}


		public func isOk() -> Bool {
			return self.cType?.result_ok == true
		}


		public func getError() -> PaymentError? {
			if self.cType?.result_ok == false {
				return PaymentError(
					cType: self.cType!.contents.err.pointee,
					instantiationContext: "Result_NonePaymentErrorZ.swift::\(#function):\(#line)", anchor: self)
			}
			return nil
		}


		/*
					public func getValue() -> Void? {
						if self.cType?.result_ok == true {
							return self.cType!.contents.result.pointee
						}
						return nil
					}
					*/

		internal func dangle(_ shouldDangle: Bool = true) -> Result_NonePaymentErrorZ {
			self.dangling = shouldDangle
			return self
		}

		internal func dangleRecursively() -> Result_NonePaymentErrorZ {
			self.dangling = true
			for currentAnchor in self.anchors {
				currentAnchor.dangleRecursively()
			}
			return self
		}


		internal func danglingClone() -> Result_NonePaymentErrorZ {
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
						"Freeing Result_NonePaymentErrorZ \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Result_NonePaymentErrorZ \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}

}
