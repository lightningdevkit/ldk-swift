public class C2Tuple_BlockHashChannelMonitorZ {

    public internal(set) var cOpaqueStruct: LDKC2Tuple_BlockHashChannelMonitorZ?;

    public init(pointer: LDKC2Tuple_BlockHashChannelMonitorZ){
		self.cOpaqueStruct = pointer
	}

    /* TUPLE_METHODS_START */

    public func new(a: [UInt8], b: ChannelMonitor) -> C2Tuple_BlockHashChannelMonitorZ {
    	
        return C2Tuple_BlockHashChannelMonitorZ(pointer: C2Tuple_BlockHashChannelMonitorZ_new(Bindings.new_LDKThirtyTwoBytes(array: a), b.cOpaqueStruct!));
    }

				
	deinit {
					
					
		C2Tuple_BlockHashChannelMonitorZ_free(self.cOpaqueStruct!)
				
	}
			
    /* TUPLE_METHODS_END */

}
