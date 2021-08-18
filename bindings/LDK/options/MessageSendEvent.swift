public class MessageSendEvent {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKMessageSendEvent?;

	

    public init(pointer: LDKMessageSendEvent){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* OPTION_METHODS_START */

				public enum MessageSendEventValueType {
					case SendAcceptChannel, SendOpenChannel, SendFundingCreated, SendFundingSigned, SendFundingLocked, SendAnnouncementSignatures, UpdateHTLCs, SendRevokeAndACK, SendClosingSigned, SendShutdown, SendChannelReestablish, BroadcastChannelAnnouncement, BroadcastNodeAnnouncement, BroadcastChannelUpdate, SendChannelUpdate, HandleError, PaymentFailureNetworkUpdate, SendChannelRangeQuery, SendShortIdsQuery, SendReplyChannelRange
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
					case LDKMessageSendEvent_PaymentFailureNetworkUpdate:
						return .PaymentFailureNetworkUpdate
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
						return SendAcceptChannel(pointer: self.cOpaqueStruct!.send_accept_channel)
					}
				
					public func getValueAsSendOpenChannel() -> SendOpenChannel? {
						if self.cOpaqueStruct?.tag != LDKMessageSendEvent_SendOpenChannel {
							return nil
						}
						return SendOpenChannel(pointer: self.cOpaqueStruct!.send_open_channel)
					}
				
					public func getValueAsSendFundingCreated() -> SendFundingCreated? {
						if self.cOpaqueStruct?.tag != LDKMessageSendEvent_SendFundingCreated {
							return nil
						}
						return SendFundingCreated(pointer: self.cOpaqueStruct!.send_funding_created)
					}
				
					public func getValueAsSendFundingSigned() -> SendFundingSigned? {
						if self.cOpaqueStruct?.tag != LDKMessageSendEvent_SendFundingSigned {
							return nil
						}
						return SendFundingSigned(pointer: self.cOpaqueStruct!.send_funding_signed)
					}
				
					public func getValueAsSendFundingLocked() -> SendFundingLocked? {
						if self.cOpaqueStruct?.tag != LDKMessageSendEvent_SendFundingLocked {
							return nil
						}
						return SendFundingLocked(pointer: self.cOpaqueStruct!.send_funding_locked)
					}
				
					public func getValueAsSendAnnouncementSignatures() -> SendAnnouncementSignatures? {
						if self.cOpaqueStruct?.tag != LDKMessageSendEvent_SendAnnouncementSignatures {
							return nil
						}
						return SendAnnouncementSignatures(pointer: self.cOpaqueStruct!.send_announcement_signatures)
					}
				
					public func getValueAsUpdateHTLCs() -> UpdateHTLCs? {
						if self.cOpaqueStruct?.tag != LDKMessageSendEvent_UpdateHTLCs {
							return nil
						}
						return UpdateHTLCs(pointer: self.cOpaqueStruct!.update_htl_cs)
					}
				
					public func getValueAsSendRevokeAndACK() -> SendRevokeAndACK? {
						if self.cOpaqueStruct?.tag != LDKMessageSendEvent_SendRevokeAndACK {
							return nil
						}
						return SendRevokeAndACK(pointer: self.cOpaqueStruct!.send_revoke_and_ack)
					}
				
					public func getValueAsSendClosingSigned() -> SendClosingSigned? {
						if self.cOpaqueStruct?.tag != LDKMessageSendEvent_SendClosingSigned {
							return nil
						}
						return SendClosingSigned(pointer: self.cOpaqueStruct!.send_closing_signed)
					}
				
					public func getValueAsSendShutdown() -> SendShutdown? {
						if self.cOpaqueStruct?.tag != LDKMessageSendEvent_SendShutdown {
							return nil
						}
						return SendShutdown(pointer: self.cOpaqueStruct!.send_shutdown)
					}
				
					public func getValueAsSendChannelReestablish() -> SendChannelReestablish? {
						if self.cOpaqueStruct?.tag != LDKMessageSendEvent_SendChannelReestablish {
							return nil
						}
						return SendChannelReestablish(pointer: self.cOpaqueStruct!.send_channel_reestablish)
					}
				
					public func getValueAsBroadcastChannelAnnouncement() -> BroadcastChannelAnnouncement? {
						if self.cOpaqueStruct?.tag != LDKMessageSendEvent_BroadcastChannelAnnouncement {
							return nil
						}
						return BroadcastChannelAnnouncement(pointer: self.cOpaqueStruct!.broadcast_channel_announcement)
					}
				
					public func getValueAsBroadcastNodeAnnouncement() -> BroadcastNodeAnnouncement? {
						if self.cOpaqueStruct?.tag != LDKMessageSendEvent_BroadcastNodeAnnouncement {
							return nil
						}
						return BroadcastNodeAnnouncement(pointer: self.cOpaqueStruct!.broadcast_node_announcement)
					}
				
					public func getValueAsBroadcastChannelUpdate() -> BroadcastChannelUpdate? {
						if self.cOpaqueStruct?.tag != LDKMessageSendEvent_BroadcastChannelUpdate {
							return nil
						}
						return BroadcastChannelUpdate(pointer: self.cOpaqueStruct!.broadcast_channel_update)
					}
				
					public func getValueAsSendChannelUpdate() -> SendChannelUpdate? {
						if self.cOpaqueStruct?.tag != LDKMessageSendEvent_SendChannelUpdate {
							return nil
						}
						return SendChannelUpdate(pointer: self.cOpaqueStruct!.send_channel_update)
					}
				
					public func getValueAsHandleError() -> HandleError? {
						if self.cOpaqueStruct?.tag != LDKMessageSendEvent_HandleError {
							return nil
						}
						return HandleError(pointer: self.cOpaqueStruct!.handle_error)
					}
				
					public func getValueAsPaymentFailureNetworkUpdate() -> PaymentFailureNetworkUpdate? {
						if self.cOpaqueStruct?.tag != LDKMessageSendEvent_PaymentFailureNetworkUpdate {
							return nil
						}
						return PaymentFailureNetworkUpdate(pointer: self.cOpaqueStruct!.payment_failure_network_update)
					}
				
					public func getValueAsSendChannelRangeQuery() -> SendChannelRangeQuery? {
						if self.cOpaqueStruct?.tag != LDKMessageSendEvent_SendChannelRangeQuery {
							return nil
						}
						return SendChannelRangeQuery(pointer: self.cOpaqueStruct!.send_channel_range_query)
					}
				
					public func getValueAsSendShortIdsQuery() -> SendShortIdsQuery? {
						if self.cOpaqueStruct?.tag != LDKMessageSendEvent_SendShortIdsQuery {
							return nil
						}
						return SendShortIdsQuery(pointer: self.cOpaqueStruct!.send_short_ids_query)
					}
				
					public func getValueAsSendReplyChannelRange() -> SendReplyChannelRange? {
						if self.cOpaqueStruct?.tag != LDKMessageSendEvent_SendReplyChannelRange {
							return nil
						}
						return SendReplyChannelRange(pointer: self.cOpaqueStruct!.send_reply_channel_range)
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
							print("Freeing MessageSendEvent \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing MessageSendEvent \(self.instanceNumber) due to dangle.")
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
				

    /* OPTION_METHODS_END */

	

			public class SendAcceptChannel {
				
				
				var cOpaqueStruct: LDKMessageSendEvent_LDKSendAcceptChannel_Body?;
				fileprivate init(pointer: LDKMessageSendEvent_LDKSendAcceptChannel_Body) {
					self.cOpaqueStruct = pointer
				}
			
				
				
					public func getNode_id() -> [UInt8] {
						return Bindings.LDKPublicKey_to_array(nativeType: self.cOpaqueStruct!.node_id)
					}
				
					public func getMsg() -> AcceptChannel {
						return AcceptChannel(pointer: self.cOpaqueStruct!.msg)
					}
				
				
			}
		

			public class SendOpenChannel {
				
				
				var cOpaqueStruct: LDKMessageSendEvent_LDKSendOpenChannel_Body?;
				fileprivate init(pointer: LDKMessageSendEvent_LDKSendOpenChannel_Body) {
					self.cOpaqueStruct = pointer
				}
			
				
				
					public func getNode_id() -> [UInt8] {
						return Bindings.LDKPublicKey_to_array(nativeType: self.cOpaqueStruct!.node_id)
					}
				
					public func getMsg() -> OpenChannel {
						return OpenChannel(pointer: self.cOpaqueStruct!.msg)
					}
				
				
			}
		

			public class SendFundingCreated {
				
				
				var cOpaqueStruct: LDKMessageSendEvent_LDKSendFundingCreated_Body?;
				fileprivate init(pointer: LDKMessageSendEvent_LDKSendFundingCreated_Body) {
					self.cOpaqueStruct = pointer
				}
			
				
				
					public func getNode_id() -> [UInt8] {
						return Bindings.LDKPublicKey_to_array(nativeType: self.cOpaqueStruct!.node_id)
					}
				
					public func getMsg() -> FundingCreated {
						return FundingCreated(pointer: self.cOpaqueStruct!.msg)
					}
				
				
			}
		

			public class SendFundingSigned {
				
				
				var cOpaqueStruct: LDKMessageSendEvent_LDKSendFundingSigned_Body?;
				fileprivate init(pointer: LDKMessageSendEvent_LDKSendFundingSigned_Body) {
					self.cOpaqueStruct = pointer
				}
			
				
				
					public func getNode_id() -> [UInt8] {
						return Bindings.LDKPublicKey_to_array(nativeType: self.cOpaqueStruct!.node_id)
					}
				
					public func getMsg() -> FundingSigned {
						return FundingSigned(pointer: self.cOpaqueStruct!.msg)
					}
				
				
			}
		

			public class SendFundingLocked {
				
				
				var cOpaqueStruct: LDKMessageSendEvent_LDKSendFundingLocked_Body?;
				fileprivate init(pointer: LDKMessageSendEvent_LDKSendFundingLocked_Body) {
					self.cOpaqueStruct = pointer
				}
			
				
				
					public func getNode_id() -> [UInt8] {
						return Bindings.LDKPublicKey_to_array(nativeType: self.cOpaqueStruct!.node_id)
					}
				
					public func getMsg() -> FundingLocked {
						return FundingLocked(pointer: self.cOpaqueStruct!.msg)
					}
				
				
			}
		

			public class SendAnnouncementSignatures {
				
				
				var cOpaqueStruct: LDKMessageSendEvent_LDKSendAnnouncementSignatures_Body?;
				fileprivate init(pointer: LDKMessageSendEvent_LDKSendAnnouncementSignatures_Body) {
					self.cOpaqueStruct = pointer
				}
			
				
				
					public func getNode_id() -> [UInt8] {
						return Bindings.LDKPublicKey_to_array(nativeType: self.cOpaqueStruct!.node_id)
					}
				
					public func getMsg() -> AnnouncementSignatures {
						return AnnouncementSignatures(pointer: self.cOpaqueStruct!.msg)
					}
				
				
			}
		

			public class UpdateHTLCs {
				
				
				var cOpaqueStruct: LDKMessageSendEvent_LDKUpdateHTLCs_Body?;
				fileprivate init(pointer: LDKMessageSendEvent_LDKUpdateHTLCs_Body) {
					self.cOpaqueStruct = pointer
				}
			
				
				
					public func getNode_id() -> [UInt8] {
						return Bindings.LDKPublicKey_to_array(nativeType: self.cOpaqueStruct!.node_id)
					}
				
					public func getUpdates() -> CommitmentUpdate {
						return CommitmentUpdate(pointer: self.cOpaqueStruct!.updates)
					}
				
				
			}
		

			public class SendRevokeAndACK {
				
				
				var cOpaqueStruct: LDKMessageSendEvent_LDKSendRevokeAndACK_Body?;
				fileprivate init(pointer: LDKMessageSendEvent_LDKSendRevokeAndACK_Body) {
					self.cOpaqueStruct = pointer
				}
			
				
				
					public func getNode_id() -> [UInt8] {
						return Bindings.LDKPublicKey_to_array(nativeType: self.cOpaqueStruct!.node_id)
					}
				
					public func getMsg() -> RevokeAndACK {
						return RevokeAndACK(pointer: self.cOpaqueStruct!.msg)
					}
				
				
			}
		

			public class SendClosingSigned {
				
				
				var cOpaqueStruct: LDKMessageSendEvent_LDKSendClosingSigned_Body?;
				fileprivate init(pointer: LDKMessageSendEvent_LDKSendClosingSigned_Body) {
					self.cOpaqueStruct = pointer
				}
			
				
				
					public func getNode_id() -> [UInt8] {
						return Bindings.LDKPublicKey_to_array(nativeType: self.cOpaqueStruct!.node_id)
					}
				
					public func getMsg() -> ClosingSigned {
						return ClosingSigned(pointer: self.cOpaqueStruct!.msg)
					}
				
				
			}
		

			public class SendShutdown {
				
				
				var cOpaqueStruct: LDKMessageSendEvent_LDKSendShutdown_Body?;
				fileprivate init(pointer: LDKMessageSendEvent_LDKSendShutdown_Body) {
					self.cOpaqueStruct = pointer
				}
			
				
				
					public func getNode_id() -> [UInt8] {
						return Bindings.LDKPublicKey_to_array(nativeType: self.cOpaqueStruct!.node_id)
					}
				
					public func getMsg() -> Shutdown {
						return Shutdown(pointer: self.cOpaqueStruct!.msg)
					}
				
				
			}
		

			public class SendChannelReestablish {
				
				
				var cOpaqueStruct: LDKMessageSendEvent_LDKSendChannelReestablish_Body?;
				fileprivate init(pointer: LDKMessageSendEvent_LDKSendChannelReestablish_Body) {
					self.cOpaqueStruct = pointer
				}
			
				
				
					public func getNode_id() -> [UInt8] {
						return Bindings.LDKPublicKey_to_array(nativeType: self.cOpaqueStruct!.node_id)
					}
				
					public func getMsg() -> ChannelReestablish {
						return ChannelReestablish(pointer: self.cOpaqueStruct!.msg)
					}
				
				
			}
		

			public class BroadcastChannelAnnouncement {
				
				
				var cOpaqueStruct: LDKMessageSendEvent_LDKBroadcastChannelAnnouncement_Body?;
				fileprivate init(pointer: LDKMessageSendEvent_LDKBroadcastChannelAnnouncement_Body) {
					self.cOpaqueStruct = pointer
				}
			
				
				
					public func getMsg() -> ChannelAnnouncement {
						return ChannelAnnouncement(pointer: self.cOpaqueStruct!.msg)
					}
				
					public func getUpdate_msg() -> ChannelUpdate {
						return ChannelUpdate(pointer: self.cOpaqueStruct!.update_msg)
					}
				
				
			}
		

			public class BroadcastNodeAnnouncement {
				
				
				var cOpaqueStruct: LDKMessageSendEvent_LDKBroadcastNodeAnnouncement_Body?;
				fileprivate init(pointer: LDKMessageSendEvent_LDKBroadcastNodeAnnouncement_Body) {
					self.cOpaqueStruct = pointer
				}
			
				
				
					public func getMsg() -> NodeAnnouncement {
						return NodeAnnouncement(pointer: self.cOpaqueStruct!.msg)
					}
				
				
			}
		

			public class BroadcastChannelUpdate {
				
				
				var cOpaqueStruct: LDKMessageSendEvent_LDKBroadcastChannelUpdate_Body?;
				fileprivate init(pointer: LDKMessageSendEvent_LDKBroadcastChannelUpdate_Body) {
					self.cOpaqueStruct = pointer
				}
			
				
				
					public func getMsg() -> ChannelUpdate {
						return ChannelUpdate(pointer: self.cOpaqueStruct!.msg)
					}
				
				
			}
		

			public class SendChannelUpdate {
				
				
				var cOpaqueStruct: LDKMessageSendEvent_LDKSendChannelUpdate_Body?;
				fileprivate init(pointer: LDKMessageSendEvent_LDKSendChannelUpdate_Body) {
					self.cOpaqueStruct = pointer
				}
			
				
				
					public func getNode_id() -> [UInt8] {
						return Bindings.LDKPublicKey_to_array(nativeType: self.cOpaqueStruct!.node_id)
					}
				
					public func getMsg() -> ChannelUpdate {
						return ChannelUpdate(pointer: self.cOpaqueStruct!.msg)
					}
				
				
			}
		

			public class HandleError {
				
				
				var cOpaqueStruct: LDKMessageSendEvent_LDKHandleError_Body?;
				fileprivate init(pointer: LDKMessageSendEvent_LDKHandleError_Body) {
					self.cOpaqueStruct = pointer
				}
			
				
				
					public func getNode_id() -> [UInt8] {
						return Bindings.LDKPublicKey_to_array(nativeType: self.cOpaqueStruct!.node_id)
					}
				
					public func getAction() -> ErrorAction {
						return ErrorAction(pointer: self.cOpaqueStruct!.action)
					}
				
				
			}
		

			public class PaymentFailureNetworkUpdate {
				
				
				var cOpaqueStruct: LDKMessageSendEvent_LDKPaymentFailureNetworkUpdate_Body?;
				fileprivate init(pointer: LDKMessageSendEvent_LDKPaymentFailureNetworkUpdate_Body) {
					self.cOpaqueStruct = pointer
				}
			
				
				
					public func getUpdate() -> HTLCFailChannelUpdate {
						return HTLCFailChannelUpdate(pointer: self.cOpaqueStruct!.update)
					}
				
				
			}
		

			public class SendChannelRangeQuery {
				
				
				var cOpaqueStruct: LDKMessageSendEvent_LDKSendChannelRangeQuery_Body?;
				fileprivate init(pointer: LDKMessageSendEvent_LDKSendChannelRangeQuery_Body) {
					self.cOpaqueStruct = pointer
				}
			
				
				
					public func getNode_id() -> [UInt8] {
						return Bindings.LDKPublicKey_to_array(nativeType: self.cOpaqueStruct!.node_id)
					}
				
					public func getMsg() -> QueryChannelRange {
						return QueryChannelRange(pointer: self.cOpaqueStruct!.msg)
					}
				
				
			}
		

			public class SendShortIdsQuery {
				
				
				var cOpaqueStruct: LDKMessageSendEvent_LDKSendShortIdsQuery_Body?;
				fileprivate init(pointer: LDKMessageSendEvent_LDKSendShortIdsQuery_Body) {
					self.cOpaqueStruct = pointer
				}
			
				
				
					public func getNode_id() -> [UInt8] {
						return Bindings.LDKPublicKey_to_array(nativeType: self.cOpaqueStruct!.node_id)
					}
				
					public func getMsg() -> QueryShortChannelIds {
						return QueryShortChannelIds(pointer: self.cOpaqueStruct!.msg)
					}
				
				
			}
		

			public class SendReplyChannelRange {
				
				
				var cOpaqueStruct: LDKMessageSendEvent_LDKSendReplyChannelRange_Body?;
				fileprivate init(pointer: LDKMessageSendEvent_LDKSendReplyChannelRange_Body) {
					self.cOpaqueStruct = pointer
				}
			
				
				
					public func getNode_id() -> [UInt8] {
						return Bindings.LDKPublicKey_to_array(nativeType: self.cOpaqueStruct!.node_id)
					}
				
					public func getMsg() -> ReplyChannelRange {
						return ReplyChannelRange(pointer: self.cOpaqueStruct!.msg)
					}
				
				
			}
		
}
