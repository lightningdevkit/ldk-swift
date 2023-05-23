#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A dynamically-allocated array of crate::lightning::ln::channelmanager::RecentPaymentDetailss of arbitrary size.
/// This corresponds to std::vector in C++
internal typealias Vec_RecentPaymentDetailsZ = Bindings.Vec_RecentPaymentDetailsZ

extension Bindings {

	/// A dynamically-allocated array of crate::lightning::ln::channelmanager::RecentPaymentDetailss of arbitrary size.
	/// This corresponds to std::vector in C++
	internal class Vec_RecentPaymentDetailsZ: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKCVec_RecentPaymentDetailsZ?

		internal init(cType: LDKCVec_RecentPaymentDetailsZ, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKCVec_RecentPaymentDetailsZ, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKCVec_RecentPaymentDetailsZ, instantiationContext: String, anchor: NativeTypeWrapper,
			dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		internal init(array: [RecentPaymentDetails], instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)


			let rustArray = array.map { (currentValueDepth1: RecentPaymentDetails) -> LDKRecentPaymentDetails in

				return currentValueDepth1.danglingClone().cType!
			}


			let dataContainer = UnsafeMutablePointer<LDKRecentPaymentDetails>.allocate(capacity: array.count)
			dataContainer.initialize(from: rustArray, count: array.count)

			let vector = LDKCVec_RecentPaymentDetailsZ(data: dataContainer, datalen: UInt(array.count))
			self.cType = vector
		}

		public func getValue() -> [RecentPaymentDetails] {

			var array = [LDKRecentPaymentDetails]()


			for index1 in 0..<Int(self.cType!.datalen) {
				let currentEntry1 = self.cType!.data[index1]
				array.append(currentEntry1)
			}


			let swiftArray = array.map { (currentCType: LDKRecentPaymentDetails) -> RecentPaymentDetails in
				RecentPaymentDetails(
					cType: currentCType, instantiationContext: "Vec_RecentPaymentDetailsZ.swift::\(#function):\(#line)",
					anchor: self
				)
				.dangle()
			}
			return swiftArray
		}


		/// Frees the buffer pointed to by `data` if `datalen` is non-0.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = CVec_RecentPaymentDetailsZ_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}


		internal func dangle(_ shouldDangle: Bool = true) -> Vec_RecentPaymentDetailsZ {
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
						"Freeing Vec_RecentPaymentDetailsZ \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Vec_RecentPaymentDetailsZ \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}

}
