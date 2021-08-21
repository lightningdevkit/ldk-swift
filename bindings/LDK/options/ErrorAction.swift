import LDKHeaders

public class ErrorAction: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKErrorAction?

	

    public init(pointer: LDKErrorAction){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

    /* OPTION_METHODS_START */

				public enum ErrorActionValueType {
					case DisconnectPeer, IgnoreAndLog, SendErrorMessage
				}
				
				public func getValueType() -> ErrorActionValueType? {
					switch self.cOpaqueStruct?.tag {
                    
					case LDKErrorAction_DisconnectPeer:
						return .DisconnectPeer
					case LDKErrorAction_IgnoreAndLog:
						return .IgnoreAndLog
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
				
					public func getValueAsIgnoreAndLog() -> LDKLevel? {
						if self.cOpaqueStruct?.tag != LDKErrorAction_IgnoreAndLog {
							return nil
						}
						return self.cOpaqueStruct!.ignore_and_log
					}
				
					public func getValueAsSendErrorMessage() -> SendErrorMessage? {
						if self.cOpaqueStruct?.tag != LDKErrorAction_SendErrorMessage {
							return nil
						}
						return SendErrorMessage(pointer: self.cOpaqueStruct!.send_error_message)
					}
				
			
    internal func free() -> Void {
    	
        return ErrorAction_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> ErrorAction {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing ErrorAction \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing ErrorAction \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> ErrorAction {
    	
        return ErrorAction(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKErrorAction>) in
ErrorAction_clone(origPointer)
});
    }

					internal func danglingClone() -> ErrorAction {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public class func disconnect_peer(msg: ErrorMessage) -> ErrorAction {
    	
        return ErrorAction(pointer: ErrorAction_disconnect_peer(msg.danglingClone().cOpaqueStruct!));
    }

    public class func ignore_error() -> ErrorAction {
    	
        return ErrorAction(pointer: ErrorAction_ignore_error());
    }

    public class func ignore_and_log(a: LDKLevel) -> ErrorAction {
    	
        return ErrorAction(pointer: ErrorAction_ignore_and_log(a));
    }

    public class func send_error_message(msg: ErrorMessage) -> ErrorAction {
    	
        return ErrorAction(pointer: ErrorAction_send_error_message(msg.danglingClone().cOpaqueStruct!));
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
