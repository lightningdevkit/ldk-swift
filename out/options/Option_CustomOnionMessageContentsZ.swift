
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// 
			internal typealias Option_CustomOnionMessageContentsZ = Bindings.Option_CustomOnionMessageContentsZ

			extension Bindings {

				/// An enum which can either contain a crate::lightning::onion_message::packet::CustomOnionMessageContents or not
				internal class Option_CustomOnionMessageContentsZ: NativeTypeWrapper {

					
					/// Set to false to suppress an individual type's deinit log statements.
					/// Only applicable when log threshold is set to `.Debug`.
					public static var enableDeinitLogging = true

					/// Set to true to suspend the freeing of this type's associated Rust memory.
					/// Should only ever be used for debugging purposes, and will likely be
					/// deprecated soon.
					public static var suspendFreedom = false

					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCOption_CustomOnionMessageContentsZ?

					internal init(cType: LDKCOption_CustomOnionMessageContentsZ, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCOption_CustomOnionMessageContentsZ, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKCOption_CustomOnionMessageContentsZ, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					internal init(some: CustomOnionMessageContents?, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						if let some = some {
														
							self.cType = COption_CustomOnionMessageContentsZ_some(some.activate().cType!)
						} else {
							self.cType = COption_CustomOnionMessageContentsZ_none()
						}

						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					
					/// Frees any resources associated with the crate::lightning::onion_message::packet::CustomOnionMessageContents, if we are in the Some state
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = COption_CustomOnionMessageContentsZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new COption_CustomOnionMessageContentsZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Option_CustomOnionMessageContentsZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCOption_CustomOnionMessageContentsZ>) in
				COption_CustomOnionMessageContentsZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Option_CustomOnionMessageContentsZ(cType: nativeCallResult, instantiationContext: "Option_CustomOnionMessageContentsZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		

					public func getValue() -> CustomOnionMessageContents? {
						if self.cType!.tag == LDKCOption_CustomOnionMessageContentsZ_None {
							return nil
						}
						if self.cType!.tag == LDKCOption_CustomOnionMessageContentsZ_Some {
							return NativelyImplementedCustomOnionMessageContents(cType: self.cType!.some, instantiationContext: "Option_CustomOnionMessageContentsZ.swift::\(#function):\(#line)", anchor: self).dangle()
						}
						assert(false, "invalid option enum value")
						return nil
					}

					internal func dangle(_ shouldDangle: Bool = true) -> Option_CustomOnionMessageContentsZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Option_CustomOnionMessageContentsZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing Option_CustomOnionMessageContentsZ \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing Option_CustomOnionMessageContentsZ \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

				}

			}
		