public class HTLCUpdate {

    public internal(set) var cOpaqueStruct: LDKHTLCUpdate?;

	

    public init(pointer: LDKHTLCUpdate){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func clone(orig: HTLCUpdate) -> HTLCUpdate {
    	
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKHTLCUpdate>) in
HTLCUpdate(pointer: HTLCUpdate_clone(origPointer))
};
    }

    public func write(obj: HTLCUpdate) -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: obj.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKHTLCUpdate>) in
HTLCUpdate_write(objPointer)
});
    }

    public func read(ser: [UInt8]) -> Result_HTLCUpdateDecodeErrorZ {
    	
        return Result_HTLCUpdateDecodeErrorZ(pointer: HTLCUpdate_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		HTLCUpdate_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}
