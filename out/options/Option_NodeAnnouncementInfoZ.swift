#if SWIFT_PACKAGE
	import LDKHeaders
#endif

///
internal typealias Option_NodeAnnouncementInfoZ = Bindings.Option_NodeAnnouncementInfoZ

extension Bindings {

	/// An enum which can either contain a crate::lightning::routing::gossip::NodeAnnouncementInfo or not
	internal class Option_NodeAnnouncementInfoZ: NativeTypeWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKCOption_NodeAnnouncementInfoZ?

		internal init(cType: LDKCOption_NodeAnnouncementInfoZ, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKCOption_NodeAnnouncementInfoZ, instantiationContext: String, anchor: NativeTypeWrapper)
		{
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKCOption_NodeAnnouncementInfoZ, instantiationContext: String, anchor: NativeTypeWrapper,
			dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		internal init(some: NodeAnnouncementInfo?, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter

			if let some = some {

				self.cType = COption_NodeAnnouncementInfoZ_some(some.danglingClone().cType!)
			} else {
				self.cType = COption_NodeAnnouncementInfoZ_none()
			}

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}


		/// Frees any resources associated with the crate::lightning::routing::gossip::NodeAnnouncementInfo, if we are in the Some state
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = COption_NodeAnnouncementInfoZ_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a new COption_NodeAnnouncementInfoZ which has the same data as `orig`
		/// but with all dynamically-allocated buffers duplicated in new buffers.
		internal func clone() -> Option_NodeAnnouncementInfoZ {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCOption_NodeAnnouncementInfoZ>) in
					COption_NodeAnnouncementInfoZ_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = Option_NodeAnnouncementInfoZ(
				cType: nativeCallResult,
				instantiationContext: "Option_NodeAnnouncementInfoZ.swift::\(#function):\(#line)")


			return returnValue
		}


		public func getValue() -> NodeAnnouncementInfo? {
			if self.cType!.tag == LDKCOption_NodeAnnouncementInfoZ_None {
				return nil
			}
			if self.cType!.tag == LDKCOption_NodeAnnouncementInfoZ_Some {
				return NodeAnnouncementInfo(
					cType: self.cType!.some,
					instantiationContext: "Option_NodeAnnouncementInfoZ.swift::\(#function):\(#line)", anchor: self
				)
				.dangle()
			}
			assert(false, "invalid option enum value")
			return nil
		}


		internal func danglingClone() -> Option_NodeAnnouncementInfoZ {
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
						"Freeing Option_NodeAnnouncementInfoZ \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Option_NodeAnnouncementInfoZ \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}

}
