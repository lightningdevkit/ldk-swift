import Foundation  // necessary for Data for Strings

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


/// A "slice" referencing some byte array. This is simply a length-tagged pointer which does not
/// own the memory pointed to by data.
internal typealias u8slice = Bindings.u8slice

extension Bindings {

	/// A "slice" referencing some byte array. This is simply a length-tagged pointer which does not
	/// own the memory pointed to by data.
	internal class u8slice: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKu8slice?

		internal init(cType: LDKu8slice, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKu8slice, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(cType: LDKu8slice, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false)
		{
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


			let dataContainer = UnsafeMutablePointer<UInt8>.allocate(capacity: value.count)
			dataContainer.initialize(from: value, count: value.count)
			self.cType = LDKu8slice(data: dataContainer, datalen: UInt(value.count))


			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}


		public func getValue() -> [UInt8] {

			var array = [UInt8]()
			for index in 0..<Int(self.cType!.datalen) {
				let currentEntry = self.cType!.data[index]
				array.append(currentEntry)
			}
			return array

		}

		internal func dangle(_ shouldDangle: Bool = true) -> u8slice {
			self.dangling = shouldDangle
			return self
		}


		deinit {
			if !self.dangling {
				print("Freeing u8slice \(self.instanceNumber).")
				self.cType!.data.deallocate()
			} else {
				print("Not freeing u8slice \(self.instanceNumber) due to dangle.")
			}
		}


	}

}
