#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A CResult_C2Tuple_PublicKeyOnionMessageZSendErrorZ represents the result of a fallible operation,
/// containing a crate::c_types::derived::C2Tuple_PublicKeyOnionMessageZ on success and a crate::lightning::onion_message::messenger::SendError on failure.
/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
public typealias Result_C2Tuple_PublicKeyOnionMessageZSendErrorZ = Bindings
	.Result_C2Tuple_PublicKeyOnionMessageZSendErrorZ

extension Bindings {

	/// A CResult_C2Tuple_PublicKeyOnionMessageZSendErrorZ represents the result of a fallible operation,
	/// containing a crate::c_types::derived::C2Tuple_PublicKeyOnionMessageZ on success and a crate::lightning::onion_message::messenger::SendError on failure.
	/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
	public class Result_C2Tuple_PublicKeyOnionMessageZSendErrorZ: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKCResult_C2Tuple_PublicKeyOnionMessageZSendErrorZ?

		internal init(cType: LDKCResult_C2Tuple_PublicKeyOnionMessageZSendErrorZ, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(
			cType: LDKCResult_C2Tuple_PublicKeyOnionMessageZSendErrorZ, instantiationContext: String,
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
			cType: LDKCResult_C2Tuple_PublicKeyOnionMessageZSendErrorZ, instantiationContext: String,
			anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Creates a new CResult_C2Tuple_PublicKeyOnionMessageZSendErrorZ in the success state.
		public class func initWithOk(o: ([UInt8], OnionMessage)) -> Result_C2Tuple_PublicKeyOnionMessageZSendErrorZ {
			// native call variable prep

			let oTuple = Tuple_PublicKeyOnionMessageZ(
				tuple: o,
				instantiationContext: "Result_C2Tuple_PublicKeyOnionMessageZSendErrorZ.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult = CResult_C2Tuple_PublicKeyOnionMessageZSendErrorZ_ok(oTuple.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_C2Tuple_PublicKeyOnionMessageZSendErrorZ(
				cType: nativeCallResult,
				instantiationContext: "Result_C2Tuple_PublicKeyOnionMessageZSendErrorZ.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Creates a new CResult_C2Tuple_PublicKeyOnionMessageZSendErrorZ in the error state.
		public class func initWithErr(e: SendError) -> Result_C2Tuple_PublicKeyOnionMessageZSendErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult = CResult_C2Tuple_PublicKeyOnionMessageZSendErrorZ_err(e.danglingClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_C2Tuple_PublicKeyOnionMessageZSendErrorZ(
				cType: nativeCallResult,
				instantiationContext: "Result_C2Tuple_PublicKeyOnionMessageZSendErrorZ.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Frees any resources used by the CResult_C2Tuple_PublicKeyOnionMessageZSendErrorZ.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = CResult_C2Tuple_PublicKeyOnionMessageZSendErrorZ_free(self.cType!)

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
					instantiationContext:
						"Result_C2Tuple_PublicKeyOnionMessageZSendErrorZ.swift::\(#function):\(#line)", anchor: self)
			}
			return nil
		}


		public func getValue() -> ([UInt8], OnionMessage)? {
			if self.cType?.result_ok == true {
				return Tuple_PublicKeyOnionMessageZ(
					cType: self.cType!.contents.result.pointee,
					instantiationContext:
						"Result_C2Tuple_PublicKeyOnionMessageZSendErrorZ.swift::\(#function):\(#line)", anchor: self
				)
				.getValue()
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
						"Freeing Result_C2Tuple_PublicKeyOnionMessageZSendErrorZ \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Result_C2Tuple_PublicKeyOnionMessageZSendErrorZ \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}

}
