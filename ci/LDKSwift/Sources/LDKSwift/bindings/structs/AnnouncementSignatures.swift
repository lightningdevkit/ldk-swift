#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class AnnouncementSignatures: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKAnnouncementSignatures?


	/* DEFAULT_CONSTRUCTOR_START */
    public init(channel_id_arg: [UInt8], short_channel_id_arg: UInt64, node_signature_arg: [UInt8], bitcoin_signature_arg: [UInt8]) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = AnnouncementSignatures_new(Bindings.new_LDKThirtyTwoBytes(array: channel_id_arg), short_channel_id_arg, Bindings.new_LDKSignature(array: node_signature_arg), Bindings.new_LDKSignature(array: bitcoin_signature_arg))
        super.init(conflictAvoidingVariableName: 0)
        
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKAnnouncementSignatures){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKAnnouncementSignatures, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func get_channel_id() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKAnnouncementSignatures>) in
AnnouncementSignatures_get_channel_id(this_ptrPointer)
}.pointee);
    }

    public func set_channel_id(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKAnnouncementSignatures>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return AnnouncementSignatures_set_channel_id(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func get_short_channel_id() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKAnnouncementSignatures>) in
AnnouncementSignatures_get_short_channel_id(this_ptrPointer)
};
    }

    public func set_short_channel_id(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKAnnouncementSignatures>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return AnnouncementSignatures_set_short_channel_id(this_ptrPointer, val);
    }

    public func get_node_signature() -> [UInt8] {
    	
        return Bindings.LDKSignature_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKAnnouncementSignatures>) in
AnnouncementSignatures_get_node_signature(this_ptrPointer)
});
    }

    public func set_node_signature(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKAnnouncementSignatures>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return AnnouncementSignatures_set_node_signature(this_ptrPointer, Bindings.new_LDKSignature(array: val));
    }

    public func get_bitcoin_signature() -> [UInt8] {
    	
        return Bindings.LDKSignature_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKAnnouncementSignatures>) in
AnnouncementSignatures_get_bitcoin_signature(this_ptrPointer)
});
    }

    public func set_bitcoin_signature(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKAnnouncementSignatures>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return AnnouncementSignatures_set_bitcoin_signature(this_ptrPointer, Bindings.new_LDKSignature(array: val));
    }

    public func clone() -> AnnouncementSignatures {
    	
        return AnnouncementSignatures(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKAnnouncementSignatures>) in
AnnouncementSignatures_clone(origPointer)
});
    }

					internal func danglingClone() -> AnnouncementSignatures {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKAnnouncementSignatures>) in
AnnouncementSignatures_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_AnnouncementSignaturesDecodeErrorZ {
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_AnnouncementSignaturesDecodeErrorZ(pointer: AnnouncementSignatures_read(serWrapper.cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return AnnouncementSignatures_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> AnnouncementSignatures {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing AnnouncementSignatures \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing AnnouncementSignatures \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
