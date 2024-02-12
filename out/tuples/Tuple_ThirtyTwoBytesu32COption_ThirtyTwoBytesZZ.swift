#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A tuple of 3 elements. See the individual fields for the types contained.
internal typealias Tuple_ThirtyTwoBytesu32COption_ThirtyTwoBytesZZ = Bindings
	.Tuple_ThirtyTwoBytesu32COption_ThirtyTwoBytesZZ

extension Bindings {

	/// A tuple of 3 elements. See the individual fields for the types contained.
	internal class Tuple_ThirtyTwoBytesu32COption_ThirtyTwoBytesZZ: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKC3Tuple_ThirtyTwoBytesu32COption_ThirtyTwoBytesZZ?

		internal init(cType: LDKC3Tuple_ThirtyTwoBytesu32COption_ThirtyTwoBytesZZ, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(
			cType: LDKC3Tuple_ThirtyTwoBytesu32COption_ThirtyTwoBytesZZ, instantiationContext: String,
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
			cType: LDKC3Tuple_ThirtyTwoBytesu32COption_ThirtyTwoBytesZZ, instantiationContext: String,
			anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		internal convenience init(tuple: ([UInt8], UInt32, [UInt8]?), instantiationContext: String) {
			self.init(a: tuple.0, b: tuple.1, c: tuple.2, instantiationContext: instantiationContext)
		}


		/// Creates a new tuple which has the same data as `orig`
		/// but with all dynamically-allocated buffers duplicated in new buffers.
		internal func clone() -> Tuple_ThirtyTwoBytesu32COption_ThirtyTwoBytesZZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) {
					(origPointer: UnsafePointer<LDKC3Tuple_ThirtyTwoBytesu32COption_ThirtyTwoBytesZZ>) in
					C3Tuple_ThirtyTwoBytesu32COption_ThirtyTwoBytesZZ_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Tuple_ThirtyTwoBytesu32COption_ThirtyTwoBytesZZ(
				cType: nativeCallResult,
				instantiationContext: "Tuple_ThirtyTwoBytesu32COption_ThirtyTwoBytesZZ.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Creates a new C3Tuple_ThirtyTwoBytesu32COption_ThirtyTwoBytesZZ from the contained elements.
		public init(a: [UInt8], b: UInt32, c: [UInt8]?, instantiationContext: String) {
			// native call variable prep

			let aPrimitiveWrapper = ThirtyTwoBytes(
				value: a,
				instantiationContext: "Tuple_ThirtyTwoBytesu32COption_ThirtyTwoBytesZZ.swift::\(#function):\(#line)")

			let cOption = Option_ThirtyTwoBytesZ(
				some: c,
				instantiationContext: "Tuple_ThirtyTwoBytesu32COption_ThirtyTwoBytesZZ.swift::\(#function):\(#line)"
			)
			.danglingClone()


			// native method call
			let nativeCallResult = C3Tuple_ThirtyTwoBytesu32COption_ThirtyTwoBytesZZ_new(
				aPrimitiveWrapper.cType!, b, cOption.cType!)

			// cleanup

			// for elided types, we need this
			aPrimitiveWrapper.noOpRetain()


			/*
						// return value (do some wrapping)
						let returnValue = Tuple_ThirtyTwoBytesu32COption_ThirtyTwoBytesZZ(cType: nativeCallResult, instantiationContext: "Tuple_ThirtyTwoBytesu32COption_ThirtyTwoBytesZZ.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)


		}

		/// Frees any resources used by the C3Tuple_ThirtyTwoBytesu32COption_ThirtyTwoBytesZZ.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = C3Tuple_ThirtyTwoBytesu32COption_ThirtyTwoBytesZZ_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}


		public func getValue() -> ([UInt8], UInt32, [UInt8]?) {
			return (self.getA(), self.getB(), self.getC())
		}


		/// The element at position 0
		public func getA() -> [UInt8] {
			// return value (do some wrapping)
			let returnValue = ThirtyTwoBytes(
				cType: self.cType!.a,
				instantiationContext: "Tuple_ThirtyTwoBytesu32COption_ThirtyTwoBytesZZ.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle().getValue()

			return returnValue
		}

		/// The element at position 1
		public func getB() -> UInt32 {
			// return value (do some wrapping)
			let returnValue = self.cType!.b

			return returnValue
		}

		/// The element at position 2
		public func getC() -> [UInt8]? {
			// return value (do some wrapping)
			let returnValue = Option_ThirtyTwoBytesZ(
				cType: self.cType!.c,
				instantiationContext: "Tuple_ThirtyTwoBytesu32COption_ThirtyTwoBytesZZ.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle().getValue()

			return returnValue
		}


		internal func danglingClone() -> Tuple_ThirtyTwoBytesu32COption_ThirtyTwoBytesZZ {
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
						"Freeing Tuple_ThirtyTwoBytesu32COption_ThirtyTwoBytesZZ \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Tuple_ThirtyTwoBytesu32COption_ThirtyTwoBytesZZ \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}
}
