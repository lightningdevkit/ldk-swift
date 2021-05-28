public class ChannelFeatures {

    public internal(set) var cOpaqueStruct: LDKChannelFeatures?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init() {
    	
        self.cOpaqueStruct = ChannelFeatures_known()
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKChannelFeatures){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func clone(orig: ChannelFeatures) -> ChannelFeatures {
    	
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKChannelFeatures>) in
ChannelFeatures(pointer: ChannelFeatures_clone(origPointer))
};
    }

    public func write(obj: ChannelFeatures) -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: obj.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKChannelFeatures>) in
ChannelFeatures_write(objPointer)
});
    }

    public func read(ser: [UInt8]) -> Result_ChannelFeaturesDecodeErrorZ {
    	
        return Result_ChannelFeaturesDecodeErrorZ(pointer: ChannelFeatures_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		ChannelFeatures_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}
