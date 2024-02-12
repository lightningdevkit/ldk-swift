#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A CResult_FinalOnionHopDataDecodeErrorZ represents the result of a fallible operation,
/// containing a crate::lightning::ln::msgs::FinalOnionHopData on success and a crate::lightning::ln::msgs::DecodeError on failure.
/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
public typealias Result_FinalOnionHopDataDecodeErrorZ = Bindings.Result_FinalOnionHopDataDecodeErrorZ

extension Bindings {

	/// A CResult_FinalOnionHopDataDecodeErrorZ represents the result of a fallible operation,
	/// containing a crate::lightning::ln::msgs::FinalOnionHopData on success and a crate::lightning::ln::msgs::DecodeError on failure.
	/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
	public class Result_FinalOnionHopDataDecodeErrorZ: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKCResult_FinalOnionHopDataDecodeErrorZ?

		internal init(cType: LDKCResult_FinalOnionHopDataDecodeErrorZ, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(
			cType: LDKCResult_FinalOnionHopDataDecodeErrorZ, instantiationContext: String, anchor: NativeTypeWrapper
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKCResult_FinalOnionHopDataDecodeErrorZ, instantiationContext: String, anchor: NativeTypeWrapper,
			dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Creates a new CResult_FinalOnionHopDataDecodeErrorZ in the success state.
		public class func initWithOk(o: FinalOnionHopData) -> Result_FinalOnionHopDataDecodeErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult = CResult_FinalOnionHopDataDecodeErrorZ_ok(o.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_FinalOnionHopDataDecodeErrorZ(
				cType: nativeCallResult,
				instantiationContext: "Result_FinalOnionHopDataDecodeErrorZ.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Creates a new CResult_FinalOnionHopDataDecodeErrorZ in the error state.
		public class func initWithErr(e: DecodeError) -> Result_FinalOnionHopDataDecodeErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult = CResult_FinalOnionHopDataDecodeErrorZ_err(e.danglingClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_FinalOnionHopDataDecodeErrorZ(
				cType: nativeCallResult,
				instantiationContext: "Result_FinalOnionHopDataDecodeErrorZ.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Frees any resources used by the CResult_FinalOnionHopDataDecodeErrorZ.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = CResult_FinalOnionHopDataDecodeErrorZ_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a new CResult_FinalOnionHopDataDecodeErrorZ which has the same data as `orig`
		/// but with all dynamically-allocated buffers duplicated in new buffers.
		internal func clone() -> Result_FinalOnionHopDataDecodeErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) {
					(origPointer: UnsafePointer<LDKCResult_FinalOnionHopDataDecodeErrorZ>) in
					CResult_FinalOnionHopDataDecodeErrorZ_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_FinalOnionHopDataDecodeErrorZ(
				cType: nativeCallResult,
				instantiationContext: "Result_FinalOnionHopDataDecodeErrorZ.swift::\(#function):\(#line)")


			return returnValue
		}


		public func isOk() -> Bool {
			return self.cType?.result_ok == true
		}


		public func getError() -> DecodeError? {
			if self.cType?.result_ok == false {
				return DecodeError(
					cType: self.cType!.contents.err.pointee,
					instantiationContext: "Result_FinalOnionHopDataDecodeErrorZ.swift::\(#function):\(#line)",
					anchor: self)
			}
			return nil
		}


		public func getValue() -> FinalOnionHopData? {
			if self.cType?.result_ok == true {
				return FinalOnionHopData(
					cType: self.cType!.contents.result.pointee,
					instantiationContext: "Result_FinalOnionHopDataDecodeErrorZ.swift::\(#function):\(#line)",
					anchor: self)
			}
			return nil
		}


		internal func danglingClone() -> Result_FinalOnionHopDataDecodeErrorZ {
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
						"Freeing Result_FinalOnionHopDataDecodeErrorZ \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Result_FinalOnionHopDataDecodeErrorZ \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}

}
