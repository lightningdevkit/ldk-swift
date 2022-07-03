#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class PhantomRouteHints: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKPhantomRouteHints?


	/* DEFAULT_CONSTRUCTOR_START */
    internal init(channels_arg: [LDKChannelDetails], phantom_scid_arg: UInt64, real_node_pubkey_arg: [UInt8]) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
						let channels_argWrapper = Bindings.new_LDKCVec_ChannelDetailsZWrapper(array: channels_arg)
						defer {
							channels_argWrapper.noOpRetain()
						}
					
        self.cOpaqueStruct = PhantomRouteHints_new(channels_argWrapper.dangle().cOpaqueStruct!, phantom_scid_arg, Bindings.new_LDKPublicKey(array: real_node_pubkey_arg))
        super.init(conflictAvoidingVariableName: 0)
        
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKPhantomRouteHints){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKPhantomRouteHints, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */
    public convenience init(channels_arg: [ChannelDetails], phantom_scid_arg: UInt64, real_node_pubkey_arg: [UInt8])  {
    	
							let channels_argUnwrapped = channels_arg.map { (channels_argCurrentValue) in
							channels_argCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
        self.init(channels_arg: channels_argUnwrapped, phantom_scid_arg: phantom_scid_arg, real_node_pubkey_arg: real_node_pubkey_arg);
    }

    public func get_channels() -> [ChannelDetails] {
    	
        return Bindings.LDKCVec_ChannelDetailsZ_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKPhantomRouteHints>) in
PhantomRouteHints_get_channels(this_ptrPointer)
})
						
						.map { (cOpaqueStruct) in
							ChannelDetails(pointer: cOpaqueStruct)
						}
					;
    }

    public func set_channels(val: [ChannelDetails]) -> Void {
    	
							let valUnwrapped = val.map { (valCurrentValue) in
							valCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
        return self.set_channels(val: valUnwrapped);
    }

    internal func set_channels(val: [LDKChannelDetails]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKPhantomRouteHints>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
						let valWrapper = Bindings.new_LDKCVec_ChannelDetailsZWrapper(array: val)
						defer {
							valWrapper.noOpRetain()
						}
					
        return PhantomRouteHints_set_channels(this_ptrPointer, valWrapper.dangle().cOpaqueStruct!);
    }

    public func get_phantom_scid() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKPhantomRouteHints>) in
PhantomRouteHints_get_phantom_scid(this_ptrPointer)
};
    }

    public func set_phantom_scid(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKPhantomRouteHints>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return PhantomRouteHints_set_phantom_scid(this_ptrPointer, val);
    }

    public func get_real_node_pubkey() -> [UInt8] {
    	
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKPhantomRouteHints>) in
PhantomRouteHints_get_real_node_pubkey(this_ptrPointer)
});
    }

    public func set_real_node_pubkey(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKPhantomRouteHints>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return PhantomRouteHints_set_real_node_pubkey(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    public func clone() -> PhantomRouteHints {
    	
        return PhantomRouteHints(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKPhantomRouteHints>) in
PhantomRouteHints_clone(origPointer)
});
    }

					internal func danglingClone() -> PhantomRouteHints {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKPhantomRouteHints>) in
PhantomRouteHints_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_PhantomRouteHintsDecodeErrorZ {
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_PhantomRouteHintsDecodeErrorZ(pointer: PhantomRouteHints_read(serWrapper.cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return PhantomRouteHints_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> PhantomRouteHints {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing PhantomRouteHints \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing PhantomRouteHints \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
