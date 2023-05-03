
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// `min_final_cltv_expiry_delta` to use for the last HTLC in the route
			public typealias MinFinalCltvExpiryDelta = Bindings.MinFinalCltvExpiryDelta

			extension Bindings {
		

				/// `min_final_cltv_expiry_delta` to use for the last HTLC in the route
				public class MinFinalCltvExpiryDelta: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKMinFinalCltvExpiryDelta?

					internal init(cType: LDKMinFinalCltvExpiryDelta) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKMinFinalCltvExpiryDelta, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the MinFinalCltvExpiryDelta, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = MinFinalCltvExpiryDelta_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// 
					public func getA() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKMinFinalCltvExpiryDelta>) in
				MinFinalCltvExpiryDelta_get_a(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// 
					public func setA(val: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKMinFinalCltvExpiryDelta>) in
				MinFinalCltvExpiryDelta_set_a(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new MinFinalCltvExpiryDelta given each field
					public init(aArg: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = MinFinalCltvExpiryDelta_new(aArg)

						// cleanup
						
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = MinFinalCltvExpiryDelta(cType: nativeCallResult)
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
				
			
					}
		
					/// Creates a copy of the MinFinalCltvExpiryDelta
					internal func clone() -> MinFinalCltvExpiryDelta {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKMinFinalCltvExpiryDelta>) in
				MinFinalCltvExpiryDelta_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = MinFinalCltvExpiryDelta(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Generates a non-cryptographic 64-bit hash of the MinFinalCltvExpiryDelta.
					public func hash() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKMinFinalCltvExpiryDelta>) in
				MinFinalCltvExpiryDelta_hash(oPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if two MinFinalCltvExpiryDeltas contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public class func eq(a: MinFinalCltvExpiryDelta, b: MinFinalCltvExpiryDelta) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKMinFinalCltvExpiryDelta>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKMinFinalCltvExpiryDelta>) in
				MinFinalCltvExpiryDelta_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> MinFinalCltvExpiryDelta {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> MinFinalCltvExpiryDelta {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> MinFinalCltvExpiryDelta {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> MinFinalCltvExpiryDelta {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> MinFinalCltvExpiryDelta {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing MinFinalCltvExpiryDelta \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing MinFinalCltvExpiryDelta \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		