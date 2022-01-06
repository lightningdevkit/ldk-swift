public class NetworkUpdate: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKNetworkUpdate?

	

    public init(pointer: LDKNetworkUpdate){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKNetworkUpdate, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* OPTION_METHODS_START */

				public enum NetworkUpdateValueType {
					case ChannelUpdateMessage, ChannelClosed, NodeFailure
				}
				
				public func getValueType() -> NetworkUpdateValueType? {
					switch self.cOpaqueStruct?.tag {
                    
					case LDKNetworkUpdate_ChannelUpdateMessage:
						return .ChannelUpdateMessage
					case LDKNetworkUpdate_ChannelClosed:
						return .ChannelClosed
					case LDKNetworkUpdate_NodeFailure:
						return .NodeFailure
                    default:
                        return nil
                    }
				}
				
				
					public func getValueAsChannelUpdateMessage() -> ChannelUpdateMessage? {
						if self.cOpaqueStruct?.tag != LDKNetworkUpdate_ChannelUpdateMessage {
							return nil
						}
						return ChannelUpdateMessage(pointer: self.cOpaqueStruct!.channel_update_message, anchor: self)
					}
				
					public func getValueAsChannelClosed() -> ChannelClosed? {
						if self.cOpaqueStruct?.tag != LDKNetworkUpdate_ChannelClosed {
							return nil
						}
						return ChannelClosed(pointer: self.cOpaqueStruct!.channel_closed, anchor: self)
					}
				
					public func getValueAsNodeFailure() -> NodeFailure? {
						if self.cOpaqueStruct?.tag != LDKNetworkUpdate_NodeFailure {
							return nil
						}
						return NodeFailure(pointer: self.cOpaqueStruct!.node_failure, anchor: self)
					}
				
			
    internal func free() -> Void {
    	
        return NetworkUpdate_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> NetworkUpdate {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing NetworkUpdate \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing NetworkUpdate \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> NetworkUpdate {
    	
        return NetworkUpdate(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKNetworkUpdate>) in
NetworkUpdate_clone(origPointer)
});
    }

					internal func danglingClone() -> NetworkUpdate {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public class func channel_update_message(msg: ChannelUpdate) -> NetworkUpdate {
    	
        return NetworkUpdate(pointer: NetworkUpdate_channel_update_message(msg.danglingClone().cOpaqueStruct!));
    }

    public class func channel_closed(short_channel_id: UInt64, is_permanent: Bool) -> NetworkUpdate {
    	
        return NetworkUpdate(pointer: NetworkUpdate_channel_closed(short_channel_id, is_permanent));
    }

    public class func node_failure(node_id: [UInt8], is_permanent: Bool) -> NetworkUpdate {
    	
        return NetworkUpdate(pointer: NetworkUpdate_node_failure(Bindings.new_LDKPublicKey(array: node_id), is_permanent));
    }

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKNetworkUpdate>) in
NetworkUpdate_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_COption_NetworkUpdateZDecodeErrorZ {
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_COption_NetworkUpdateZDecodeErrorZ(pointer: NetworkUpdate_read(serWrapper.cOpaqueStruct!));
    }

    /* OPTION_METHODS_END */

	

			public class ChannelUpdateMessage: NativeTypeWrapper {
				
				
				var cOpaqueStruct: LDKNetworkUpdate_LDKChannelUpdateMessage_Body?;
				fileprivate init(pointer: LDKNetworkUpdate_LDKChannelUpdateMessage_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKNetworkUpdate_LDKChannelUpdateMessage_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			
				
				
					public func getMsg() -> ChannelUpdate {
						return ChannelUpdate(pointer: self.cOpaqueStruct!.msg, anchor: self)
					}
				
				
			}
		

			public class ChannelClosed: NativeTypeWrapper {
				
				
				var cOpaqueStruct: LDKNetworkUpdate_LDKChannelClosed_Body?;
				fileprivate init(pointer: LDKNetworkUpdate_LDKChannelClosed_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKNetworkUpdate_LDKChannelClosed_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			
				
				
					public func getShort_channel_id() -> UInt64 {
						return self.cOpaqueStruct!.short_channel_id
					}
				
					public func getIs_permanent() -> Bool {
						return self.cOpaqueStruct!.is_permanent
					}
				
				
			}
		

			public class NodeFailure: NativeTypeWrapper {
				
				
				var cOpaqueStruct: LDKNetworkUpdate_LDKNodeFailure_Body?;
				fileprivate init(pointer: LDKNetworkUpdate_LDKNodeFailure_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKNetworkUpdate_LDKNodeFailure_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			
				
				
					public func getNode_id() -> [UInt8] {
						return Bindings.LDKPublicKey_to_array(nativeType: self.cOpaqueStruct!.node_id)
					}
				
					public func getIs_permanent() -> Bool {
						return self.cOpaqueStruct!.is_permanent
					}
				
				
			}
		
}
