#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A CResult_RecoverableSignatureNoneZ represents the result of a fallible operation,
/// containing a crate::c_types::RecoverableSignature on success and a () on failure.
/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
public typealias Result_RecoverableSignatureNoneZ = Bindings.Result_RecoverableSignatureNoneZ

extension Bindings {

	/// A CResult_RecoverableSignatureNoneZ represents the result of a fallible operation,
	/// containing a crate::c_types::RecoverableSignature on success and a () on failure.
	/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
	public class Result_RecoverableSignatureNoneZ: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKCResult_RecoverableSignatureNoneZ?

		internal init(cType: LDKCResult_RecoverableSignatureNoneZ, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(
			cType: LDKCResult_RecoverableSignatureNoneZ, instantiationContext: String, anchor: NativeTypeWrapper
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKCResult_RecoverableSignatureNoneZ, instantiationContext: String, anchor: NativeTypeWrapper,
			dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Creates a new CResult_RecoverableSignatureNoneZ in the success state.
		public class func initWithOk(o: [UInt8]) -> Result_RecoverableSignatureNoneZ {
			// native call variable prep

			let oPrimitiveWrapper = RecoverableSignature(
				value: o, instantiationContext: "Result_RecoverableSignatureNoneZ.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = CResult_RecoverableSignatureNoneZ_ok(oPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			oPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_RecoverableSignatureNoneZ(
				cType: nativeCallResult,
				instantiationContext: "Result_RecoverableSignatureNoneZ.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Creates a new CResult_RecoverableSignatureNoneZ in the error state.
		public class func initWithErr() -> Result_RecoverableSignatureNoneZ {
			// native call variable prep


			// native method call
			let nativeCallResult = CResult_RecoverableSignatureNoneZ_err()

			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_RecoverableSignatureNoneZ(
				cType: nativeCallResult,
				instantiationContext: "Result_RecoverableSignatureNoneZ.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Frees any resources used by the CResult_RecoverableSignatureNoneZ.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = CResult_RecoverableSignatureNoneZ_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a new CResult_RecoverableSignatureNoneZ which has the same data as `orig`
		/// but with all dynamically-allocated buffers duplicated in new buffers.
		internal func clone() -> Result_RecoverableSignatureNoneZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) {
					(origPointer: UnsafePointer<LDKCResult_RecoverableSignatureNoneZ>) in
					CResult_RecoverableSignatureNoneZ_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_RecoverableSignatureNoneZ(
				cType: nativeCallResult,
				instantiationContext: "Result_RecoverableSignatureNoneZ.swift::\(#function):\(#line)")


			return returnValue
		}


		public func isOk() -> Bool {
			return self.cType?.result_ok == true
		}

		/*
					public func getError() -> Void? {
						if self.cType?.result_ok == false {
							return self.cType!.contents.err.pointee
						}
						return nil
					}
					*/


		public func getValue() -> [UInt8]? {
			if self.cType?.result_ok == true {
				return RecoverableSignature(
					cType: self.cType!.contents.result.pointee,
					instantiationContext: "Result_RecoverableSignatureNoneZ.swift::\(#function):\(#line)", anchor: self
				)
				.getValue()
			}
			return nil
		}


		internal func dangle(_ shouldDangle: Bool = true) -> Result_RecoverableSignatureNoneZ {
			self.dangling = shouldDangle
			return self
		}


		internal func danglingClone() -> Result_RecoverableSignatureNoneZ {
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
						"Freeing Result_RecoverableSignatureNoneZ \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Result_RecoverableSignatureNoneZ \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}

}
