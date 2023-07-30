#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A CResult_ClosingSignedFeeRangeDecodeErrorZ represents the result of a fallible operation,
/// containing a crate::lightning::ln::msgs::ClosingSignedFeeRange on success and a crate::lightning::ln::msgs::DecodeError on failure.
/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
public typealias Result_ClosingSignedFeeRangeDecodeErrorZ = Bindings.Result_ClosingSignedFeeRangeDecodeErrorZ

extension Bindings {

	/// A CResult_ClosingSignedFeeRangeDecodeErrorZ represents the result of a fallible operation,
	/// containing a crate::lightning::ln::msgs::ClosingSignedFeeRange on success and a crate::lightning::ln::msgs::DecodeError on failure.
	/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
	public class Result_ClosingSignedFeeRangeDecodeErrorZ: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKCResult_ClosingSignedFeeRangeDecodeErrorZ?

		internal init(cType: LDKCResult_ClosingSignedFeeRangeDecodeErrorZ, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(
			cType: LDKCResult_ClosingSignedFeeRangeDecodeErrorZ, instantiationContext: String, anchor: NativeTypeWrapper
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKCResult_ClosingSignedFeeRangeDecodeErrorZ, instantiationContext: String,
			anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Creates a new CResult_ClosingSignedFeeRangeDecodeErrorZ in the success state.
		public class func initWithOk(o: ClosingSignedFeeRange) -> Result_ClosingSignedFeeRangeDecodeErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult = CResult_ClosingSignedFeeRangeDecodeErrorZ_ok(o.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_ClosingSignedFeeRangeDecodeErrorZ(
				cType: nativeCallResult,
				instantiationContext: "Result_ClosingSignedFeeRangeDecodeErrorZ.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Creates a new CResult_ClosingSignedFeeRangeDecodeErrorZ in the error state.
		public class func initWithErr(e: DecodeError) -> Result_ClosingSignedFeeRangeDecodeErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult = CResult_ClosingSignedFeeRangeDecodeErrorZ_err(e.danglingClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_ClosingSignedFeeRangeDecodeErrorZ(
				cType: nativeCallResult,
				instantiationContext: "Result_ClosingSignedFeeRangeDecodeErrorZ.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Frees any resources used by the CResult_ClosingSignedFeeRangeDecodeErrorZ.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = CResult_ClosingSignedFeeRangeDecodeErrorZ_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a new CResult_ClosingSignedFeeRangeDecodeErrorZ which has the same data as `orig`
		/// but with all dynamically-allocated buffers duplicated in new buffers.
		internal func clone() -> Result_ClosingSignedFeeRangeDecodeErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) {
					(origPointer: UnsafePointer<LDKCResult_ClosingSignedFeeRangeDecodeErrorZ>) in
					CResult_ClosingSignedFeeRangeDecodeErrorZ_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_ClosingSignedFeeRangeDecodeErrorZ(
				cType: nativeCallResult,
				instantiationContext: "Result_ClosingSignedFeeRangeDecodeErrorZ.swift::\(#function):\(#line)")


			return returnValue
		}


		public func isOk() -> Bool {
			return self.cType?.result_ok == true
		}


		public func getError() -> DecodeError? {
			if self.cType?.result_ok == false {
				return DecodeError(
					cType: self.cType!.contents.err.pointee,
					instantiationContext: "Result_ClosingSignedFeeRangeDecodeErrorZ.swift::\(#function):\(#line)",
					anchor: self)
			}
			return nil
		}


		public func getValue() -> ClosingSignedFeeRange? {
			if self.cType?.result_ok == true {
				return ClosingSignedFeeRange(
					cType: self.cType!.contents.result.pointee,
					instantiationContext: "Result_ClosingSignedFeeRangeDecodeErrorZ.swift::\(#function):\(#line)",
					anchor: self)
			}
			return nil
		}


		internal func dangle(_ shouldDangle: Bool = true) -> Result_ClosingSignedFeeRangeDecodeErrorZ {
			self.dangling = shouldDangle
			return self
		}

		internal func dangleRecursively() -> Result_ClosingSignedFeeRangeDecodeErrorZ {
			self.dangling = true
			for currentAnchor in self.anchors {
				currentAnchor.dangleRecursively()
			}
			return self
		}


		internal func danglingClone() -> Result_ClosingSignedFeeRangeDecodeErrorZ {
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
						"Freeing Result_ClosingSignedFeeRangeDecodeErrorZ \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Result_ClosingSignedFeeRangeDecodeErrorZ \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}

}
