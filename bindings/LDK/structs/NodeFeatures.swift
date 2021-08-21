import LDKHeaders

public class NodeFeatures: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKNodeFeatures?


	/* DEFAULT_CONSTRUCTOR_START */
    public init() {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = NodeFeatures_known()
        super.init(conflictAvoidingVariableName: 0)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKNodeFeatures){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

    /* STRUCT_METHODS_START */

    public class func eq(a: NodeFeatures, b: NodeFeatures) -> Bool {
    	
        return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKNodeFeatures>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKNodeFeatures>) in
NodeFeatures_eq(aPointer, bPointer)
}
};
    }

    public func clone() -> NodeFeatures {
    	
        return NodeFeatures(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKNodeFeatures>) in
NodeFeatures_clone(origPointer)
});
    }

					internal func danglingClone() -> NodeFeatures {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func supports_payment_secret() -> Bool {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKNodeFeatures>) in
NodeFeatures_supports_payment_secret(this_argPointer)
};
    }

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKNodeFeatures>) in
NodeFeatures_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_NodeFeaturesDecodeErrorZ {
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_NodeFeaturesDecodeErrorZ(pointer: NodeFeatures_read(serWrapper.cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return NodeFeatures_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> NodeFeatures {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing NodeFeatures \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing NodeFeatures \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
