public class ErrorAction: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKErrorAction?

	

    public init(pointer: LDKErrorAction){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKErrorAction, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* OPTION_METHODS_START */

				public enum ErrorActionValueType {
					case DisconnectPeer, IgnoreAndLog, SendErrorMessage, SendWarningMessage
				}
				
				public func getValueType() -> ErrorActionValueType? {
					switch self.cOpaqueStruct?.tag {
                    
					case LDKErrorAction_DisconnectPeer:
						return .DisconnectPeer
					case LDKErrorAction_IgnoreAndLog:
						return .IgnoreAndLog
					case LDKErrorAction_SendErrorMessage:
						return .SendErrorMessage
					case LDKErrorAction_SendWarningMessage:
						return .SendWarningMessage
                    default:
                        return nil
                    }
				}
				
				
					public func getValueAsDisconnectPeer() -> DisconnectPeer? {
						if self.cOpaqueStruct?.tag != LDKErrorAction_DisconnectPeer {
							return nil
						}
						return DisconnectPeer(pointer: self.cOpaqueStruct!.disconnect_peer, anchor: self)
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
						return SendErrorMessage(pointer: self.cOpaqueStruct!.send_error_message, anchor: self)
					}
				
					public func getValueAsSendWarningMessage() -> SendWarningMessage? {
						if self.cOpaqueStruct?.tag != LDKErrorAction_SendWarningMessage {
							return nil
						}
						return SendWarningMessage(pointer: self.cOpaqueStruct!.send_warning_message, anchor: self)
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
							Bindings.print("Freeing ErrorAction \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing ErrorAction \(self.instanceNumber) due to dangle.")
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

    public class func ignore_duplicate_gossip() -> ErrorAction {
    	
        return ErrorAction(pointer: ErrorAction_ignore_duplicate_gossip());
    }

    public class func send_error_message(msg: ErrorMessage) -> ErrorAction {
    	
        return ErrorAction(pointer: ErrorAction_send_error_message(msg.danglingClone().cOpaqueStruct!));
    }

    public class func send_warning_message(msg: WarningMessage, log_level: LDKLevel) -> ErrorAction {
    	
        return ErrorAction(pointer: ErrorAction_send_warning_message(msg.danglingClone().cOpaqueStruct!, log_level));
    }

    /* OPTION_METHODS_END */

	

			public class DisconnectPeer: NativeTypeWrapper {
				
				
				var cOpaqueStruct: LDKErrorAction_LDKDisconnectPeer_Body?;
				fileprivate init(pointer: LDKErrorAction_LDKDisconnectPeer_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKErrorAction_LDKDisconnectPeer_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			
				
				
					public func getMsg() -> ErrorMessage {
						return ErrorMessage(pointer: self.cOpaqueStruct!.msg, anchor: self)
					}
				
				
			}
		

			public class SendErrorMessage: NativeTypeWrapper {
				
				
				var cOpaqueStruct: LDKErrorAction_LDKSendErrorMessage_Body?;
				fileprivate init(pointer: LDKErrorAction_LDKSendErrorMessage_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKErrorAction_LDKSendErrorMessage_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			
				
				
					public func getMsg() -> ErrorMessage {
						return ErrorMessage(pointer: self.cOpaqueStruct!.msg, anchor: self)
					}
				
				
			}
		

			public class SendWarningMessage: NativeTypeWrapper {
				
				
				var cOpaqueStruct: LDKErrorAction_LDKSendWarningMessage_Body?;
				fileprivate init(pointer: LDKErrorAction_LDKSendWarningMessage_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKErrorAction_LDKSendWarningMessage_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			
				
				
					public func getMsg() -> WarningMessage {
						return WarningMessage(pointer: self.cOpaqueStruct!.msg, anchor: self)
					}
				
					public func getLog_level() -> LDKLevel {
						return self.cOpaqueStruct!.log_level
					}
				
				
			}
		
}
