#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A tuple of 3 elements. See the individual fields for the types contained.
internal typealias Tuple_OnionMessageContentsDestinationBlindedPathZ = Bindings
	.Tuple_OnionMessageContentsDestinationBlindedPathZ

extension Bindings {

	/// A tuple of 3 elements. See the individual fields for the types contained.
	internal class Tuple_OnionMessageContentsDestinationBlindedPathZ: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKC3Tuple_OnionMessageContentsDestinationBlindedPathZ?

		internal init(cType: LDKC3Tuple_OnionMessageContentsDestinationBlindedPathZ, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(
			cType: LDKC3Tuple_OnionMessageContentsDestinationBlindedPathZ, instantiationContext: String,
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
			cType: LDKC3Tuple_OnionMessageContentsDestinationBlindedPathZ, instantiationContext: String,
			anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		internal convenience init(tuple: (OnionMessageContents, Destination, BlindedPath), instantiationContext: String)
		{
			self.init(a: tuple.0, b: tuple.1, c: tuple.2, instantiationContext: instantiationContext)
		}


		/// Creates a new tuple which has the same data as `orig`
		/// but with all dynamically-allocated buffers duplicated in new buffers.
		internal func clone() -> Tuple_OnionMessageContentsDestinationBlindedPathZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) {
					(origPointer: UnsafePointer<LDKC3Tuple_OnionMessageContentsDestinationBlindedPathZ>) in
					C3Tuple_OnionMessageContentsDestinationBlindedPathZ_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Tuple_OnionMessageContentsDestinationBlindedPathZ(
				cType: nativeCallResult,
				instantiationContext: "Tuple_OnionMessageContentsDestinationBlindedPathZ.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Creates a new C3Tuple_OnionMessageContentsDestinationBlindedPathZ from the contained elements.
		public init(a: OnionMessageContents, b: Destination, c: BlindedPath, instantiationContext: String) {
			// native call variable prep


			// native method call
			let nativeCallResult = C3Tuple_OnionMessageContentsDestinationBlindedPathZ_new(
				a.activate().cType!, b.danglingClone().cType!, c.dynamicallyDangledClone().cType!)

			// cleanup


			/*
						// return value (do some wrapping)
						let returnValue = Tuple_OnionMessageContentsDestinationBlindedPathZ(cType: nativeCallResult, instantiationContext: "Tuple_OnionMessageContentsDestinationBlindedPathZ.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)


		}

		/// Frees any resources used by the C3Tuple_OnionMessageContentsDestinationBlindedPathZ.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = C3Tuple_OnionMessageContentsDestinationBlindedPathZ_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}


		public func getValue() -> (OnionMessageContents, Destination, BlindedPath) {
			return (self.getA(), self.getB(), self.getC())
		}


		/// The element at position 0
		public func getA() -> OnionMessageContents {
			// return value (do some wrapping)
			let returnValue = NativelyImplementedOnionMessageContents(
				cType: self.cType!.a,
				instantiationContext: "Tuple_OnionMessageContentsDestinationBlindedPathZ.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle()

			return returnValue
		}

		/// The element at position 1
		public func getB() -> Destination {
			// return value (do some wrapping)
			let returnValue = Destination(
				cType: self.cType!.b,
				instantiationContext: "Tuple_OnionMessageContentsDestinationBlindedPathZ.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle()

			return returnValue
		}

		/// The element at position 2
		public func getC() -> BlindedPath {
			// return value (do some wrapping)
			let returnValue = BlindedPath(
				cType: self.cType!.c,
				instantiationContext: "Tuple_OnionMessageContentsDestinationBlindedPathZ.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle()

			return returnValue
		}


		internal func danglingClone() -> Tuple_OnionMessageContentsDestinationBlindedPathZ {
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
						"Freeing Tuple_OnionMessageContentsDestinationBlindedPathZ \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Tuple_OnionMessageContentsDestinationBlindedPathZ \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}
}
