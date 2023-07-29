#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A CResult_TxOutUtxoLookupErrorZ represents the result of a fallible operation,
/// containing a crate::c_types::TxOut on success and a crate::lightning::routing::utxo::UtxoLookupError on failure.
/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
public typealias Result_TxOutUtxoLookupErrorZ = Bindings.Result_TxOutUtxoLookupErrorZ

extension Bindings {

	/// A CResult_TxOutUtxoLookupErrorZ represents the result of a fallible operation,
	/// containing a crate::c_types::TxOut on success and a crate::lightning::routing::utxo::UtxoLookupError on failure.
	/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
	public class Result_TxOutUtxoLookupErrorZ: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKCResult_TxOutUtxoLookupErrorZ?

		internal init(cType: LDKCResult_TxOutUtxoLookupErrorZ, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKCResult_TxOutUtxoLookupErrorZ, instantiationContext: String, anchor: NativeTypeWrapper)
		{
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKCResult_TxOutUtxoLookupErrorZ, instantiationContext: String, anchor: NativeTypeWrapper,
			dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Creates a new CResult_TxOutUtxoLookupErrorZ in the success state.
		public class func initWithOk(o: TxOut) -> Result_TxOutUtxoLookupErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult = CResult_TxOutUtxoLookupErrorZ_ok(o.danglingClone().cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_TxOutUtxoLookupErrorZ(
				cType: nativeCallResult,
				instantiationContext: "Result_TxOutUtxoLookupErrorZ.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Creates a new CResult_TxOutUtxoLookupErrorZ in the error state.
		public class func initWithErr(e: UtxoLookupError) -> Result_TxOutUtxoLookupErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult = CResult_TxOutUtxoLookupErrorZ_err(e.getCValue())

			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_TxOutUtxoLookupErrorZ(
				cType: nativeCallResult,
				instantiationContext: "Result_TxOutUtxoLookupErrorZ.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Frees any resources used by the CResult_TxOutUtxoLookupErrorZ.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = CResult_TxOutUtxoLookupErrorZ_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a new CResult_TxOutUtxoLookupErrorZ which has the same data as `orig`
		/// but with all dynamically-allocated buffers duplicated in new buffers.
		internal func clone() -> Result_TxOutUtxoLookupErrorZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_TxOutUtxoLookupErrorZ>) in
					CResult_TxOutUtxoLookupErrorZ_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Result_TxOutUtxoLookupErrorZ(
				cType: nativeCallResult,
				instantiationContext: "Result_TxOutUtxoLookupErrorZ.swift::\(#function):\(#line)")


			return returnValue
		}


		public func isOk() -> Bool {
			return self.cType?.result_ok == true
		}


		public func getError() -> UtxoLookupError? {
			if self.cType?.result_ok == false {
				return UtxoLookupError(value: self.cType!.contents.err.pointee)
			}
			return nil
		}


		public func getValue() -> TxOut? {
			if self.cType?.result_ok == true {
				return TxOut(
					cType: self.cType!.contents.result.pointee,
					instantiationContext: "Result_TxOutUtxoLookupErrorZ.swift::\(#function):\(#line)", anchor: self)
			}
			return nil
		}


		internal func dangle(_ shouldDangle: Bool = true) -> Result_TxOutUtxoLookupErrorZ {
			self.dangling = shouldDangle
			return self
		}


		internal func danglingClone() -> Result_TxOutUtxoLookupErrorZ {
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
						"Freeing Result_TxOutUtxoLookupErrorZ \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Result_TxOutUtxoLookupErrorZ \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}

}
