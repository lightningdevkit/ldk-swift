public class InitFeatures {

    public internal(set) var cOpaqueStruct: LDKInitFeatures?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init() {
    	
        self.cOpaqueStruct = InitFeatures_known()
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKInitFeatures){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func clone(orig: InitFeatures) -> InitFeatures {
    	
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKInitFeatures>) in
InitFeatures(pointer: InitFeatures_clone(origPointer))
};
    }

    public func write(obj: InitFeatures) -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: obj.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKInitFeatures>) in
InitFeatures_write(objPointer)
});
    }

    public func read(ser: [UInt8]) -> Result_InitFeaturesDecodeErrorZ {
    	
        return Result_InitFeaturesDecodeErrorZ(pointer: InitFeatures_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		InitFeatures_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}
