
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// 
			internal typealias Option_MonitorEventZ = Bindings.Option_MonitorEventZ

			extension Bindings {

				/// An enum which can either contain a crate::lightning::chain::channelmonitor::MonitorEvent or not
				internal class Option_MonitorEventZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCOption_MonitorEventZ?

					internal init(cType: LDKCOption_MonitorEventZ, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCOption_MonitorEventZ, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					internal init(some: MonitorEvent?, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						if let some = some {
														
							self.cType = COption_MonitorEventZ_some(some.danglingClone().cType!)
						} else {
							self.cType = COption_MonitorEventZ_none()
						}

						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					
					/// Frees any resources associated with the crate::lightning::chain::channelmonitor::MonitorEvent, if we are in the Some state
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = COption_MonitorEventZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new COption_MonitorEventZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Option_MonitorEventZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCOption_MonitorEventZ>) in
				COption_MonitorEventZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Option_MonitorEventZ(cType: nativeCallResult, instantiationContext: "Option_MonitorEventZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		

					public func getValue() -> MonitorEvent? {
						if self.cType!.tag == LDKCOption_MonitorEventZ_None {
							return nil
						}
						if self.cType!.tag == LDKCOption_MonitorEventZ_Some {
							return MonitorEvent(cType: self.cType!.some, instantiationContext: "Option_MonitorEventZ.swift::\(#function):\(#line)", anchor: self).dangle()
						}
						assert(false, "invalid option enum value")
						return nil
					}

					internal func dangle(_ shouldDangle: Bool = true) -> Option_MonitorEventZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Option_MonitorEventZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Option_MonitorEventZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Option_MonitorEventZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		