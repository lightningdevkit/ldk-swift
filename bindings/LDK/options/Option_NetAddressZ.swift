#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class Option_NetAddressZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKCOption_NetAddressZ?

	/* DEFAULT_CONSTRUCTOR_START */
    public init(value: NetAddress?) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
				self.cOpaqueStruct = LDKCOption_NetAddressZ()
				if let value = value {
					self.cOpaqueStruct!.tag = LDKCOption_NetAddressZ_Some
					
					self.cOpaqueStruct!.some = value.cOpaqueStruct!
				} else {
					self.cOpaqueStruct!.tag = LDKCOption_NetAddressZ_None
				}
			
        
        super.init(conflictAvoidingVariableName: 0)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCOption_NetAddressZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKCOption_NetAddressZ, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* OPTION_METHODS_START */

    public func getValue() -> NetAddress? {
    	
			
				if self.cOpaqueStruct!.tag == LDKCOption_NetAddressZ_None {
						return nil
				}
				if self.cOpaqueStruct!.tag == LDKCOption_NetAddressZ_Some {
					return NetAddress(pointer: self.cOpaqueStruct!.some)
				}
				assert(false, "invalid option enum value")
				return nil
			
        
    }

    public class func some(o: NetAddress) -> Option_NetAddressZ {
    	
        return Option_NetAddressZ(pointer: COption_NetAddressZ_some(o.danglingClone().cOpaqueStruct!));
    }

    public class func none() -> Option_NetAddressZ {
    	
        return Option_NetAddressZ(pointer: COption_NetAddressZ_none());
    }

    internal func free() -> Void {
    	
        return COption_NetAddressZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Option_NetAddressZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Option_NetAddressZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Option_NetAddressZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Option_NetAddressZ {
    	
        return Option_NetAddressZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCOption_NetAddressZ>) in
COption_NetAddressZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Option_NetAddressZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* OPTION_METHODS_END */

	/* TYPE_CLASSES */
}
