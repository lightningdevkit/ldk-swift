#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A CResult_SendSuccessSendErrorZ represents the result of a fallible operation,
/// containing a crate::lightning::onion_message::messenger::SendSuccess on success and a crate::lightning::onion_message::messenger::SendError on failure.
/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
public typealias Result_SendSuccessSendErrorZ = Bindings.Result_SendSuccessSendErrorZ

extension Bindings {

	/// A CResult_SendSuccessSendErrorZ represents the result of a fallible operation,
	/// containing a crate::lightning::onion_message::messenger::SendSuccess on success and a crate::lightning::onion_message::messenger::SendError on failure.
	/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
	public class Result_SendSuccessSendErrorZ: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKCResult_SendSuccessSendErrorZ?

		internal init(cType: LDKCResult_SendSuccessSendErrorZ, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKCResult_SendSuccessSendErrorZ, instantiationContext: String, anchor: NativeTypeWrapper)
		{
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKCResult_SendSuccessSendErrorZ, instantiationContext: String, anchor: NativeTypeWrapper,
			dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Creates a new CResult_SendSuccessSendErrorZ in the success state.
		public class func initWithOk(o: SendSuccess) -> Result_SendSuccessSendErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult = CResult_SendSuccessSendErrorZ_ok(o.danglingClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_SendSuccessSendErrorZ(
				cType: nativeCallResult,
				instantiationContext: "Result_SendSuccessSendErrorZ.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Creates a new CResult_SendSuccessSendErrorZ in the error state.
		public class func initWithErr(e: SendError) -> Result_SendSuccessSendErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult = CResult_SendSuccessSendErrorZ_err(e.danglingClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_SendSuccessSendErrorZ(
				cType: nativeCallResult,
				instantiationContext: "Result_SendSuccessSendErrorZ.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Frees any resources used by the CResult_SendSuccessSendErrorZ.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = CResult_SendSuccessSendErrorZ_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}


		public func isOk() -> Bool {
			return self.cType?.result_ok == true
		}


		public func getError() -> SendError? {
			if self.cType?.result_ok == false {
				return SendError(
					cType: self.cType!.contents.err.pointee,
					instantiationContext: "Result_SendSuccessSendErrorZ.swift::\(#function):\(#line)", anchor: self)
			}
			return nil
		}


		public func getValue() -> SendSuccess? {
			if self.cType?.result_ok == true {
				return SendSuccess(
					cType: self.cType!.contents.result.pointee,
					instantiationContext: "Result_SendSuccessSendErrorZ.swift::\(#function):\(#line)", anchor: self)
			}
			return nil
		}


		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print(
						"Freeing Result_SendSuccessSendErrorZ \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Result_SendSuccessSendErrorZ \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}

}
