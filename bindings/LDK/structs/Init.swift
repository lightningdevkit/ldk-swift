public class Init {

    var cOpaqueStruct: LDKInit?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(features_arg: InitFeatures) {
    	
        self.cOpaqueStruct = Init_new(features_arg.cOpaqueStruct!)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKInit){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_features() -> InitFeatures {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInit>) in
							
			pointer
						
		}
					
        return InitFeatures(pointer: Init_get_features(this_ptrPointer));
    }

    public func set_features(val: InitFeatures) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKInit>) in
							
			pointer
						
		}
					
        return Init_set_features(this_ptrPointer, val.cOpaqueStruct!);
    }

    public func clone(orig: Init) -> Init {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInit>) in
							
			pointer
						
		}
					
        return Init(pointer: Init_clone(origPointer));
    }

    public func write(obj: Init) -> [UInt8] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKInit>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_u8Z_to_array(nativeType: Init_write(objPointer));
    }

    public func read(ser: [UInt8]) -> Result_InitDecodeErrorZ {
    	
        return Result_InitDecodeErrorZ(pointer: Init_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
		Init_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}
