#if SWIFT_PACKAGE
	import LDKHeaders
#endif

///
internal typealias Option_C2Tuple_ThirtyTwoU16sThirtyTwoU16sZZ = Bindings.Option_C2Tuple_ThirtyTwoU16sThirtyTwoU16sZZ

extension Bindings {

	/// An enum which can either contain a crate::c_types::derived::C2Tuple__u1632_u1632Z or not
	internal class Option_C2Tuple_ThirtyTwoU16sThirtyTwoU16sZZ: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKCOption_C2Tuple_ThirtyTwoU16sThirtyTwoU16sZZ?

		internal init(cType: LDKCOption_C2Tuple_ThirtyTwoU16sThirtyTwoU16sZZ, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(
			cType: LDKCOption_C2Tuple_ThirtyTwoU16sThirtyTwoU16sZZ, instantiationContext: String,
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
			cType: LDKCOption_C2Tuple_ThirtyTwoU16sThirtyTwoU16sZZ, instantiationContext: String,
			anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		internal init(some: ([UInt16], [UInt16])?, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter

			if let some = some {

				let someTuple = Tuple__u1632_u1632Z(
					tuple: some,
					instantiationContext: "Option_C2Tuple_ThirtyTwoU16sThirtyTwoU16sZZ.swift::\(#function):\(#line)"
				)
				.dangle()

				self.cType = COption_C2Tuple_ThirtyTwoU16sThirtyTwoU16sZZ_some(someTuple.cType!)
			} else {
				self.cType = COption_C2Tuple_ThirtyTwoU16sThirtyTwoU16sZZ_none()
			}

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}


		/// Frees any resources associated with the crate::c_types::derived::C2Tuple__u1632_u1632Z, if we are in the Some state
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = COption_C2Tuple_ThirtyTwoU16sThirtyTwoU16sZZ_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}


		public func getValue() -> ([UInt16], [UInt16])? {
			if self.cType!.tag == LDKCOption_C2Tuple_ThirtyTwoU16sThirtyTwoU16sZZ_None {
				return nil
			}
			if self.cType!.tag == LDKCOption_C2Tuple_ThirtyTwoU16sThirtyTwoU16sZZ_Some {
				return Tuple__u1632_u1632Z(
					cType: self.cType!.some,
					instantiationContext: "Option_C2Tuple_ThirtyTwoU16sThirtyTwoU16sZZ.swift::\(#function):\(#line)",
					anchor: self
				)
				.dangle().getValue()
			}
			assert(false, "invalid option enum value")
			return nil
		}


		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print(
						"Freeing Option_C2Tuple_ThirtyTwoU16sThirtyTwoU16sZZ \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Option_C2Tuple_ThirtyTwoU16sThirtyTwoU16sZZ \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}

}
