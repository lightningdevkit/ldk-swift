#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class Option_HTLCDestinationZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKCOption_HTLCDestinationZ?

	/* DEFAULT_CONSTRUCTOR_START */
    public init(value: HTLCDestination?) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
				self.cOpaqueStruct = LDKCOption_HTLCDestinationZ()
				if let value = value {
					self.cOpaqueStruct!.tag = LDKCOption_HTLCDestinationZ_Some
					
					self.cOpaqueStruct!.some = value.cOpaqueStruct!
				} else {
					self.cOpaqueStruct!.tag = LDKCOption_HTLCDestinationZ_None
				}
			
        
        super.init(conflictAvoidingVariableName: 0)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCOption_HTLCDestinationZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKCOption_HTLCDestinationZ, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* OPTION_METHODS_START */

    public func getValue() -> HTLCDestination? {
    	
			
				if self.cOpaqueStruct!.tag == LDKCOption_HTLCDestinationZ_None {
						return nil
				}
				if self.cOpaqueStruct!.tag == LDKCOption_HTLCDestinationZ_Some {
					return HTLCDestination(pointer: self.cOpaqueStruct!.some)
				}
				assert(false, "invalid option enum value")
				return nil
			
        
    }

    public class func some(o: HTLCDestination) -> Option_HTLCDestinationZ {
    	
        return Option_HTLCDestinationZ(pointer: COption_HTLCDestinationZ_some(o.danglingClone().cOpaqueStruct!));
    }

    public class func none() -> Option_HTLCDestinationZ {
    	
        return Option_HTLCDestinationZ(pointer: COption_HTLCDestinationZ_none());
    }

    internal func free() -> Void {
    	
        return COption_HTLCDestinationZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Option_HTLCDestinationZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Option_HTLCDestinationZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Option_HTLCDestinationZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Option_HTLCDestinationZ {
    	
        return Option_HTLCDestinationZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCOption_HTLCDestinationZ>) in
COption_HTLCDestinationZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Option_HTLCDestinationZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* OPTION_METHODS_END */

	/* TYPE_CLASSES */
}
