public class Option_AccessZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKCOption_AccessZ?

	/* DEFAULT_CONSTRUCTOR_START */
    public init(value: Access?) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
				self.cOpaqueStruct = LDKCOption_AccessZ()
				if let value = value {
					self.cOpaqueStruct!.tag = LDKCOption_AccessZ_Some
					
					self.cOpaqueStruct!.some = value.cOpaqueStruct!
				} else {
					self.cOpaqueStruct!.tag = LDKCOption_AccessZ_None
				}
			
        
        super.init(conflictAvoidingVariableName: 0)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCOption_AccessZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKCOption_AccessZ, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* OPTION_METHODS_START */

    public func getValue() -> Access? {
    	
			
				if self.cOpaqueStruct!.tag == LDKCOption_AccessZ_None {
						return nil
				}
				if self.cOpaqueStruct!.tag == LDKCOption_AccessZ_Some {
					return Access(pointer: self.cOpaqueStruct!.some)
				}
				assert(false, "invalid option enum value")
				return nil
			
        
    }

    public class func some(o: Access) -> Option_AccessZ {
    	
        return Option_AccessZ(pointer: COption_AccessZ_some(o.activate().cOpaqueStruct!));
    }

    public class func none() -> Option_AccessZ {
    	
        return Option_AccessZ(pointer: COption_AccessZ_none());
    }

    internal func free() -> Void {
    	
        return COption_AccessZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Option_AccessZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Option_AccessZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Option_AccessZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* OPTION_METHODS_END */

	/* TYPE_CLASSES */
}
