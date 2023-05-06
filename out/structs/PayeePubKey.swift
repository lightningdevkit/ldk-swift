
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Payee public key
			public typealias PayeePubKey = Bindings.PayeePubKey

			extension Bindings {
		

				/// Payee public key
				public class PayeePubKey: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					/// Set to false to suppress an individual type's deinit log statements.
					/// Only applicable when log threshold is set to `.Debug`.
					public static var enableDeinitLogging = true

					/// Set to true to suspend the freeing of this type's associated Rust memory.
					/// Should only ever be used for debugging purposes, and will likely be
					/// deprecated soon.
					public static var suspendFreedom = false

					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKPayeePubKey?

					internal init(cType: LDKPayeePubKey, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKPayeePubKey, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKPayeePubKey, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the PayeePubKey, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = PayeePubKey_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// 
					public func getA() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKPayeePubKey>) in
				PayeePubKey_get_a(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = PublicKey(cType: nativeCallResult, instantiationContext: "PayeePubKey.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// 
					public func setA(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = PublicKey(value: val, instantiationContext: "PayeePubKey.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKPayeePubKey>) in
				PayeePubKey_set_a(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new PayeePubKey given each field
					public init(aArg: [UInt8]) {
						// native call variable prep
						
						let aArgPrimitiveWrapper = PublicKey(value: aArg, instantiationContext: "PayeePubKey.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = PayeePubKey_new(aArgPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						aArgPrimitiveWrapper.noOpRetain()
				
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = PayeePubKey(cType: nativeCallResult, instantiationContext: "PayeePubKey.swift::\(#function):\(#line)")
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0, instantiationContext: "PayeePubKey.swift::\(#function):\(#line)")
				
			
					}
		
					/// Creates a copy of the PayeePubKey
					internal func clone() -> PayeePubKey {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKPayeePubKey>) in
				PayeePubKey_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = PayeePubKey(cType: nativeCallResult, instantiationContext: "PayeePubKey.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Generates a non-cryptographic 64-bit hash of the PayeePubKey.
					public func hash() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKPayeePubKey>) in
				PayeePubKey_hash(oPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if two PayeePubKeys contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public class func eq(a: PayeePubKey, b: PayeePubKey) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKPayeePubKey>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKPayeePubKey>) in
				PayeePubKey_eq(aPointer, bPointer)
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
		

					internal func dangle(_ shouldDangle: Bool = true) -> PayeePubKey {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> PayeePubKey {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> PayeePubKey {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> PayeePubKey {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> PayeePubKey {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing PayeePubKey \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing PayeePubKey \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

				}

				
			}
		
		