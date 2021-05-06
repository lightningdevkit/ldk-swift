public class PeerHandleError {

    var cOpaqueStruct: LDKPeerHandleError?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(no_connection_possible_arg: Bool) {
    	
        self.cOpaqueStruct = PeerHandleError_new(no_connection_possible_arg)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKPeerHandleError){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_no_connection_possible() -> Bool {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKPeerHandleError>) in
PeerHandleError_get_no_connection_possible(this_ptrPointer)
};
    }

    public func set_no_connection_possible(val: Bool) -> Void {
    	/* NATIVE_CALL_PREP */
        return withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (this_ptrPointer: UnsafeMutablePointer<LDKPeerHandleError>) in
PeerHandleError_set_no_connection_possible(this_ptrPointer, val)
};
    }

    public func clone(orig: PeerHandleError) -> PeerHandleError {
    	/* NATIVE_CALL_PREP */
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKPeerHandleError>) in
PeerHandleError(pointer: PeerHandleError_clone(origPointer))
};
    }

				
	deinit {
					
					
		PeerHandleError_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}
