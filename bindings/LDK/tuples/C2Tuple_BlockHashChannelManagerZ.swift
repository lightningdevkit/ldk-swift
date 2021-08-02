public class C2Tuple_BlockHashChannelManagerZ {

    public internal(set) var cOpaqueStruct: LDKC2Tuple_BlockHashChannelManagerZ?;

    public init(pointer: LDKC2Tuple_BlockHashChannelManagerZ){
		self.cOpaqueStruct = pointer
	}

    /* TUPLE_METHODS_START */

    public class func new(a: [UInt8], b: ChannelManager) -> C2Tuple_BlockHashChannelManagerZ {
    	
        return C2Tuple_BlockHashChannelManagerZ(pointer: C2Tuple_BlockHashChannelManagerZ_new(Bindings.new_LDKThirtyTwoBytes(array: a), b.cOpaqueStruct!));
    }

				
	deinit {
					
					if self.cOpaqueStruct?.b.is_owned == true {
						return
					}
				
					
					
		C2Tuple_BlockHashChannelManagerZ_free(self.cOpaqueStruct!)
				
	}
			
    /* TUPLE_METHODS_END */

}
