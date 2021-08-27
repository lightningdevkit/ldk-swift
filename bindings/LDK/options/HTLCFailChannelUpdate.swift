public class HTLCFailChannelUpdate: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKHTLCFailChannelUpdate?

	

    public init(pointer: LDKHTLCFailChannelUpdate){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
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
				
			
    internal func free() -> Void {
    	
        return HTLCFailChannelUpdate_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> HTLCFailChannelUpdate {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing HTLCFailChannelUpdate \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing HTLCFailChannelUpdate \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> HTLCFailChannelUpdate {
    	
        return HTLCFailChannelUpdate(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKHTLCFailChannelUpdate>) in
HTLCFailChannelUpdate_clone(origPointer)
});
    }

					internal func danglingClone() -> HTLCFailChannelUpdate {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public class func channel_update_message(msg: ChannelUpdate) -> HTLCFailChannelUpdate {
    	
        return HTLCFailChannelUpdate(pointer: HTLCFailChannelUpdate_channel_update_message(msg.danglingClone().cOpaqueStruct!));
    }

    public class func channel_closed(short_channel_id: UInt64, is_permanent: Bool) -> HTLCFailChannelUpdate {
    	
        return HTLCFailChannelUpdate(pointer: HTLCFailChannelUpdate_channel_closed(short_channel_id, is_permanent));
    }

    public class func node_failure(node_id: [UInt8], is_permanent: Bool) -> HTLCFailChannelUpdate {
    	
        return HTLCFailChannelUpdate(pointer: HTLCFailChannelUpdate_node_failure(Bindings.new_LDKPublicKey(array: node_id), is_permanent));
    }

    /* OPTION_METHODS_END */

	

			public class ChannelUpdateMessage {
				
				
				var cOpaqueStruct: LDKHTLCFailChannelUpdate_LDKChannelUpdateMessage_Body?;
				fileprivate init(pointer: LDKHTLCFailChannelUpdate_LDKChannelUpdateMessage_Body) {
					self.cOpaqueStruct = pointer
				}
			
				
				
					public func getMsg() -> ChannelUpdate {
						return ChannelUpdate(pointer: self.cOpaqueStruct!.msg).dangle()
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
