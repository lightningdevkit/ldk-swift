
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			// necessary for abort() calls
			import Foundation

			/// A trait implemented for objects handling events from [`EventsProvider`].
			/// 
			/// An async variation also exists for implementations of [`EventsProvider`] that support async
			/// event handling. The async event handler should satisfy the generic bounds: `F:
			/// core::future::Future, H: Fn(Event) -> F`.
			public typealias EventHandler = Bindings.EventHandler

			extension Bindings {

				/// A trait implemented for objects handling events from [`EventsProvider`].
				/// 
				/// An async variation also exists for implementations of [`EventsProvider`] that support async
				/// event handling. The async event handler should satisfy the generic bounds: `F:
				/// core::future::Future, H: Fn(Event) -> F`.
				open class EventHandler: NativeTraitWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKEventHandler?

					internal init(cType: LDKEventHandler) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKEventHandler, anchor: NativeTypeWrapper) {
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

						

						
						func handleEventLambda(this_arg: UnsafeRawPointer?, event: LDKEvent) -> Void {
							let instance: EventHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "EventHandler::handleEventLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.handleEvent(event: Event(cType: event))

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func freeLambda(this_arg: UnsafeMutableRawPointer?) -> Void {
							let instance: EventHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "EventHandler::freeLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.free()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		

						self.cType = LDKEventHandler(							
							this_arg: thisArg,
							handle_event: handleEventLambda,
							free: freeLambda
						)
					}

					
					/// Handles the given [`Event`].
					/// 
					/// See [`EventsProvider`] for details that must be considered when implementing this method.
					open func handleEvent(event: Event) -> Void {
						
						Bindings.print("Error: EventHandler::handleEvent MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
					internal func free() -> Void {
						
				// TODO: figure out something smarter
				return; // the semicolon is necessary because Swift is whitespace-agnostic
			
						Bindings.print("Error: EventHandler::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		

					

					

					internal func dangle(_ shouldDangle: Bool = true) -> EventHandler {
        				self.dangling = shouldDangle
						return self
					}

					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing EventHandler \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing EventHandler \(self.instanceNumber) due to dangle.")
						}
					}
				}

				internal class NativelyImplementedEventHandler: EventHandler {
					
					/// Handles the given [`Event`].
					/// 
					/// See [`EventsProvider`] for details that must be considered when implementing this method.
					public override func handleEvent(event: Event) {
						// native call variable prep
						

						

						// native method call
						let nativeCallResult = self.cType!.handle_event(self.cType!.this_arg, event.danglingClone().cType!)

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
		