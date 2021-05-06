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
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKPeerHandleError>) in
							
			pointer
						
		}
					
        return PeerHandleError_get_no_connection_possible(this_ptrPointer);
    }

    public func set_no_connection_possible(val: Bool) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKPeerHandleError>) in
							
			pointer
						
		}
					
        return PeerHandleError_set_no_connection_possible(this_ptrPointer, val);
    }

    public func clone(orig: PeerHandleError) -> PeerHandleError {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKPeerHandleError>) in
							
			pointer
						
		}
					
        return PeerHandleError(pointer: PeerHandleError_clone(origPointer));
    }

				
	deinit {
					
					
		PeerHandleError_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}
