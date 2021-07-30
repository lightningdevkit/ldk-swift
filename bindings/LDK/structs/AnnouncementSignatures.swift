public class AnnouncementSignatures {

    public internal(set) var cOpaqueStruct: LDKAnnouncementSignatures?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(channel_id_arg: [UInt8], short_channel_id_arg: UInt64, node_signature_arg: [UInt8], bitcoin_signature_arg: [UInt8]) {
    	
        self.cOpaqueStruct = AnnouncementSignatures_new(Bindings.new_LDKThirtyTwoBytes(array: channel_id_arg), short_channel_id_arg, Bindings.new_LDKSignature(array: node_signature_arg), Bindings.new_LDKSignature(array: bitcoin_signature_arg))
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKAnnouncementSignatures){
		self.cOpaqueStruct = pointer
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
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKAnnouncementSignatures>) in
AnnouncementSignatures(pointer: AnnouncementSignatures_clone(origPointer))
};
    }

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKAnnouncementSignatures>) in
AnnouncementSignatures_write(objPointer)
});
    }

    public func read(ser: [UInt8]) -> Result_AnnouncementSignaturesDecodeErrorZ {
    	
        return Result_AnnouncementSignaturesDecodeErrorZ(pointer: AnnouncementSignatures_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		AnnouncementSignatures_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}
