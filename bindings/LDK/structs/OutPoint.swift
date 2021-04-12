class OutPoint {

    var cOpaqueStruct: LDKOutPoint?;

    init(txid_arg: [U], index_arg: U) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = OutPoint_new(txid_arg, index_arg)
    }

    private init(pointer: LDKOutPoint){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_txid() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOutPoint>) in
							
			pointer
						
		}
					
        return OutPoint_get_txid(this_ptrPointer);
    }

    func set_txid(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKOutPoint>) in
							
			pointer
						
		}
					
        return OutPoint_set_txid(this_ptrPointer, val);
    }

    func get_index() -> U {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOutPoint>) in
							
			pointer
						
		}
					
        return OutPoint_get_index(this_ptrPointer);
    }

    func set_index(val: U) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKOutPoint>) in
							
			pointer
						
		}
					
        return OutPoint_set_index(this_ptrPointer, val);
    }

    func clone(orig: OutPoint) -> OutPoint {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOutPoint>) in
							
			pointer
						
		}
					
        return OutPoint(pointer: OutPoint_clone(origPointer));
    }

    func to_channel_id(this_arg: OutPoint) -> [U] {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOutPoint>) in
							
			pointer
						
		}
					
        return OutPoint_to_channel_id(this_argPointer);
    }

    func write(obj: OutPoint) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKOutPoint>) in
							
			pointer
						
		}
					
        return OutPoint_write(objPointer);
    }

    func read(ser: [U]) -> Result_OutPointDecodeErrorZ {
    	
        return OutPoint_read(ser);
    }

				
	deinit {
					
					
		OutPoint_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}
