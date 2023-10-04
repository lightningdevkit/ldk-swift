#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A CResult_OpenChannelV2DecodeErrorZ represents the result of a fallible operation,
/// containing a crate::lightning::ln::msgs::OpenChannelV2 on success and a crate::lightning::ln::msgs::DecodeError on failure.
/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
public typealias Result_OpenChannelV2DecodeErrorZ = Bindings.Result_OpenChannelV2DecodeErrorZ

extension Bindings {

	/// A CResult_OpenChannelV2DecodeErrorZ represents the result of a fallible operation,
	/// containing a crate::lightning::ln::msgs::OpenChannelV2 on success and a crate::lightning::ln::msgs::DecodeError on failure.
	/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
	public class Result_OpenChannelV2DecodeErrorZ: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKCResult_OpenChannelV2DecodeErrorZ?

		internal init(cType: LDKCResult_OpenChannelV2DecodeErrorZ, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(
			cType: LDKCResult_OpenChannelV2DecodeErrorZ, instantiationContext: String, anchor: NativeTypeWrapper
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKCResult_OpenChannelV2DecodeErrorZ, instantiationContext: String, anchor: NativeTypeWrapper,
			dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Creates a new CResult_OpenChannelV2DecodeErrorZ in the success state.
		public class func initWithOk(o: OpenChannelV2) -> Result_OpenChannelV2DecodeErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult = CResult_OpenChannelV2DecodeErrorZ_ok(o.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_OpenChannelV2DecodeErrorZ(
				cType: nativeCallResult,
				instantiationContext: "Result_OpenChannelV2DecodeErrorZ.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Creates a new CResult_OpenChannelV2DecodeErrorZ in the error state.
		public class func initWithErr(e: DecodeError) -> Result_OpenChannelV2DecodeErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult = CResult_OpenChannelV2DecodeErrorZ_err(e.danglingClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_OpenChannelV2DecodeErrorZ(
				cType: nativeCallResult,
				instantiationContext: "Result_OpenChannelV2DecodeErrorZ.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Frees any resources used by the CResult_OpenChannelV2DecodeErrorZ.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = CResult_OpenChannelV2DecodeErrorZ_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a new CResult_OpenChannelV2DecodeErrorZ which has the same data as `orig`
		/// but with all dynamically-allocated buffers duplicated in new buffers.
		internal func clone() -> Result_OpenChannelV2DecodeErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) {
					(origPointer: UnsafePointer<LDKCResult_OpenChannelV2DecodeErrorZ>) in
					CResult_OpenChannelV2DecodeErrorZ_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_OpenChannelV2DecodeErrorZ(
				cType: nativeCallResult,
				instantiationContext: "Result_OpenChannelV2DecodeErrorZ.swift::\(#function):\(#line)")


			return returnValue
		}


		public func isOk() -> Bool {
			return self.cType?.result_ok == true
		}


		public func getError() -> DecodeError? {
			if self.cType?.result_ok == false {
				return DecodeError(
					cType: self.cType!.contents.err.pointee,
					instantiationContext: "Result_OpenChannelV2DecodeErrorZ.swift::\(#function):\(#line)", anchor: self)
			}
			return nil
		}


		public func getValue() -> OpenChannelV2? {
			if self.cType?.result_ok == true {
				return OpenChannelV2(
					cType: self.cType!.contents.result.pointee,
					instantiationContext: "Result_OpenChannelV2DecodeErrorZ.swift::\(#function):\(#line)", anchor: self)
			}
			return nil
		}


		internal func danglingClone() -> Result_OpenChannelV2DecodeErrorZ {
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
						"Freeing Result_OpenChannelV2DecodeErrorZ \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Result_OpenChannelV2DecodeErrorZ \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}

}
