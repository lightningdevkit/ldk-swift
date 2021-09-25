public class MessageSendEvent: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKMessageSendEvent?

	

    public init(pointer: LDKMessageSendEvent){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKMessageSendEvent, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* OPTION_METHODS_START */

				public enum MessageSendEventValueType {
					case SendAcceptChannel, SendOpenChannel, SendFundingCreated, SendFundingSigned, SendFundingLocked, SendAnnouncementSignatures, UpdateHTLCs, SendRevokeAndACK, SendClosingSigned, SendShutdown, SendChannelReestablish, BroadcastChannelAnnouncement, BroadcastNodeAnnouncement, BroadcastChannelUpdate, SendChannelUpdate, HandleError, SendChannelRangeQuery, SendShortIdsQuery, SendReplyChannelRange
				}
				
				public func getValueType() -> MessageSendEventValueType? {
					switch self.cOpaqueStruct?.tag {
                    
					case LDKMessageSendEvent_SendAcceptChannel:
						return .SendAcceptChannel
					case LDKMessageSendEvent_SendOpenChannel:
						return .SendOpenChannel
					case LDKMessageSendEvent_SendFundingCreated:
						return .SendFundingCreated
					case LDKMessageSendEvent_SendFundingSigned:
						return .SendFundingSigned
					case LDKMessageSendEvent_SendFundingLocked:
						return .SendFundingLocked
					case LDKMessageSendEvent_SendAnnouncementSignatures:
						return .SendAnnouncementSignatures
					case LDKMessageSendEvent_UpdateHTLCs:
						return .UpdateHTLCs
					case LDKMessageSendEvent_SendRevokeAndACK:
						return .SendRevokeAndACK
					case LDKMessageSendEvent_SendClosingSigned:
						return .SendClosingSigned
					case LDKMessageSendEvent_SendShutdown:
						return .SendShutdown
					case LDKMessageSendEvent_SendChannelReestablish:
						return .SendChannelReestablish
					case LDKMessageSendEvent_BroadcastChannelAnnouncement:
						return .BroadcastChannelAnnouncement
					case LDKMessageSendEvent_BroadcastNodeAnnouncement:
						return .BroadcastNodeAnnouncement
					case LDKMessageSendEvent_BroadcastChannelUpdate:
						return .BroadcastChannelUpdate
					case LDKMessageSendEvent_SendChannelUpdate:
						return .SendChannelUpdate
					case LDKMessageSendEvent_HandleError:
						return .HandleError
					case LDKMessageSendEvent_SendChannelRangeQuery:
						return .SendChannelRangeQuery
					case LDKMessageSendEvent_SendShortIdsQuery:
						return .SendShortIdsQuery
					case LDKMessageSendEvent_SendReplyChannelRange:
						return .SendReplyChannelRange
                    default:
                        return nil
                    }
				}
				
				
					public func getValueAsSendAcceptChannel() -> SendAcceptChannel? {
						if self.cOpaqueStruct?.tag != LDKMessageSendEvent_SendAcceptChannel {
							return nil
						}
						return SendAcceptChannel(pointer: self.cOpaqueStruct!.send_accept_channel, anchor: self)
					}
				
					public func getValueAsSendOpenChannel() -> SendOpenChannel? {
						if self.cOpaqueStruct?.tag != LDKMessageSendEvent_SendOpenChannel {
							return nil
						}
						return SendOpenChannel(pointer: self.cOpaqueStruct!.send_open_channel, anchor: self)
					}
				
					public func getValueAsSendFundingCreated() -> SendFundingCreated? {
						if self.cOpaqueStruct?.tag != LDKMessageSendEvent_SendFundingCreated {
							return nil
						}
						return SendFundingCreated(pointer: self.cOpaqueStruct!.send_funding_created, anchor: self)
					}
				
					public func getValueAsSendFundingSigned() -> SendFundingSigned? {
						if self.cOpaqueStruct?.tag != LDKMessageSendEvent_SendFundingSigned {
							return nil
						}
						return SendFundingSigned(pointer: self.cOpaqueStruct!.send_funding_signed, anchor: self)
					}
				
					public func getValueAsSendFundingLocked() -> SendFundingLocked? {
						if self.cOpaqueStruct?.tag != LDKMessageSendEvent_SendFundingLocked {
							return nil
						}
						return SendFundingLocked(pointer: self.cOpaqueStruct!.send_funding_locked, anchor: self)
					}
				
					public func getValueAsSendAnnouncementSignatures() -> SendAnnouncementSignatures? {
						if self.cOpaqueStruct?.tag != LDKMessageSendEvent_SendAnnouncementSignatures {
							return nil
						}
						return SendAnnouncementSignatures(pointer: self.cOpaqueStruct!.send_announcement_signatures, anchor: self)
					}
				
					public func getValueAsUpdateHTLCs() -> UpdateHTLCs? {
						if self.cOpaqueStruct?.tag != LDKMessageSendEvent_UpdateHTLCs {
							return nil
						}
						return UpdateHTLCs(pointer: self.cOpaqueStruct!.update_htl_cs, anchor: self)
					}
				
					public func getValueAsSendRevokeAndACK() -> SendRevokeAndACK? {
						if self.cOpaqueStruct?.tag != LDKMessageSendEvent_SendRevokeAndACK {
							return nil
						}
						return SendRevokeAndACK(pointer: self.cOpaqueStruct!.send_revoke_and_ack, anchor: self)
					}
				
					public func getValueAsSendClosingSigned() -> SendClosingSigned? {
						if self.cOpaqueStruct?.tag != LDKMessageSendEvent_SendClosingSigned {
							return nil
						}
						return SendClosingSigned(pointer: self.cOpaqueStruct!.send_closing_signed, anchor: self)
					}
				
					public func getValueAsSendShutdown() -> SendShutdown? {
						if self.cOpaqueStruct?.tag != LDKMessageSendEvent_SendShutdown {
							return nil
						}
						return SendShutdown(pointer: self.cOpaqueStruct!.send_shutdown, anchor: self)
					}
				
					public func getValueAsSendChannelReestablish() -> SendChannelReestablish? {
						if self.cOpaqueStruct?.tag != LDKMessageSendEvent_SendChannelReestablish {
							return nil
						}
						return SendChannelReestablish(pointer: self.cOpaqueStruct!.send_channel_reestablish, anchor: self)
					}
				
					public func getValueAsBroadcastChannelAnnouncement() -> BroadcastChannelAnnouncement? {
						if self.cOpaqueStruct?.tag != LDKMessageSendEvent_BroadcastChannelAnnouncement {
							return nil
						}
						return BroadcastChannelAnnouncement(pointer: self.cOpaqueStruct!.broadcast_channel_announcement, anchor: self)
					}
				
					public func getValueAsBroadcastNodeAnnouncement() -> BroadcastNodeAnnouncement? {
						if self.cOpaqueStruct?.tag != LDKMessageSendEvent_BroadcastNodeAnnouncement {
							return nil
						}
						return BroadcastNodeAnnouncement(pointer: self.cOpaqueStruct!.broadcast_node_announcement, anchor: self)
					}
				
					public func getValueAsBroadcastChannelUpdate() -> BroadcastChannelUpdate? {
						if self.cOpaqueStruct?.tag != LDKMessageSendEvent_BroadcastChannelUpdate {
							return nil
						}
						return BroadcastChannelUpdate(pointer: self.cOpaqueStruct!.broadcast_channel_update, anchor: self)
					}
				
					public func getValueAsSendChannelUpdate() -> SendChannelUpdate? {
						if self.cOpaqueStruct?.tag != LDKMessageSendEvent_SendChannelUpdate {
							return nil
						}
						return SendChannelUpdate(pointer: self.cOpaqueStruct!.send_channel_update, anchor: self)
					}
				
					public func getValueAsHandleError() -> HandleError? {
						if self.cOpaqueStruct?.tag != LDKMessageSendEvent_HandleError {
							return nil
						}
						return HandleError(pointer: self.cOpaqueStruct!.handle_error, anchor: self)
					}
				
					public func getValueAsSendChannelRangeQuery() -> SendChannelRangeQuery? {
						if self.cOpaqueStruct?.tag != LDKMessageSendEvent_SendChannelRangeQuery {
							return nil
						}
						return SendChannelRangeQuery(pointer: self.cOpaqueStruct!.send_channel_range_query, anchor: self)
					}
				
					public func getValueAsSendShortIdsQuery() -> SendShortIdsQuery? {
						if self.cOpaqueStruct?.tag != LDKMessageSendEvent_SendShortIdsQuery {
							return nil
						}
						return SendShortIdsQuery(pointer: self.cOpaqueStruct!.send_short_ids_query, anchor: self)
					}
				
					public func getValueAsSendReplyChannelRange() -> SendReplyChannelRange? {
						if self.cOpaqueStruct?.tag != LDKMessageSendEvent_SendReplyChannelRange {
							return nil
						}
						return SendReplyChannelRange(pointer: self.cOpaqueStruct!.send_reply_channel_range, anchor: self)
					}
				
			
    internal func free() -> Void {
    	
        return MessageSendEvent_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> MessageSendEvent {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing MessageSendEvent \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing MessageSendEvent \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> MessageSendEvent {
    	
        return MessageSendEvent(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKMessageSendEvent>) in
MessageSendEvent_clone(origPointer)
});
    }

					internal func danglingClone() -> MessageSendEvent {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public class func send_accept_channel(node_id: [UInt8], msg: AcceptChannel) -> MessageSendEvent {
    	
        return MessageSendEvent(pointer: MessageSendEvent_send_accept_channel(Bindings.new_LDKPublicKey(array: node_id), msg.danglingClone().cOpaqueStruct!));
    }

    public class func send_open_channel(node_id: [UInt8], msg: OpenChannel) -> MessageSendEvent {
    	
        return MessageSendEvent(pointer: MessageSendEvent_send_open_channel(Bindings.new_LDKPublicKey(array: node_id), msg.danglingClone().cOpaqueStruct!));
    }

    public class func send_funding_created(node_id: [UInt8], msg: FundingCreated) -> MessageSendEvent {
    	
        return MessageSendEvent(pointer: MessageSendEvent_send_funding_created(Bindings.new_LDKPublicKey(array: node_id), msg.danglingClone().cOpaqueStruct!));
    }

    public class func send_funding_signed(node_id: [UInt8], msg: FundingSigned) -> MessageSendEvent {
    	
        return MessageSendEvent(pointer: MessageSendEvent_send_funding_signed(Bindings.new_LDKPublicKey(array: node_id), msg.danglingClone().cOpaqueStruct!));
    }

    public class func send_funding_locked(node_id: [UInt8], msg: FundingLocked) -> MessageSendEvent {
    	
        return MessageSendEvent(pointer: MessageSendEvent_send_funding_locked(Bindings.new_LDKPublicKey(array: node_id), msg.danglingClone().cOpaqueStruct!));
    }

    public class func send_announcement_signatures(node_id: [UInt8], msg: AnnouncementSignatures) -> MessageSendEvent {
    	
        return MessageSendEvent(pointer: MessageSendEvent_send_announcement_signatures(Bindings.new_LDKPublicKey(array: node_id), msg.danglingClone().cOpaqueStruct!));
    }

    public class func update_htlcs(node_id: [UInt8], updates: CommitmentUpdate) -> MessageSendEvent {
    	
        return MessageSendEvent(pointer: MessageSendEvent_update_htlcs(Bindings.new_LDKPublicKey(array: node_id), updates.danglingClone().cOpaqueStruct!));
    }

    public class func send_revoke_and_ack(node_id: [UInt8], msg: RevokeAndACK) -> MessageSendEvent {
    	
        return MessageSendEvent(pointer: MessageSendEvent_send_revoke_and_ack(Bindings.new_LDKPublicKey(array: node_id), msg.danglingClone().cOpaqueStruct!));
    }

    public class func send_closing_signed(node_id: [UInt8], msg: ClosingSigned) -> MessageSendEvent {
    	
        return MessageSendEvent(pointer: MessageSendEvent_send_closing_signed(Bindings.new_LDKPublicKey(array: node_id), msg.danglingClone().cOpaqueStruct!));
    }

    public class func send_shutdown(node_id: [UInt8], msg: Shutdown) -> MessageSendEvent {
    	
        return MessageSendEvent(pointer: MessageSendEvent_send_shutdown(Bindings.new_LDKPublicKey(array: node_id), msg.danglingClone().cOpaqueStruct!));
    }

    public class func send_channel_reestablish(node_id: [UInt8], msg: ChannelReestablish) -> MessageSendEvent {
    	
        return MessageSendEvent(pointer: MessageSendEvent_send_channel_reestablish(Bindings.new_LDKPublicKey(array: node_id), msg.danglingClone().cOpaqueStruct!));
    }

    public class func broadcast_channel_announcement(msg: ChannelAnnouncement, update_msg: ChannelUpdate) -> MessageSendEvent {
    	
        return MessageSendEvent(pointer: MessageSendEvent_broadcast_channel_announcement(msg.danglingClone().cOpaqueStruct!, update_msg.danglingClone().cOpaqueStruct!));
    }

    public class func broadcast_node_announcement(msg: NodeAnnouncement) -> MessageSendEvent {
    	
        return MessageSendEvent(pointer: MessageSendEvent_broadcast_node_announcement(msg.danglingClone().cOpaqueStruct!));
    }

    public class func broadcast_channel_update(msg: ChannelUpdate) -> MessageSendEvent {
    	
        return MessageSendEvent(pointer: MessageSendEvent_broadcast_channel_update(msg.danglingClone().cOpaqueStruct!));
    }

    public class func send_channel_update(node_id: [UInt8], msg: ChannelUpdate) -> MessageSendEvent {
    	
        return MessageSendEvent(pointer: MessageSendEvent_send_channel_update(Bindings.new_LDKPublicKey(array: node_id), msg.danglingClone().cOpaqueStruct!));
    }

    public class func handle_error(node_id: [UInt8], action: ErrorAction) -> MessageSendEvent {
    	
        return MessageSendEvent(pointer: MessageSendEvent_handle_error(Bindings.new_LDKPublicKey(array: node_id), action.danglingClone().cOpaqueStruct!));
    }

    public class func send_channel_range_query(node_id: [UInt8], msg: QueryChannelRange) -> MessageSendEvent {
    	
        return MessageSendEvent(pointer: MessageSendEvent_send_channel_range_query(Bindings.new_LDKPublicKey(array: node_id), msg.danglingClone().cOpaqueStruct!));
    }

    public class func send_short_ids_query(node_id: [UInt8], msg: QueryShortChannelIds) -> MessageSendEvent {
    	
        return MessageSendEvent(pointer: MessageSendEvent_send_short_ids_query(Bindings.new_LDKPublicKey(array: node_id), msg.danglingClone().cOpaqueStruct!));
    }

    public class func send_reply_channel_range(node_id: [UInt8], msg: ReplyChannelRange) -> MessageSendEvent {
    	
        return MessageSendEvent(pointer: MessageSendEvent_send_reply_channel_range(Bindings.new_LDKPublicKey(array: node_id), msg.danglingClone().cOpaqueStruct!));
    }

    /* OPTION_METHODS_END */

	

			public class SendAcceptChannel: NativeTypeWrapper {
				
				
				var cOpaqueStruct: LDKMessageSendEvent_LDKSendAcceptChannel_Body?;
				fileprivate init(pointer: LDKMessageSendEvent_LDKSendAcceptChannel_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKMessageSendEvent_LDKSendAcceptChannel_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			
				
				
					public func getNode_id() -> [UInt8] {
						return Bindings.LDKPublicKey_to_array(nativeType: self.cOpaqueStruct!.node_id)
					}
				
					public func getMsg() -> AcceptChannel {
						return AcceptChannel(pointer: self.cOpaqueStruct!.msg, anchor: self)
					}
				
				
			}
		

			public class SendOpenChannel: NativeTypeWrapper {
				
				
				var cOpaqueStruct: LDKMessageSendEvent_LDKSendOpenChannel_Body?;
				fileprivate init(pointer: LDKMessageSendEvent_LDKSendOpenChannel_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKMessageSendEvent_LDKSendOpenChannel_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			
				
				
					public func getNode_id() -> [UInt8] {
						return Bindings.LDKPublicKey_to_array(nativeType: self.cOpaqueStruct!.node_id)
					}
				
					public func getMsg() -> OpenChannel {
						return OpenChannel(pointer: self.cOpaqueStruct!.msg, anchor: self)
					}
				
				
			}
		

			public class SendFundingCreated: NativeTypeWrapper {
				
				
				var cOpaqueStruct: LDKMessageSendEvent_LDKSendFundingCreated_Body?;
				fileprivate init(pointer: LDKMessageSendEvent_LDKSendFundingCreated_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKMessageSendEvent_LDKSendFundingCreated_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			
				
				
					public func getNode_id() -> [UInt8] {
						return Bindings.LDKPublicKey_to_array(nativeType: self.cOpaqueStruct!.node_id)
					}
				
					public func getMsg() -> FundingCreated {
						return FundingCreated(pointer: self.cOpaqueStruct!.msg, anchor: self)
					}
				
				
			}
		

			public class SendFundingSigned: NativeTypeWrapper {
				
				
				var cOpaqueStruct: LDKMessageSendEvent_LDKSendFundingSigned_Body?;
				fileprivate init(pointer: LDKMessageSendEvent_LDKSendFundingSigned_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKMessageSendEvent_LDKSendFundingSigned_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			
				
				
					public func getNode_id() -> [UInt8] {
						return Bindings.LDKPublicKey_to_array(nativeType: self.cOpaqueStruct!.node_id)
					}
				
					public func getMsg() -> FundingSigned {
						return FundingSigned(pointer: self.cOpaqueStruct!.msg, anchor: self)
					}
				
				
			}
		

			public class SendFundingLocked: NativeTypeWrapper {
				
				
				var cOpaqueStruct: LDKMessageSendEvent_LDKSendFundingLocked_Body?;
				fileprivate init(pointer: LDKMessageSendEvent_LDKSendFundingLocked_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKMessageSendEvent_LDKSendFundingLocked_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			
				
				
					public func getNode_id() -> [UInt8] {
						return Bindings.LDKPublicKey_to_array(nativeType: self.cOpaqueStruct!.node_id)
					}
				
					public func getMsg() -> FundingLocked {
						return FundingLocked(pointer: self.cOpaqueStruct!.msg, anchor: self)
					}
				
				
			}
		

			public class SendAnnouncementSignatures: NativeTypeWrapper {
				
				
				var cOpaqueStruct: LDKMessageSendEvent_LDKSendAnnouncementSignatures_Body?;
				fileprivate init(pointer: LDKMessageSendEvent_LDKSendAnnouncementSignatures_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKMessageSendEvent_LDKSendAnnouncementSignatures_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			
				
				
					public func getNode_id() -> [UInt8] {
						return Bindings.LDKPublicKey_to_array(nativeType: self.cOpaqueStruct!.node_id)
					}
				
					public func getMsg() -> AnnouncementSignatures {
						return AnnouncementSignatures(pointer: self.cOpaqueStruct!.msg, anchor: self)
					}
				
				
			}
		

			public class UpdateHTLCs: NativeTypeWrapper {
				
				
				var cOpaqueStruct: LDKMessageSendEvent_LDKUpdateHTLCs_Body?;
				fileprivate init(pointer: LDKMessageSendEvent_LDKUpdateHTLCs_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKMessageSendEvent_LDKUpdateHTLCs_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			
				
				
					public func getNode_id() -> [UInt8] {
						return Bindings.LDKPublicKey_to_array(nativeType: self.cOpaqueStruct!.node_id)
					}
				
					public func getUpdates() -> CommitmentUpdate {
						return CommitmentUpdate(pointer: self.cOpaqueStruct!.updates, anchor: self)
					}
				
				
			}
		

			public class SendRevokeAndACK: NativeTypeWrapper {
				
				
				var cOpaqueStruct: LDKMessageSendEvent_LDKSendRevokeAndACK_Body?;
				fileprivate init(pointer: LDKMessageSendEvent_LDKSendRevokeAndACK_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKMessageSendEvent_LDKSendRevokeAndACK_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			
				
				
					public func getNode_id() -> [UInt8] {
						return Bindings.LDKPublicKey_to_array(nativeType: self.cOpaqueStruct!.node_id)
					}
				
					public func getMsg() -> RevokeAndACK {
						return RevokeAndACK(pointer: self.cOpaqueStruct!.msg, anchor: self)
					}
				
				
			}
		

			public class SendClosingSigned: NativeTypeWrapper {
				
				
				var cOpaqueStruct: LDKMessageSendEvent_LDKSendClosingSigned_Body?;
				fileprivate init(pointer: LDKMessageSendEvent_LDKSendClosingSigned_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKMessageSendEvent_LDKSendClosingSigned_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			
				
				
					public func getNode_id() -> [UInt8] {
						return Bindings.LDKPublicKey_to_array(nativeType: self.cOpaqueStruct!.node_id)
					}
				
					public func getMsg() -> ClosingSigned {
						return ClosingSigned(pointer: self.cOpaqueStruct!.msg, anchor: self)
					}
				
				
			}
		

			public class SendShutdown: NativeTypeWrapper {
				
				
				var cOpaqueStruct: LDKMessageSendEvent_LDKSendShutdown_Body?;
				fileprivate init(pointer: LDKMessageSendEvent_LDKSendShutdown_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKMessageSendEvent_LDKSendShutdown_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			
				
				
					public func getNode_id() -> [UInt8] {
						return Bindings.LDKPublicKey_to_array(nativeType: self.cOpaqueStruct!.node_id)
					}
				
					public func getMsg() -> Shutdown {
						return Shutdown(pointer: self.cOpaqueStruct!.msg, anchor: self)
					}
				
				
			}
		

			public class SendChannelReestablish: NativeTypeWrapper {
				
				
				var cOpaqueStruct: LDKMessageSendEvent_LDKSendChannelReestablish_Body?;
				fileprivate init(pointer: LDKMessageSendEvent_LDKSendChannelReestablish_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKMessageSendEvent_LDKSendChannelReestablish_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			
				
				
					public func getNode_id() -> [UInt8] {
						return Bindings.LDKPublicKey_to_array(nativeType: self.cOpaqueStruct!.node_id)
					}
				
					public func getMsg() -> ChannelReestablish {
						return ChannelReestablish(pointer: self.cOpaqueStruct!.msg, anchor: self)
					}
				
				
			}
		

			public class BroadcastChannelAnnouncement: NativeTypeWrapper {
				
				
				var cOpaqueStruct: LDKMessageSendEvent_LDKBroadcastChannelAnnouncement_Body?;
				fileprivate init(pointer: LDKMessageSendEvent_LDKBroadcastChannelAnnouncement_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKMessageSendEvent_LDKBroadcastChannelAnnouncement_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			
				
				
					public func getMsg() -> ChannelAnnouncement {
						return ChannelAnnouncement(pointer: self.cOpaqueStruct!.msg, anchor: self)
					}
				
					public func getUpdate_msg() -> ChannelUpdate {
						return ChannelUpdate(pointer: self.cOpaqueStruct!.update_msg, anchor: self)
					}
				
				
			}
		

			public class BroadcastNodeAnnouncement: NativeTypeWrapper {
				
				
				var cOpaqueStruct: LDKMessageSendEvent_LDKBroadcastNodeAnnouncement_Body?;
				fileprivate init(pointer: LDKMessageSendEvent_LDKBroadcastNodeAnnouncement_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKMessageSendEvent_LDKBroadcastNodeAnnouncement_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			
				
				
					public func getMsg() -> NodeAnnouncement {
						return NodeAnnouncement(pointer: self.cOpaqueStruct!.msg, anchor: self)
					}
				
				
			}
		

			public class BroadcastChannelUpdate: NativeTypeWrapper {
				
				
				var cOpaqueStruct: LDKMessageSendEvent_LDKBroadcastChannelUpdate_Body?;
				fileprivate init(pointer: LDKMessageSendEvent_LDKBroadcastChannelUpdate_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKMessageSendEvent_LDKBroadcastChannelUpdate_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			
				
				
					public func getMsg() -> ChannelUpdate {
						return ChannelUpdate(pointer: self.cOpaqueStruct!.msg, anchor: self)
					}
				
				
			}
		

			public class SendChannelUpdate: NativeTypeWrapper {
				
				
				var cOpaqueStruct: LDKMessageSendEvent_LDKSendChannelUpdate_Body?;
				fileprivate init(pointer: LDKMessageSendEvent_LDKSendChannelUpdate_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKMessageSendEvent_LDKSendChannelUpdate_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			
				
				
					public func getNode_id() -> [UInt8] {
						return Bindings.LDKPublicKey_to_array(nativeType: self.cOpaqueStruct!.node_id)
					}
				
					public func getMsg() -> ChannelUpdate {
						return ChannelUpdate(pointer: self.cOpaqueStruct!.msg, anchor: self)
					}
				
				
			}
		

			public class HandleError: NativeTypeWrapper {
				
				
				var cOpaqueStruct: LDKMessageSendEvent_LDKHandleError_Body?;
				fileprivate init(pointer: LDKMessageSendEvent_LDKHandleError_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKMessageSendEvent_LDKHandleError_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			
				
				
					public func getNode_id() -> [UInt8] {
						return Bindings.LDKPublicKey_to_array(nativeType: self.cOpaqueStruct!.node_id)
					}
				
					public func getAction() -> ErrorAction {
						return ErrorAction(pointer: self.cOpaqueStruct!.action, anchor: self)
					}
				
				
			}
		

			public class SendChannelRangeQuery: NativeTypeWrapper {
				
				
				var cOpaqueStruct: LDKMessageSendEvent_LDKSendChannelRangeQuery_Body?;
				fileprivate init(pointer: LDKMessageSendEvent_LDKSendChannelRangeQuery_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKMessageSendEvent_LDKSendChannelRangeQuery_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			
				
				
					public func getNode_id() -> [UInt8] {
						return Bindings.LDKPublicKey_to_array(nativeType: self.cOpaqueStruct!.node_id)
					}
				
					public func getMsg() -> QueryChannelRange {
						return QueryChannelRange(pointer: self.cOpaqueStruct!.msg, anchor: self)
					}
				
				
			}
		

			public class SendShortIdsQuery: NativeTypeWrapper {
				
				
				var cOpaqueStruct: LDKMessageSendEvent_LDKSendShortIdsQuery_Body?;
				fileprivate init(pointer: LDKMessageSendEvent_LDKSendShortIdsQuery_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKMessageSendEvent_LDKSendShortIdsQuery_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			
				
				
					public func getNode_id() -> [UInt8] {
						return Bindings.LDKPublicKey_to_array(nativeType: self.cOpaqueStruct!.node_id)
					}
				
					public func getMsg() -> QueryShortChannelIds {
						return QueryShortChannelIds(pointer: self.cOpaqueStruct!.msg, anchor: self)
					}
				
				
			}
		

			public class SendReplyChannelRange: NativeTypeWrapper {
				
				
				var cOpaqueStruct: LDKMessageSendEvent_LDKSendReplyChannelRange_Body?;
				fileprivate init(pointer: LDKMessageSendEvent_LDKSendReplyChannelRange_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKMessageSendEvent_LDKSendReplyChannelRange_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			
				
				
					public func getNode_id() -> [UInt8] {
						return Bindings.LDKPublicKey_to_array(nativeType: self.cOpaqueStruct!.node_id)
					}
				
					public func getMsg() -> ReplyChannelRange {
						return ReplyChannelRange(pointer: self.cOpaqueStruct!.msg, anchor: self)
					}
				
				
			}
		
}
