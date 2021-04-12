class DataLossProtect {

    var cOpaqueStruct: LDKDataLossProtect?;

    init(your_last_per_commitment_secret_arg: [U], my_current_per_commitment_point_arg: [U]) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = DataLossProtect_new(your_last_per_commitment_secret_arg, my_current_per_commitment_point_arg)
    }

    private init(pointer: LDKDataLossProtect){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_your_last_per_commitment_secret() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKDataLossProtect>) in
							
			pointer
						
		}
					
        return DataLossProtect_get_your_last_per_commitment_secret(this_ptrPointer);
    }

    func set_your_last_per_commitment_secret(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKDataLossProtect>) in
							
			pointer
						
		}
					
        return DataLossProtect_set_your_last_per_commitment_secret(this_ptrPointer, val);
    }

    func get_my_current_per_commitment_point() -> [U] {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKDataLossProtect>) in
							
			pointer
						
		}
					
        return DataLossProtect_get_my_current_per_commitment_point(this_ptrPointer);
    }

    func set_my_current_per_commitment_point(val: [U]) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKDataLossProtect>) in
							
			pointer
						
		}
					
        return DataLossProtect_set_my_current_per_commitment_point(this_ptrPointer, val);
    }

    func clone(orig: DataLossProtect) -> DataLossProtect {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKDataLossProtect>) in
							
			pointer
						
		}
					
        return DataLossProtect(pointer: DataLossProtect_clone(origPointer));
    }

				
	deinit {
					
					
		DataLossProtect_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}
