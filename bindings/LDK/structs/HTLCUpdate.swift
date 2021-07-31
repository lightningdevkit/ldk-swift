public class HTLCUpdate {

    public internal(set) var cOpaqueStruct: LDKHTLCUpdate?;

	

    public init(pointer: LDKHTLCUpdate){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func clone() -> HTLCUpdate {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKHTLCUpdate>) in
HTLCUpdate(pointer: HTLCUpdate_clone(origPointer))
};
    }

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKHTLCUpdate>) in
HTLCUpdate_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_HTLCUpdateDecodeErrorZ {
    	
        return Result_HTLCUpdateDecodeErrorZ(pointer: HTLCUpdate_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		HTLCUpdate_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}
