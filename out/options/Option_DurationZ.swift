
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// 
			internal typealias Option_DurationZ = Bindings.Option_DurationZ

			extension Bindings {

				/// An enum which can either contain a u64 or not
				internal class Option_DurationZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCOption_DurationZ?

					internal init(cType: LDKCOption_DurationZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKCOption_DurationZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init(some: UInt64?) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						if let some = some {
														
							self.cType = COption_DurationZ_some(some)
						} else {
							self.cType = COption_DurationZ_none()
						}

						super.init(conflictAvoidingVariableName: 0)
					}

					
					/// Frees any resources associated with the u64, if we are in the Some state
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = COption_DurationZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new COption_DurationZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Option_DurationZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCOption_DurationZ>) in
				COption_DurationZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Option_DurationZ(cType: nativeCallResult)
						

						return returnValue
					}
		

					public func getValue() -> UInt64? {
						if self.cType!.tag == LDKCOption_DurationZ_None {
							return nil
						}
						if self.cType!.tag == LDKCOption_DurationZ_Some {
							return self.cType!.some
						}
						assert(false, "invalid option enum value")
						return nil
					}

					internal func dangle(_ shouldDangle: Bool = true) -> Option_DurationZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Option_DurationZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Option_DurationZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Option_DurationZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		