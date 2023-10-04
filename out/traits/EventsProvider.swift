
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			// necessary for abort() calls
			import Foundation

			/// A trait indicating an object may generate events.
			/// 
			/// Events are processed by passing an [`EventHandler`] to [`process_pending_events`].
			/// 
			/// Implementations of this trait may also feature an async version of event handling, as shown with
			/// [`ChannelManager::process_pending_events_async`] and
			/// [`ChainMonitor::process_pending_events_async`].
			/// 
			/// # Requirements
			/// 
			/// When using this trait, [`process_pending_events`] will call [`handle_event`] for each pending
			/// event since the last invocation.
			/// 
			/// In order to ensure no [`Event`]s are lost, implementors of this trait will persist [`Event`]s
			/// and replay any unhandled events on startup. An [`Event`] is considered handled when
			/// [`process_pending_events`] returns, thus handlers MUST fully handle [`Event`]s and persist any
			/// relevant changes to disk *before* returning.
			/// 
			/// Further, because an application may crash between an [`Event`] being handled and the
			/// implementor of this trait being re-serialized, [`Event`] handling must be idempotent - in
			/// effect, [`Event`]s may be replayed.
			/// 
			/// Note, handlers may call back into the provider and thus deadlocking must be avoided. Be sure to
			/// consult the provider's documentation on the implication of processing events and how a handler
			/// may safely use the provider (e.g., see [`ChannelManager::process_pending_events`] and
			/// [`ChainMonitor::process_pending_events`]).
			/// 
			/// (C-not implementable) As there is likely no reason for a user to implement this trait on their
			/// own type(s).
			/// 
			/// [`process_pending_events`]: Self::process_pending_events
			/// [`handle_event`]: EventHandler::handle_event
			/// [`ChannelManager::process_pending_events`]: crate::ln::channelmanager::ChannelManager#method.process_pending_events
			/// [`ChainMonitor::process_pending_events`]: crate::chain::chainmonitor::ChainMonitor#method.process_pending_events
			/// [`ChannelManager::process_pending_events_async`]: crate::ln::channelmanager::ChannelManager::process_pending_events_async
			/// [`ChainMonitor::process_pending_events_async`]: crate::chain::chainmonitor::ChainMonitor::process_pending_events_async
			public typealias EventsProvider = Bindings.EventsProvider

			extension Bindings {

				/// A trait indicating an object may generate events.
				/// 
				/// Events are processed by passing an [`EventHandler`] to [`process_pending_events`].
				/// 
				/// Implementations of this trait may also feature an async version of event handling, as shown with
				/// [`ChannelManager::process_pending_events_async`] and
				/// [`ChainMonitor::process_pending_events_async`].
				/// 
				/// # Requirements
				/// 
				/// When using this trait, [`process_pending_events`] will call [`handle_event`] for each pending
				/// event since the last invocation.
				/// 
				/// In order to ensure no [`Event`]s are lost, implementors of this trait will persist [`Event`]s
				/// and replay any unhandled events on startup. An [`Event`] is considered handled when
				/// [`process_pending_events`] returns, thus handlers MUST fully handle [`Event`]s and persist any
				/// relevant changes to disk *before* returning.
				/// 
				/// Further, because an application may crash between an [`Event`] being handled and the
				/// implementor of this trait being re-serialized, [`Event`] handling must be idempotent - in
				/// effect, [`Event`]s may be replayed.
				/// 
				/// Note, handlers may call back into the provider and thus deadlocking must be avoided. Be sure to
				/// consult the provider's documentation on the implication of processing events and how a handler
				/// may safely use the provider (e.g., see [`ChannelManager::process_pending_events`] and
				/// [`ChainMonitor::process_pending_events`]).
				/// 
				/// (C-not implementable) As there is likely no reason for a user to implement this trait on their
				/// own type(s).
				/// 
				/// [`process_pending_events`]: Self::process_pending_events
				/// [`handle_event`]: EventHandler::handle_event
				/// [`ChannelManager::process_pending_events`]: crate::ln::channelmanager::ChannelManager#method.process_pending_events
				/// [`ChainMonitor::process_pending_events`]: crate::chain::chainmonitor::ChainMonitor#method.process_pending_events
				/// [`ChannelManager::process_pending_events_async`]: crate::ln::channelmanager::ChannelManager::process_pending_events_async
				/// [`ChainMonitor::process_pending_events_async`]: crate::chain::chainmonitor::ChainMonitor::process_pending_events_async
				open class EventsProvider: NativeTraitWrapper {

					
					/// Set to false to suppress an individual type's deinit log statements.
					/// Only applicable when log threshold is set to `.Debug`.
					public static var enableDeinitLogging = true

					/// Set to true to suspend the freeing of this type's associated Rust memory.
					/// Should only ever be used for debugging purposes, and will likely be
					/// deprecated soon.
					public static var suspendFreedom = false

					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKEventsProvider?

					internal init(cType: LDKEventsProvider, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKEventsProvider, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKEventsProvider, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
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
						super.init(conflictAvoidingVariableName: 0, instantiationContext: "EventsProvider.swift::\(#function):\(#line)")

						let thisArg = Bindings.instanceToPointer(instance: self)

						

						
						func processPendingEventsLambda(this_arg: UnsafeRawPointer?, handler: LDKEventHandler) -> Void {
							let instance: EventsProvider = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "EventsProvider::processPendingEventsLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.processPendingEvents(handler: NativelyImplementedEventHandler(cType: handler, instantiationContext: "EventsProvider.swift::init()::\(#function):\(#line)"))

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func freeLambda(this_arg: UnsafeMutableRawPointer?) -> Void {
							let instance: EventsProvider = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "EventsProvider::freeLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.free()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		

						self.cType = LDKEventsProvider(							
							this_arg: thisArg,
							process_pending_events: processPendingEventsLambda,
							free: freeLambda
						)
					}

					
			/// Processes any events generated since the last call using the given event handler.
					/// 
					/// See the trait-level documentation for requirements.
			open func processPendingEvents(handler: EventHandler) -> Void {
				
				Bindings.print("Error: EventsProvider::processPendingEvents MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
				abort()
			}
		
			/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
			internal func free() -> Void {
				
				// TODO: figure out something smarter
				return () // the empty tuple (aka Void) is necessary because Swift is whitespace-agnostic
			
				Bindings.print("Error: EventsProvider::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
				abort()
			}
		

					

					

					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing EventsProvider \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing EventsProvider \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
				}

				internal class NativelyImplementedEventsProvider: EventsProvider {
					
			/// Processes any events generated since the last call using the given event handler.
					/// 
					/// See the trait-level documentation for requirements.
			public override func processPendingEvents(handler: EventHandler) {
				// native call variable prep
				

				

				// native method call
				let nativeCallResult = self.cType!.process_pending_events(self.cType!.this_arg, handler.activate().cType!)

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
		