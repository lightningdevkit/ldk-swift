#if SWIFT_PACKAGE
	import LDKHeaders
#endif

///
internal typealias Option_SecretKeyZ = Bindings.Option_SecretKeyZ

extension Bindings {

	/// An enum which can either contain a crate::c_types::SecretKey or not
	internal class Option_SecretKeyZ: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKCOption_SecretKeyZ?

		internal init(cType: LDKCOption_SecretKeyZ, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKCOption_SecretKeyZ, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKCOption_SecretKeyZ, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		internal init(some: [UInt8]?, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter

			if let some = some {

				let somePrimitiveWrapper = SecretKey(
					value: some, instantiationContext: "Option_SecretKeyZ.swift::\(#function):\(#line)")

				self.cType = COption_SecretKeyZ_some(somePrimitiveWrapper.cType!)
			} else {
				self.cType = COption_SecretKeyZ_none()
			}

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}


		/// Frees any resources associated with the crate::c_types::SecretKey, if we are in the Some state
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = COption_SecretKeyZ_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a new COption_SecretKeyZ which has the same data as `orig`
		/// but with all dynamically-allocated buffers duplicated in new buffers.
		internal func clone() -> Option_SecretKeyZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCOption_SecretKeyZ>) in
					COption_SecretKeyZ_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_SecretKeyZ(
				cType: nativeCallResult, instantiationContext: "Option_SecretKeyZ.swift::\(#function):\(#line)")


			return returnValue
		}


		public func getValue() -> [UInt8]? {
			if self.cType!.tag == LDKCOption_SecretKeyZ_None {
				return nil
			}
			if self.cType!.tag == LDKCOption_SecretKeyZ_Some {
				return SecretKey(
					cType: self.cType!.some, instantiationContext: "Option_SecretKeyZ.swift::\(#function):\(#line)",
					anchor: self
				)
				.dangle().getValue()
			}
			assert(false, "invalid option enum value")
			return nil
		}


		internal func danglingClone() -> Option_SecretKeyZ {
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
						"Freeing Option_SecretKeyZ \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Option_SecretKeyZ \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}

}
