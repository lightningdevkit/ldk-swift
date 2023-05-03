
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// 
			internal typealias Option_ScalarZ = Bindings.Option_ScalarZ

			extension Bindings {

				/// An enum which can either contain a crate::c_types::BigEndianScalar or not
				internal class Option_ScalarZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCOption_ScalarZ?

					internal init(cType: LDKCOption_ScalarZ, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCOption_ScalarZ, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					internal init(some: [UInt8]?) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						if let some = some {
							
							let somePrimitiveWrapper = BigEndianScalar(value: some)
				
							self.cType = COption_ScalarZ_some(somePrimitiveWrapper.cType!)
						} else {
							self.cType = COption_ScalarZ_none()
						}

						super.init(conflictAvoidingVariableName: 0, instantiationContext: "Option_ScalarZ.swift::\(#function):\(#line)")
					}

					
					/// Frees any resources associated with the crate::c_types::BigEndianScalar, if we are in the Some state
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = COption_ScalarZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					public func getValue() -> [UInt8]? {
						if self.cType!.tag == LDKCOption_ScalarZ_None {
							return nil
						}
						if self.cType!.tag == LDKCOption_ScalarZ_Some {
							return BigEndianScalar(cType: self.cType!.some, instantiationContext: "#{swift_class_name}::\(#function):\(#line)", anchor: self).dangle().getValue()
						}
						assert(false, "invalid option enum value")
						return nil
					}

					internal func dangle(_ shouldDangle: Bool = true) -> Option_ScalarZ {
        				self.dangling = shouldDangle
						return self
					}

					
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Option_ScalarZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Option_ScalarZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		