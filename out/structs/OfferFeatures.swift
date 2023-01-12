
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Features used within an `offer`.
			public typealias OfferFeatures = Bindings.OfferFeatures

			extension Bindings {
		

				/// Features used within an `offer`.
				public class OfferFeatures: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKOfferFeatures?

					internal init(cType: LDKOfferFeatures) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKOfferFeatures, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Checks if two OfferFeaturess contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public class func eq(a: OfferFeatures, b: OfferFeatures) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKOfferFeatures>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKOfferFeatures>) in
				OfferFeatures_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the OfferFeatures
					internal func clone() -> OfferFeatures {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKOfferFeatures>) in
				OfferFeatures_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = OfferFeatures(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the OfferFeatures, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = OfferFeatures_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Create a blank Features with no features set
					public class func initWithEmpty() -> OfferFeatures {
						// native call variable prep
						

						// native method call
						let nativeCallResult = OfferFeatures_empty()

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = OfferFeatures(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Returns true if this `Features` object contains unknown feature flags which are set as
					/// \"required\".
					public func requiresUnknownBits() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKOfferFeatures>) in
				OfferFeatures_requires_unknown_bits(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Serialize the OfferFeatures object into a byte array which can be read by OfferFeatures_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKOfferFeatures>) in
				OfferFeatures_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a OfferFeatures from a byte array, created by OfferFeatures_write
					public class func read(ser: [UInt8]) -> Result_OfferFeaturesDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = OfferFeatures_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_OfferFeaturesDecodeErrorZ(cType: nativeCallResult)
						

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> OfferFeatures {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> OfferFeatures {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> OfferFeatures {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> OfferFeatures {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> OfferFeatures {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing OfferFeatures \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing OfferFeatures \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		