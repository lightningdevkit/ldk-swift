public class Option_WriteableScoreZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKCOption_WriteableScoreZ?

	/* DEFAULT_CONSTRUCTOR_START */
    public init(value: WriteableScore?) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
				self.cOpaqueStruct = LDKCOption_WriteableScoreZ()
				if let value = value {
					self.cOpaqueStruct!.tag = LDKCOption_WriteableScoreZ_Some
					
					self.cOpaqueStruct!.some = value.cOpaqueStruct!
				} else {
					self.cOpaqueStruct!.tag = LDKCOption_WriteableScoreZ_None
				}
			
        
        super.init(conflictAvoidingVariableName: 0)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCOption_WriteableScoreZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKCOption_WriteableScoreZ, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* OPTION_METHODS_START */

    public func getValue() -> WriteableScore? {
    	
			
				if self.cOpaqueStruct!.tag == LDKCOption_WriteableScoreZ_None {
						return nil
				}
				if self.cOpaqueStruct!.tag == LDKCOption_WriteableScoreZ_Some {
					return WriteableScore(pointer: self.cOpaqueStruct!.some)
				}
				assert(false, "invalid option enum value")
				return nil
			
        
    }

    public class func some(o: WriteableScore) -> Option_WriteableScoreZ {
    	
        return Option_WriteableScoreZ(pointer: COption_WriteableScoreZ_some(o.activate().cOpaqueStruct!));
    }

    public class func none() -> Option_WriteableScoreZ {
    	
        return Option_WriteableScoreZ(pointer: COption_WriteableScoreZ_none());
    }

    internal func free() -> Void {
    	
        return COption_WriteableScoreZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Option_WriteableScoreZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Option_WriteableScoreZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Option_WriteableScoreZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* OPTION_METHODS_END */

	/* TYPE_CLASSES */
}
