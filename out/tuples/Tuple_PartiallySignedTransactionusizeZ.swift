#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A tuple of 2 elements. See the individual fields for the types contained.
internal typealias Tuple_PartiallySignedTransactionusizeZ = Bindings.Tuple_PartiallySignedTransactionusizeZ

extension Bindings {

	/// A tuple of 2 elements. See the individual fields for the types contained.
	internal class Tuple_PartiallySignedTransactionusizeZ: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKC2Tuple_PartiallySignedTransactionusizeZ?

		internal init(cType: LDKC2Tuple_PartiallySignedTransactionusizeZ, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(
			cType: LDKC2Tuple_PartiallySignedTransactionusizeZ, instantiationContext: String, anchor: NativeTypeWrapper
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKC2Tuple_PartiallySignedTransactionusizeZ, instantiationContext: String, anchor: NativeTypeWrapper,
			dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		internal convenience init(tuple: ([UInt8], UInt), instantiationContext: String) {
			self.init(a: tuple.0, b: tuple.1, instantiationContext: instantiationContext)
		}


		/// Creates a new tuple which has the same data as `orig`
		/// but with all dynamically-allocated buffers duplicated in new buffers.
		internal func clone() -> Tuple_PartiallySignedTransactionusizeZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) {
					(origPointer: UnsafePointer<LDKC2Tuple_PartiallySignedTransactionusizeZ>) in
					C2Tuple_PartiallySignedTransactionusizeZ_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Tuple_PartiallySignedTransactionusizeZ(
				cType: nativeCallResult,
				instantiationContext: "Tuple_PartiallySignedTransactionusizeZ.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Creates a new C2Tuple_PartiallySignedTransactionusizeZ from the contained elements.
		public init(a: [UInt8], b: UInt, instantiationContext: String) {
			// native call variable prep

			let aVector = Vec_u8Z(
				array: a, instantiationContext: "Tuple_PartiallySignedTransactionusizeZ.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult = C2Tuple_PartiallySignedTransactionusizeZ_new(aVector.cType!, b)

			// cleanup

			// aVector.noOpRetain()


			/*
						// return value (do some wrapping)
						let returnValue = Tuple_PartiallySignedTransactionusizeZ(cType: nativeCallResult, instantiationContext: "Tuple_PartiallySignedTransactionusizeZ.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)


		}

		/// Frees any resources used by the C2Tuple_PartiallySignedTransactionusizeZ.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = C2Tuple_PartiallySignedTransactionusizeZ_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}


		public func getValue() -> ([UInt8], UInt) {
			return (self.getA(), self.getB())
		}


		/// The element at position 0
		public func getA() -> [UInt8] {
			// return value (do some wrapping)
			let returnValue = Vec_u8Z(
				cType: self.cType!.a,
				instantiationContext: "Tuple_PartiallySignedTransactionusizeZ.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle().getValue()

			return returnValue
		}

		/// The element at position 1
		public func getB() -> UInt {
			// return value (do some wrapping)
			let returnValue = self.cType!.b

			return returnValue
		}


		internal func danglingClone() -> Tuple_PartiallySignedTransactionusizeZ {
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
						"Freeing Tuple_PartiallySignedTransactionusizeZ \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Tuple_PartiallySignedTransactionusizeZ \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}
}
