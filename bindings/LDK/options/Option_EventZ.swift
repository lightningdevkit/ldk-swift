public class Option_EventZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKCOption_EventZ?

	/* DEFAULT_CONSTRUCTOR_START */
    public init(value: Event?) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
				self.cOpaqueStruct = LDKCOption_EventZ()
				if let value = value {
					self.cOpaqueStruct!.tag = LDKCOption_EventZ_Some
					
					self.cOpaqueStruct!.some = value.cOpaqueStruct!
				} else {
					self.cOpaqueStruct!.tag = LDKCOption_EventZ_None
				}
			
        
        super.init(conflictAvoidingVariableName: 0)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCOption_EventZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKCOption_EventZ, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* OPTION_METHODS_START */

    public func getValue() -> Event? {
    	
			
				if self.cOpaqueStruct!.tag == LDKCOption_EventZ_None {
						return nil
				}
				if self.cOpaqueStruct!.tag == LDKCOption_EventZ_Some {
					return Event(pointer: self.cOpaqueStruct!.some)
				}
				assert(false, "invalid option enum value")
				return nil
			
        
    }

    public class func some(o: Event) -> Option_EventZ {
    	
        return Option_EventZ(pointer: COption_EventZ_some(o.danglingClone().cOpaqueStruct!));
    }

    public class func none() -> Option_EventZ {
    	
        return Option_EventZ(pointer: COption_EventZ_none());
    }

    internal func free() -> Void {
    	
        return COption_EventZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Option_EventZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Option_EventZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Option_EventZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Option_EventZ {
    	
        return Option_EventZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCOption_EventZ>) in
COption_EventZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Option_EventZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* OPTION_METHODS_END */

	/* TYPE_CLASSES */
}
