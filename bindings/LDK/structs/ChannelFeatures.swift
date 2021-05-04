class ChannelFeatures {

    var cOpaqueStruct: LDKChannelFeatures?;

	/* DEFAULT_CONSTRUCTOR_START */
    init() {
    	
        self.cOpaqueStruct = ChannelFeatures_known()
    }
    /* DEFAULT_CONSTRUCTOR_END */

    init(pointer: LDKChannelFeatures){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func clone(orig: ChannelFeatures) -> ChannelFeatures {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelFeatures>) in
							
			pointer
						
		}
					
        return ChannelFeatures(pointer: ChannelFeatures_clone(origPointer));
    }

    func write(obj: ChannelFeatures) -> [UInt8] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelFeatures>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_u8Z_to_array(nativeType: ChannelFeatures_write(objPointer));
    }

    func read(ser: [UInt8]) -> Result_ChannelFeaturesDecodeErrorZ {
    	
        return Result_ChannelFeaturesDecodeErrorZ(pointer: ChannelFeatures_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		ChannelFeatures_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}
