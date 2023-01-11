
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// 
			internal typealias Option_u32Z = Bindings.Option_u32Z

			extension Bindings {

				/// An enum which can either contain a u32 or not
				internal class Option_u32Z: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCOption_u32Z?

					internal init(cType: LDKCOption_u32Z) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKCOption_u32Z, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init(some: UInt32?) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						if let some = some {
														
							self.cType = COption_u32Z_some(some)
						} else {
							self.cType = COption_u32Z_none()
						}

						super.init(conflictAvoidingVariableName: 0)
					}

					
					/// Frees any resources associated with the u32, if we are in the Some state
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = COption_u32Z_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new COption_u32Z which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Option_u32Z {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCOption_u32Z>) in
				COption_u32Z_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Option_u32Z(cType: nativeCallResult)
						

						return returnValue
					}
		

					public func getValue() -> UInt32? {
						if self.cType!.tag == LDKCOption_u32Z_None {
							return nil
						}
						if self.cType!.tag == LDKCOption_u32Z_Some {
							return self.cType!.some
						}
						assert(false, "invalid option enum value")
						return nil
					}

					internal func dangle(_ shouldDangle: Bool = true) -> Option_u32Z {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Option_u32Z {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Option_u32Z \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Option_u32Z \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		