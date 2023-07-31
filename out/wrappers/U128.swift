import Foundation  // necessary for Data for Strings

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


/// Unsigned, 128-bit integer.
///
/// Because LLVM implements an incorrect ABI for 128-bit integers, a wrapper type is defined here.
/// See https://github.com/rust-lang/rust/issues/54341 for more details.
internal typealias U128 = Bindings.U128

extension Bindings {

	/// Unsigned, 128-bit integer.
	///
	/// Because LLVM implements an incorrect ABI for 128-bit integers, a wrapper type is defined here.
	/// See https://github.com/rust-lang/rust/issues/54341 for more details.
	internal class U128: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKU128?

		internal init(cType: LDKU128, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKU128, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(cType: LDKU128, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		internal init(value: [UInt8], instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter

			self.cType = LDKU128(le_bytes: Bindings.arrayToUInt8Tuple16(array: value))

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}


		/// Gets the 128-bit integer, as 16 little-endian bytes
		public func leBytes() -> [UInt8] {
			// native call variable prep


			// native method call
			let nativeCallResult = U128_le_bytes(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = SixteenBytes(
				cType: nativeCallResult, instantiationContext: "U128.swift::\(#function):\(#line)"
			)
			.getValue()


			return returnValue
		}

		/// Constructs a new U128 from 16 little-endian bytes
		public init(leBytes: [UInt8], instantiationContext: String) {
			// native call variable prep

			let leBytesPrimitiveWrapper = SixteenBytes(
				value: leBytes, instantiationContext: "U128.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult = U128_new(leBytesPrimitiveWrapper.cType!)

			// cleanup

			// for elided types, we need this
			leBytesPrimitiveWrapper.noOpRetain()


			/*
						// return value (do some wrapping)
						let returnValue = U128(cType: nativeCallResult, instantiationContext: "U128.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)


		}


		public func getValue() -> [UInt8] {
			return Bindings.UInt8Tuple16ToArray(tuple: self.cType!.le_bytes)
		}


	}

}
