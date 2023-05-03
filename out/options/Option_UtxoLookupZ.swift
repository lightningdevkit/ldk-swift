
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// 
			internal typealias Option_UtxoLookupZ = Bindings.Option_UtxoLookupZ

			extension Bindings {

				/// An enum which can either contain a crate::lightning::routing::utxo::UtxoLookup or not
				internal class Option_UtxoLookupZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCOption_UtxoLookupZ?

					internal init(cType: LDKCOption_UtxoLookupZ, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCOption_UtxoLookupZ, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					internal init(some: UtxoLookup?, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						if let some = some {
														
							self.cType = COption_UtxoLookupZ_some(some.activate().cType!)
						} else {
							self.cType = COption_UtxoLookupZ_none()
						}

						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					
					/// Frees any resources associated with the crate::lightning::routing::utxo::UtxoLookup, if we are in the Some state
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = COption_UtxoLookupZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					public func getValue() -> UtxoLookup? {
						if self.cType!.tag == LDKCOption_UtxoLookupZ_None {
							return nil
						}
						if self.cType!.tag == LDKCOption_UtxoLookupZ_Some {
							return NativelyImplementedUtxoLookup(cType: self.cType!.some, instantiationContext: "Option_UtxoLookupZ.swift::\(#function):\(#line)", anchor: self).dangle()
						}
						assert(false, "invalid option enum value")
						return nil
					}

					internal func dangle(_ shouldDangle: Bool = true) -> Option_UtxoLookupZ {
        				self.dangling = shouldDangle
						return self
					}

					
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Option_UtxoLookupZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Option_UtxoLookupZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		