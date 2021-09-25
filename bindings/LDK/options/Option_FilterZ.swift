public class Option_FilterZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKCOption_FilterZ?

	/* DEFAULT_CONSTRUCTOR_START */
    public init(value: Filter?) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
				self.cOpaqueStruct = LDKCOption_FilterZ()
				if let value = value {
					self.cOpaqueStruct!.tag = LDKCOption_FilterZ_Some
					self.cOpaqueStruct!.some = value.cOpaqueStruct!
				} else {
					self.cOpaqueStruct!.tag = LDKCOption_FilterZ_None
				}
			
        
        super.init(conflictAvoidingVariableName: 0)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCOption_FilterZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKCOption_FilterZ, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* OPTION_METHODS_START */

    public func getValue() -> Filter? {
    	
			
				if self.cOpaqueStruct!.tag == LDKCOption_FilterZ_None {
						return nil
				}
				if self.cOpaqueStruct!.tag == LDKCOption_FilterZ_Some {
					return Filter(pointer: self.cOpaqueStruct!.some)
				}
				assert(false, "invalid option enum value")
				return nil
			
        
    }

    public class func some(o: Filter) -> Option_FilterZ {
    	
        return Option_FilterZ(pointer: COption_FilterZ_some(o.cOpaqueStruct!));
    }

    public class func none() -> Option_FilterZ {
    	
        return Option_FilterZ(pointer: COption_FilterZ_none());
    }

    internal func free() -> Void {
    	
        return COption_FilterZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Option_FilterZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Option_FilterZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Option_FilterZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* OPTION_METHODS_END */

	/* TYPE_CLASSES */
}
