#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A tuple of 2 elements. See the individual fields for the types contained.
internal typealias Tuple_DNSResolverMessageResponseInstructionZ = Bindings.Tuple_DNSResolverMessageResponseInstructionZ

extension Bindings {

	/// A tuple of 2 elements. See the individual fields for the types contained.
	internal class Tuple_DNSResolverMessageResponseInstructionZ: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKC2Tuple_DNSResolverMessageResponseInstructionZ?

		internal init(cType: LDKC2Tuple_DNSResolverMessageResponseInstructionZ, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(
			cType: LDKC2Tuple_DNSResolverMessageResponseInstructionZ, instantiationContext: String,
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
			cType: LDKC2Tuple_DNSResolverMessageResponseInstructionZ, instantiationContext: String,
			anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		internal convenience init(tuple: (DNSResolverMessage, ResponseInstruction), instantiationContext: String) {
			self.init(a: tuple.0, b: tuple.1, instantiationContext: instantiationContext)
		}


		/// Creates a new tuple which has the same data as `orig`
		/// but with all dynamically-allocated buffers duplicated in new buffers.
		internal func clone() -> Tuple_DNSResolverMessageResponseInstructionZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) {
					(origPointer: UnsafePointer<LDKC2Tuple_DNSResolverMessageResponseInstructionZ>) in
					C2Tuple_DNSResolverMessageResponseInstructionZ_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Tuple_DNSResolverMessageResponseInstructionZ(
				cType: nativeCallResult,
				instantiationContext: "Tuple_DNSResolverMessageResponseInstructionZ.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Creates a new C2Tuple_DNSResolverMessageResponseInstructionZ from the contained elements.
		public init(a: DNSResolverMessage, b: ResponseInstruction, instantiationContext: String) {
			// native call variable prep


			// native method call
			let nativeCallResult = C2Tuple_DNSResolverMessageResponseInstructionZ_new(
				a.danglingClone().cType!, b.dynamicallyDangledClone().cType!)

			// cleanup


			/*
						// return value (do some wrapping)
						let returnValue = Tuple_DNSResolverMessageResponseInstructionZ(cType: nativeCallResult, instantiationContext: "Tuple_DNSResolverMessageResponseInstructionZ.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)


		}

		/// Frees any resources used by the C2Tuple_DNSResolverMessageResponseInstructionZ.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = C2Tuple_DNSResolverMessageResponseInstructionZ_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}


		public func getValue() -> (DNSResolverMessage, ResponseInstruction) {
			return (self.getA(), self.getB())
		}


		/// The element at position 0
		public func getA() -> DNSResolverMessage {
			// return value (do some wrapping)
			let returnValue = DNSResolverMessage(
				cType: self.cType!.a,
				instantiationContext: "Tuple_DNSResolverMessageResponseInstructionZ.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle()

			return returnValue
		}

		/// The element at position 1
		public func getB() -> ResponseInstruction {
			// return value (do some wrapping)
			let returnValue = ResponseInstruction(
				cType: self.cType!.b,
				instantiationContext: "Tuple_DNSResolverMessageResponseInstructionZ.swift::\(#function):\(#line)",
				anchor: self
			)
			.dangle()

			return returnValue
		}


		internal func danglingClone() -> Tuple_DNSResolverMessageResponseInstructionZ {
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
						"Freeing Tuple_DNSResolverMessageResponseInstructionZ \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Tuple_DNSResolverMessageResponseInstructionZ \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}
}
