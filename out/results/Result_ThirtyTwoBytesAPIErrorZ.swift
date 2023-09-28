#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A CResult_ThirtyTwoBytesAPIErrorZ represents the result of a fallible operation,
/// containing a crate::c_types::ThirtyTwoBytes on success and a crate::lightning::util::errors::APIError on failure.
/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
public typealias Result_ThirtyTwoBytesAPIErrorZ = Bindings.Result_ThirtyTwoBytesAPIErrorZ

extension Bindings {

	/// A CResult_ThirtyTwoBytesAPIErrorZ represents the result of a fallible operation,
	/// containing a crate::c_types::ThirtyTwoBytes on success and a crate::lightning::util::errors::APIError on failure.
	/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
	public class Result_ThirtyTwoBytesAPIErrorZ: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKCResult_ThirtyTwoBytesAPIErrorZ?

		internal init(cType: LDKCResult_ThirtyTwoBytesAPIErrorZ, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(
			cType: LDKCResult_ThirtyTwoBytesAPIErrorZ, instantiationContext: String, anchor: NativeTypeWrapper
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKCResult_ThirtyTwoBytesAPIErrorZ, instantiationContext: String, anchor: NativeTypeWrapper,
			dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Creates a new CResult_ThirtyTwoBytesAPIErrorZ in the success state.
		public class func initWithOk(o: [UInt8]) -> Result_ThirtyTwoBytesAPIErrorZ {
			// native call variable prep

			let oPrimitiveWrapper = ThirtyTwoBytes(
				value: o, instantiationContext: "Result_ThirtyTwoBytesAPIErrorZ.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = CResult_ThirtyTwoBytesAPIErrorZ_ok(oPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			oPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_ThirtyTwoBytesAPIErrorZ(
				cType: nativeCallResult,
				instantiationContext: "Result_ThirtyTwoBytesAPIErrorZ.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Creates a new CResult_ThirtyTwoBytesAPIErrorZ in the error state.
		public class func initWithErr(e: APIError) -> Result_ThirtyTwoBytesAPIErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult = CResult_ThirtyTwoBytesAPIErrorZ_err(e.danglingClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_ThirtyTwoBytesAPIErrorZ(
				cType: nativeCallResult,
				instantiationContext: "Result_ThirtyTwoBytesAPIErrorZ.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Frees any resources used by the CResult_ThirtyTwoBytesAPIErrorZ.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = CResult_ThirtyTwoBytesAPIErrorZ_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a new CResult_ThirtyTwoBytesAPIErrorZ which has the same data as `orig`
		/// but with all dynamically-allocated buffers duplicated in new buffers.
		internal func clone() -> Result_ThirtyTwoBytesAPIErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_ThirtyTwoBytesAPIErrorZ>) in
					CResult_ThirtyTwoBytesAPIErrorZ_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_ThirtyTwoBytesAPIErrorZ(
				cType: nativeCallResult,
				instantiationContext: "Result_ThirtyTwoBytesAPIErrorZ.swift::\(#function):\(#line)")


			return returnValue
		}


		public func isOk() -> Bool {
			return self.cType?.result_ok == true
		}


		public func getError() -> APIError? {
			if self.cType?.result_ok == false {
				return APIError(
					cType: self.cType!.contents.err.pointee,
					instantiationContext: "Result_ThirtyTwoBytesAPIErrorZ.swift::\(#function):\(#line)", anchor: self)
			}
			return nil
		}


		public func getValue() -> [UInt8]? {
			if self.cType?.result_ok == true {
				return ThirtyTwoBytes(
					cType: self.cType!.contents.result.pointee,
					instantiationContext: "Result_ThirtyTwoBytesAPIErrorZ.swift::\(#function):\(#line)", anchor: self
				)
				.getValue()
			}
			return nil
		}


		internal func danglingClone() -> Result_ThirtyTwoBytesAPIErrorZ {
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
						"Freeing Result_ThirtyTwoBytesAPIErrorZ \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Result_ThirtyTwoBytesAPIErrorZ \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}

}
