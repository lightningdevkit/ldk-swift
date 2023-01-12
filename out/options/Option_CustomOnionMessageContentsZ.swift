
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// 
			internal typealias Option_CustomOnionMessageContentsZ = Bindings.Option_CustomOnionMessageContentsZ

			extension Bindings {

				/// An enum which can either contain a crate::lightning::onion_message::packet::CustomOnionMessageContents or not
				internal class Option_CustomOnionMessageContentsZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCOption_CustomOnionMessageContentsZ?

					internal init(cType: LDKCOption_CustomOnionMessageContentsZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKCOption_CustomOnionMessageContentsZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init(some: CustomOnionMessageContents?) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						if let some = some {
														
							self.cType = COption_CustomOnionMessageContentsZ_some(some.activate().cType!)
						} else {
							self.cType = COption_CustomOnionMessageContentsZ_none()
						}

						super.init(conflictAvoidingVariableName: 0)
					}

					
					/// Frees any resources associated with the crate::lightning::onion_message::packet::CustomOnionMessageContents, if we are in the Some state
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = COption_CustomOnionMessageContentsZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new COption_CustomOnionMessageContentsZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Option_CustomOnionMessageContentsZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCOption_CustomOnionMessageContentsZ>) in
				COption_CustomOnionMessageContentsZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Option_CustomOnionMessageContentsZ(cType: nativeCallResult)
						

						return returnValue
					}
		

					public func getValue() -> CustomOnionMessageContents? {
						if self.cType!.tag == LDKCOption_CustomOnionMessageContentsZ_None {
							return nil
						}
						if self.cType!.tag == LDKCOption_CustomOnionMessageContentsZ_Some {
							return NativelyImplementedCustomOnionMessageContents(cType: self.cType!.some, anchor: self).dangle()
						}
						assert(false, "invalid option enum value")
						return nil
					}

					internal func dangle(_ shouldDangle: Bool = true) -> Option_CustomOnionMessageContentsZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Option_CustomOnionMessageContentsZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Option_CustomOnionMessageContentsZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Option_CustomOnionMessageContentsZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		