public class RawDataPart {

    var cOpaqueStruct: LDKRawDataPart?;

	

    public init(pointer: LDKRawDataPart){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_timestamp() -> PositiveTimestamp {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRawDataPart>) in
							
			pointer
						
		}
					
        return PositiveTimestamp(pointer: RawDataPart_get_timestamp(this_ptrPointer));
    }

    public func set_timestamp(val: PositiveTimestamp) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKRawDataPart>) in
							
			pointer
						
		}
					
        return RawDataPart_set_timestamp(this_ptrPointer, val.cOpaqueStruct!);
    }

    public func clone(orig: RawDataPart) -> RawDataPart {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKRawDataPart>) in
							
			pointer
						
		}
					
        return RawDataPart(pointer: RawDataPart_clone(origPointer));
    }

				
	deinit {
					
					
		RawDataPart_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}
