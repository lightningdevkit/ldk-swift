
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A dummy struct which implements `ChannelMessageHandler` without having any channels.
			/// You can provide one of these as the route_handler in a MessageHandler.
			public typealias ErroringMessageHandler = Bindings.ErroringMessageHandler

			extension Bindings {
		

				/// A dummy struct which implements `ChannelMessageHandler` without having any channels.
				/// You can provide one of these as the route_handler in a MessageHandler.
				public class ErroringMessageHandler: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKErroringMessageHandler?

					internal init(cType: LDKErroringMessageHandler, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKErroringMessageHandler, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the ErroringMessageHandler, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ErroringMessageHandler_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new ErroringMessageHandler
					public init() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ErroringMessageHandler_new()

						// cleanup
						
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = ErroringMessageHandler(cType: nativeCallResult, instantiationContext: "ErroringMessageHandler.swift::\(#function):\(#line)")
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0, instantiationContext: "ErroringMessageHandler.swift::\(#function):\(#line)")
				
			
					}
		
					/// Constructs a new MessageSendEventsProvider which calls the relevant methods on this_arg.
					/// This copies the `inner` pointer in this_arg and thus the returned MessageSendEventsProvider must be freed before this_arg is
					public func asMessageSendEventsProvider() -> MessageSendEventsProvider {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKErroringMessageHandler>) in
				ErroringMessageHandler_as_MessageSendEventsProvider(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = NativelyImplementedMessageSendEventsProvider(cType: nativeCallResult, instantiationContext: "ErroringMessageHandler.swift::\(#function):\(#line)", anchor: self)
						

						return returnValue
					}
		
					/// Constructs a new ChannelMessageHandler which calls the relevant methods on this_arg.
					/// This copies the `inner` pointer in this_arg and thus the returned ChannelMessageHandler must be freed before this_arg is
					public func asChannelMessageHandler() -> ChannelMessageHandler {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKErroringMessageHandler>) in
				ErroringMessageHandler_as_ChannelMessageHandler(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = NativelyImplementedChannelMessageHandler(cType: nativeCallResult, instantiationContext: "ErroringMessageHandler.swift::\(#function):\(#line)", anchor: self)
						

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> ErroringMessageHandler {
						self.dangling = shouldDangle
						return self
					}

					
					internal func setCFreeability(freeable: Bool) -> ErroringMessageHandler {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> ErroringMessageHandler {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing ErroringMessageHandler \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing ErroringMessageHandler \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		