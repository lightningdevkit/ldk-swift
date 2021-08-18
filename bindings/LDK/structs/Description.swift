public class Description {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKDescription?;


	

    public init(pointer: LDKDescription){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public class func eq(a: Description, b: Description) -> Bool {
    	
        return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKDescription>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKDescription>) in
Description_eq(aPointer, bPointer)
}
};
    }

    public func clone() -> Description {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKDescription>) in
Description(pointer: Description_clone(origPointer))
};
    }

    public class func new(description: String) -> Result_DescriptionCreationErrorZ {
    	
        return Result_DescriptionCreationErrorZ(pointer: Description_new(Bindings.new_LDKStr(string: description)));
    }

    public func into_inner() -> String {
    	
        return Bindings.LDKStr_to_string(nativeType: Description_into_inner(self.clone().cOpaqueStruct!));
    }

				
	deinit {
					
					
					
		Description_free(self.cOpaqueStruct!)
					
				
	}
			
    /* STRUCT_METHODS_END */

}
