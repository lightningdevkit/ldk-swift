
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// 
			internal typealias Option_NetAddressZ = Bindings.Option_NetAddressZ

			extension Bindings {

				/// An enum which can either contain a crate::lightning::ln::msgs::NetAddress or not
				internal class Option_NetAddressZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCOption_NetAddressZ?

					internal init(cType: LDKCOption_NetAddressZ, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCOption_NetAddressZ, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					internal init(some: NetAddress?) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						if let some = some {
														
							self.cType = COption_NetAddressZ_some(some.danglingClone().cType!)
						} else {
							self.cType = COption_NetAddressZ_none()
						}

						super.init(conflictAvoidingVariableName: 0, instantiationContext: "Option_NetAddressZ.swift::\(#function):\(#line)")
					}

					
					/// Frees any resources associated with the crate::lightning::ln::msgs::NetAddress, if we are in the Some state
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = COption_NetAddressZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new COption_NetAddressZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Option_NetAddressZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCOption_NetAddressZ>) in
				COption_NetAddressZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Option_NetAddressZ(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)")
						

						return returnValue
					}
		

					public func getValue() -> NetAddress? {
						if self.cType!.tag == LDKCOption_NetAddressZ_None {
							return nil
						}
						if self.cType!.tag == LDKCOption_NetAddressZ_Some {
							return NetAddress(cType: self.cType!.some, instantiationContext: "#{swift_class_name}::\(#function):\(#line)", anchor: self).dangle()
						}
						assert(false, "invalid option enum value")
						return nil
					}

					internal func dangle(_ shouldDangle: Bool = true) -> Option_NetAddressZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Option_NetAddressZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Option_NetAddressZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Option_NetAddressZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		