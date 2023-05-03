
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// 
			internal typealias Option_TypeZ = Bindings.Option_TypeZ

			extension Bindings {

				/// An enum which can either contain a crate::lightning::ln::wire::Type or not
				internal class Option_TypeZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCOption_TypeZ?

					internal init(cType: LDKCOption_TypeZ, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCOption_TypeZ, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					internal init(some: BindingsType?, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						if let some = some {
														
							self.cType = COption_TypeZ_some(some.activate().cType!)
						} else {
							self.cType = COption_TypeZ_none()
						}

						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					
					/// Frees any resources associated with the crate::lightning::ln::wire::Type, if we are in the Some state
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = COption_TypeZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new COption_TypeZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Option_TypeZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCOption_TypeZ>) in
				COption_TypeZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Option_TypeZ(cType: nativeCallResult, instantiationContext: "Option_TypeZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		

					public func getValue() -> BindingsType? {
						if self.cType!.tag == LDKCOption_TypeZ_None {
							return nil
						}
						if self.cType!.tag == LDKCOption_TypeZ_Some {
							return NativelyImplementedBindingsType(cType: self.cType!.some, instantiationContext: "Option_TypeZ.swift::\(#function):\(#line)", anchor: self).dangle()
						}
						assert(false, "invalid option enum value")
						return nil
					}

					internal func dangle(_ shouldDangle: Bool = true) -> Option_TypeZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Option_TypeZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Option_TypeZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Option_TypeZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		