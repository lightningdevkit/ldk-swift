
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			// necessary for abort() calls
			import Foundation

			/// A callback which is called when a [`Future`] completes.
			/// 
			/// Note that this MUST NOT call back into LDK directly, it must instead schedule actions to be
			/// taken later. Rust users should use the [`std::future::Future`] implementation for [`Future`]
			/// instead.
			/// 
			/// Note that the [`std::future::Future`] implementation may only work for runtimes which schedule
			/// futures when they receive a wake, rather than immediately executing them.
			public typealias FutureCallback = Bindings.FutureCallback

			extension Bindings {

				/// A callback which is called when a [`Future`] completes.
				/// 
				/// Note that this MUST NOT call back into LDK directly, it must instead schedule actions to be
				/// taken later. Rust users should use the [`std::future::Future`] implementation for [`Future`]
				/// instead.
				/// 
				/// Note that the [`std::future::Future`] implementation may only work for runtimes which schedule
				/// futures when they receive a wake, rather than immediately executing them.
				open class FutureCallback: NativeTraitWrapper {

					
					/// Set to false to suppress an individual type's deinit log statements.
					/// Only applicable when log threshold is set to `.Debug`.
					public static var enableDeinitLogging = true

					/// Set to true to suspend the freeing of this type's associated Rust memory.
					/// Should only ever be used for debugging purposes, and will likely be
					/// deprecated soon.
					public static var suspendFreedom = false

					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKFutureCallback?

					internal init(cType: LDKFutureCallback, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKFutureCallback, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKFutureCallback, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					public init() {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						super.init(conflictAvoidingVariableName: 0, instantiationContext: "FutureCallback.swift::\(#function):\(#line)")

						let thisArg = Bindings.instanceToPointer(instance: self)

						

						
						func callLambda(this_arg: UnsafeRawPointer?) -> Void {
							let instance: FutureCallback = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "FutureCallback::callLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.call()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func freeLambda(this_arg: UnsafeMutableRawPointer?) -> Void {
							let instance: FutureCallback = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "FutureCallback::freeLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.free()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		

						self.cType = LDKFutureCallback(							
							this_arg: thisArg,
							call: callLambda,
							free: freeLambda
						)
					}

					
			/// The method which is called.
			open func call() -> Void {
				
				Bindings.print("Error: FutureCallback::call MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
				abort()
			}
		
			/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
			internal func free() -> Void {
				
				// TODO: figure out something smarter
				return () // the empty tuple (aka Void) is necessary because Swift is whitespace-agnostic
			
				Bindings.print("Error: FutureCallback::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
				abort()
			}
		

					

					

					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing FutureCallback \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing FutureCallback \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
				}

				internal class NativelyImplementedFutureCallback: FutureCallback {
					
			/// The method which is called.
			public override func call() {
				// native call variable prep
				

				

				// native method call
				let nativeCallResult = self.cType!.call(self.cType!.this_arg)

				// cleanup
				

				// return value (do some wrapping)
				let returnValue = nativeCallResult

				return returnValue
			}
		
			/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
			public override func free() {
				// native call variable prep
				

				
				// natively wrapped traits may not necessarily be properly initialized
				// for now just don't free these things
				// self.cType?.free(self.cType?.this_arg)
				return;
			

				// native method call
				let nativeCallResult = self.cType!.free(self.cType!.this_arg)

				// cleanup
				

				// return value (do some wrapping)
				let returnValue = nativeCallResult

				return returnValue
			}
		
				}

			}
		