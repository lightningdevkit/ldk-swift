class PeerHandleError {

    var cOpaqueStruct: LDKPeerHandleError?;

    init(no_connection_possible_arg: boolean) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = PeerHandleError_new(no_connection_possible_arg)
    }

    private init(pointer: LDKPeerHandleError){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_no_connection_possible() -> boolean {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKPeerHandleError>) in
							
			pointer
						
		}
					
        return PeerHandleError_get_no_connection_possible(this_ptrPointer);
    }

    func set_no_connection_possible(val: boolean) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKPeerHandleError>) in
							
			pointer
						
		}
					
        return PeerHandleError_set_no_connection_possible(this_ptrPointer, val);
    }

    func clone(orig: PeerHandleError) -> PeerHandleError {
    	
						
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
