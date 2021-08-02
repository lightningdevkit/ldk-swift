public class Option_u16Z {

    public internal(set) var cOpaqueStruct: LDKCOption_u16Z?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(value: UInt16?) {
    	
				self.cOpaqueStruct = LDKCOption_u16Z()
				if let value = value {
					self.cOpaqueStruct!.tag = LDKCOption_u16Z_Some
					self.cOpaqueStruct!.some = value
				} else {
					self.cOpaqueStruct!.tag = LDKCOption_u16Z_None
				}
			
        
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCOption_u16Z){
		self.cOpaqueStruct = pointer
	}

    /* OPTION_METHODS_START */

    public func getValue() -> UInt16? {
    	
			
				if self.cOpaqueStruct!.tag == LDKCOption_u16Z_None {
						return nil
				}
				if self.cOpaqueStruct!.tag == LDKCOption_u16Z_Some {
					return self.cOpaqueStruct!.some
				}
				assert(false, "invalid option enum value")
				return nil
			
        
    }

    public class func some(o: UInt16) -> Option_u16Z {
    	
        return Option_u16Z(pointer: COption_u16Z_some(o));
    }

    public class func none() -> Option_u16Z {
    	
        return Option_u16Z(pointer: COption_u16Z_none());
    }

    public func free() -> Void {
    	
        return COption_u16Z_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Option_u16Z {
    	
        return Option_u16Z(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCOption_u16Z>) in
COption_u16Z_clone(origPointer)
});
    }

    /* OPTION_METHODS_END */

	/* TYPE_CLASSES */
}
