public class Option_u32Z: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKCOption_u32Z?

	/* DEFAULT_CONSTRUCTOR_START */
    public init(value: UInt32?) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
				self.cOpaqueStruct = LDKCOption_u32Z()
				if let value = value {
					self.cOpaqueStruct!.tag = LDKCOption_u32Z_Some
					self.cOpaqueStruct!.some = value
				} else {
					self.cOpaqueStruct!.tag = LDKCOption_u32Z_None
				}
			
        
        super.init(conflictAvoidingVariableName: 0)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCOption_u32Z){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKCOption_u32Z, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
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

    public class func some(o: UInt32) -> Option_u32Z {
    	
        return Option_u32Z(pointer: COption_u32Z_some(o));
    }

    public class func none() -> Option_u32Z {
    	
        return Option_u32Z(pointer: COption_u32Z_none());
    }

    internal func free() -> Void {
    	
        return COption_u32Z_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Option_u32Z {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Option_u32Z \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Option_u32Z \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Option_u32Z {
    	
        return Option_u32Z(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCOption_u32Z>) in
COption_u32Z_clone(origPointer)
});
    }

					internal func danglingClone() -> Option_u32Z {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* OPTION_METHODS_END */

	/* TYPE_CLASSES */
}
