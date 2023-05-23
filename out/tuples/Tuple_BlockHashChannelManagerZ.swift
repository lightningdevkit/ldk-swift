#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A tuple of 2 elements. See the individual fields for the types contained.
internal typealias Tuple_BlockHashChannelManagerZ = Bindings.Tuple_BlockHashChannelManagerZ

extension Bindings {

	/// A tuple of 2 elements. See the individual fields for the types contained.
	internal class Tuple_BlockHashChannelManagerZ: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKC2Tuple_BlockHashChannelManagerZ?

		internal init(cType: LDKC2Tuple_BlockHashChannelManagerZ, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(
			cType: LDKC2Tuple_BlockHashChannelManagerZ, instantiationContext: String, anchor: NativeTypeWrapper
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKC2Tuple_BlockHashChannelManagerZ, instantiationContext: String, anchor: NativeTypeWrapper,
			dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		internal convenience init(tuple: ([UInt8], ChannelManager), instantiationContext: String) {
			self.init(a: tuple.0, b: tuple.1, instantiationContext: instantiationContext)
		}


		/// Creates a new C2Tuple_BlockHashChannelManagerZ from the contained elements.
		@available(
			*, deprecated,
			message: "This method passes the following non-cloneable, but freeable objects by value: `b`."
		)
		public init(a: [UInt8], b: ChannelManager, instantiationContext: String) {
			// native call variable prep

			let aPrimitiveWrapper = ThirtyTwoBytes(
				value: a, instantiationContext: "Tuple_BlockHashChannelManagerZ.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = C2Tuple_BlockHashChannelManagerZ_new(aPrimitiveWrapper.cType!, b.dangle().cType!)

			// cleanup

			// for elided types, we need this
			aPrimitiveWrapper.noOpRetain()


			/*
						// return value (do some wrapping)
						let returnValue = Tuple_BlockHashChannelManagerZ(cType: nativeCallResult, instantiationContext: "Tuple_BlockHashChannelManagerZ.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)


		}

		/// Frees any resources used by the C2Tuple_BlockHashChannelManagerZ.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = C2Tuple_BlockHashChannelManagerZ_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Read a C2Tuple_BlockHashChannelManagerZ from a byte array, created by C2Tuple_BlockHashChannelManagerZ_write
		@available(
			*, deprecated,
			message: "This method passes the following non-cloneable, but freeable objects by value: `arg`."
		)
		public class func read(ser: [UInt8], arg: ChannelManagerReadArgs)
			-> Result_C2Tuple_BlockHashChannelManagerZDecodeErrorZ
		{
			// native call variable prep

			let serPrimitiveWrapper = u8slice(
				value: ser, instantiationContext: "Tuple_BlockHashChannelManagerZ.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = C2Tuple_BlockHashChannelManagerZ_read(
				serPrimitiveWrapper.cType!, arg.dangle().cType!)

			// cleanup

			// for elided types, we need this
			serPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_C2Tuple_BlockHashChannelManagerZDecodeErrorZ(
				cType: nativeCallResult,
				instantiationContext: "Tuple_BlockHashChannelManagerZ.swift::\(#function):\(#line)")


			return returnValue
		}


		public func getValue() -> ([UInt8], ChannelManager) {
			return (self.getA(), self.getB())
		}


		/// The element at position 0
		public func getA() -> [UInt8] {
			// return value (do some wrapping)
			let returnValue = ThirtyTwoBytes(
				cType: self.cType!.a,
				instantiationContext: "Tuple_BlockHashChannelManagerZ.swift::\(#function):\(#line)", anchor: self
			)
			.dangle().getValue()

			return returnValue
		}

		/// The element at position 1
		public func getB() -> ChannelManager {
			// return value (do some wrapping)
			let returnValue = ChannelManager(
				cType: self.cType!.b,
				instantiationContext: "Tuple_BlockHashChannelManagerZ.swift::\(#function):\(#line)", anchor: self
			)
			.dangle()

			return returnValue
		}


		internal func dangle(_ shouldDangle: Bool = true) -> Tuple_BlockHashChannelManagerZ {
			self.dangling = shouldDangle
			return self
		}


		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print(
						"Freeing Tuple_BlockHashChannelManagerZ \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Tuple_BlockHashChannelManagerZ \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}
}
