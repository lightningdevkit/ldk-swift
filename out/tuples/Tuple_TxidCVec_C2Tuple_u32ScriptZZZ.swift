#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A tuple of 2 elements. See the individual fields for the types contained.
internal typealias Tuple_TxidCVec_C2Tuple_u32ScriptZZZ = Bindings.Tuple_TxidCVec_C2Tuple_u32ScriptZZZ

extension Bindings {

	/// A tuple of 2 elements. See the individual fields for the types contained.
	internal class Tuple_TxidCVec_C2Tuple_u32ScriptZZZ: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKC2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ?

		internal init(cType: LDKC2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(
			cType: LDKC2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ, instantiationContext: String, anchor: NativeTypeWrapper
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKC2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ, instantiationContext: String, anchor: NativeTypeWrapper,
			dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		internal convenience init(tuple: ([UInt8], [(UInt32, [UInt8])]), instantiationContext: String) {
			self.init(a: tuple.0, b: tuple.1, instantiationContext: instantiationContext)
		}


		/// Creates a new tuple which has the same data as `orig`
		/// but with all dynamically-allocated buffers duplicated in new buffers.
		internal func clone() -> Tuple_TxidCVec_C2Tuple_u32ScriptZZZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) {
					(origPointer: UnsafePointer<LDKC2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ>) in
					C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Tuple_TxidCVec_C2Tuple_u32ScriptZZZ(
				cType: nativeCallResult,
				instantiationContext: "Tuple_TxidCVec_C2Tuple_u32ScriptZZZ.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Creates a new C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ from the contained elements.
		public init(a: [UInt8], b: [(UInt32, [UInt8])], instantiationContext: String) {
			// native call variable prep

			let aPrimitiveWrapper = ThirtyTwoBytes(
				value: a, instantiationContext: "Tuple_TxidCVec_C2Tuple_u32ScriptZZZ.swift::\(#function):\(#line)")

			let bVector = Vec_C2Tuple_u32ScriptZZ(
				array: b, instantiationContext: "Tuple_TxidCVec_C2Tuple_u32ScriptZZZ.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ_new(aPrimitiveWrapper.cType!, bVector.cType!)

			// cleanup

			// for elided types, we need this
			aPrimitiveWrapper.noOpRetain()

			// bVector.noOpRetain()


			/*
						// return value (do some wrapping)
						let returnValue = Tuple_TxidCVec_C2Tuple_u32ScriptZZZ(cType: nativeCallResult, instantiationContext: "Tuple_TxidCVec_C2Tuple_u32ScriptZZZ.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)


		}

		/// Frees any resources used by the C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}


		public func getValue() -> ([UInt8], [(UInt32, [UInt8])]) {
			return (self.getA(), self.getB())
		}


		/// The element at position 0
		public func getA() -> [UInt8] {
			// return value (do some wrapping)
			let returnValue = ThirtyTwoBytes(
				cType: self.cType!.a,
				instantiationContext: "Tuple_TxidCVec_C2Tuple_u32ScriptZZZ.swift::\(#function):\(#line)", anchor: self
			)
			.dangle().getValue()

			return returnValue
		}

		/// The element at position 1
		public func getB() -> [(UInt32, [UInt8])] {
			// return value (do some wrapping)
			let returnValue = Vec_C2Tuple_u32ScriptZZ(
				cType: self.cType!.b,
				instantiationContext: "Tuple_TxidCVec_C2Tuple_u32ScriptZZZ.swift::\(#function):\(#line)", anchor: self
			)
			.dangle().getValue()

			return returnValue
		}


		internal func dangle(_ shouldDangle: Bool = true) -> Tuple_TxidCVec_C2Tuple_u32ScriptZZZ {
			self.dangling = shouldDangle
			return self
		}


		internal func danglingClone() -> Tuple_TxidCVec_C2Tuple_u32ScriptZZZ {
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
						"Freeing Tuple_TxidCVec_C2Tuple_u32ScriptZZZ \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Tuple_TxidCVec_C2Tuple_u32ScriptZZZ \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}
}
