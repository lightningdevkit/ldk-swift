#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class ChannelUpdateInfo: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKChannelUpdateInfo?


	/* DEFAULT_CONSTRUCTOR_START */
    public init(last_update_arg: UInt32, enabled_arg: Bool, cltv_expiry_delta_arg: UInt16, htlc_minimum_msat_arg: UInt64, htlc_maximum_msat_arg: Option_u64Z, fees_arg: RoutingFees, last_update_message_arg: ChannelUpdate) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = ChannelUpdateInfo_new(last_update_arg, enabled_arg, cltv_expiry_delta_arg, htlc_minimum_msat_arg, htlc_maximum_msat_arg.danglingClone().cOpaqueStruct!, fees_arg.danglingClone().cOpaqueStruct!, last_update_message_arg.danglingClone().cOpaqueStruct!)
        super.init(conflictAvoidingVariableName: 0)
        
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKChannelUpdateInfo){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKChannelUpdateInfo, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func get_last_update() -> UInt32 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelUpdateInfo>) in
ChannelUpdateInfo_get_last_update(this_ptrPointer)
};
    }

    public func set_last_update(val: UInt32) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelUpdateInfo>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelUpdateInfo_set_last_update(this_ptrPointer, val);
    }

    public func get_enabled() -> Bool {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelUpdateInfo>) in
ChannelUpdateInfo_get_enabled(this_ptrPointer)
};
    }

    public func set_enabled(val: Bool) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelUpdateInfo>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelUpdateInfo_set_enabled(this_ptrPointer, val);
    }

    public func get_cltv_expiry_delta() -> UInt16 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelUpdateInfo>) in
ChannelUpdateInfo_get_cltv_expiry_delta(this_ptrPointer)
};
    }

    public func set_cltv_expiry_delta(val: UInt16) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelUpdateInfo>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelUpdateInfo_set_cltv_expiry_delta(this_ptrPointer, val);
    }

    public func get_htlc_minimum_msat() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelUpdateInfo>) in
ChannelUpdateInfo_get_htlc_minimum_msat(this_ptrPointer)
};
    }

    public func set_htlc_minimum_msat(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelUpdateInfo>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelUpdateInfo_set_htlc_minimum_msat(this_ptrPointer, val);
    }

    public func get_htlc_maximum_msat() -> Option_u64Z {
    	
        return Option_u64Z(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelUpdateInfo>) in
ChannelUpdateInfo_get_htlc_maximum_msat(this_ptrPointer)
});
    }

    public func set_htlc_maximum_msat(val: Option_u64Z) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelUpdateInfo>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelUpdateInfo_set_htlc_maximum_msat(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func get_fees() -> RoutingFees {
    	
        return RoutingFees(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelUpdateInfo>) in
ChannelUpdateInfo_get_fees(this_ptrPointer)
});
    }

    public func set_fees(val: RoutingFees) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelUpdateInfo>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelUpdateInfo_set_fees(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func get_last_update_message() -> ChannelUpdate {
    	
        return ChannelUpdate(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelUpdateInfo>) in
ChannelUpdateInfo_get_last_update_message(this_ptrPointer)
});
    }

    public func set_last_update_message(val: ChannelUpdate) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelUpdateInfo>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelUpdateInfo_set_last_update_message(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func clone() -> ChannelUpdateInfo {
    	
        return ChannelUpdateInfo(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKChannelUpdateInfo>) in
ChannelUpdateInfo_clone(origPointer)
});
    }

					internal func danglingClone() -> ChannelUpdateInfo {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKChannelUpdateInfo>) in
ChannelUpdateInfo_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_ChannelUpdateInfoDecodeErrorZ {
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_ChannelUpdateInfoDecodeErrorZ(pointer: ChannelUpdateInfo_read(serWrapper.cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return ChannelUpdateInfo_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> ChannelUpdateInfo {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing ChannelUpdateInfo \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing ChannelUpdateInfo \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
