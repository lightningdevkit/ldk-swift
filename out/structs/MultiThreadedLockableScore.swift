
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A concrete implementation of [`LockableScore`] which supports multi-threading.
			public typealias MultiThreadedLockableScore = Bindings.MultiThreadedLockableScore

			extension Bindings {
		

				/// A concrete implementation of [`LockableScore`] which supports multi-threading.
				public class MultiThreadedLockableScore: NativeTypeWrapper {

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

					internal var cType: LDKMultiThreadedLockableScore?

					internal init(cType: LDKMultiThreadedLockableScore, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKMultiThreadedLockableScore, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKMultiThreadedLockableScore, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the MultiThreadedLockableScore, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = MultiThreadedLockableScore_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new LockableScore which calls the relevant methods on this_arg.
					/// This copies the `inner` pointer in this_arg and thus the returned LockableScore must be freed before this_arg is
					public func asLockableScore() -> LockableScore {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKMultiThreadedLockableScore>) in
				MultiThreadedLockableScore_as_LockableScore(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = NativelyImplementedLockableScore(cType: nativeCallResult, instantiationContext: "MultiThreadedLockableScore.swift::\(#function):\(#line)", anchor: self)
						

						return returnValue
					}
		
					/// Serialize the MultiThreadedLockableScore object into a byte array which can be read by MultiThreadedLockableScore_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKMultiThreadedLockableScore>) in
				MultiThreadedLockableScore_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, instantiationContext: "MultiThreadedLockableScore.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Constructs a new WriteableScore which calls the relevant methods on this_arg.
					/// This copies the `inner` pointer in this_arg and thus the returned WriteableScore must be freed before this_arg is
					public func asWriteableScore() -> WriteableScore {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKMultiThreadedLockableScore>) in
				MultiThreadedLockableScore_as_WriteableScore(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = NativelyImplementedWriteableScore(cType: nativeCallResult, instantiationContext: "MultiThreadedLockableScore.swift::\(#function):\(#line)", anchor: self)
						

						return returnValue
					}
		
					/// Creates a new [`MultiThreadedLockableScore`] given an underlying [`Score`].
					public init(score: Score) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = MultiThreadedLockableScore_new(score.activate().cType!)

						// cleanup
						
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = MultiThreadedLockableScore(cType: nativeCallResult, instantiationContext: "MultiThreadedLockableScore.swift::\(#function):\(#line)")
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0, instantiationContext: "MultiThreadedLockableScore.swift::\(#function):\(#line)")
				
			
					}
		

					
					/// Indicates that this is the only struct which contains the same pointer.
					/// Rust functions which take ownership of an object provided via an argument require
					/// this to be true and invalidate the object pointed to by inner.
					public func isOwned() -> Bool {
						// return value (do some wrapping)
						let returnValue = self.cType!.is_owned

						return returnValue;
					}
		

					
					internal func setCFreeability(freeable: Bool) -> MultiThreadedLockableScore {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> MultiThreadedLockableScore {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing MultiThreadedLockableScore \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing MultiThreadedLockableScore \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

				}

				
			}
		
		