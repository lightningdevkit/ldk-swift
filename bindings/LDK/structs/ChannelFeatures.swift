class ChannelFeatures {

    var cOpaqueStruct: LDKChannelFeatures?;

    init(: Void) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = ChannelFeatures_known()
    }

    private init(pointer: LDKChannelFeatures){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func clone(orig: ChannelFeatures) -> ChannelFeatures {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelFeatures>) in
							
			pointer
						
		}
					
        return ChannelFeatures(pointer: ChannelFeatures_clone(origPointer));
    }

    func write(obj: ChannelFeatures) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelFeatures>) in
							
			pointer
						
		}
					
        return ChannelFeatures_write(objPointer);
    }

    func read(ser: [U]) -> Result_ChannelFeaturesDecodeErrorZ {
    	
        return ChannelFeatures_read(ser);
    }

				
	deinit {
					
					
		ChannelFeatures_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}
