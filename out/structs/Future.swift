
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A simple future which can complete once, and calls some callback(s) when it does so.
			/// 
			/// Clones can be made and all futures cloned from the same source will complete at the same time.
			public typealias Future = Bindings.Future

			extension Bindings {
		

				/// A simple future which can complete once, and calls some callback(s) when it does so.
				/// 
				/// Clones can be made and all futures cloned from the same source will complete at the same time.
				public class Future: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKFuture?

					internal init(cType: LDKFuture) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKFuture, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the Future, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Future_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the Future
					internal func clone() -> Future {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKFuture>) in
				Future_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Future(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Registers a callback to be called upon completion of this future. If the future has already
					/// completed, the callback will be called immediately.
					public func registerCallbackFn(callback: FutureCallback) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKFuture>) in
				Future_register_callback_fn(thisArgPointer, callback.activate().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Waits until this [`Future`] completes.
					public func wait() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Future_wait(self.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Waits until this [`Future`] completes or the given amount of time has elapsed.
					/// 
					/// Returns true if the [`Future`] completed, false if the time elapsed.
					public func waitTimeout(maxWait: UInt64) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Future_wait_timeout(self.dynamicallyDangledClone().cType!, maxWait)

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> Future {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Future {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> Future {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> Future {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> Future {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Future \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Future \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		