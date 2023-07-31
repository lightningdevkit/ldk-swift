import Foundation  // necessary for Data for Strings

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


/// A serialized witness.
internal typealias Witness = Bindings.Witness

extension Bindings {

	/// A serialized witness.
	internal class Witness: NativeTypeWrapper {

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

		internal var cType: LDKWitness?

		internal init(cType: LDKWitness, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.data_is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKWitness, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.data_is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(cType: LDKWitness, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false)
		{
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.data_is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		internal init(value: [UInt8], instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter


			let dataContainer = UnsafeMutablePointer<UInt8>.allocate(capacity: value.count)
			dataContainer.initialize(from: value, count: value.count)
			self.cType = LDKWitness(data: dataContainer, datalen: UInt(value.count), data_is_owned: true)

			self.initialCFreeability = self.cType!.data_is_owned


			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}


		/// Frees the data pointed to by data
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = Witness_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}


		public func getValue() -> [UInt8] {

			var array = [UInt8]()
			for index in 0..<Int(self.cType!.datalen) {
				let currentEntry = self.cType!.data[index]
				array.append(currentEntry)
			}
			return array

		}


		internal func setCFreeability(freeable: Bool) -> Witness {
			self.cType!.data_is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> Witness {
			self.dangling = self.cType!.data_is_owned
			return self
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print("Freeing Witness \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				if !self.initialCFreeability {
					// only set to freeable if it was originally false
					// Bindings.print("Setting Witness \(self.instanceNumber)'s data_is_owned: \(self.cType!.data_is_owned) -> true")
					// self.cType!.data_is_owned = true
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Witness \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
			}
		}


	}

}
