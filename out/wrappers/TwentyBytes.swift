import Foundation  // necessary for Data for Strings

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


/// A 20-byte byte array.
internal typealias TwentyBytes = Bindings.TwentyBytes

extension Bindings {

	/// A 20-byte byte array.
	internal class TwentyBytes: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKTwentyBytes?

		internal init(cType: LDKTwentyBytes, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKTwentyBytes, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKTwentyBytes, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
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

			self.cType = LDKTwentyBytes(data: Bindings.arrayToUInt8Tuple20(array: value))

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}


		public func getValue() -> [UInt8] {
			return Bindings.UInt8Tuple20ToArray(tuple: self.cType!.data)
		}


	}

}
