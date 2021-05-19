public class C2Tuple_OutPointScriptZ {

    var cOpaqueStruct: LDKC2Tuple_OutPointScriptZ?;

    public init(pointer: LDKC2Tuple_OutPointScriptZ){
		self.cOpaqueStruct = pointer
	}

    /* TUPLE_METHODS_START */

    public func clone(orig: C2Tuple_OutPointScriptZ) -> C2Tuple_OutPointScriptZ {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKC2Tuple_OutPointScriptZ>) in
							
			pointer
						
		}
					
        return C2Tuple_OutPointScriptZ(pointer: C2Tuple_OutPointScriptZ_clone(origPointer));
    }

    public func new(a: OutPoint, b: [UInt8]) -> C2Tuple_OutPointScriptZ {
    	
        return C2Tuple_OutPointScriptZ(pointer: C2Tuple_OutPointScriptZ_new(a.cOpaqueStruct!, Bindings.new_LDKCVec_u8Z(array: b)));
    }

				
	deinit {
					
					
		C2Tuple_OutPointScriptZ_free(self.cOpaqueStruct!)
				
	}
			
    /* TUPLE_METHODS_END */

}
