public class ErrorAction {

    var cOpaqueStruct: LDKErrorAction?;

	

    public init(pointer: LDKErrorAction){
		self.cOpaqueStruct = pointer
	}

    /* OPTION_METHODS_START */

				public enum ErrorActionValueType {
					case DisconnectPeer, SendErrorMessage
				}
				
				public func getValueType() -> ErrorActionValueType? {
					switch self.cOpaqueStruct?.tag {
                    
					case LDKErrorAction_DisconnectPeer:
						return .DisconnectPeer
					case LDKErrorAction_SendErrorMessage:
						return .SendErrorMessage
                    default:
                        return nil
                    }
				}
				
				
					public func getValueAsDisconnectPeer() -> DisconnectPeer? {
						if self.cOpaqueStruct?.tag != LDKErrorAction_DisconnectPeer {
							return nil
						}
						return DisconnectPeer(pointer: self.cOpaqueStruct!.disconnect_peer)
					}
				
					public func getValueAsSendErrorMessage() -> SendErrorMessage? {
						if self.cOpaqueStruct?.tag != LDKErrorAction_SendErrorMessage {
							return nil
						}
						return SendErrorMessage(pointer: self.cOpaqueStruct!.send_error_message)
					}
				
			
    /* OPTION_METHODS_END */

	

			public class DisconnectPeer {
				
				
				var cOpaqueStruct: LDKErrorAction_LDKDisconnectPeer_Body?;
				fileprivate init(pointer: LDKErrorAction_LDKDisconnectPeer_Body) {
					self.cOpaqueStruct = pointer
				}
			
				
				
					public func getMsg() -> ErrorMessage {
						return ErrorMessage(pointer: self.cOpaqueStruct!.msg)
					}
				
				
			}
		

			public class SendErrorMessage {
				
				
				var cOpaqueStruct: LDKErrorAction_LDKSendErrorMessage_Body?;
				fileprivate init(pointer: LDKErrorAction_LDKSendErrorMessage_Body) {
					self.cOpaqueStruct = pointer
				}
			
				
				
					public func getMsg() -> ErrorMessage {
						return ErrorMessage(pointer: self.cOpaqueStruct!.msg)
					}
				
				
			}
		
}
