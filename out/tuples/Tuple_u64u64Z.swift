#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A tuple of 2 elements. See the individual fields for the types contained.
internal typealias Tuple_u64u64Z = Bindings.Tuple_u64u64Z

extension Bindings {

	/// A tuple of 2 elements. See the individual fields for the types contained.
	internal class Tuple_u64u64Z: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKC2Tuple_u64u64Z?

		internal init(cType: LDKC2Tuple_u64u64Z, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKC2Tuple_u64u64Z, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKC2Tuple_u64u64Z, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		internal convenience init(tuple: (UInt64, UInt64), instantiationContext: String) {
			self.init(a: tuple.0, b: tuple.1, instantiationContext: instantiationContext)
		}


		/// Creates a new tuple which has the same data as `orig`
		/// but with all dynamically-allocated buffers duplicated in new buffers.
		internal func clone() -> Tuple_u64u64Z {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKC2Tuple_u64u64Z>) in
					C2Tuple_u64u64Z_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Tuple_u64u64Z(
				cType: nativeCallResult, instantiationContext: "Tuple_u64u64Z.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Creates a new C2Tuple_u64u64Z from the contained elements.
		public init(a: UInt64, b: UInt64, instantiationContext: String) {
			// native call variable prep


			// native method call
			let nativeCallResult = C2Tuple_u64u64Z_new(a, b)

			// cleanup


			/*
						// return value (do some wrapping)
						let returnValue = Tuple_u64u64Z(cType: nativeCallResult, instantiationContext: "Tuple_u64u64Z.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)


		}

		/// Frees any resources used by the C2Tuple_u64u64Z.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = C2Tuple_u64u64Z_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}


		public func getValue() -> (UInt64, UInt64) {
			return (self.getA(), self.getB())
		}


		/// The element at position 0
		public func getA() -> UInt64 {
			// return value (do some wrapping)
			let returnValue = self.cType!.a

			return returnValue
		}

		/// The element at position 1
		public func getB() -> UInt64 {
			// return value (do some wrapping)
			let returnValue = self.cType!.b

			return returnValue
		}


		internal func dangle(_ shouldDangle: Bool = true) -> Tuple_u64u64Z {
			self.dangling = shouldDangle
			return self
		}


		internal func danglingClone() -> Tuple_u64u64Z {
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
						"Freeing Tuple_u64u64Z \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Tuple_u64u64Z \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}
}
