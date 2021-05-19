public class Option_u32Z {

    var cOpaqueStruct: LDKCOption_u32Z?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(value: UInt32?) {
    	
				self.cOpaqueStruct = LDKCOption_u32Z()
				if let value = value {
					self.cOpaqueStruct!.tag = LDKCOption_u32Z_Some
					self.cOpaqueStruct!.some = value
				} else {
					self.cOpaqueStruct!.tag = LDKCOption_u32Z_None
				}
			
        
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCOption_u32Z){
		self.cOpaqueStruct = pointer
	}

    /* OPTION_METHODS_START */

    public func getValue() -> UInt32? {
    	
			
				if self.cOpaqueStruct!.tag == LDKCOption_u32Z_None {
						return nil
				}
				if self.cOpaqueStruct!.tag == LDKCOption_u32Z_Some {
					return self.cOpaqueStruct!.some
				}
				assert(false, "invalid option enum value")
				return nil
			
        
    }

    /* OPTION_METHODS_END */

}
