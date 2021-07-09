public class RawDataPart {

    var cOpaqueStruct: LDKRawDataPart?;

	

    public init(pointer: LDKRawDataPart){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_timestamp() -> PositiveTimestamp {
    	/* NATIVE_CALL_PREP */
        return PositiveTimestamp(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKRawDataPart>) in
RawDataPart_get_timestamp(this_ptrPointer)
});
    }

    public func set_timestamp(val: PositiveTimestamp) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKRawDataPart>) in
RawDataPart_set_timestamp(this_ptrPointer, val.cOpaqueStruct!)
};
    }

    public func clone(orig: RawDataPart) -> RawDataPart {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKRawDataPart>) in
RawDataPart(pointer: RawDataPart_clone(origPointer))
};
    }

				
	deinit {
					
					
		RawDataPart_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}
