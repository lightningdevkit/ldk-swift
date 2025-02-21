#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A tuple of 3 elements. See the individual fields for the types contained.
internal typealias Tuple_StrStrStrZ = Bindings.Tuple_StrStrStrZ

extension Bindings {

	/// A tuple of 3 elements. See the individual fields for the types contained.
	internal class Tuple_StrStrStrZ: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKC3Tuple_StrStrStrZ?

		internal init(cType: LDKC3Tuple_StrStrStrZ, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKC3Tuple_StrStrStrZ, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKC3Tuple_StrStrStrZ, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		internal convenience init(tuple: (String, String, String), instantiationContext: String) {
			self.init(a: tuple.0, b: tuple.1, c: tuple.2, instantiationContext: instantiationContext)
		}


		/// Creates a new tuple which has the same data as `orig`
		/// but with all dynamically-allocated buffers duplicated in new buffers.
		internal func clone() -> Tuple_StrStrStrZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKC3Tuple_StrStrStrZ>) in
					C3Tuple_StrStrStrZ_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Tuple_StrStrStrZ(
				cType: nativeCallResult, instantiationContext: "Tuple_StrStrStrZ.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Creates a new C3Tuple_StrStrStrZ from the contained elements.
		public init(a: String, b: String, c: String, instantiationContext: String) {
			// native call variable prep

			let aPrimitiveWrapper = Str(value: a, instantiationContext: "Tuple_StrStrStrZ.swift::\(#function):\(#line)")
				.dangle()

			let bPrimitiveWrapper = Str(value: b, instantiationContext: "Tuple_StrStrStrZ.swift::\(#function):\(#line)")
				.dangle()

			let cPrimitiveWrapper = Str(value: c, instantiationContext: "Tuple_StrStrStrZ.swift::\(#function):\(#line)")
				.dangle()


			// native method call
			let nativeCallResult = C3Tuple_StrStrStrZ_new(
				aPrimitiveWrapper.cType!, bPrimitiveWrapper.cType!, cPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			aPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			bPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			cPrimitiveWrapper.noOpRetain()


			/*
						// return value (do some wrapping)
						let returnValue = Tuple_StrStrStrZ(cType: nativeCallResult, instantiationContext: "Tuple_StrStrStrZ.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)


		}

		/// Frees any resources used by the C3Tuple_StrStrStrZ.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = C3Tuple_StrStrStrZ_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}


		public func getValue() -> (String, String, String) {
			return (self.getA(), self.getB(), self.getC())
		}


		/// The element at position 0
		public func getA() -> String {
			// return value (do some wrapping)
			let returnValue = Str(
				cType: self.cType!.a, instantiationContext: "Tuple_StrStrStrZ.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle().getValue()

			return returnValue
		}

		/// The element at position 1
		public func getB() -> String {
			// return value (do some wrapping)
			let returnValue = Str(
				cType: self.cType!.b, instantiationContext: "Tuple_StrStrStrZ.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle().getValue()

			return returnValue
		}

		/// The element at position 2
		public func getC() -> String {
			// return value (do some wrapping)
			let returnValue = Str(
				cType: self.cType!.c, instantiationContext: "Tuple_StrStrStrZ.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle().getValue()

			return returnValue
		}


		internal func danglingClone() -> Tuple_StrStrStrZ {
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
						"Freeing Tuple_StrStrStrZ \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Tuple_StrStrStrZ \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}
}
