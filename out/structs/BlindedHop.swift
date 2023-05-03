
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Used to construct the blinded hops portion of a blinded path. These hops cannot be identified
			/// by outside observers and thus can be used to hide the identity of the recipient.
			public typealias BlindedHop = Bindings.BlindedHop

			extension Bindings {
		

				/// Used to construct the blinded hops portion of a blinded path. These hops cannot be identified
				/// by outside observers and thus can be used to hide the identity of the recipient.
				public class BlindedHop: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKBlindedHop?

					internal init(cType: LDKBlindedHop, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKBlindedHop, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the BlindedHop, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = BlindedHop_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the BlindedHop
					internal func clone() -> BlindedHop {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKBlindedHop>) in
				BlindedHop_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = BlindedHop(cType: nativeCallResult, instantiationContext: "BlindedHop.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Serialize the BlindedHop object into a byte array which can be read by BlindedHop_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKBlindedHop>) in
				BlindedHop_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, instantiationContext: "BlindedHop.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a BlindedHop from a byte array, created by BlindedHop_write
					public class func read(ser: [UInt8]) -> Result_BlindedHopDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser, instantiationContext: "BlindedHop.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = BlindedHop_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_BlindedHopDecodeErrorZ(cType: nativeCallResult, instantiationContext: "BlindedHop.swift::\(#function):\(#line)")
						

						return returnValue
					}
		

					
					/// Indicates that this is the only struct which contains the same pointer.
					/// Rust functions which take ownership of an object provided via an argument require
					/// this to be true and invalidate the object pointed to by inner.
					public func isOwned() -> Bool {
						// return value (do some wrapping)
						let returnValue = self.cType!.is_owned

						return returnValue;
					}
		

					internal func dangle(_ shouldDangle: Bool = true) -> BlindedHop {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> BlindedHop {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> BlindedHop {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> BlindedHop {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> BlindedHop {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing BlindedHop \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing BlindedHop \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		