#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A CResult_PaymentPreimageAPIErrorZ represents the result of a fallible operation,
/// containing a crate::c_types::ThirtyTwoBytes on success and a crate::lightning::util::errors::APIError on failure.
/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
public typealias Result_PaymentPreimageAPIErrorZ = Bindings.Result_PaymentPreimageAPIErrorZ

extension Bindings {

	/// A CResult_PaymentPreimageAPIErrorZ represents the result of a fallible operation,
	/// containing a crate::c_types::ThirtyTwoBytes on success and a crate::lightning::util::errors::APIError on failure.
	/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
	public class Result_PaymentPreimageAPIErrorZ: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKCResult_PaymentPreimageAPIErrorZ?

		internal init(cType: LDKCResult_PaymentPreimageAPIErrorZ, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(
			cType: LDKCResult_PaymentPreimageAPIErrorZ, instantiationContext: String, anchor: NativeTypeWrapper
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKCResult_PaymentPreimageAPIErrorZ, instantiationContext: String, anchor: NativeTypeWrapper,
			dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Creates a new CResult_PaymentPreimageAPIErrorZ in the success state.
		public class func initWithOk(o: [UInt8]) -> Result_PaymentPreimageAPIErrorZ {
			// native call variable prep

			let oPrimitiveWrapper = ThirtyTwoBytes(
				value: o, instantiationContext: "Result_PaymentPreimageAPIErrorZ.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = CResult_PaymentPreimageAPIErrorZ_ok(oPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			oPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_PaymentPreimageAPIErrorZ(
				cType: nativeCallResult,
				instantiationContext: "Result_PaymentPreimageAPIErrorZ.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Creates a new CResult_PaymentPreimageAPIErrorZ in the error state.
		public class func initWithErr(e: APIError) -> Result_PaymentPreimageAPIErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult = CResult_PaymentPreimageAPIErrorZ_err(e.danglingClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_PaymentPreimageAPIErrorZ(
				cType: nativeCallResult,
				instantiationContext: "Result_PaymentPreimageAPIErrorZ.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Frees any resources used by the CResult_PaymentPreimageAPIErrorZ.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = CResult_PaymentPreimageAPIErrorZ_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a new CResult_PaymentPreimageAPIErrorZ which has the same data as `orig`
		/// but with all dynamically-allocated buffers duplicated in new buffers.
		internal func clone() -> Result_PaymentPreimageAPIErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) {
					(origPointer: UnsafePointer<LDKCResult_PaymentPreimageAPIErrorZ>) in
					CResult_PaymentPreimageAPIErrorZ_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_PaymentPreimageAPIErrorZ(
				cType: nativeCallResult,
				instantiationContext: "Result_PaymentPreimageAPIErrorZ.swift::\(#function):\(#line)")


			return returnValue
		}


		public func isOk() -> Bool {
			return self.cType?.result_ok == true
		}


		public func getError() -> APIError? {
			if self.cType?.result_ok == false {
				return APIError(
					cType: self.cType!.contents.err.pointee,
					instantiationContext: "Result_PaymentPreimageAPIErrorZ.swift::\(#function):\(#line)", anchor: self)
			}
			return nil
		}


		public func getValue() -> [UInt8]? {
			if self.cType?.result_ok == true {
				return ThirtyTwoBytes(
					cType: self.cType!.contents.result.pointee,
					instantiationContext: "Result_PaymentPreimageAPIErrorZ.swift::\(#function):\(#line)", anchor: self
				)
				.getValue()
			}
			return nil
		}


		internal func danglingClone() -> Result_PaymentPreimageAPIErrorZ {
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
						"Freeing Result_PaymentPreimageAPIErrorZ \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Result_PaymentPreimageAPIErrorZ \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}

}
