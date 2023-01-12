
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			// necessary for abort() calls
			import Foundation

			/// A trait to describe an object which can receive channel messages.
			/// 
			/// Messages MAY be called in parallel when they originate from different their_node_ids, however
			/// they MUST NOT be called in parallel when the two calls have the same their_node_id.
			public typealias ChannelMessageHandler = Bindings.ChannelMessageHandler

			extension Bindings {

				/// A trait to describe an object which can receive channel messages.
				/// 
				/// Messages MAY be called in parallel when they originate from different their_node_ids, however
				/// they MUST NOT be called in parallel when the two calls have the same their_node_id.
				open class ChannelMessageHandler: NativeTraitWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKChannelMessageHandler?

					internal init(cType: LDKChannelMessageHandler) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKChannelMessageHandler, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init(MessageSendEventsProvider: MessageSendEventsProvider) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						super.init(conflictAvoidingVariableName: 0)

						let thisArg = Bindings.instanceToPointer(instance: self)

						

						
						func handleOpenChannelLambda(this_arg: UnsafeRawPointer?, their_node_id: LDKPublicKey, their_features: LDKInitFeatures, msg: UnsafePointer<LDKOpenChannel>) -> Void {
							let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "ChannelMessageHandler::handleOpenChannelLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.handleOpenChannel(theirNodeId: PublicKey(cType: their_node_id).getValue(), theirFeatures: InitFeatures(cType: their_features), msg: OpenChannel(cType: msg.pointee).dangle().clone())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func handleAcceptChannelLambda(this_arg: UnsafeRawPointer?, their_node_id: LDKPublicKey, their_features: LDKInitFeatures, msg: UnsafePointer<LDKAcceptChannel>) -> Void {
							let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "ChannelMessageHandler::handleAcceptChannelLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.handleAcceptChannel(theirNodeId: PublicKey(cType: their_node_id).getValue(), theirFeatures: InitFeatures(cType: their_features), msg: AcceptChannel(cType: msg.pointee).dangle().clone())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func handleFundingCreatedLambda(this_arg: UnsafeRawPointer?, their_node_id: LDKPublicKey, msg: UnsafePointer<LDKFundingCreated>) -> Void {
							let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "ChannelMessageHandler::handleFundingCreatedLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.handleFundingCreated(theirNodeId: PublicKey(cType: their_node_id).getValue(), msg: FundingCreated(cType: msg.pointee).dangle().clone())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func handleFundingSignedLambda(this_arg: UnsafeRawPointer?, their_node_id: LDKPublicKey, msg: UnsafePointer<LDKFundingSigned>) -> Void {
							let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "ChannelMessageHandler::handleFundingSignedLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.handleFundingSigned(theirNodeId: PublicKey(cType: their_node_id).getValue(), msg: FundingSigned(cType: msg.pointee).dangle().clone())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func handleChannelReadyLambda(this_arg: UnsafeRawPointer?, their_node_id: LDKPublicKey, msg: UnsafePointer<LDKChannelReady>) -> Void {
							let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "ChannelMessageHandler::handleChannelReadyLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.handleChannelReady(theirNodeId: PublicKey(cType: their_node_id).getValue(), msg: ChannelReady(cType: msg.pointee).dangle().clone())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func handleShutdownLambda(this_arg: UnsafeRawPointer?, their_node_id: LDKPublicKey, their_features: UnsafePointer<LDKInitFeatures>, msg: UnsafePointer<LDKShutdown>) -> Void {
							let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "ChannelMessageHandler::handleShutdownLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.handleShutdown(theirNodeId: PublicKey(cType: their_node_id).getValue(), theirFeatures: InitFeatures(cType: their_features.pointee).dangle().clone(), msg: Shutdown(cType: msg.pointee).dangle().clone())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func handleClosingSignedLambda(this_arg: UnsafeRawPointer?, their_node_id: LDKPublicKey, msg: UnsafePointer<LDKClosingSigned>) -> Void {
							let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "ChannelMessageHandler::handleClosingSignedLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.handleClosingSigned(theirNodeId: PublicKey(cType: their_node_id).getValue(), msg: ClosingSigned(cType: msg.pointee).dangle().clone())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func handleUpdateAddHtlcLambda(this_arg: UnsafeRawPointer?, their_node_id: LDKPublicKey, msg: UnsafePointer<LDKUpdateAddHTLC>) -> Void {
							let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "ChannelMessageHandler::handleUpdateAddHtlcLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.handleUpdateAddHtlc(theirNodeId: PublicKey(cType: their_node_id).getValue(), msg: UpdateAddHTLC(cType: msg.pointee).dangle().clone())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func handleUpdateFulfillHtlcLambda(this_arg: UnsafeRawPointer?, their_node_id: LDKPublicKey, msg: UnsafePointer<LDKUpdateFulfillHTLC>) -> Void {
							let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "ChannelMessageHandler::handleUpdateFulfillHtlcLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.handleUpdateFulfillHtlc(theirNodeId: PublicKey(cType: their_node_id).getValue(), msg: UpdateFulfillHTLC(cType: msg.pointee).dangle().clone())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func handleUpdateFailHtlcLambda(this_arg: UnsafeRawPointer?, their_node_id: LDKPublicKey, msg: UnsafePointer<LDKUpdateFailHTLC>) -> Void {
							let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "ChannelMessageHandler::handleUpdateFailHtlcLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.handleUpdateFailHtlc(theirNodeId: PublicKey(cType: their_node_id).getValue(), msg: UpdateFailHTLC(cType: msg.pointee).dangle().clone())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func handleUpdateFailMalformedHtlcLambda(this_arg: UnsafeRawPointer?, their_node_id: LDKPublicKey, msg: UnsafePointer<LDKUpdateFailMalformedHTLC>) -> Void {
							let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "ChannelMessageHandler::handleUpdateFailMalformedHtlcLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.handleUpdateFailMalformedHtlc(theirNodeId: PublicKey(cType: their_node_id).getValue(), msg: UpdateFailMalformedHTLC(cType: msg.pointee).dangle().clone())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func handleCommitmentSignedLambda(this_arg: UnsafeRawPointer?, their_node_id: LDKPublicKey, msg: UnsafePointer<LDKCommitmentSigned>) -> Void {
							let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "ChannelMessageHandler::handleCommitmentSignedLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.handleCommitmentSigned(theirNodeId: PublicKey(cType: their_node_id).getValue(), msg: CommitmentSigned(cType: msg.pointee).dangle().clone())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func handleRevokeAndAckLambda(this_arg: UnsafeRawPointer?, their_node_id: LDKPublicKey, msg: UnsafePointer<LDKRevokeAndACK>) -> Void {
							let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "ChannelMessageHandler::handleRevokeAndAckLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.handleRevokeAndAck(theirNodeId: PublicKey(cType: their_node_id).getValue(), msg: RevokeAndACK(cType: msg.pointee).dangle().clone())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func handleUpdateFeeLambda(this_arg: UnsafeRawPointer?, their_node_id: LDKPublicKey, msg: UnsafePointer<LDKUpdateFee>) -> Void {
							let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "ChannelMessageHandler::handleUpdateFeeLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.handleUpdateFee(theirNodeId: PublicKey(cType: their_node_id).getValue(), msg: UpdateFee(cType: msg.pointee).dangle().clone())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func handleAnnouncementSignaturesLambda(this_arg: UnsafeRawPointer?, their_node_id: LDKPublicKey, msg: UnsafePointer<LDKAnnouncementSignatures>) -> Void {
							let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "ChannelMessageHandler::handleAnnouncementSignaturesLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.handleAnnouncementSignatures(theirNodeId: PublicKey(cType: their_node_id).getValue(), msg: AnnouncementSignatures(cType: msg.pointee).dangle().clone())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func peerDisconnectedLambda(this_arg: UnsafeRawPointer?, their_node_id: LDKPublicKey, no_connection_possible: Bool) -> Void {
							let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "ChannelMessageHandler::peerDisconnectedLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.peerDisconnected(theirNodeId: PublicKey(cType: their_node_id).getValue(), noConnectionPossible: no_connection_possible)

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func peerConnectedLambda(this_arg: UnsafeRawPointer?, their_node_id: LDKPublicKey, msg: UnsafePointer<LDKInit>) -> LDKCResult_NoneNoneZ {
							let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "ChannelMessageHandler::peerConnectedLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.peerConnected(theirNodeId: PublicKey(cType: their_node_id).getValue(), msg: BindingsInit(cType: msg.pointee).dangle().clone())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func handleChannelReestablishLambda(this_arg: UnsafeRawPointer?, their_node_id: LDKPublicKey, msg: UnsafePointer<LDKChannelReestablish>) -> Void {
							let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "ChannelMessageHandler::handleChannelReestablishLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.handleChannelReestablish(theirNodeId: PublicKey(cType: their_node_id).getValue(), msg: ChannelReestablish(cType: msg.pointee).dangle().clone())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func handleChannelUpdateLambda(this_arg: UnsafeRawPointer?, their_node_id: LDKPublicKey, msg: UnsafePointer<LDKChannelUpdate>) -> Void {
							let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "ChannelMessageHandler::handleChannelUpdateLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.handleChannelUpdate(theirNodeId: PublicKey(cType: their_node_id).getValue(), msg: ChannelUpdate(cType: msg.pointee).dangle().clone())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func handleErrorLambda(this_arg: UnsafeRawPointer?, their_node_id: LDKPublicKey, msg: UnsafePointer<LDKErrorMessage>) -> Void {
							let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "ChannelMessageHandler::handleErrorLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.handleError(theirNodeId: PublicKey(cType: their_node_id).getValue(), msg: ErrorMessage(cType: msg.pointee).dangle().clone())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func providedNodeFeaturesLambda(this_arg: UnsafeRawPointer?) -> LDKNodeFeatures {
							let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "ChannelMessageHandler::providedNodeFeaturesLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.providedNodeFeatures()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func providedInitFeaturesLambda(this_arg: UnsafeRawPointer?, their_node_id: LDKPublicKey) -> LDKInitFeatures {
							let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "ChannelMessageHandler::providedInitFeaturesLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.providedInitFeatures(theirNodeId: PublicKey(cType: their_node_id).getValue())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func freeLambda(this_arg: UnsafeMutableRawPointer?) -> Void {
							let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "ChannelMessageHandler::freeLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.free()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		

						self.cType = LDKChannelMessageHandler(							
							this_arg: thisArg,
							handle_open_channel: handleOpenChannelLambda,
							handle_accept_channel: handleAcceptChannelLambda,
							handle_funding_created: handleFundingCreatedLambda,
							handle_funding_signed: handleFundingSignedLambda,
							handle_channel_ready: handleChannelReadyLambda,
							handle_shutdown: handleShutdownLambda,
							handle_closing_signed: handleClosingSignedLambda,
							handle_update_add_htlc: handleUpdateAddHtlcLambda,
							handle_update_fulfill_htlc: handleUpdateFulfillHtlcLambda,
							handle_update_fail_htlc: handleUpdateFailHtlcLambda,
							handle_update_fail_malformed_htlc: handleUpdateFailMalformedHtlcLambda,
							handle_commitment_signed: handleCommitmentSignedLambda,
							handle_revoke_and_ack: handleRevokeAndAckLambda,
							handle_update_fee: handleUpdateFeeLambda,
							handle_announcement_signatures: handleAnnouncementSignaturesLambda,
							peer_disconnected: peerDisconnectedLambda,
							peer_connected: peerConnectedLambda,
							handle_channel_reestablish: handleChannelReestablishLambda,
							handle_channel_update: handleChannelUpdateLambda,
							handle_error: handleErrorLambda,
							provided_node_features: providedNodeFeaturesLambda,
							provided_init_features: providedInitFeaturesLambda,
							MessageSendEventsProvider: MessageSendEventsProvider.activate().cType!,
							free: freeLambda
						)
					}

					
					/// Handle an incoming open_channel message from the given peer.
					open func handleOpenChannel(theirNodeId: [UInt8], theirFeatures: InitFeatures, msg: OpenChannel) -> Void {
						
						Bindings.print("Error: ChannelMessageHandler::handleOpenChannel MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Handle an incoming accept_channel message from the given peer.
					open func handleAcceptChannel(theirNodeId: [UInt8], theirFeatures: InitFeatures, msg: AcceptChannel) -> Void {
						
						Bindings.print("Error: ChannelMessageHandler::handleAcceptChannel MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Handle an incoming funding_created message from the given peer.
					open func handleFundingCreated(theirNodeId: [UInt8], msg: FundingCreated) -> Void {
						
						Bindings.print("Error: ChannelMessageHandler::handleFundingCreated MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Handle an incoming funding_signed message from the given peer.
					open func handleFundingSigned(theirNodeId: [UInt8], msg: FundingSigned) -> Void {
						
						Bindings.print("Error: ChannelMessageHandler::handleFundingSigned MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Handle an incoming channel_ready message from the given peer.
					open func handleChannelReady(theirNodeId: [UInt8], msg: ChannelReady) -> Void {
						
						Bindings.print("Error: ChannelMessageHandler::handleChannelReady MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Handle an incoming shutdown message from the given peer.
					open func handleShutdown(theirNodeId: [UInt8], theirFeatures: InitFeatures, msg: Shutdown) -> Void {
						
						Bindings.print("Error: ChannelMessageHandler::handleShutdown MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Handle an incoming closing_signed message from the given peer.
					open func handleClosingSigned(theirNodeId: [UInt8], msg: ClosingSigned) -> Void {
						
						Bindings.print("Error: ChannelMessageHandler::handleClosingSigned MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Handle an incoming update_add_htlc message from the given peer.
					open func handleUpdateAddHtlc(theirNodeId: [UInt8], msg: UpdateAddHTLC) -> Void {
						
						Bindings.print("Error: ChannelMessageHandler::handleUpdateAddHtlc MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Handle an incoming update_fulfill_htlc message from the given peer.
					open func handleUpdateFulfillHtlc(theirNodeId: [UInt8], msg: UpdateFulfillHTLC) -> Void {
						
						Bindings.print("Error: ChannelMessageHandler::handleUpdateFulfillHtlc MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Handle an incoming update_fail_htlc message from the given peer.
					open func handleUpdateFailHtlc(theirNodeId: [UInt8], msg: UpdateFailHTLC) -> Void {
						
						Bindings.print("Error: ChannelMessageHandler::handleUpdateFailHtlc MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Handle an incoming update_fail_malformed_htlc message from the given peer.
					open func handleUpdateFailMalformedHtlc(theirNodeId: [UInt8], msg: UpdateFailMalformedHTLC) -> Void {
						
						Bindings.print("Error: ChannelMessageHandler::handleUpdateFailMalformedHtlc MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Handle an incoming commitment_signed message from the given peer.
					open func handleCommitmentSigned(theirNodeId: [UInt8], msg: CommitmentSigned) -> Void {
						
						Bindings.print("Error: ChannelMessageHandler::handleCommitmentSigned MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Handle an incoming revoke_and_ack message from the given peer.
					open func handleRevokeAndAck(theirNodeId: [UInt8], msg: RevokeAndACK) -> Void {
						
						Bindings.print("Error: ChannelMessageHandler::handleRevokeAndAck MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Handle an incoming update_fee message from the given peer.
					open func handleUpdateFee(theirNodeId: [UInt8], msg: UpdateFee) -> Void {
						
						Bindings.print("Error: ChannelMessageHandler::handleUpdateFee MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Handle an incoming announcement_signatures message from the given peer.
					open func handleAnnouncementSignatures(theirNodeId: [UInt8], msg: AnnouncementSignatures) -> Void {
						
						Bindings.print("Error: ChannelMessageHandler::handleAnnouncementSignatures MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Indicates a connection to the peer failed/an existing connection was lost. If no connection
					/// is believed to be possible in the future (eg they're sending us messages we don't
					/// understand or indicate they require unknown feature bits), no_connection_possible is set
					/// and any outstanding channels should be failed.
					/// 
					/// Note that in some rare cases this may be called without a corresponding
					/// [`Self::peer_connected`].
					open func peerDisconnected(theirNodeId: [UInt8], noConnectionPossible: Bool) -> Void {
						
						Bindings.print("Error: ChannelMessageHandler::peerDisconnected MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Handle a peer reconnecting, possibly generating channel_reestablish message(s).
					/// 
					/// May return an `Err(())` if the features the peer supports are not sufficient to communicate
					/// with us. Implementors should be somewhat conservative about doing so, however, as other
					/// message handlers may still wish to communicate with this peer.
					open func peerConnected(theirNodeId: [UInt8], msg: BindingsInit) -> Result_NoneNoneZ {
						
						Bindings.print("Error: ChannelMessageHandler::peerConnected MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Handle an incoming channel_reestablish message from the given peer.
					open func handleChannelReestablish(theirNodeId: [UInt8], msg: ChannelReestablish) -> Void {
						
						Bindings.print("Error: ChannelMessageHandler::handleChannelReestablish MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Handle an incoming channel update from the given peer.
					open func handleChannelUpdate(theirNodeId: [UInt8], msg: ChannelUpdate) -> Void {
						
						Bindings.print("Error: ChannelMessageHandler::handleChannelUpdate MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Handle an incoming error message from the given peer.
					open func handleError(theirNodeId: [UInt8], msg: ErrorMessage) -> Void {
						
						Bindings.print("Error: ChannelMessageHandler::handleError MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Gets the node feature flags which this handler itself supports. All available handlers are
					/// queried similarly and their feature flags are OR'd together to form the [`NodeFeatures`]
					/// which are broadcasted in our [`NodeAnnouncement`] message.
					open func providedNodeFeatures() -> NodeFeatures {
						
						Bindings.print("Error: ChannelMessageHandler::providedNodeFeatures MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Gets the init feature flags which should be sent to the given peer. All available handlers
					/// are queried similarly and their feature flags are OR'd together to form the [`InitFeatures`]
					/// which are sent in our [`Init`] message.
					/// 
					/// Note that this method is called before [`Self::peer_connected`].
					open func providedInitFeatures(theirNodeId: [UInt8]) -> InitFeatures {
						
						Bindings.print("Error: ChannelMessageHandler::providedInitFeatures MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
					internal func free() -> Void {
						
				// TODO: figure out something smarter
				return; // the semicolon is necessary because Swift is whitespace-agnostic
			
						Bindings.print("Error: ChannelMessageHandler::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		

					

					
					/// Implementation of MessageSendEventsProvider for this object.
					public func getMessageSendEventsProvider() -> MessageSendEventsProvider {
						// return value (do some wrapping)
						let returnValue = NativelyImplementedMessageSendEventsProvider(cType: self.cType!.MessageSendEventsProvider, anchor: self)

						return returnValue;
					}
		

					internal func dangle(_ shouldDangle: Bool = true) -> ChannelMessageHandler {
        				self.dangling = shouldDangle
						return self
					}

					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing ChannelMessageHandler \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing ChannelMessageHandler \(self.instanceNumber) due to dangle.")
						}
					}
				}

				internal class NativelyImplementedChannelMessageHandler: ChannelMessageHandler {
					
					/// Handle an incoming open_channel message from the given peer.
					public override func handleOpenChannel(theirNodeId: [UInt8], theirFeatures: InitFeatures, msg: OpenChannel) {
						// native call variable prep
						
						let theirNodeIdPrimitiveWrapper = PublicKey(value: theirNodeId)
				

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: msg.cType!) { (msgPointer: UnsafePointer<LDKOpenChannel>) in
				self.cType!.handle_open_channel(self.cType!.this_arg, theirNodeIdPrimitiveWrapper.cType!, theirFeatures.dynamicallyDangledClone().cType!, msgPointer)
						}
				

						// cleanup
						
						// for elided types, we need this
						theirNodeIdPrimitiveWrapper.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Handle an incoming accept_channel message from the given peer.
					public override func handleAcceptChannel(theirNodeId: [UInt8], theirFeatures: InitFeatures, msg: AcceptChannel) {
						// native call variable prep
						
						let theirNodeIdPrimitiveWrapper = PublicKey(value: theirNodeId)
				

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: msg.cType!) { (msgPointer: UnsafePointer<LDKAcceptChannel>) in
				self.cType!.handle_accept_channel(self.cType!.this_arg, theirNodeIdPrimitiveWrapper.cType!, theirFeatures.dynamicallyDangledClone().cType!, msgPointer)
						}
				

						// cleanup
						
						// for elided types, we need this
						theirNodeIdPrimitiveWrapper.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Handle an incoming funding_created message from the given peer.
					public override func handleFundingCreated(theirNodeId: [UInt8], msg: FundingCreated) {
						// native call variable prep
						
						let theirNodeIdPrimitiveWrapper = PublicKey(value: theirNodeId)
				

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: msg.cType!) { (msgPointer: UnsafePointer<LDKFundingCreated>) in
				self.cType!.handle_funding_created(self.cType!.this_arg, theirNodeIdPrimitiveWrapper.cType!, msgPointer)
						}
				

						// cleanup
						
						// for elided types, we need this
						theirNodeIdPrimitiveWrapper.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Handle an incoming funding_signed message from the given peer.
					public override func handleFundingSigned(theirNodeId: [UInt8], msg: FundingSigned) {
						// native call variable prep
						
						let theirNodeIdPrimitiveWrapper = PublicKey(value: theirNodeId)
				

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: msg.cType!) { (msgPointer: UnsafePointer<LDKFundingSigned>) in
				self.cType!.handle_funding_signed(self.cType!.this_arg, theirNodeIdPrimitiveWrapper.cType!, msgPointer)
						}
				

						// cleanup
						
						// for elided types, we need this
						theirNodeIdPrimitiveWrapper.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Handle an incoming channel_ready message from the given peer.
					public override func handleChannelReady(theirNodeId: [UInt8], msg: ChannelReady) {
						// native call variable prep
						
						let theirNodeIdPrimitiveWrapper = PublicKey(value: theirNodeId)
				

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: msg.cType!) { (msgPointer: UnsafePointer<LDKChannelReady>) in
				self.cType!.handle_channel_ready(self.cType!.this_arg, theirNodeIdPrimitiveWrapper.cType!, msgPointer)
						}
				

						// cleanup
						
						// for elided types, we need this
						theirNodeIdPrimitiveWrapper.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Handle an incoming shutdown message from the given peer.
					public override func handleShutdown(theirNodeId: [UInt8], theirFeatures: InitFeatures, msg: Shutdown) {
						// native call variable prep
						
						let theirNodeIdPrimitiveWrapper = PublicKey(value: theirNodeId)
				

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: theirFeatures.cType!) { (theirFeaturesPointer: UnsafePointer<LDKInitFeatures>) in
				
						withUnsafePointer(to: msg.cType!) { (msgPointer: UnsafePointer<LDKShutdown>) in
				self.cType!.handle_shutdown(self.cType!.this_arg, theirNodeIdPrimitiveWrapper.cType!, theirFeaturesPointer, msgPointer)
						}
				
						}
				

						// cleanup
						
						// for elided types, we need this
						theirNodeIdPrimitiveWrapper.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Handle an incoming closing_signed message from the given peer.
					public override func handleClosingSigned(theirNodeId: [UInt8], msg: ClosingSigned) {
						// native call variable prep
						
						let theirNodeIdPrimitiveWrapper = PublicKey(value: theirNodeId)
				

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: msg.cType!) { (msgPointer: UnsafePointer<LDKClosingSigned>) in
				self.cType!.handle_closing_signed(self.cType!.this_arg, theirNodeIdPrimitiveWrapper.cType!, msgPointer)
						}
				

						// cleanup
						
						// for elided types, we need this
						theirNodeIdPrimitiveWrapper.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Handle an incoming update_add_htlc message from the given peer.
					public override func handleUpdateAddHtlc(theirNodeId: [UInt8], msg: UpdateAddHTLC) {
						// native call variable prep
						
						let theirNodeIdPrimitiveWrapper = PublicKey(value: theirNodeId)
				

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: msg.cType!) { (msgPointer: UnsafePointer<LDKUpdateAddHTLC>) in
				self.cType!.handle_update_add_htlc(self.cType!.this_arg, theirNodeIdPrimitiveWrapper.cType!, msgPointer)
						}
				

						// cleanup
						
						// for elided types, we need this
						theirNodeIdPrimitiveWrapper.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Handle an incoming update_fulfill_htlc message from the given peer.
					public override func handleUpdateFulfillHtlc(theirNodeId: [UInt8], msg: UpdateFulfillHTLC) {
						// native call variable prep
						
						let theirNodeIdPrimitiveWrapper = PublicKey(value: theirNodeId)
				

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: msg.cType!) { (msgPointer: UnsafePointer<LDKUpdateFulfillHTLC>) in
				self.cType!.handle_update_fulfill_htlc(self.cType!.this_arg, theirNodeIdPrimitiveWrapper.cType!, msgPointer)
						}
				

						// cleanup
						
						// for elided types, we need this
						theirNodeIdPrimitiveWrapper.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Handle an incoming update_fail_htlc message from the given peer.
					public override func handleUpdateFailHtlc(theirNodeId: [UInt8], msg: UpdateFailHTLC) {
						// native call variable prep
						
						let theirNodeIdPrimitiveWrapper = PublicKey(value: theirNodeId)
				

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: msg.cType!) { (msgPointer: UnsafePointer<LDKUpdateFailHTLC>) in
				self.cType!.handle_update_fail_htlc(self.cType!.this_arg, theirNodeIdPrimitiveWrapper.cType!, msgPointer)
						}
				

						// cleanup
						
						// for elided types, we need this
						theirNodeIdPrimitiveWrapper.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Handle an incoming update_fail_malformed_htlc message from the given peer.
					public override func handleUpdateFailMalformedHtlc(theirNodeId: [UInt8], msg: UpdateFailMalformedHTLC) {
						// native call variable prep
						
						let theirNodeIdPrimitiveWrapper = PublicKey(value: theirNodeId)
				

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: msg.cType!) { (msgPointer: UnsafePointer<LDKUpdateFailMalformedHTLC>) in
				self.cType!.handle_update_fail_malformed_htlc(self.cType!.this_arg, theirNodeIdPrimitiveWrapper.cType!, msgPointer)
						}
				

						// cleanup
						
						// for elided types, we need this
						theirNodeIdPrimitiveWrapper.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Handle an incoming commitment_signed message from the given peer.
					public override func handleCommitmentSigned(theirNodeId: [UInt8], msg: CommitmentSigned) {
						// native call variable prep
						
						let theirNodeIdPrimitiveWrapper = PublicKey(value: theirNodeId)
				

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: msg.cType!) { (msgPointer: UnsafePointer<LDKCommitmentSigned>) in
				self.cType!.handle_commitment_signed(self.cType!.this_arg, theirNodeIdPrimitiveWrapper.cType!, msgPointer)
						}
				

						// cleanup
						
						// for elided types, we need this
						theirNodeIdPrimitiveWrapper.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Handle an incoming revoke_and_ack message from the given peer.
					public override func handleRevokeAndAck(theirNodeId: [UInt8], msg: RevokeAndACK) {
						// native call variable prep
						
						let theirNodeIdPrimitiveWrapper = PublicKey(value: theirNodeId)
				

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: msg.cType!) { (msgPointer: UnsafePointer<LDKRevokeAndACK>) in
				self.cType!.handle_revoke_and_ack(self.cType!.this_arg, theirNodeIdPrimitiveWrapper.cType!, msgPointer)
						}
				

						// cleanup
						
						// for elided types, we need this
						theirNodeIdPrimitiveWrapper.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Handle an incoming update_fee message from the given peer.
					public override func handleUpdateFee(theirNodeId: [UInt8], msg: UpdateFee) {
						// native call variable prep
						
						let theirNodeIdPrimitiveWrapper = PublicKey(value: theirNodeId)
				

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: msg.cType!) { (msgPointer: UnsafePointer<LDKUpdateFee>) in
				self.cType!.handle_update_fee(self.cType!.this_arg, theirNodeIdPrimitiveWrapper.cType!, msgPointer)
						}
				

						// cleanup
						
						// for elided types, we need this
						theirNodeIdPrimitiveWrapper.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Handle an incoming announcement_signatures message from the given peer.
					public override func handleAnnouncementSignatures(theirNodeId: [UInt8], msg: AnnouncementSignatures) {
						// native call variable prep
						
						let theirNodeIdPrimitiveWrapper = PublicKey(value: theirNodeId)
				

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: msg.cType!) { (msgPointer: UnsafePointer<LDKAnnouncementSignatures>) in
				self.cType!.handle_announcement_signatures(self.cType!.this_arg, theirNodeIdPrimitiveWrapper.cType!, msgPointer)
						}
				

						// cleanup
						
						// for elided types, we need this
						theirNodeIdPrimitiveWrapper.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Indicates a connection to the peer failed/an existing connection was lost. If no connection
					/// is believed to be possible in the future (eg they're sending us messages we don't
					/// understand or indicate they require unknown feature bits), no_connection_possible is set
					/// and any outstanding channels should be failed.
					/// 
					/// Note that in some rare cases this may be called without a corresponding
					/// [`Self::peer_connected`].
					public override func peerDisconnected(theirNodeId: [UInt8], noConnectionPossible: Bool) {
						// native call variable prep
						
						let theirNodeIdPrimitiveWrapper = PublicKey(value: theirNodeId)
				

						

						// native method call
						let nativeCallResult = self.cType!.peer_disconnected(self.cType!.this_arg, theirNodeIdPrimitiveWrapper.cType!, noConnectionPossible)

						// cleanup
						
						// for elided types, we need this
						theirNodeIdPrimitiveWrapper.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Handle a peer reconnecting, possibly generating channel_reestablish message(s).
					/// 
					/// May return an `Err(())` if the features the peer supports are not sufficient to communicate
					/// with us. Implementors should be somewhat conservative about doing so, however, as other
					/// message handlers may still wish to communicate with this peer.
					public override func peerConnected(theirNodeId: [UInt8], msg: BindingsInit) -> Result_NoneNoneZ {
						// native call variable prep
						
						let theirNodeIdPrimitiveWrapper = PublicKey(value: theirNodeId)
				

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: msg.cType!) { (msgPointer: UnsafePointer<LDKInit>) in
				self.cType!.peer_connected(self.cType!.this_arg, theirNodeIdPrimitiveWrapper.cType!, msgPointer)
						}
				

						// cleanup
						
						// for elided types, we need this
						theirNodeIdPrimitiveWrapper.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = Result_NoneNoneZ(cType: nativeCallResult)

						return returnValue
					}
		
					/// Handle an incoming channel_reestablish message from the given peer.
					public override func handleChannelReestablish(theirNodeId: [UInt8], msg: ChannelReestablish) {
						// native call variable prep
						
						let theirNodeIdPrimitiveWrapper = PublicKey(value: theirNodeId)
				

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: msg.cType!) { (msgPointer: UnsafePointer<LDKChannelReestablish>) in
				self.cType!.handle_channel_reestablish(self.cType!.this_arg, theirNodeIdPrimitiveWrapper.cType!, msgPointer)
						}
				

						// cleanup
						
						// for elided types, we need this
						theirNodeIdPrimitiveWrapper.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Handle an incoming channel update from the given peer.
					public override func handleChannelUpdate(theirNodeId: [UInt8], msg: ChannelUpdate) {
						// native call variable prep
						
						let theirNodeIdPrimitiveWrapper = PublicKey(value: theirNodeId)
				

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: msg.cType!) { (msgPointer: UnsafePointer<LDKChannelUpdate>) in
				self.cType!.handle_channel_update(self.cType!.this_arg, theirNodeIdPrimitiveWrapper.cType!, msgPointer)
						}
				

						// cleanup
						
						// for elided types, we need this
						theirNodeIdPrimitiveWrapper.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Handle an incoming error message from the given peer.
					public override func handleError(theirNodeId: [UInt8], msg: ErrorMessage) {
						// native call variable prep
						
						let theirNodeIdPrimitiveWrapper = PublicKey(value: theirNodeId)
				

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: msg.cType!) { (msgPointer: UnsafePointer<LDKErrorMessage>) in
				self.cType!.handle_error(self.cType!.this_arg, theirNodeIdPrimitiveWrapper.cType!, msgPointer)
						}
				

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
						let returnValue = NodeFeatures(cType: nativeCallResult)

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
						let returnValue = InitFeatures(cType: nativeCallResult)

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
		