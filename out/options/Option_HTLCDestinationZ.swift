
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// 
			internal typealias Option_HTLCDestinationZ = Bindings.Option_HTLCDestinationZ

			extension Bindings {

				/// An enum which can either contain a crate::lightning::util::events::HTLCDestination or not
				internal class Option_HTLCDestinationZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCOption_HTLCDestinationZ?

					internal init(cType: LDKCOption_HTLCDestinationZ, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCOption_HTLCDestinationZ, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					internal init(some: HTLCDestination?) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						if let some = some {
														
							self.cType = COption_HTLCDestinationZ_some(some.danglingClone().cType!)
						} else {
							self.cType = COption_HTLCDestinationZ_none()
						}

						super.init(conflictAvoidingVariableName: 0, instantiationContext: "Option_HTLCDestinationZ.swift::\(#function):\(#line)")
					}

					
					/// Frees any resources associated with the crate::lightning::util::events::HTLCDestination, if we are in the Some state
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = COption_HTLCDestinationZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new COption_HTLCDestinationZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Option_HTLCDestinationZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCOption_HTLCDestinationZ>) in
				COption_HTLCDestinationZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Option_HTLCDestinationZ(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)")
						

						return returnValue
					}
		

					public func getValue() -> HTLCDestination? {
						if self.cType!.tag == LDKCOption_HTLCDestinationZ_None {
							return nil
						}
						if self.cType!.tag == LDKCOption_HTLCDestinationZ_Some {
							return HTLCDestination(cType: self.cType!.some, instantiationContext: "#{swift_class_name}::\(#function):\(#line)", anchor: self).dangle()
						}
						assert(false, "invalid option enum value")
						return nil
					}

					internal func dangle(_ shouldDangle: Bool = true) -> Option_HTLCDestinationZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Option_HTLCDestinationZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Option_HTLCDestinationZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Option_HTLCDestinationZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		