
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

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKFutureCallback?

					internal init(cType: LDKFutureCallback) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKFutureCallback, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init() {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						super.init(conflictAvoidingVariableName: 0)

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
				return; // the semicolon is necessary because Swift is whitespace-agnostic
			
						Bindings.print("Error: FutureCallback::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		

					

					

					internal func dangle(_ shouldDangle: Bool = true) -> FutureCallback {
        				self.dangling = shouldDangle
						return self
					}

					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing FutureCallback \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing FutureCallback \(self.instanceNumber) due to dangle.")
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
		