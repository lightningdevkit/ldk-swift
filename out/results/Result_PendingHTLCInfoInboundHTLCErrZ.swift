#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A CResult_PendingHTLCInfoInboundHTLCErrZ represents the result of a fallible operation,
/// containing a crate::lightning::ln::channelmanager::PendingHTLCInfo on success and a crate::lightning::ln::onion_payment::InboundHTLCErr on failure.
/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
public typealias Result_PendingHTLCInfoInboundHTLCErrZ = Bindings.Result_PendingHTLCInfoInboundHTLCErrZ

extension Bindings {

	/// A CResult_PendingHTLCInfoInboundHTLCErrZ represents the result of a fallible operation,
	/// containing a crate::lightning::ln::channelmanager::PendingHTLCInfo on success and a crate::lightning::ln::onion_payment::InboundHTLCErr on failure.
	/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
	public class Result_PendingHTLCInfoInboundHTLCErrZ: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKCResult_PendingHTLCInfoInboundHTLCErrZ?

		internal init(cType: LDKCResult_PendingHTLCInfoInboundHTLCErrZ, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(
			cType: LDKCResult_PendingHTLCInfoInboundHTLCErrZ, instantiationContext: String, anchor: NativeTypeWrapper
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKCResult_PendingHTLCInfoInboundHTLCErrZ, instantiationContext: String, anchor: NativeTypeWrapper,
			dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Creates a new CResult_PendingHTLCInfoInboundHTLCErrZ in the success state.
		public class func initWithOk(o: PendingHTLCInfo) -> Result_PendingHTLCInfoInboundHTLCErrZ {
			// native call variable prep


			// native method call
			let nativeCallResult = CResult_PendingHTLCInfoInboundHTLCErrZ_ok(o.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_PendingHTLCInfoInboundHTLCErrZ(
				cType: nativeCallResult,
				instantiationContext: "Result_PendingHTLCInfoInboundHTLCErrZ.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Creates a new CResult_PendingHTLCInfoInboundHTLCErrZ in the error state.
		@available(
			*, deprecated,
			message: "This method passes the following non-cloneable, but freeable objects by value: `e`."
		)
		public class func initWithErr(e: InboundHTLCErr) -> Result_PendingHTLCInfoInboundHTLCErrZ {
			// native call variable prep


			// native method call
			let nativeCallResult = CResult_PendingHTLCInfoInboundHTLCErrZ_err(e.dangle().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_PendingHTLCInfoInboundHTLCErrZ(
				cType: nativeCallResult,
				instantiationContext: "Result_PendingHTLCInfoInboundHTLCErrZ.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Frees any resources used by the CResult_PendingHTLCInfoInboundHTLCErrZ.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = CResult_PendingHTLCInfoInboundHTLCErrZ_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}


		public func isOk() -> Bool {
			return self.cType?.result_ok == true
		}


		public func getError() -> InboundHTLCErr? {
			if self.cType?.result_ok == false {
				return InboundHTLCErr(
					cType: self.cType!.contents.err.pointee,
					instantiationContext: "Result_PendingHTLCInfoInboundHTLCErrZ.swift::\(#function):\(#line)",
					anchor: self)
			}
			return nil
		}


		public func getValue() -> PendingHTLCInfo? {
			if self.cType?.result_ok == true {
				return PendingHTLCInfo(
					cType: self.cType!.contents.result.pointee,
					instantiationContext: "Result_PendingHTLCInfoInboundHTLCErrZ.swift::\(#function):\(#line)",
					anchor: self)
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
						"Freeing Result_PendingHTLCInfoInboundHTLCErrZ \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Result_PendingHTLCInfoInboundHTLCErrZ \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}

}
