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

    public class func eq(a: ChannelFeatures, b: ChannelFeatures) -> Bool {
    	
        return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKChannelFeatures>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKChannelFeatures>) in
ChannelFeatures_eq(aPointer, bPointer)
}
};
    }

    public func clone() -> ChannelFeatures {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKChannelFeatures>) in
ChannelFeatures(pointer: ChannelFeatures_clone(origPointer))
};
    }

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKChannelFeatures>) in
ChannelFeatures_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_ChannelFeaturesDecodeErrorZ {
    	
        return Result_ChannelFeaturesDecodeErrorZ(pointer: ChannelFeatures_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		ChannelFeatures_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}
