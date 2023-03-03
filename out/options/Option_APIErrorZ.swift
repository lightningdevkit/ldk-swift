
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// 
			internal typealias Option_APIErrorZ = Bindings.Option_APIErrorZ

			extension Bindings {

				/// An enum which can either contain a crate::lightning::util::errors::APIError or not
				internal class Option_APIErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCOption_APIErrorZ?

					internal init(cType: LDKCOption_APIErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKCOption_APIErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init(some: APIError?) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						if let some = some {
														
							self.cType = COption_APIErrorZ_some(some.danglingClone().cType!)
						} else {
							self.cType = COption_APIErrorZ_none()
						}

						super.init(conflictAvoidingVariableName: 0)
					}

					
					/// Frees any resources associated with the crate::lightning::util::errors::APIError, if we are in the Some state
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = COption_APIErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new COption_APIErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Option_APIErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCOption_APIErrorZ>) in
				COption_APIErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Option_APIErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		

					public func getValue() -> APIError? {
						if self.cType!.tag == LDKCOption_APIErrorZ_None {
							return nil
						}
						if self.cType!.tag == LDKCOption_APIErrorZ_Some {
							return APIError(cType: self.cType!.some, anchor: self).dangle()
						}
						assert(false, "invalid option enum value")
						return nil
					}

					internal func dangle(_ shouldDangle: Bool = true) -> Option_APIErrorZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Option_APIErrorZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Option_APIErrorZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Option_APIErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		