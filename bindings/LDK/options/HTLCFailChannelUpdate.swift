import LDKHeaders

public class HTLCFailChannelUpdate {

    public internal(set) var cOpaqueStruct: LDKHTLCFailChannelUpdate?;

	

    public init(pointer: LDKHTLCFailChannelUpdate){
		self.cOpaqueStruct = pointer
	}

    /* OPTION_METHODS_START */

				public enum HTLCFailChannelUpdateValueType {
					case ChannelUpdateMessage, ChannelClosed, NodeFailure
				}
				
				public func getValueType() -> HTLCFailChannelUpdateValueType? {
					switch self.cOpaqueStruct?.tag {
                    
					case LDKHTLCFailChannelUpdate_ChannelUpdateMessage:
						return .ChannelUpdateMessage
					case LDKHTLCFailChannelUpdate_ChannelClosed:
						return .ChannelClosed
					case LDKHTLCFailChannelUpdate_NodeFailure:
						return .NodeFailure
                    default:
                        return nil
                    }
				}
				
				
					public func getValueAsChannelUpdateMessage() -> ChannelUpdateMessage? {
						if self.cOpaqueStruct?.tag != LDKHTLCFailChannelUpdate_ChannelUpdateMessage {
							return nil
						}
						return ChannelUpdateMessage(pointer: self.cOpaqueStruct!.channel_update_message)
					}
				
					public func getValueAsChannelClosed() -> ChannelClosed? {
						if self.cOpaqueStruct?.tag != LDKHTLCFailChannelUpdate_ChannelClosed {
							return nil
						}
						return ChannelClosed(pointer: self.cOpaqueStruct!.channel_closed)
					}
				
					public func getValueAsNodeFailure() -> NodeFailure? {
						if self.cOpaqueStruct?.tag != LDKHTLCFailChannelUpdate_NodeFailure {
							return nil
						}
						return NodeFailure(pointer: self.cOpaqueStruct!.node_failure)
					}
				
			
    public func free() -> Void {
    	
        return HTLCFailChannelUpdate_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> HTLCFailChannelUpdate {
    	
        return HTLCFailChannelUpdate(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKHTLCFailChannelUpdate>) in
HTLCFailChannelUpdate_clone(origPointer)
});
    }

    /* OPTION_METHODS_END */

	

			public class ChannelUpdateMessage {
				
				
				var cOpaqueStruct: LDKHTLCFailChannelUpdate_LDKChannelUpdateMessage_Body?;
				fileprivate init(pointer: LDKHTLCFailChannelUpdate_LDKChannelUpdateMessage_Body) {
					self.cOpaqueStruct = pointer
				}
			
				
				
					public func getMsg() -> ChannelUpdate {
						return ChannelUpdate(pointer: self.cOpaqueStruct!.msg)
					}
				
				
			}
		

			public class ChannelClosed {
				
				
				var cOpaqueStruct: LDKHTLCFailChannelUpdate_LDKChannelClosed_Body?;
				fileprivate init(pointer: LDKHTLCFailChannelUpdate_LDKChannelClosed_Body) {
					self.cOpaqueStruct = pointer
				}
			
				
				
					public func getShort_channel_id() -> UInt64 {
						return self.cOpaqueStruct!.short_channel_id
					}
				
					public func getIs_permanent() -> Bool {
						return self.cOpaqueStruct!.is_permanent
					}
				
				
			}
		

			public class NodeFailure {
				
				
				var cOpaqueStruct: LDKHTLCFailChannelUpdate_LDKNodeFailure_Body?;
				fileprivate init(pointer: LDKHTLCFailChannelUpdate_LDKNodeFailure_Body) {
					self.cOpaqueStruct = pointer
				}
			
				
				
					public func getNode_id() -> [UInt8] {
						return Bindings.LDKPublicKey_to_array(nativeType: self.cOpaqueStruct!.node_id)
					}
				
					public func getIs_permanent() -> Bool {
						return self.cOpaqueStruct!.is_permanent
					}
				
				
			}
		
}
