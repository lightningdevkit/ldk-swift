#if SWIFT_PACKAGE
	import LDKHeaders
#endif

///
internal typealias Option_OutboundHTLCStateDetailsZ = Bindings.Option_OutboundHTLCStateDetailsZ

extension Bindings {

	/// An enum which can either contain a crate::lightning::ln::channel_state::OutboundHTLCStateDetails or not
	internal class Option_OutboundHTLCStateDetailsZ: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKCOption_OutboundHTLCStateDetailsZ?

		internal init(cType: LDKCOption_OutboundHTLCStateDetailsZ, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(
			cType: LDKCOption_OutboundHTLCStateDetailsZ, instantiationContext: String, anchor: NativeTypeWrapper
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKCOption_OutboundHTLCStateDetailsZ, instantiationContext: String, anchor: NativeTypeWrapper,
			dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		internal init(some: OutboundHTLCStateDetails?, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter

			if let some = some {

				self.cType = COption_OutboundHTLCStateDetailsZ_some(some.getCValue())
			} else {
				self.cType = COption_OutboundHTLCStateDetailsZ_none()
			}

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}


		/// Frees any resources associated with the crate::lightning::ln::channel_state::OutboundHTLCStateDetails, if we are in the Some state
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = COption_OutboundHTLCStateDetailsZ_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a new COption_OutboundHTLCStateDetailsZ which has the same data as `orig`
		/// but with all dynamically-allocated buffers duplicated in new buffers.
		internal func clone() -> Option_OutboundHTLCStateDetailsZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) {
					(origPointer: UnsafePointer<LDKCOption_OutboundHTLCStateDetailsZ>) in
					COption_OutboundHTLCStateDetailsZ_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_OutboundHTLCStateDetailsZ(
				cType: nativeCallResult,
				instantiationContext: "Option_OutboundHTLCStateDetailsZ.swift::\(#function):\(#line)")


			return returnValue
		}


		public func getValue() -> OutboundHTLCStateDetails? {
			if self.cType!.tag == LDKCOption_OutboundHTLCStateDetailsZ_None {
				return nil
			}
			if self.cType!.tag == LDKCOption_OutboundHTLCStateDetailsZ_Some {
				return OutboundHTLCStateDetails(value: self.cType!.some)
			}
			assert(false, "invalid option enum value")
			return nil
		}


		internal func danglingClone() -> Option_OutboundHTLCStateDetailsZ {
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
						"Freeing Option_OutboundHTLCStateDetailsZ \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Option_OutboundHTLCStateDetailsZ \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}

}
