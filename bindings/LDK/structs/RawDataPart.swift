public class RawDataPart {

    public internal(set) var cOpaqueStruct: LDKRawDataPart?;

	

    public init(pointer: LDKRawDataPart){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_timestamp() -> PositiveTimestamp {
    	
        return PositiveTimestamp(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKRawDataPart>) in
RawDataPart_get_timestamp(this_ptrPointer)
});
    }

    public func set_timestamp(val: PositiveTimestamp) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKRawDataPart>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return RawDataPart_set_timestamp(this_ptrPointer, val.cOpaqueStruct!);
    }

    public func eq(a: RawDataPart, b: RawDataPart) -> Bool {
    	
        return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKRawDataPart>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKRawDataPart>) in
RawDataPart_eq(aPointer, bPointer)
}
};
    }

    public func clone(orig: RawDataPart) -> RawDataPart {
    	
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKRawDataPart>) in
RawDataPart(pointer: RawDataPart_clone(origPointer))
};
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		RawDataPart_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}
