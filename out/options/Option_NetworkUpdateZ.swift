
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// 
			internal typealias Option_NetworkUpdateZ = Bindings.Option_NetworkUpdateZ

			extension Bindings {

				/// An enum which can either contain a crate::lightning::routing::gossip::NetworkUpdate or not
				internal class Option_NetworkUpdateZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCOption_NetworkUpdateZ?

					internal init(cType: LDKCOption_NetworkUpdateZ, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCOption_NetworkUpdateZ, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					internal init(some: NetworkUpdate?) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						if let some = some {
														
							self.cType = COption_NetworkUpdateZ_some(some.danglingClone().cType!)
						} else {
							self.cType = COption_NetworkUpdateZ_none()
						}

						super.init(conflictAvoidingVariableName: 0, instantiationContext: "Option_NetworkUpdateZ.swift::\(#function):\(#line)")
					}

					
					/// Frees any resources associated with the crate::lightning::routing::gossip::NetworkUpdate, if we are in the Some state
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = COption_NetworkUpdateZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new COption_NetworkUpdateZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Option_NetworkUpdateZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCOption_NetworkUpdateZ>) in
				COption_NetworkUpdateZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Option_NetworkUpdateZ(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)")
						

						return returnValue
					}
		

					public func getValue() -> NetworkUpdate? {
						if self.cType!.tag == LDKCOption_NetworkUpdateZ_None {
							return nil
						}
						if self.cType!.tag == LDKCOption_NetworkUpdateZ_Some {
							return NetworkUpdate(cType: self.cType!.some, instantiationContext: "#{swift_class_name}::\(#function):\(#line)", anchor: self).dangle()
						}
						assert(false, "invalid option enum value")
						return nil
					}

					internal func dangle(_ shouldDangle: Bool = true) -> Option_NetworkUpdateZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Option_NetworkUpdateZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Option_NetworkUpdateZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Option_NetworkUpdateZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		