
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// 
			internal typealias Option_ClosureReasonZ = Bindings.Option_ClosureReasonZ

			extension Bindings {

				/// An enum which can either contain a crate::lightning::util::events::ClosureReason or not
				internal class Option_ClosureReasonZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCOption_ClosureReasonZ?

					internal init(cType: LDKCOption_ClosureReasonZ, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCOption_ClosureReasonZ, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					internal init(some: ClosureReason?) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						if let some = some {
														
							self.cType = COption_ClosureReasonZ_some(some.danglingClone().cType!)
						} else {
							self.cType = COption_ClosureReasonZ_none()
						}

						super.init(conflictAvoidingVariableName: 0, instantiationContext: "Option_ClosureReasonZ.swift::\(#function):\(#line)")
					}

					
					/// Frees any resources associated with the crate::lightning::util::events::ClosureReason, if we are in the Some state
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = COption_ClosureReasonZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new COption_ClosureReasonZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Option_ClosureReasonZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCOption_ClosureReasonZ>) in
				COption_ClosureReasonZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Option_ClosureReasonZ(cType: nativeCallResult, instantiationContext: "Option_ClosureReasonZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		

					public func getValue() -> ClosureReason? {
						if self.cType!.tag == LDKCOption_ClosureReasonZ_None {
							return nil
						}
						if self.cType!.tag == LDKCOption_ClosureReasonZ_Some {
							return ClosureReason(cType: self.cType!.some, instantiationContext: "Option_ClosureReasonZ.swift::\(#function):\(#line)", anchor: self).dangle()
						}
						assert(false, "invalid option enum value")
						return nil
					}

					internal func dangle(_ shouldDangle: Bool = true) -> Option_ClosureReasonZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Option_ClosureReasonZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Option_ClosureReasonZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Option_ClosureReasonZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		