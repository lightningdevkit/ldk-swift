#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A CResult_ChannelFeaturesDecodeErrorZ represents the result of a fallible operation,
/// containing a crate::lightning::ln::features::ChannelFeatures on success and a crate::lightning::ln::msgs::DecodeError on failure.
/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
public typealias Result_ChannelFeaturesDecodeErrorZ = Bindings.Result_ChannelFeaturesDecodeErrorZ

extension Bindings {

	/// A CResult_ChannelFeaturesDecodeErrorZ represents the result of a fallible operation,
	/// containing a crate::lightning::ln::features::ChannelFeatures on success and a crate::lightning::ln::msgs::DecodeError on failure.
	/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
	public class Result_ChannelFeaturesDecodeErrorZ: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKCResult_ChannelFeaturesDecodeErrorZ?

		internal init(cType: LDKCResult_ChannelFeaturesDecodeErrorZ, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(
			cType: LDKCResult_ChannelFeaturesDecodeErrorZ, instantiationContext: String, anchor: NativeTypeWrapper
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKCResult_ChannelFeaturesDecodeErrorZ, instantiationContext: String, anchor: NativeTypeWrapper,
			dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Creates a new CResult_ChannelFeaturesDecodeErrorZ in the success state.
		public class func initWithOk(o: ChannelFeatures) -> Result_ChannelFeaturesDecodeErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult = CResult_ChannelFeaturesDecodeErrorZ_ok(o.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_ChannelFeaturesDecodeErrorZ(
				cType: nativeCallResult,
				instantiationContext: "Result_ChannelFeaturesDecodeErrorZ.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Creates a new CResult_ChannelFeaturesDecodeErrorZ in the error state.
		public class func initWithErr(e: DecodeError) -> Result_ChannelFeaturesDecodeErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult = CResult_ChannelFeaturesDecodeErrorZ_err(e.danglingClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_ChannelFeaturesDecodeErrorZ(
				cType: nativeCallResult,
				instantiationContext: "Result_ChannelFeaturesDecodeErrorZ.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Frees any resources used by the CResult_ChannelFeaturesDecodeErrorZ.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = CResult_ChannelFeaturesDecodeErrorZ_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a new CResult_ChannelFeaturesDecodeErrorZ which has the same data as `orig`
		/// but with all dynamically-allocated buffers duplicated in new buffers.
		internal func clone() -> Result_ChannelFeaturesDecodeErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) {
					(origPointer: UnsafePointer<LDKCResult_ChannelFeaturesDecodeErrorZ>) in
					CResult_ChannelFeaturesDecodeErrorZ_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_ChannelFeaturesDecodeErrorZ(
				cType: nativeCallResult,
				instantiationContext: "Result_ChannelFeaturesDecodeErrorZ.swift::\(#function):\(#line)")


			return returnValue
		}


		public func isOk() -> Bool {
			return self.cType?.result_ok == true
		}


		public func getError() -> DecodeError? {
			if self.cType?.result_ok == false {
				return DecodeError(
					cType: self.cType!.contents.err.pointee,
					instantiationContext: "Result_ChannelFeaturesDecodeErrorZ.swift::\(#function):\(#line)",
					anchor: self)
			}
			return nil
		}


		public func getValue() -> ChannelFeatures? {
			if self.cType?.result_ok == true {
				return ChannelFeatures(
					cType: self.cType!.contents.result.pointee,
					instantiationContext: "Result_ChannelFeaturesDecodeErrorZ.swift::\(#function):\(#line)",
					anchor: self)
			}
			return nil
		}


		internal func dangle(_ shouldDangle: Bool = true) -> Result_ChannelFeaturesDecodeErrorZ {
			self.dangling = shouldDangle
			return self
		}


		internal func danglingClone() -> Result_ChannelFeaturesDecodeErrorZ {
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
						"Freeing Result_ChannelFeaturesDecodeErrorZ \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Result_ChannelFeaturesDecodeErrorZ \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}

}
