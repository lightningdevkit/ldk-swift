
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			// necessary for abort() calls
			import Foundation

			/// A trait to describe an object which can receive routing messages.
			/// 
			/// # Implementor DoS Warnings
			/// 
			/// For messages enabled with the `gossip_queries` feature there are potential DoS vectors when
			/// handling inbound queries. Implementors using an on-disk network graph should be aware of
			/// repeated disk I/O for queries accessing different parts of the network graph.
			public typealias RoutingMessageHandler = Bindings.RoutingMessageHandler

			extension Bindings {

				/// A trait to describe an object which can receive routing messages.
				/// 
				/// # Implementor DoS Warnings
				/// 
				/// For messages enabled with the `gossip_queries` feature there are potential DoS vectors when
				/// handling inbound queries. Implementors using an on-disk network graph should be aware of
				/// repeated disk I/O for queries accessing different parts of the network graph.
				open class RoutingMessageHandler: NativeTraitWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKRoutingMessageHandler?

					internal init(cType: LDKRoutingMessageHandler, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKRoutingMessageHandler, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init(messageSendEventsProvider: MessageSendEventsProvider) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						super.init(conflictAvoidingVariableName: 0, instantiationContext: "RoutingMessageHandler.swift::\(#function):\(#line)")

						let thisArg = Bindings.instanceToPointer(instance: self)

						

						
						func handleNodeAnnouncementLambda(this_arg: UnsafeRawPointer?, msg: UnsafePointer<LDKNodeAnnouncement>) -> LDKCResult_boolLightningErrorZ {
							let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "RoutingMessageHandler::handleNodeAnnouncementLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.handleNodeAnnouncement(msg: NodeAnnouncement(cType: msg.pointee, instantiationContext: "RoutingMessageHandler.swift::init()::\(#function):\(#line)").dangle().clone())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func handleChannelAnnouncementLambda(this_arg: UnsafeRawPointer?, msg: UnsafePointer<LDKChannelAnnouncement>) -> LDKCResult_boolLightningErrorZ {
							let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "RoutingMessageHandler::handleChannelAnnouncementLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.handleChannelAnnouncement(msg: ChannelAnnouncement(cType: msg.pointee, instantiationContext: "RoutingMessageHandler.swift::init()::\(#function):\(#line)").dangle().clone())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func handleChannelUpdateLambda(this_arg: UnsafeRawPointer?, msg: UnsafePointer<LDKChannelUpdate>) -> LDKCResult_boolLightningErrorZ {
							let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "RoutingMessageHandler::handleChannelUpdateLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.handleChannelUpdate(msg: ChannelUpdate(cType: msg.pointee, instantiationContext: "RoutingMessageHandler.swift::init()::\(#function):\(#line)").dangle().clone())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func getNextChannelAnnouncementLambda(this_arg: UnsafeRawPointer?, starting_point: UInt64) -> LDKCOption_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ {
							let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "RoutingMessageHandler::getNextChannelAnnouncementLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.getNextChannelAnnouncement(startingPoint: starting_point)

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = Option_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ(some: swiftCallbackResult).dangle().cType!

							return returnValue
						}
		
						func getNextNodeAnnouncementLambda(this_arg: UnsafeRawPointer?, starting_point: LDKNodeId) -> LDKNodeAnnouncement {
							let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "RoutingMessageHandler::getNextNodeAnnouncementLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.getNextNodeAnnouncement(startingPoint: NodeId(cType: starting_point, instantiationContext: "RoutingMessageHandler.swift::init()::\(#function):\(#line)"))

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func peerConnectedLambda(this_arg: UnsafeRawPointer?, their_node_id: LDKPublicKey, initArgument: UnsafePointer<LDKInit>, inbound: Bool) -> LDKCResult_NoneNoneZ {
							let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "RoutingMessageHandler::peerConnectedLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.peerConnected(theirNodeId: PublicKey(cType: their_node_id, instantiationContext: "RoutingMessageHandler.swift::init()::\(#function):\(#line)").getValue(), initArgument: BindingsInit(cType: initArgument.pointee, instantiationContext: "RoutingMessageHandler.swift::init()::\(#function):\(#line)").dangle().clone(), inbound: inbound)

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func handleReplyChannelRangeLambda(this_arg: UnsafeRawPointer?, their_node_id: LDKPublicKey, msg: LDKReplyChannelRange) -> LDKCResult_NoneLightningErrorZ {
							let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "RoutingMessageHandler::handleReplyChannelRangeLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.handleReplyChannelRange(theirNodeId: PublicKey(cType: their_node_id, instantiationContext: "RoutingMessageHandler.swift::init()::\(#function):\(#line)").getValue(), msg: ReplyChannelRange(cType: msg, instantiationContext: "RoutingMessageHandler.swift::init()::\(#function):\(#line)"))

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func handleReplyShortChannelIdsEndLambda(this_arg: UnsafeRawPointer?, their_node_id: LDKPublicKey, msg: LDKReplyShortChannelIdsEnd) -> LDKCResult_NoneLightningErrorZ {
							let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "RoutingMessageHandler::handleReplyShortChannelIdsEndLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.handleReplyShortChannelIdsEnd(theirNodeId: PublicKey(cType: their_node_id, instantiationContext: "RoutingMessageHandler.swift::init()::\(#function):\(#line)").getValue(), msg: ReplyShortChannelIdsEnd(cType: msg, instantiationContext: "RoutingMessageHandler.swift::init()::\(#function):\(#line)"))

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func handleQueryChannelRangeLambda(this_arg: UnsafeRawPointer?, their_node_id: LDKPublicKey, msg: LDKQueryChannelRange) -> LDKCResult_NoneLightningErrorZ {
							let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "RoutingMessageHandler::handleQueryChannelRangeLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.handleQueryChannelRange(theirNodeId: PublicKey(cType: their_node_id, instantiationContext: "RoutingMessageHandler.swift::init()::\(#function):\(#line)").getValue(), msg: QueryChannelRange(cType: msg, instantiationContext: "RoutingMessageHandler.swift::init()::\(#function):\(#line)"))

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func handleQueryShortChannelIdsLambda(this_arg: UnsafeRawPointer?, their_node_id: LDKPublicKey, msg: LDKQueryShortChannelIds) -> LDKCResult_NoneLightningErrorZ {
							let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "RoutingMessageHandler::handleQueryShortChannelIdsLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.handleQueryShortChannelIds(theirNodeId: PublicKey(cType: their_node_id, instantiationContext: "RoutingMessageHandler.swift::init()::\(#function):\(#line)").getValue(), msg: QueryShortChannelIds(cType: msg, instantiationContext: "RoutingMessageHandler.swift::init()::\(#function):\(#line)"))

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func processingQueueHighLambda(this_arg: UnsafeRawPointer?) -> Bool {
							let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "RoutingMessageHandler::processingQueueHighLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.processingQueueHigh()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func providedNodeFeaturesLambda(this_arg: UnsafeRawPointer?) -> LDKNodeFeatures {
							let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "RoutingMessageHandler::providedNodeFeaturesLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.providedNodeFeatures()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func providedInitFeaturesLambda(this_arg: UnsafeRawPointer?, their_node_id: LDKPublicKey) -> LDKInitFeatures {
							let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "RoutingMessageHandler::providedInitFeaturesLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.providedInitFeatures(theirNodeId: PublicKey(cType: their_node_id, instantiationContext: "RoutingMessageHandler.swift::init()::\(#function):\(#line)").getValue())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func freeLambda(this_arg: UnsafeMutableRawPointer?) -> Void {
							let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "RoutingMessageHandler::freeLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.free()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		

						self.cType = LDKRoutingMessageHandler(							
							this_arg: thisArg,
							handle_node_announcement: handleNodeAnnouncementLambda,
							handle_channel_announcement: handleChannelAnnouncementLambda,
							handle_channel_update: handleChannelUpdateLambda,
							get_next_channel_announcement: getNextChannelAnnouncementLambda,
							get_next_node_announcement: getNextNodeAnnouncementLambda,
							peer_connected: peerConnectedLambda,
							handle_reply_channel_range: handleReplyChannelRangeLambda,
							handle_reply_short_channel_ids_end: handleReplyShortChannelIdsEndLambda,
							handle_query_channel_range: handleQueryChannelRangeLambda,
							handle_query_short_channel_ids: handleQueryShortChannelIdsLambda,
							processing_queue_high: processingQueueHighLambda,
							provided_node_features: providedNodeFeaturesLambda,
							provided_init_features: providedInitFeaturesLambda,
							MessageSendEventsProvider: messageSendEventsProvider.activate().cType!,
							free: freeLambda
						)
					}

					
					/// Handle an incoming `node_announcement` message, returning `true` if it should be forwarded on,
					/// `false` or returning an `Err` otherwise.
					open func handleNodeAnnouncement(msg: NodeAnnouncement) -> Result_boolLightningErrorZ {
						
						Bindings.print("Error: RoutingMessageHandler::handleNodeAnnouncement MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Handle a `channel_announcement` message, returning `true` if it should be forwarded on, `false`
					/// or returning an `Err` otherwise.
					open func handleChannelAnnouncement(msg: ChannelAnnouncement) -> Result_boolLightningErrorZ {
						
						Bindings.print("Error: RoutingMessageHandler::handleChannelAnnouncement MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Handle an incoming `channel_update` message, returning true if it should be forwarded on,
					/// `false` or returning an `Err` otherwise.
					open func handleChannelUpdate(msg: ChannelUpdate) -> Result_boolLightningErrorZ {
						
						Bindings.print("Error: RoutingMessageHandler::handleChannelUpdate MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Gets channel announcements and updates required to dump our routing table to a remote node,
					/// starting at the `short_channel_id` indicated by `starting_point` and including announcements
					/// for a single channel.
					open func getNextChannelAnnouncement(startingPoint: UInt64) -> (ChannelAnnouncement, ChannelUpdate, ChannelUpdate)? {
						
						Bindings.print("Error: RoutingMessageHandler::getNextChannelAnnouncement MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Gets a node announcement required to dump our routing table to a remote node, starting at
					/// the node *after* the provided pubkey and including up to one announcement immediately
					/// higher (as defined by `<PublicKey as Ord>::cmp`) than `starting_point`.
					/// If `None` is provided for `starting_point`, we start at the first node.
					/// 
					/// Note that starting_point (or a relevant inner pointer) may be NULL or all-0s to represent None
					/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
					open func getNextNodeAnnouncement(startingPoint: NodeId) -> NodeAnnouncement {
						
						Bindings.print("Error: RoutingMessageHandler::getNextNodeAnnouncement MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Called when a connection is established with a peer. This can be used to
					/// perform routing table synchronization using a strategy defined by the
					/// implementor.
					/// 
					/// May return an `Err(())` if the features the peer supports are not sufficient to communicate
					/// with us. Implementors should be somewhat conservative about doing so, however, as other
					/// message handlers may still wish to communicate with this peer.
					open func peerConnected(theirNodeId: [UInt8], initArgument: BindingsInit, inbound: Bool) -> Result_NoneNoneZ {
						
						Bindings.print("Error: RoutingMessageHandler::peerConnected MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Handles the reply of a query we initiated to learn about channels
					/// for a given range of blocks. We can expect to receive one or more
					/// replies to a single query.
					open func handleReplyChannelRange(theirNodeId: [UInt8], msg: ReplyChannelRange) -> Result_NoneLightningErrorZ {
						
						Bindings.print("Error: RoutingMessageHandler::handleReplyChannelRange MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Handles the reply of a query we initiated asking for routing gossip
					/// messages for a list of channels. We should receive this message when
					/// a node has completed its best effort to send us the pertaining routing
					/// gossip messages.
					open func handleReplyShortChannelIdsEnd(theirNodeId: [UInt8], msg: ReplyShortChannelIdsEnd) -> Result_NoneLightningErrorZ {
						
						Bindings.print("Error: RoutingMessageHandler::handleReplyShortChannelIdsEnd MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Handles when a peer asks us to send a list of `short_channel_id`s
					/// for the requested range of blocks.
					open func handleQueryChannelRange(theirNodeId: [UInt8], msg: QueryChannelRange) -> Result_NoneLightningErrorZ {
						
						Bindings.print("Error: RoutingMessageHandler::handleQueryChannelRange MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Handles when a peer asks us to send routing gossip messages for a
					/// list of `short_channel_id`s.
					open func handleQueryShortChannelIds(theirNodeId: [UInt8], msg: QueryShortChannelIds) -> Result_NoneLightningErrorZ {
						
						Bindings.print("Error: RoutingMessageHandler::handleQueryShortChannelIds MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Indicates that there are a large number of [`ChannelAnnouncement`] (or other) messages
					/// pending some async action. While there is no guarantee of the rate of future messages, the
					/// caller should seek to reduce the rate of new gossip messages handled, especially
					/// [`ChannelAnnouncement`]s.
					open func processingQueueHigh() -> Bool {
						
						Bindings.print("Error: RoutingMessageHandler::processingQueueHigh MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Gets the node feature flags which this handler itself supports. All available handlers are
					/// queried similarly and their feature flags are OR'd together to form the [`NodeFeatures`]
					/// which are broadcasted in our [`NodeAnnouncement`] message.
					open func providedNodeFeatures() -> NodeFeatures {
						
						Bindings.print("Error: RoutingMessageHandler::providedNodeFeatures MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Gets the init feature flags which should be sent to the given peer. All available handlers
					/// are queried similarly and their feature flags are OR'd together to form the [`InitFeatures`]
					/// which are sent in our [`Init`] message.
					/// 
					/// Note that this method is called before [`Self::peer_connected`].
					open func providedInitFeatures(theirNodeId: [UInt8]) -> InitFeatures {
						
						Bindings.print("Error: RoutingMessageHandler::providedInitFeatures MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
					internal func free() -> Void {
						
				// TODO: figure out something smarter
				return; // the semicolon is necessary because Swift is whitespace-agnostic
			
						Bindings.print("Error: RoutingMessageHandler::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		

					

					
					/// Implementation of MessageSendEventsProvider for this object.
					public func getMessageSendEventsProvider() -> MessageSendEventsProvider {
						// return value (do some wrapping)
						let returnValue = NativelyImplementedMessageSendEventsProvider(cType: self.cType!.MessageSendEventsProvider, instantiationContext: "RoutingMessageHandler.swift::\(#function):\(#line)", anchor: self)

						return returnValue;
					}
		

					internal func dangle(_ shouldDangle: Bool = true) -> RoutingMessageHandler {
        				self.dangling = shouldDangle
						return self
					}

					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing RoutingMessageHandler \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing RoutingMessageHandler \(self.instanceNumber) due to dangle.")
						}
					}
				}

				internal class NativelyImplementedRoutingMessageHandler: RoutingMessageHandler {
					
					/// Handle an incoming `node_announcement` message, returning `true` if it should be forwarded on,
					/// `false` or returning an `Err` otherwise.
					public override func handleNodeAnnouncement(msg: NodeAnnouncement) -> Result_boolLightningErrorZ {
						// native call variable prep
						

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: msg.cType!) { (msgPointer: UnsafePointer<LDKNodeAnnouncement>) in
				self.cType!.handle_node_announcement(self.cType!.this_arg, msgPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_boolLightningErrorZ(cType: nativeCallResult, instantiationContext: "RoutingMessageHandler.swift::\(#function):\(#line)")

						return returnValue
					}
		
					/// Handle a `channel_announcement` message, returning `true` if it should be forwarded on, `false`
					/// or returning an `Err` otherwise.
					public override func handleChannelAnnouncement(msg: ChannelAnnouncement) -> Result_boolLightningErrorZ {
						// native call variable prep
						

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: msg.cType!) { (msgPointer: UnsafePointer<LDKChannelAnnouncement>) in
				self.cType!.handle_channel_announcement(self.cType!.this_arg, msgPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_boolLightningErrorZ(cType: nativeCallResult, instantiationContext: "RoutingMessageHandler.swift::\(#function):\(#line)")

						return returnValue
					}
		
					/// Handle an incoming `channel_update` message, returning true if it should be forwarded on,
					/// `false` or returning an `Err` otherwise.
					public override func handleChannelUpdate(msg: ChannelUpdate) -> Result_boolLightningErrorZ {
						// native call variable prep
						

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: msg.cType!) { (msgPointer: UnsafePointer<LDKChannelUpdate>) in
				self.cType!.handle_channel_update(self.cType!.this_arg, msgPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_boolLightningErrorZ(cType: nativeCallResult, instantiationContext: "RoutingMessageHandler.swift::\(#function):\(#line)")

						return returnValue
					}
		
					/// Gets channel announcements and updates required to dump our routing table to a remote node,
					/// starting at the `short_channel_id` indicated by `starting_point` and including announcements
					/// for a single channel.
					public override func getNextChannelAnnouncement(startingPoint: UInt64) -> (ChannelAnnouncement, ChannelUpdate, ChannelUpdate)? {
						// native call variable prep
						

						

						// native method call
						let nativeCallResult = self.cType!.get_next_channel_announcement(self.cType!.this_arg, startingPoint)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Option_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ(cType: nativeCallResult, instantiationContext: "RoutingMessageHandler.swift::\(#function):\(#line)").getValue()

						return returnValue
					}
		
					/// Gets a node announcement required to dump our routing table to a remote node, starting at
					/// the node *after* the provided pubkey and including up to one announcement immediately
					/// higher (as defined by `<PublicKey as Ord>::cmp`) than `starting_point`.
					/// If `None` is provided for `starting_point`, we start at the first node.
					/// 
					/// Note that starting_point (or a relevant inner pointer) may be NULL or all-0s to represent None
					/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
					public override func getNextNodeAnnouncement(startingPoint: NodeId) -> NodeAnnouncement {
						// native call variable prep
						

						

						// native method call
						let nativeCallResult = self.cType!.get_next_node_announcement(self.cType!.this_arg, startingPoint.dynamicallyDangledClone().cType!)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = NodeAnnouncement(cType: nativeCallResult, instantiationContext: "RoutingMessageHandler.swift::\(#function):\(#line)")

						return returnValue
					}
		
					/// Called when a connection is established with a peer. This can be used to
					/// perform routing table synchronization using a strategy defined by the
					/// implementor.
					/// 
					/// May return an `Err(())` if the features the peer supports are not sufficient to communicate
					/// with us. Implementors should be somewhat conservative about doing so, however, as other
					/// message handlers may still wish to communicate with this peer.
					public override func peerConnected(theirNodeId: [UInt8], initArgument: BindingsInit, inbound: Bool) -> Result_NoneNoneZ {
						// native call variable prep
						
						let theirNodeIdPrimitiveWrapper = PublicKey(value: theirNodeId)
				

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: initArgument.cType!) { (initArgumentPointer: UnsafePointer<LDKInit>) in
				self.cType!.peer_connected(self.cType!.this_arg, theirNodeIdPrimitiveWrapper.cType!, initArgumentPointer, inbound)
						}
				

						// cleanup
						
						// for elided types, we need this
						theirNodeIdPrimitiveWrapper.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = Result_NoneNoneZ(cType: nativeCallResult, instantiationContext: "RoutingMessageHandler.swift::\(#function):\(#line)")

						return returnValue
					}
		
					/// Handles the reply of a query we initiated to learn about channels
					/// for a given range of blocks. We can expect to receive one or more
					/// replies to a single query.
					public override func handleReplyChannelRange(theirNodeId: [UInt8], msg: ReplyChannelRange) -> Result_NoneLightningErrorZ {
						// native call variable prep
						
						let theirNodeIdPrimitiveWrapper = PublicKey(value: theirNodeId)
				

						

						// native method call
						let nativeCallResult = self.cType!.handle_reply_channel_range(self.cType!.this_arg, theirNodeIdPrimitiveWrapper.cType!, msg.dynamicallyDangledClone().cType!)

						// cleanup
						
						// for elided types, we need this
						theirNodeIdPrimitiveWrapper.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = Result_NoneLightningErrorZ(cType: nativeCallResult, instantiationContext: "RoutingMessageHandler.swift::\(#function):\(#line)")

						return returnValue
					}
		
					/// Handles the reply of a query we initiated asking for routing gossip
					/// messages for a list of channels. We should receive this message when
					/// a node has completed its best effort to send us the pertaining routing
					/// gossip messages.
					public override func handleReplyShortChannelIdsEnd(theirNodeId: [UInt8], msg: ReplyShortChannelIdsEnd) -> Result_NoneLightningErrorZ {
						// native call variable prep
						
						let theirNodeIdPrimitiveWrapper = PublicKey(value: theirNodeId)
				

						

						// native method call
						let nativeCallResult = self.cType!.handle_reply_short_channel_ids_end(self.cType!.this_arg, theirNodeIdPrimitiveWrapper.cType!, msg.dynamicallyDangledClone().cType!)

						// cleanup
						
						// for elided types, we need this
						theirNodeIdPrimitiveWrapper.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = Result_NoneLightningErrorZ(cType: nativeCallResult, instantiationContext: "RoutingMessageHandler.swift::\(#function):\(#line)")

						return returnValue
					}
		
					/// Handles when a peer asks us to send a list of `short_channel_id`s
					/// for the requested range of blocks.
					public override func handleQueryChannelRange(theirNodeId: [UInt8], msg: QueryChannelRange) -> Result_NoneLightningErrorZ {
						// native call variable prep
						
						let theirNodeIdPrimitiveWrapper = PublicKey(value: theirNodeId)
				

						

						// native method call
						let nativeCallResult = self.cType!.handle_query_channel_range(self.cType!.this_arg, theirNodeIdPrimitiveWrapper.cType!, msg.dynamicallyDangledClone().cType!)

						// cleanup
						
						// for elided types, we need this
						theirNodeIdPrimitiveWrapper.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = Result_NoneLightningErrorZ(cType: nativeCallResult, instantiationContext: "RoutingMessageHandler.swift::\(#function):\(#line)")

						return returnValue
					}
		
					/// Handles when a peer asks us to send routing gossip messages for a
					/// list of `short_channel_id`s.
					public override func handleQueryShortChannelIds(theirNodeId: [UInt8], msg: QueryShortChannelIds) -> Result_NoneLightningErrorZ {
						// native call variable prep
						
						let theirNodeIdPrimitiveWrapper = PublicKey(value: theirNodeId)
				

						

						// native method call
						let nativeCallResult = self.cType!.handle_query_short_channel_ids(self.cType!.this_arg, theirNodeIdPrimitiveWrapper.cType!, msg.dynamicallyDangledClone().cType!)

						// cleanup
						
						// for elided types, we need this
						theirNodeIdPrimitiveWrapper.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = Result_NoneLightningErrorZ(cType: nativeCallResult, instantiationContext: "RoutingMessageHandler.swift::\(#function):\(#line)")

						return returnValue
					}
		
					/// Indicates that there are a large number of [`ChannelAnnouncement`] (or other) messages
					/// pending some async action. While there is no guarantee of the rate of future messages, the
					/// caller should seek to reduce the rate of new gossip messages handled, especially
					/// [`ChannelAnnouncement`]s.
					public override func processingQueueHigh() -> Bool {
						// native call variable prep
						

						

						// native method call
						let nativeCallResult = self.cType!.processing_queue_high(self.cType!.this_arg)

						// cleanup
						

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
						let returnValue = NodeFeatures(cType: nativeCallResult, instantiationContext: "RoutingMessageHandler.swift::\(#function):\(#line)")

						return returnValue
					}
		
					/// Gets the init feature flags which should be sent to the given peer. All available handlers
					/// are queried similarly and their feature flags are OR'd together to form the [`InitFeatures`]
					/// which are sent in our [`Init`] message.
					/// 
					/// Note that this method is called before [`Self::peer_connected`].
					public override func providedInitFeatures(theirNodeId: [UInt8]) -> InitFeatures {
						// native call variable prep
						
						let theirNodeIdPrimitiveWrapper = PublicKey(value: theirNodeId)
				

						

						// native method call
						let nativeCallResult = self.cType!.provided_init_features(self.cType!.this_arg, theirNodeIdPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						theirNodeIdPrimitiveWrapper.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = InitFeatures(cType: nativeCallResult, instantiationContext: "RoutingMessageHandler.swift::\(#function):\(#line)")

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
		