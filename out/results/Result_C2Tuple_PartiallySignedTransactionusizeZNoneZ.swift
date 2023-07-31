#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A CResult_C2Tuple_PartiallySignedTransactionusizeZNoneZ represents the result of a fallible operation,
/// containing a crate::c_types::derived::C2Tuple_PartiallySignedTransactionusizeZ on success and a () on failure.
/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
public typealias Result_C2Tuple_PartiallySignedTransactionusizeZNoneZ = Bindings
	.Result_C2Tuple_PartiallySignedTransactionusizeZNoneZ

extension Bindings {

	/// A CResult_C2Tuple_PartiallySignedTransactionusizeZNoneZ represents the result of a fallible operation,
	/// containing a crate::c_types::derived::C2Tuple_PartiallySignedTransactionusizeZ on success and a () on failure.
	/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
	public class Result_C2Tuple_PartiallySignedTransactionusizeZNoneZ: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKCResult_C2Tuple_PartiallySignedTransactionusizeZNoneZ?

		internal init(cType: LDKCResult_C2Tuple_PartiallySignedTransactionusizeZNoneZ, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(
			cType: LDKCResult_C2Tuple_PartiallySignedTransactionusizeZNoneZ, instantiationContext: String,
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
			cType: LDKCResult_C2Tuple_PartiallySignedTransactionusizeZNoneZ, instantiationContext: String,
			anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Creates a new CResult_C2Tuple_PartiallySignedTransactionusizeZNoneZ in the success state.
		public class func initWithOk(o: ([UInt8], UInt)) -> Result_C2Tuple_PartiallySignedTransactionusizeZNoneZ {
			// native call variable prep

			let oTuple = Tuple_PartiallySignedTransactionusizeZ(
				tuple: o,
				instantiationContext:
					"Result_C2Tuple_PartiallySignedTransactionusizeZNoneZ.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult = CResult_C2Tuple_PartiallySignedTransactionusizeZNoneZ_ok(oTuple.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_C2Tuple_PartiallySignedTransactionusizeZNoneZ(
				cType: nativeCallResult,
				instantiationContext:
					"Result_C2Tuple_PartiallySignedTransactionusizeZNoneZ.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Creates a new CResult_C2Tuple_PartiallySignedTransactionusizeZNoneZ in the error state.
		public class func initWithErr() -> Result_C2Tuple_PartiallySignedTransactionusizeZNoneZ {
			// native call variable prep


			// native method call
			let nativeCallResult = CResult_C2Tuple_PartiallySignedTransactionusizeZNoneZ_err()

			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_C2Tuple_PartiallySignedTransactionusizeZNoneZ(
				cType: nativeCallResult,
				instantiationContext:
					"Result_C2Tuple_PartiallySignedTransactionusizeZNoneZ.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Frees any resources used by the CResult_C2Tuple_PartiallySignedTransactionusizeZNoneZ.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = CResult_C2Tuple_PartiallySignedTransactionusizeZNoneZ_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a new CResult_C2Tuple_PartiallySignedTransactionusizeZNoneZ which has the same data as `orig`
		/// but with all dynamically-allocated buffers duplicated in new buffers.
		internal func clone() -> Result_C2Tuple_PartiallySignedTransactionusizeZNoneZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) {
					(origPointer: UnsafePointer<LDKCResult_C2Tuple_PartiallySignedTransactionusizeZNoneZ>) in
					CResult_C2Tuple_PartiallySignedTransactionusizeZNoneZ_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_C2Tuple_PartiallySignedTransactionusizeZNoneZ(
				cType: nativeCallResult,
				instantiationContext:
					"Result_C2Tuple_PartiallySignedTransactionusizeZNoneZ.swift::\(#function):\(#line)")


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


		public func getValue() -> ([UInt8], UInt)? {
			if self.cType?.result_ok == true {
				return Tuple_PartiallySignedTransactionusizeZ(
					cType: self.cType!.contents.result.pointee,
					instantiationContext:
						"Result_C2Tuple_PartiallySignedTransactionusizeZNoneZ.swift::\(#function):\(#line)",
					anchor: self
				)
				.getValue()
			}
			return nil
		}


		internal func danglingClone() -> Result_C2Tuple_PartiallySignedTransactionusizeZNoneZ {
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
						"Freeing Result_C2Tuple_PartiallySignedTransactionusizeZNoneZ \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Result_C2Tuple_PartiallySignedTransactionusizeZNoneZ \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}

}
