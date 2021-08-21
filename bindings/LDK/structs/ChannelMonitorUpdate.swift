import LDKHeaders

public class ChannelMonitorUpdate: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKChannelMonitorUpdate?


	

    public init(pointer: LDKChannelMonitorUpdate){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

    /* STRUCT_METHODS_START */

    public func get_update_id() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelMonitorUpdate>) in
ChannelMonitorUpdate_get_update_id(this_ptrPointer)
};
    }

    public func set_update_id(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelMonitorUpdate>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelMonitorUpdate_set_update_id(this_ptrPointer, val);
    }

    public func clone() -> ChannelMonitorUpdate {
    	
        return ChannelMonitorUpdate(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKChannelMonitorUpdate>) in
ChannelMonitorUpdate_clone(origPointer)
});
    }

					internal func danglingClone() -> ChannelMonitorUpdate {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKChannelMonitorUpdate>) in
ChannelMonitorUpdate_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_ChannelMonitorUpdateDecodeErrorZ {
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_ChannelMonitorUpdateDecodeErrorZ(pointer: ChannelMonitorUpdate_read(serWrapper.cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return ChannelMonitorUpdate_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> ChannelMonitorUpdate {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing ChannelMonitorUpdate \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing ChannelMonitorUpdate \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
