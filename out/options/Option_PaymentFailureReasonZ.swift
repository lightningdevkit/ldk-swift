#if SWIFT_PACKAGE
	import LDKHeaders
#endif

///
internal typealias Option_PaymentFailureReasonZ = Bindings.Option_PaymentFailureReasonZ

extension Bindings {

	/// An enum which can either contain a crate::lightning::events::PaymentFailureReason or not
	internal class Option_PaymentFailureReasonZ: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKCOption_PaymentFailureReasonZ?

		internal init(cType: LDKCOption_PaymentFailureReasonZ, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKCOption_PaymentFailureReasonZ, instantiationContext: String, anchor: NativeTypeWrapper)
		{
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKCOption_PaymentFailureReasonZ, instantiationContext: String, anchor: NativeTypeWrapper,
			dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		internal init(some: PaymentFailureReason?, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter

			if let some = some {

				self.cType = COption_PaymentFailureReasonZ_some(some.getCValue())
			} else {
				self.cType = COption_PaymentFailureReasonZ_none()
			}

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}


		/// Frees any resources associated with the crate::lightning::events::PaymentFailureReason, if we are in the Some state
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = COption_PaymentFailureReasonZ_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a new COption_PaymentFailureReasonZ which has the same data as `orig`
		/// but with all dynamically-allocated buffers duplicated in new buffers.
		internal func clone() -> Option_PaymentFailureReasonZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCOption_PaymentFailureReasonZ>) in
					COption_PaymentFailureReasonZ_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_PaymentFailureReasonZ(
				cType: nativeCallResult,
				instantiationContext: "Option_PaymentFailureReasonZ.swift::\(#function):\(#line)")


			return returnValue
		}


		public func getValue() -> PaymentFailureReason? {
			if self.cType!.tag == LDKCOption_PaymentFailureReasonZ_None {
				return nil
			}
			if self.cType!.tag == LDKCOption_PaymentFailureReasonZ_Some {
				return PaymentFailureReason(value: self.cType!.some)
			}
			assert(false, "invalid option enum value")
			return nil
		}


		internal func danglingClone() -> Option_PaymentFailureReasonZ {
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
						"Freeing Option_PaymentFailureReasonZ \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Option_PaymentFailureReasonZ \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}

}
