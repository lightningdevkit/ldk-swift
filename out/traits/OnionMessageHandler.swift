
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			// necessary for abort() calls
			import Foundation

			/// A trait to describe an object that can receive onion messages.
			public typealias OnionMessageHandler = Bindings.OnionMessageHandler

			extension Bindings {

				/// A trait to describe an object that can receive onion messages.
				open class OnionMessageHandler: NativeTraitWrapper {

					
					public static var enableDeinitLogging = true
					public static var suspendFreedom = false
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKOnionMessageHandler?

					internal init(cType: LDKOnionMessageHandler, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKOnionMessageHandler, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init(onionMessageProvider: OnionMessageProvider) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						super.init(conflictAvoidingVariableName: 0, instantiationContext: "OnionMessageHandler.swift::\(#function):\(#line)")

						let thisArg = Bindings.instanceToPointer(instance: self)

						

						
						func handleOnionMessageLambda(this_arg: UnsafeRawPointer?, peer_node_id: LDKPublicKey, msg: UnsafePointer<LDKOnionMessage>) -> Void {
							let instance: OnionMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "OnionMessageHandler::handleOnionMessageLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.handleOnionMessage(peerNodeId: PublicKey(cType: peer_node_id, instantiationContext: "OnionMessageHandler.swift::init()::\(#function):\(#line)").getValue(), msg: OnionMessage(cType: msg.pointee, instantiationContext: "OnionMessageHandler.swift::init()::\(#function):\(#line)").dangle().clone())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func peerConnectedLambda(this_arg: UnsafeRawPointer?, their_node_id: LDKPublicKey, initArgument: UnsafePointer<LDKInit>, inbound: Bool) -> LDKCResult_NoneNoneZ {
							let instance: OnionMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "OnionMessageHandler::peerConnectedLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.peerConnected(theirNodeId: PublicKey(cType: their_node_id, instantiationContext: "OnionMessageHandler.swift::init()::\(#function):\(#line)").getValue(), initArgument: BindingsInit(cType: initArgument.pointee, instantiationContext: "OnionMessageHandler.swift::init()::\(#function):\(#line)").dangle().clone(), inbound: inbound)

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func peerDisconnectedLambda(this_arg: UnsafeRawPointer?, their_node_id: LDKPublicKey) -> Void {
							let instance: OnionMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "OnionMessageHandler::peerDisconnectedLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.peerDisconnected(theirNodeId: PublicKey(cType: their_node_id, instantiationContext: "OnionMessageHandler.swift::init()::\(#function):\(#line)").getValue())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func providedNodeFeaturesLambda(this_arg: UnsafeRawPointer?) -> LDKNodeFeatures {
							let instance: OnionMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "OnionMessageHandler::providedNodeFeaturesLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.providedNodeFeatures()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func providedInitFeaturesLambda(this_arg: UnsafeRawPointer?, their_node_id: LDKPublicKey) -> LDKInitFeatures {
							let instance: OnionMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "OnionMessageHandler::providedInitFeaturesLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.providedInitFeatures(theirNodeId: PublicKey(cType: their_node_id, instantiationContext: "OnionMessageHandler.swift::init()::\(#function):\(#line)").getValue())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func freeLambda(this_arg: UnsafeMutableRawPointer?) -> Void {
							let instance: OnionMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "OnionMessageHandler::freeLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.free()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		

						self.cType = LDKOnionMessageHandler(							
							this_arg: thisArg,
							handle_onion_message: handleOnionMessageLambda,
							peer_connected: peerConnectedLambda,
							peer_disconnected: peerDisconnectedLambda,
							provided_node_features: providedNodeFeaturesLambda,
							provided_init_features: providedInitFeaturesLambda,
							OnionMessageProvider: onionMessageProvider.activate().cType!,
							free: freeLambda
						)
					}

					
					/// Handle an incoming `onion_message` message from the given peer.
					open func handleOnionMessage(peerNodeId: [UInt8], msg: OnionMessage) -> Void {
						
						Bindings.print("Error: OnionMessageHandler::handleOnionMessage MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Called when a connection is established with a peer. Can be used to track which peers
					/// advertise onion message support and are online.
					/// 
					/// May return an `Err(())` if the features the peer supports are not sufficient to communicate
					/// with us. Implementors should be somewhat conservative about doing so, however, as other
					/// message handlers may still wish to communicate with this peer.
					open func peerConnected(theirNodeId: [UInt8], initArgument: BindingsInit, inbound: Bool) -> Result_NoneNoneZ {
						
						Bindings.print("Error: OnionMessageHandler::peerConnected MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Indicates a connection to the peer failed/an existing connection was lost. Allows handlers to
					/// drop and refuse to forward onion messages to this peer.
					open func peerDisconnected(theirNodeId: [UInt8]) -> Void {
						
						Bindings.print("Error: OnionMessageHandler::peerDisconnected MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Gets the node feature flags which this handler itself supports. All available handlers are
					/// queried similarly and their feature flags are OR'd together to form the [`NodeFeatures`]
					/// which are broadcasted in our [`NodeAnnouncement`] message.
					open func providedNodeFeatures() -> NodeFeatures {
						
						Bindings.print("Error: OnionMessageHandler::providedNodeFeatures MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Gets the init feature flags which should be sent to the given peer. All available handlers
					/// are queried similarly and their feature flags are OR'd together to form the [`InitFeatures`]
					/// which are sent in our [`Init`] message.
					/// 
					/// Note that this method is called before [`Self::peer_connected`].
					open func providedInitFeatures(theirNodeId: [UInt8]) -> InitFeatures {
						
						Bindings.print("Error: OnionMessageHandler::providedInitFeatures MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
					internal func free() -> Void {
						
				// TODO: figure out something smarter
				return; // the semicolon is necessary because Swift is whitespace-agnostic
			
						Bindings.print("Error: OnionMessageHandler::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		

					

					
					/// Implementation of OnionMessageProvider for this object.
					public func getOnionMessageProvider() -> OnionMessageProvider {
						// return value (do some wrapping)
						let returnValue = NativelyImplementedOnionMessageProvider(cType: self.cType!.OnionMessageProvider, instantiationContext: "OnionMessageHandler.swift::\(#function):\(#line)", anchor: self)

						return returnValue;
					}
		

					internal func dangle(_ shouldDangle: Bool = true) -> OnionMessageHandler {
        				self.dangling = shouldDangle
						return self
					}

					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing OnionMessageHandler \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing OnionMessageHandler \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
				}

				internal class NativelyImplementedOnionMessageHandler: OnionMessageHandler {
					
					/// Handle an incoming `onion_message` message from the given peer.
					public override func handleOnionMessage(peerNodeId: [UInt8], msg: OnionMessage) {
						// native call variable prep
						
						let peerNodeIdPrimitiveWrapper = PublicKey(value: peerNodeId, instantiationContext: "OnionMessageHandler.swift::\(#function):\(#line)")
				

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: msg.cType!) { (msgPointer: UnsafePointer<LDKOnionMessage>) in
				self.cType!.handle_onion_message(self.cType!.this_arg, peerNodeIdPrimitiveWrapper.cType!, msgPointer)
						}
				

						// cleanup
						
						// for elided types, we need this
						peerNodeIdPrimitiveWrapper.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Called when a connection is established with a peer. Can be used to track which peers
					/// advertise onion message support and are online.
					/// 
					/// May return an `Err(())` if the features the peer supports are not sufficient to communicate
					/// with us. Implementors should be somewhat conservative about doing so, however, as other
					/// message handlers may still wish to communicate with this peer.
					public override func peerConnected(theirNodeId: [UInt8], initArgument: BindingsInit, inbound: Bool) -> Result_NoneNoneZ {
						// native call variable prep
						
						let theirNodeIdPrimitiveWrapper = PublicKey(value: theirNodeId, instantiationContext: "OnionMessageHandler.swift::\(#function):\(#line)")
				

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: initArgument.cType!) { (initArgumentPointer: UnsafePointer<LDKInit>) in
				self.cType!.peer_connected(self.cType!.this_arg, theirNodeIdPrimitiveWrapper.cType!, initArgumentPointer, inbound)
						}
				

						// cleanup
						
						// for elided types, we need this
						theirNodeIdPrimitiveWrapper.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = Result_NoneNoneZ(cType: nativeCallResult, instantiationContext: "OnionMessageHandler.swift::\(#function):\(#line)")

						return returnValue
					}
		
					/// Indicates a connection to the peer failed/an existing connection was lost. Allows handlers to
					/// drop and refuse to forward onion messages to this peer.
					public override func peerDisconnected(theirNodeId: [UInt8]) {
						// native call variable prep
						
						let theirNodeIdPrimitiveWrapper = PublicKey(value: theirNodeId, instantiationContext: "OnionMessageHandler.swift::\(#function):\(#line)")
				

						

						// native method call
						let nativeCallResult = self.cType!.peer_disconnected(self.cType!.this_arg, theirNodeIdPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						theirNodeIdPrimitiveWrapper.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Gets the node feature flags which this handler itself supports. All available handlers are
					/// queried similarly and their feature flags are OR'd together to form the [`NodeFeatures`]
					/// which are broadcasted in our [`NodeAnnouncement`] message.
					public override func providedNodeFeatures() -> NodeFeatures {
						// native call variable prep
						

						

						// native method call
						let nativeCallResult = self.cType!.provided_node_features(self.cType!.this_arg)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = NodeFeatures(cType: nativeCallResult, instantiationContext: "OnionMessageHandler.swift::\(#function):\(#line)")

						return returnValue
					}
		
					/// Gets the init feature flags which should be sent to the given peer. All available handlers
					/// are queried similarly and their feature flags are OR'd together to form the [`InitFeatures`]
					/// which are sent in our [`Init`] message.
					/// 
					/// Note that this method is called before [`Self::peer_connected`].
					public override func providedInitFeatures(theirNodeId: [UInt8]) -> InitFeatures {
						// native call variable prep
						
						let theirNodeIdPrimitiveWrapper = PublicKey(value: theirNodeId, instantiationContext: "OnionMessageHandler.swift::\(#function):\(#line)")
				

						

						// native method call
						let nativeCallResult = self.cType!.provided_init_features(self.cType!.this_arg, theirNodeIdPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						theirNodeIdPrimitiveWrapper.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = InitFeatures(cType: nativeCallResult, instantiationContext: "OnionMessageHandler.swift::\(#function):\(#line)")

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
		