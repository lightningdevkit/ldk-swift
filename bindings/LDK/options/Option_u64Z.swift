public class Option_u64Z {

    public internal(set) var cOpaqueStruct: LDKCOption_u64Z?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(value: UInt64?) {
    	
				self.cOpaqueStruct = LDKCOption_u64Z()
				if let value = value {
					self.cOpaqueStruct!.tag = LDKCOption_u64Z_Some
					self.cOpaqueStruct!.some = value
				} else {
					self.cOpaqueStruct!.tag = LDKCOption_u64Z_None
				}
			
        
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCOption_u64Z){
		self.cOpaqueStruct = pointer
	}

    /* OPTION_METHODS_START */

    public func getValue() -> UInt64? {
    	
			
				if self.cOpaqueStruct!.tag == LDKCOption_u64Z_None {
						return nil
				}
				if self.cOpaqueStruct!.tag == LDKCOption_u64Z_Some {
					return self.cOpaqueStruct!.some
				}
				assert(false, "invalid option enum value")
				return nil
			
        
    }

    public class func some(o: UInt64) -> Option_u64Z {
    	
        return Option_u64Z(pointer: COption_u64Z_some(o));
    }

    public class func none() -> Option_u64Z {
    	
        return Option_u64Z(pointer: COption_u64Z_none());
    }

    public func free() -> Void {
    	
        return COption_u64Z_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Option_u64Z {
    	
        return Option_u64Z(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCOption_u64Z>) in
COption_u64Z_clone(origPointer)
});
    }

    /* OPTION_METHODS_END */

	/* TYPE_CLASSES */
}
