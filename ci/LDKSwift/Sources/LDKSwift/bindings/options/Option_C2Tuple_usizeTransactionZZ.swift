#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class Option_C2Tuple_usizeTransactionZZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKCOption_C2Tuple_usizeTransactionZZ?

	/* DEFAULT_CONSTRUCTOR_START */
    public init(value: C2Tuple_usizeTransactionZ?) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
				self.cOpaqueStruct = LDKCOption_C2Tuple_usizeTransactionZZ()
				if let value = value {
					self.cOpaqueStruct!.tag = LDKCOption_C2Tuple_usizeTransactionZZ_Some
					
					self.cOpaqueStruct!.some = value.cOpaqueStruct!
				} else {
					self.cOpaqueStruct!.tag = LDKCOption_C2Tuple_usizeTransactionZZ_None
				}
			
        
        super.init(conflictAvoidingVariableName: 0)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCOption_C2Tuple_usizeTransactionZZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKCOption_C2Tuple_usizeTransactionZZ, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* OPTION_METHODS_START */

    public func getValue() -> C2Tuple_usizeTransactionZ? {
    	
			
				if self.cOpaqueStruct!.tag == LDKCOption_C2Tuple_usizeTransactionZZ_None {
						return nil
				}
				if self.cOpaqueStruct!.tag == LDKCOption_C2Tuple_usizeTransactionZZ_Some {
					return C2Tuple_usizeTransactionZ(pointer: self.cOpaqueStruct!.some)
				}
				assert(false, "invalid option enum value")
				return nil
			
        
    }

    public class func some(o: C2Tuple_usizeTransactionZ) -> Option_C2Tuple_usizeTransactionZZ {
    	
        return Option_C2Tuple_usizeTransactionZZ(pointer: COption_C2Tuple_usizeTransactionZZ_some(o.danglingClone().cOpaqueStruct!));
    }

    public class func none() -> Option_C2Tuple_usizeTransactionZZ {
    	
        return Option_C2Tuple_usizeTransactionZZ(pointer: COption_C2Tuple_usizeTransactionZZ_none());
    }

    internal func free() -> Void {
    	
        return COption_C2Tuple_usizeTransactionZZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Option_C2Tuple_usizeTransactionZZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Option_C2Tuple_usizeTransactionZZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Option_C2Tuple_usizeTransactionZZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Option_C2Tuple_usizeTransactionZZ {
    	
        return Option_C2Tuple_usizeTransactionZZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCOption_C2Tuple_usizeTransactionZZ>) in
COption_C2Tuple_usizeTransactionZZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Option_C2Tuple_usizeTransactionZZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* OPTION_METHODS_END */

	/* TYPE_CLASSES */
}
