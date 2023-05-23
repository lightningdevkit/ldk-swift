import Foundation  // necessary for Data for Strings

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


/// A Rust str object, ie a reference to a UTF8-valid string.
/// This is *not* null-terminated so cannot be used directly as a C string!
internal typealias Str = Bindings.Str

extension Bindings {

	/// A Rust str object, ie a reference to a UTF8-valid string.
	/// This is *not* null-terminated so cannot be used directly as a C string!
	internal class Str: NativeTypeWrapper {

		let initialCFreeability: Bool


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKStr?

		internal init(cType: LDKStr, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.chars_is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKStr, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.chars_is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(cType: LDKStr, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.chars_is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		internal init(value: String, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter

			self.cType = LDKStr(
				chars: Bindings.string_to_unsafe_uint8_pointer(string: value), len: UInt(value.count),
				chars_is_owned: true)
			self.initialCFreeability = self.cType!.chars_is_owned


			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}


		/// Frees the data buffer, if chars_is_owned is set and len > 0.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = Str_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}


		public func getValue() -> String {

			var array = [UInt8]()
			for index in 0..<Int(self.cType!.len) {
				let currentEntry = self.cType!.chars[index]
				array.append(currentEntry)
			}
			let data = Data(bytes: array)
			return String(data: data, encoding: .utf8)!

		}

		internal func dangle(_ shouldDangle: Bool = true) -> Str {
			self.dangling = shouldDangle
			return self
		}


		internal func setCFreeability(freeable: Bool) -> Str {
			self.cType!.chars_is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> Str {
			self.dangling = self.cType!.chars_is_owned
			return self
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print("Freeing Str \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				if !self.initialCFreeability {
					// only set to freeable if it was originally false
					// Bindings.print("Setting Str \(self.instanceNumber)'s chars_is_owned: \(self.cType!.chars_is_owned) -> true")
					// self.cType!.chars_is_owned = true
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Str \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
			}
		}


	}

}
