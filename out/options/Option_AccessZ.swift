
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// 
			internal typealias Option_AccessZ = Bindings.Option_AccessZ

			extension Bindings {

				/// An enum which can either contain a crate::lightning::chain::Access or not
				internal class Option_AccessZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCOption_AccessZ?

					internal init(cType: LDKCOption_AccessZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKCOption_AccessZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init(some: Access?) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						if let some = some {
														
							self.cType = COption_AccessZ_some(some.activate().cType!)
						} else {
							self.cType = COption_AccessZ_none()
						}

						super.init(conflictAvoidingVariableName: 0)
					}

					
					/// Frees any resources associated with the crate::lightning::chain::Access, if we are in the Some state
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = COption_AccessZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					public func getValue() -> Access? {
						if self.cType!.tag == LDKCOption_AccessZ_None {
							return nil
						}
						if self.cType!.tag == LDKCOption_AccessZ_Some {
							return NativelyImplementedAccess(cType: self.cType!.some, anchor: self).dangle()
						}
						assert(false, "invalid option enum value")
						return nil
					}

					internal func dangle(_ shouldDangle: Bool = true) -> Option_AccessZ {
        				self.dangling = shouldDangle
						return self
					}

					
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Option_AccessZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Option_AccessZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		