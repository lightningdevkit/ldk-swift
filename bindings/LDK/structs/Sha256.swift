public class Sha256 {

    public internal(set) var cOpaqueStruct: LDKSha256?;

	

    public init(pointer: LDKSha256){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func eq(a: Sha256, b: Sha256) -> Bool {
    	
        return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKSha256>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKSha256>) in
Sha256_eq(aPointer, bPointer)
}
};
    }

    public func clone() -> Sha256 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKSha256>) in
Sha256(pointer: Sha256_clone(origPointer))
};
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		Sha256_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}
