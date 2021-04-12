class NodeFeatures {

    var cOpaqueStruct: LDKNodeFeatures?;

    init(: Void) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = NodeFeatures_known()
    }

    private init(pointer: LDKNodeFeatures){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func clone(orig: NodeFeatures) -> NodeFeatures {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKNodeFeatures>) in
							
			pointer
						
		}
					
        return NodeFeatures(pointer: NodeFeatures_clone(origPointer));
    }

    func write(obj: NodeFeatures) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKNodeFeatures>) in
							
			pointer
						
		}
					
        return NodeFeatures_write(objPointer);
    }

    func read(ser: [U]) -> Result_NodeFeaturesDecodeErrorZ {
    	
        return NodeFeatures_read(ser);
    }

				
	deinit {
					
					
		NodeFeatures_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}
