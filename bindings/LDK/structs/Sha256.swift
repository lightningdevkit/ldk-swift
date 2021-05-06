public class Sha256 {

    var cOpaqueStruct: LDKSha256?;

	

    public init(pointer: LDKSha256){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func clone(orig: Sha256) -> Sha256 {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKSha256>) in
							
			pointer
						
		}
					
        return Sha256(pointer: Sha256_clone(origPointer));
    }

				
	deinit {
					
					
		Sha256_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}
