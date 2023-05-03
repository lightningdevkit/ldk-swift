
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Features used within a `channel_announcement` message.
			public typealias ChannelFeatures = Bindings.ChannelFeatures

			extension Bindings {
		

				/// Features used within a `channel_announcement` message.
				public class ChannelFeatures: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKChannelFeatures?

					internal init(cType: LDKChannelFeatures, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKChannelFeatures, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Checks if two ChannelFeaturess contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public class func eq(a: ChannelFeatures, b: ChannelFeatures) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKChannelFeatures>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKChannelFeatures>) in
				ChannelFeatures_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the ChannelFeatures
					internal func clone() -> ChannelFeatures {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKChannelFeatures>) in
				ChannelFeatures_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ChannelFeatures(cType: nativeCallResult, instantiationContext: "ChannelFeatures.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Frees any resources used by the ChannelFeatures, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ChannelFeatures_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Create a blank Features with no features set
					public class func initWithEmpty() -> ChannelFeatures {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ChannelFeatures_empty()

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ChannelFeatures(cType: nativeCallResult, instantiationContext: "ChannelFeatures.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Returns true if this `Features` object contains unknown feature flags which are set as
					/// \"required\".
					public func requiresUnknownBits() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelFeatures>) in
				ChannelFeatures_requires_unknown_bits(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Serialize the ChannelFeatures object into a byte array which can be read by ChannelFeatures_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKChannelFeatures>) in
				ChannelFeatures_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, instantiationContext: "ChannelFeatures.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a ChannelFeatures from a byte array, created by ChannelFeatures_write
					public class func read(ser: [UInt8]) -> Result_ChannelFeaturesDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser, instantiationContext: "ChannelFeatures.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = ChannelFeatures_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_ChannelFeaturesDecodeErrorZ(cType: nativeCallResult, instantiationContext: "ChannelFeatures.swift::\(#function):\(#line)")
						

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> ChannelFeatures {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> ChannelFeatures {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> ChannelFeatures {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> ChannelFeatures {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> ChannelFeatures {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing ChannelFeatures \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing ChannelFeatures \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		