
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// 
			internal typealias Option_u64Z = Bindings.Option_u64Z

			extension Bindings {

				/// An enum which can either contain a u64 or not
				internal class Option_u64Z: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCOption_u64Z?

					internal init(cType: LDKCOption_u64Z, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCOption_u64Z, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					internal init(some: UInt64?) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						if let some = some {
														
							self.cType = COption_u64Z_some(some)
						} else {
							self.cType = COption_u64Z_none()
						}

						super.init(conflictAvoidingVariableName: 0, instantiationContext: "Option_u64Z.swift::\(#function):\(#line)")
					}

					
					/// Frees any resources associated with the u64, if we are in the Some state
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = COption_u64Z_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new COption_u64Z which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Option_u64Z {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCOption_u64Z>) in
				COption_u64Z_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Option_u64Z(cType: nativeCallResult, instantiationContext: "Option_u64Z.swift::\(#function):\(#line)")
						

						return returnValue
					}
		

					public func getValue() -> UInt64? {
						if self.cType!.tag == LDKCOption_u64Z_None {
							return nil
						}
						if self.cType!.tag == LDKCOption_u64Z_Some {
							return self.cType!.some
						}
						assert(false, "invalid option enum value")
						return nil
					}

					internal func dangle(_ shouldDangle: Bool = true) -> Option_u64Z {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Option_u64Z {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Option_u64Z \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Option_u64Z \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		