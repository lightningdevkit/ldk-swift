
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Positive duration that defines when (relatively to the timestamp) in the future the invoice
			/// expires
			public typealias ExpiryTime = Bindings.ExpiryTime

			extension Bindings {
		

				/// Positive duration that defines when (relatively to the timestamp) in the future the invoice
				/// expires
				public class ExpiryTime: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					public static var enableDeinitLogging = true
					public static var suspendFreedom = false
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKExpiryTime?

					internal init(cType: LDKExpiryTime, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKExpiryTime, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the ExpiryTime, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ExpiryTime_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the ExpiryTime
					internal func clone() -> ExpiryTime {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKExpiryTime>) in
				ExpiryTime_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ExpiryTime(cType: nativeCallResult, instantiationContext: "ExpiryTime.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Checks if two ExpiryTimes contain equal inner contents.
					public func hash() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKExpiryTime>) in
				ExpiryTime_hash(oPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if two ExpiryTimes contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public class func eq(a: ExpiryTime, b: ExpiryTime) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKExpiryTime>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKExpiryTime>) in
				ExpiryTime_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Construct an `ExpiryTime` from seconds.
					public class func initWithSeconds(seconds: UInt64) -> ExpiryTime {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ExpiryTime_from_seconds(seconds)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ExpiryTime(cType: nativeCallResult, instantiationContext: "ExpiryTime.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Construct an `ExpiryTime` from a `Duration`, dropping the sub-second part.
					public class func initWithDuration(duration: UInt64) -> ExpiryTime {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ExpiryTime_from_duration(duration)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ExpiryTime(cType: nativeCallResult, instantiationContext: "ExpiryTime.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Returns the expiry time in seconds
					public func asSeconds() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKExpiryTime>) in
				ExpiryTime_as_seconds(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Returns a reference to the underlying `Duration` (=expiry time)
					public func asDuration() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKExpiryTime>) in
				ExpiryTime_as_duration(thisArgPointer)
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
		

					internal func dangle(_ shouldDangle: Bool = true) -> ExpiryTime {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> ExpiryTime {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> ExpiryTime {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> ExpiryTime {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> ExpiryTime {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing ExpiryTime \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing ExpiryTime \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

				}

				
			}
		
		