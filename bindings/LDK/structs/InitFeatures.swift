public class InitFeatures {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKInitFeatures?;


	/* DEFAULT_CONSTRUCTOR_START */
    public init() {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = InitFeatures_known()
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKInitFeatures){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public class func eq(a: InitFeatures, b: InitFeatures) -> Bool {
    	
        return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKInitFeatures>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKInitFeatures>) in
InitFeatures_eq(aPointer, bPointer)
}
};
    }

    public func clone() -> InitFeatures {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKInitFeatures>) in
InitFeatures(pointer: InitFeatures_clone(origPointer))
};
    }

    public func supports_payment_secret() -> Bool {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKInitFeatures>) in
InitFeatures_supports_payment_secret(this_argPointer)
};
    }

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKInitFeatures>) in
InitFeatures_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_InitFeaturesDecodeErrorZ {
    	
        return Result_InitFeaturesDecodeErrorZ(pointer: InitFeatures_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
					
		InitFeatures_free(self.cOpaqueStruct!)
					
				
	}
			
    /* STRUCT_METHODS_END */

}
