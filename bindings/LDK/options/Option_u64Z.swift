public class Option_u64Z {

    var cOpaqueStruct: LDKCOption_u64Z?;

	/* DEFAULT_CONSTRUCTOR_START */
    init(value: UInt64?) {
    	
				self.cOpaqueStruct = LDKCOption_u64Z()
				if let value = value {
					self.cOpaqueStruct!.tag = LDKCOption_u64Z_Some
					self.cOpaqueStruct!.some = value
				} else {
					self.cOpaqueStruct!.tag = LDKCOption_u64Z_None
				}
			
        
    }
    /* DEFAULT_CONSTRUCTOR_END */

    init(pointer: LDKCOption_u64Z){
		self.cOpaqueStruct = pointer
	}

    /* OPTION_METHODS_START */

    func getValue() -> UInt64? {
    	
			
				if self.cOpaqueStruct!.tag == LDKCOption_u64Z_None {
						return nil
				}
				if self.cOpaqueStruct!.tag == LDKCOption_u64Z_Some {
					return self.cOpaqueStruct!.some
				}
				assert(false, "invalid option enum value")
				return nil
			
        
    }

    /* OPTION_METHODS_END */

}
