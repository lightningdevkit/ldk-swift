#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A CResult_PrivateRouteCreationErrorZ represents the result of a fallible operation,
/// containing a crate::lightning_invoice::PrivateRoute on success and a crate::lightning_invoice::CreationError on failure.
/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
public typealias Result_PrivateRouteCreationErrorZ = Bindings.Result_PrivateRouteCreationErrorZ

extension Bindings {

	/// A CResult_PrivateRouteCreationErrorZ represents the result of a fallible operation,
	/// containing a crate::lightning_invoice::PrivateRoute on success and a crate::lightning_invoice::CreationError on failure.
	/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
	public class Result_PrivateRouteCreationErrorZ: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKCResult_PrivateRouteCreationErrorZ?

		internal init(cType: LDKCResult_PrivateRouteCreationErrorZ, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(
			cType: LDKCResult_PrivateRouteCreationErrorZ, instantiationContext: String, anchor: NativeTypeWrapper
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKCResult_PrivateRouteCreationErrorZ, instantiationContext: String, anchor: NativeTypeWrapper,
			dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Creates a new CResult_PrivateRouteCreationErrorZ in the success state.
		public class func initWithOk(o: PrivateRoute) -> Result_PrivateRouteCreationErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult = CResult_PrivateRouteCreationErrorZ_ok(o.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_PrivateRouteCreationErrorZ(
				cType: nativeCallResult,
				instantiationContext: "Result_PrivateRouteCreationErrorZ.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Creates a new CResult_PrivateRouteCreationErrorZ in the error state.
		public class func initWithErr(e: CreationError) -> Result_PrivateRouteCreationErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult = CResult_PrivateRouteCreationErrorZ_err(e.getCValue())

			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_PrivateRouteCreationErrorZ(
				cType: nativeCallResult,
				instantiationContext: "Result_PrivateRouteCreationErrorZ.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Frees any resources used by the CResult_PrivateRouteCreationErrorZ.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = CResult_PrivateRouteCreationErrorZ_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a new CResult_PrivateRouteCreationErrorZ which has the same data as `orig`
		/// but with all dynamically-allocated buffers duplicated in new buffers.
		internal func clone() -> Result_PrivateRouteCreationErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) {
					(origPointer: UnsafePointer<LDKCResult_PrivateRouteCreationErrorZ>) in
					CResult_PrivateRouteCreationErrorZ_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_PrivateRouteCreationErrorZ(
				cType: nativeCallResult,
				instantiationContext: "Result_PrivateRouteCreationErrorZ.swift::\(#function):\(#line)")


			return returnValue
		}


		public func isOk() -> Bool {
			return self.cType?.result_ok == true
		}


		public func getError() -> CreationError? {
			if self.cType?.result_ok == false {
				return CreationError(value: self.cType!.contents.err.pointee)
			}
			return nil
		}


		public func getValue() -> PrivateRoute? {
			if self.cType?.result_ok == true {
				return PrivateRoute(
					cType: self.cType!.contents.result.pointee,
					instantiationContext: "Result_PrivateRouteCreationErrorZ.swift::\(#function):\(#line)", anchor: self
				)
			}
			return nil
		}


		internal func dangle(_ shouldDangle: Bool = true) -> Result_PrivateRouteCreationErrorZ {
			self.dangling = shouldDangle
			return self
		}

		internal func dangleRecursively() -> Result_PrivateRouteCreationErrorZ {
			self.dangling = true
			for currentAnchor in self.anchors {
				currentAnchor.dangleRecursively()
			}
			return self
		}


		internal func danglingClone() -> Result_PrivateRouteCreationErrorZ {
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
						"Freeing Result_PrivateRouteCreationErrorZ \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Result_PrivateRouteCreationErrorZ \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}

}
