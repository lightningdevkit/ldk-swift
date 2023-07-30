#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A CResult_SignedRawInvoiceParseErrorZ represents the result of a fallible operation,
/// containing a crate::lightning_invoice::SignedRawInvoice on success and a crate::lightning_invoice::ParseError on failure.
/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
public typealias Result_SignedRawInvoiceParseErrorZ = Bindings.Result_SignedRawInvoiceParseErrorZ

extension Bindings {

	/// A CResult_SignedRawInvoiceParseErrorZ represents the result of a fallible operation,
	/// containing a crate::lightning_invoice::SignedRawInvoice on success and a crate::lightning_invoice::ParseError on failure.
	/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
	public class Result_SignedRawInvoiceParseErrorZ: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKCResult_SignedRawInvoiceParseErrorZ?

		internal init(cType: LDKCResult_SignedRawInvoiceParseErrorZ, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(
			cType: LDKCResult_SignedRawInvoiceParseErrorZ, instantiationContext: String, anchor: NativeTypeWrapper
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKCResult_SignedRawInvoiceParseErrorZ, instantiationContext: String, anchor: NativeTypeWrapper,
			dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Creates a new CResult_SignedRawInvoiceParseErrorZ in the success state.
		public class func initWithOk(o: SignedRawInvoice) -> Result_SignedRawInvoiceParseErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult = CResult_SignedRawInvoiceParseErrorZ_ok(o.dynamicallyDangledClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_SignedRawInvoiceParseErrorZ(
				cType: nativeCallResult,
				instantiationContext: "Result_SignedRawInvoiceParseErrorZ.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Creates a new CResult_SignedRawInvoiceParseErrorZ in the error state.
		public class func initWithErr(e: ParseError) -> Result_SignedRawInvoiceParseErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult = CResult_SignedRawInvoiceParseErrorZ_err(e.danglingClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_SignedRawInvoiceParseErrorZ(
				cType: nativeCallResult,
				instantiationContext: "Result_SignedRawInvoiceParseErrorZ.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Frees any resources used by the CResult_SignedRawInvoiceParseErrorZ.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = CResult_SignedRawInvoiceParseErrorZ_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a new CResult_SignedRawInvoiceParseErrorZ which has the same data as `orig`
		/// but with all dynamically-allocated buffers duplicated in new buffers.
		internal func clone() -> Result_SignedRawInvoiceParseErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) {
					(origPointer: UnsafePointer<LDKCResult_SignedRawInvoiceParseErrorZ>) in
					CResult_SignedRawInvoiceParseErrorZ_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_SignedRawInvoiceParseErrorZ(
				cType: nativeCallResult,
				instantiationContext: "Result_SignedRawInvoiceParseErrorZ.swift::\(#function):\(#line)")


			return returnValue
		}


		public func isOk() -> Bool {
			return self.cType?.result_ok == true
		}


		public func getError() -> ParseError? {
			if self.cType?.result_ok == false {
				return ParseError(
					cType: self.cType!.contents.err.pointee,
					instantiationContext: "Result_SignedRawInvoiceParseErrorZ.swift::\(#function):\(#line)",
					anchor: self)
			}
			return nil
		}


		public func getValue() -> SignedRawInvoice? {
			if self.cType?.result_ok == true {
				return SignedRawInvoice(
					cType: self.cType!.contents.result.pointee,
					instantiationContext: "Result_SignedRawInvoiceParseErrorZ.swift::\(#function):\(#line)",
					anchor: self)
			}
			return nil
		}


		internal func dangle(_ shouldDangle: Bool = true) -> Result_SignedRawInvoiceParseErrorZ {
			self.dangling = shouldDangle
			return self
		}

		internal func dangleRecursively() -> Result_SignedRawInvoiceParseErrorZ {
			self.dangling = true
			for currentAnchor in self.anchors {
				currentAnchor.dangleRecursively()
			}
			return self
		}


		internal func danglingClone() -> Result_SignedRawInvoiceParseErrorZ {
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
						"Freeing Result_SignedRawInvoiceParseErrorZ \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Result_SignedRawInvoiceParseErrorZ \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}

}
