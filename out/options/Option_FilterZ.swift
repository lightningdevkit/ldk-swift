
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// 
			internal typealias Option_FilterZ = Bindings.Option_FilterZ

			extension Bindings {

				/// An enum which can either contain a crate::lightning::chain::Filter or not
				internal class Option_FilterZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCOption_FilterZ?

					internal init(cType: LDKCOption_FilterZ, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCOption_FilterZ, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					internal init(some: Filter?) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						if let some = some {
														
							self.cType = COption_FilterZ_some(some.activate().cType!)
						} else {
							self.cType = COption_FilterZ_none()
						}

						super.init(conflictAvoidingVariableName: 0, instantiationContext: "Option_FilterZ.swift::\(#function):\(#line)")
					}

					
					/// Frees any resources associated with the crate::lightning::chain::Filter, if we are in the Some state
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = COption_FilterZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					public func getValue() -> Filter? {
						if self.cType!.tag == LDKCOption_FilterZ_None {
							return nil
						}
						if self.cType!.tag == LDKCOption_FilterZ_Some {
							return NativelyImplementedFilter(cType: self.cType!.some, instantiationContext: "#{swift_class_name}::\(#function):\(#line)", anchor: self).dangle()
						}
						assert(false, "invalid option enum value")
						return nil
					}

					internal func dangle(_ shouldDangle: Bool = true) -> Option_FilterZ {
        				self.dangling = shouldDangle
						return self
					}

					
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Option_FilterZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Option_FilterZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		