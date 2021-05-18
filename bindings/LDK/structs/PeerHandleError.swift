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
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKPeerHandleError>) in
PeerHandleError_get_no_connection_possible(this_ptrPointer)
};
    }

    public func set_no_connection_possible(val: Bool) -> Void {
    	
						let this_ptrPointer = UnsafeMutablePointer<LDKPeerHandleError>.allocate(capacity: 1)
						this_ptrPointer.initialize(to: self.cOpaqueStruct!)
					
        return PeerHandleError_set_no_connection_possible(this_ptrPointer, val);
    }

    public func clone(orig: PeerHandleError) -> PeerHandleError {
    	
        return withUnsafePointer(to: orig.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKPeerHandleError>) in
PeerHandleError(pointer: PeerHandleError_clone(origPointer))
};
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		PeerHandleError_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}
