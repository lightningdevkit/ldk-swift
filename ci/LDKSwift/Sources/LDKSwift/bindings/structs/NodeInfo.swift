#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class NodeInfo: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKNodeInfo?


	/* DEFAULT_CONSTRUCTOR_START */
    public init(channels_arg: [UInt64], lowest_inbound_channel_fees_arg: RoutingFees, announcement_info_arg: NodeAnnouncementInfo) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
						let channels_argWrapper = Bindings.new_LDKCVec_u64ZWrapper(array: channels_arg)
						defer {
							channels_argWrapper.noOpRetain()
						}
					
        self.cOpaqueStruct = NodeInfo_new(channels_argWrapper.dangle().cOpaqueStruct!, lowest_inbound_channel_fees_arg.danglingClone().cOpaqueStruct!, announcement_info_arg.danglingClone().cOpaqueStruct!)
        super.init(conflictAvoidingVariableName: 0)
        
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKNodeInfo){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKNodeInfo, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func get_channels() -> [UInt64] {
    	
        return Bindings.LDKCVec_u64Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKNodeInfo>) in
NodeInfo_get_channels(this_ptrPointer)
});
    }

    public func set_channels(val: [UInt64]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKNodeInfo>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
						let valWrapper = Bindings.new_LDKCVec_u64ZWrapper(array: val)
						defer {
							valWrapper.noOpRetain()
						}
					
        return NodeInfo_set_channels(this_ptrPointer, valWrapper.dangle().cOpaqueStruct!);
    }

    public func get_lowest_inbound_channel_fees() -> RoutingFees {
    	
        return RoutingFees(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKNodeInfo>) in
NodeInfo_get_lowest_inbound_channel_fees(this_ptrPointer)
});
    }

    public func set_lowest_inbound_channel_fees(val: RoutingFees) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKNodeInfo>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return NodeInfo_set_lowest_inbound_channel_fees(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func get_announcement_info() -> NodeAnnouncementInfo {
    	
        return NodeAnnouncementInfo(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKNodeInfo>) in
NodeInfo_get_announcement_info(this_ptrPointer)
});
    }

    public func set_announcement_info(val: NodeAnnouncementInfo) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKNodeInfo>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return NodeInfo_set_announcement_info(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func clone() -> NodeInfo {
    	
        return NodeInfo(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKNodeInfo>) in
NodeInfo_clone(origPointer)
});
    }

					internal func danglingClone() -> NodeInfo {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKNodeInfo>) in
NodeInfo_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_NodeInfoDecodeErrorZ {
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_NodeInfoDecodeErrorZ(pointer: NodeInfo_read(serWrapper.cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return NodeInfo_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> NodeInfo {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing NodeInfo \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing NodeInfo \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
