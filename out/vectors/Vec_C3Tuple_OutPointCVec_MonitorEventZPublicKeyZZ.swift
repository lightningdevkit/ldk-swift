#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// A dynamically-allocated array of crate::c_types::derived::C3Tuple_OutPointCVec_MonitorEventZPublicKeyZs of arbitrary size.
/// This corresponds to std::vector in C++
internal typealias Vec_C3Tuple_OutPointCVec_MonitorEventZPublicKeyZZ = Bindings
	.Vec_C3Tuple_OutPointCVec_MonitorEventZPublicKeyZZ

extension Bindings {

	/// A dynamically-allocated array of crate::c_types::derived::C3Tuple_OutPointCVec_MonitorEventZPublicKeyZs of arbitrary size.
	/// This corresponds to std::vector in C++
	internal class Vec_C3Tuple_OutPointCVec_MonitorEventZPublicKeyZZ: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKCVec_C3Tuple_OutPointCVec_MonitorEventZPublicKeyZZ?

		internal init(cType: LDKCVec_C3Tuple_OutPointCVec_MonitorEventZPublicKeyZZ, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(
			cType: LDKCVec_C3Tuple_OutPointCVec_MonitorEventZPublicKeyZZ, instantiationContext: String,
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
			cType: LDKCVec_C3Tuple_OutPointCVec_MonitorEventZPublicKeyZZ, instantiationContext: String,
			anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		internal init(array: [(OutPoint, [MonitorEvent], [UInt8])], instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)


			let rustArray = array.map {
				(currentValueDepth1: (OutPoint, [MonitorEvent], [UInt8]))
					-> LDKC3Tuple_OutPointCVec_MonitorEventZPublicKeyZ in

				let currentValueDepth1Tuple = Tuple_OutPointCVec_MonitorEventZPublicKeyZ(
					tuple: currentValueDepth1,
					instantiationContext:
						"Vec_C3Tuple_OutPointCVec_MonitorEventZPublicKeyZZ.swift::\(#function):\(#line)"
				)
				.danglingClone()

				return currentValueDepth1Tuple.cType!
			}


			let dataContainer = UnsafeMutablePointer<LDKC3Tuple_OutPointCVec_MonitorEventZPublicKeyZ>
				.allocate(capacity: array.count)
			dataContainer.initialize(from: rustArray, count: array.count)

			let vector = LDKCVec_C3Tuple_OutPointCVec_MonitorEventZPublicKeyZZ(
				data: dataContainer, datalen: UInt(array.count))
			self.cType = vector
		}

		public func getValue() -> [(OutPoint, [MonitorEvent], [UInt8])] {

			var array = [LDKC3Tuple_OutPointCVec_MonitorEventZPublicKeyZ]()


			for index1 in 0..<Int(self.cType!.datalen) {
				let currentEntry1 = self.cType!.data[index1]
				array.append(currentEntry1)
			}


			let swiftArray = array.map {
				(currentCType: LDKC3Tuple_OutPointCVec_MonitorEventZPublicKeyZ) -> (OutPoint, [MonitorEvent], [UInt8])
				in
				Tuple_OutPointCVec_MonitorEventZPublicKeyZ(
					cType: currentCType,
					instantiationContext:
						"Vec_C3Tuple_OutPointCVec_MonitorEventZPublicKeyZZ.swift::\(#function):\(#line)"
				)
				.dangle().getValue()
			}
			return swiftArray
		}


		/// Frees the buffer pointed to by `data` if `datalen` is non-0.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = CVec_C3Tuple_OutPointCVec_MonitorEventZPublicKeyZZ_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}


		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print(
						"Freeing Vec_C3Tuple_OutPointCVec_MonitorEventZPublicKeyZZ \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Vec_C3Tuple_OutPointCVec_MonitorEventZPublicKeyZZ \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}

}
