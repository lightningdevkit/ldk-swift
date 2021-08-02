public class NodeFeatures {

    public internal(set) var cOpaqueStruct: LDKNodeFeatures?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init() {
    	
        self.cOpaqueStruct = NodeFeatures_known()
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKNodeFeatures){
		self.cOpaqueStruct = pointer
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
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKNodeFeatures>) in
NodeFeatures(pointer: NodeFeatures_clone(origPointer))
};
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
    	
        return Result_NodeFeaturesDecodeErrorZ(pointer: NodeFeatures_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
					
		NodeFeatures_free(self.cOpaqueStruct!)
					
				
	}
			
    /* STRUCT_METHODS_END */

}
