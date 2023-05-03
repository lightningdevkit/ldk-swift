
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// 
			internal typealias Option_CVec_u8ZZ = Bindings.Option_CVec_u8ZZ

			extension Bindings {

				/// An enum which can either contain a crate::c_types::derived::CVec_u8Z or not
				internal class Option_CVec_u8ZZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCOption_CVec_u8ZZ?

					internal init(cType: LDKCOption_CVec_u8ZZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKCOption_CVec_u8ZZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init(some: [UInt8]?) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						if let some = some {
							
							let someVector = Vec_u8Z(array: some).dangle()
				
							self.cType = COption_CVec_u8ZZ_some(someVector.cType!)
						} else {
							self.cType = COption_CVec_u8ZZ_none()
						}

						super.init(conflictAvoidingVariableName: 0)
					}

					
					/// Frees any resources associated with the crate::c_types::derived::CVec_u8Z, if we are in the Some state
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = COption_CVec_u8ZZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new COption_CVec_u8ZZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Option_CVec_u8ZZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCOption_CVec_u8ZZ>) in
				COption_CVec_u8ZZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Option_CVec_u8ZZ(cType: nativeCallResult)
						

						return returnValue
					}
		

					public func getValue() -> [UInt8]? {
						if self.cType!.tag == LDKCOption_CVec_u8ZZ_None {
							return nil
						}
						if self.cType!.tag == LDKCOption_CVec_u8ZZ_Some {
							return Vec_u8Z(cType: self.cType!.some, anchor: self).dangle().getValue()
						}
						assert(false, "invalid option enum value")
						return nil
					}

					internal func dangle(_ shouldDangle: Bool = true) -> Option_CVec_u8ZZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Option_CVec_u8ZZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Option_CVec_u8ZZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Option_CVec_u8ZZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		