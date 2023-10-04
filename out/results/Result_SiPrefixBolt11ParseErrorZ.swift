#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A CResult_SiPrefixBolt11ParseErrorZ represents the result of a fallible operation,
/// containing a crate::lightning_invoice::SiPrefix on success and a crate::lightning_invoice::Bolt11ParseError on failure.
/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
public typealias Result_SiPrefixBolt11ParseErrorZ = Bindings.Result_SiPrefixBolt11ParseErrorZ

extension Bindings {

	/// A CResult_SiPrefixBolt11ParseErrorZ represents the result of a fallible operation,
	/// containing a crate::lightning_invoice::SiPrefix on success and a crate::lightning_invoice::Bolt11ParseError on failure.
	/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
	public class Result_SiPrefixBolt11ParseErrorZ: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKCResult_SiPrefixBolt11ParseErrorZ?

		internal init(cType: LDKCResult_SiPrefixBolt11ParseErrorZ, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(
			cType: LDKCResult_SiPrefixBolt11ParseErrorZ, instantiationContext: String, anchor: NativeTypeWrapper
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKCResult_SiPrefixBolt11ParseErrorZ, instantiationContext: String, anchor: NativeTypeWrapper,
			dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Creates a new CResult_SiPrefixBolt11ParseErrorZ in the success state.
		public class func initWithOk(o: SiPrefix) -> Result_SiPrefixBolt11ParseErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult = CResult_SiPrefixBolt11ParseErrorZ_ok(o.getCValue())

			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_SiPrefixBolt11ParseErrorZ(
				cType: nativeCallResult,
				instantiationContext: "Result_SiPrefixBolt11ParseErrorZ.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Creates a new CResult_SiPrefixBolt11ParseErrorZ in the error state.
		public class func initWithErr(e: Bolt11ParseError) -> Result_SiPrefixBolt11ParseErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult = CResult_SiPrefixBolt11ParseErrorZ_err(e.danglingClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_SiPrefixBolt11ParseErrorZ(
				cType: nativeCallResult,
				instantiationContext: "Result_SiPrefixBolt11ParseErrorZ.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Frees any resources used by the CResult_SiPrefixBolt11ParseErrorZ.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = CResult_SiPrefixBolt11ParseErrorZ_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a new CResult_SiPrefixBolt11ParseErrorZ which has the same data as `orig`
		/// but with all dynamically-allocated buffers duplicated in new buffers.
		internal func clone() -> Result_SiPrefixBolt11ParseErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) {
					(origPointer: UnsafePointer<LDKCResult_SiPrefixBolt11ParseErrorZ>) in
					CResult_SiPrefixBolt11ParseErrorZ_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_SiPrefixBolt11ParseErrorZ(
				cType: nativeCallResult,
				instantiationContext: "Result_SiPrefixBolt11ParseErrorZ.swift::\(#function):\(#line)")


			return returnValue
		}


		public func isOk() -> Bool {
			return self.cType?.result_ok == true
		}


		public func getError() -> Bolt11ParseError? {
			if self.cType?.result_ok == false {
				return Bolt11ParseError(
					cType: self.cType!.contents.err.pointee,
					instantiationContext: "Result_SiPrefixBolt11ParseErrorZ.swift::\(#function):\(#line)", anchor: self)
			}
			return nil
		}


		public func getValue() -> SiPrefix? {
			if self.cType?.result_ok == true {
				return SiPrefix(value: self.cType!.contents.result.pointee)
			}
			return nil
		}


		internal func danglingClone() -> Result_SiPrefixBolt11ParseErrorZ {
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
						"Freeing Result_SiPrefixBolt11ParseErrorZ \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Result_SiPrefixBolt11ParseErrorZ \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}

}
