public class ChannelFeatures: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKChannelFeatures?


	/* DEFAULT_CONSTRUCTOR_START */
    public init() {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = ChannelFeatures_known()
        super.init(conflictAvoidingVariableName: 0)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKChannelFeatures){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

    /* STRUCT_METHODS_START */

    public class func eq(a: ChannelFeatures, b: ChannelFeatures) -> Bool {
    	
        return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKChannelFeatures>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKChannelFeatures>) in
ChannelFeatures_eq(aPointer, bPointer)
}
};
    }

    public func clone() -> ChannelFeatures {
    	
        return ChannelFeatures(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKChannelFeatures>) in
ChannelFeatures_clone(origPointer)
});
    }

					internal func danglingClone() -> ChannelFeatures {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKChannelFeatures>) in
ChannelFeatures_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_ChannelFeaturesDecodeErrorZ {
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_ChannelFeaturesDecodeErrorZ(pointer: ChannelFeatures_read(serWrapper.cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return ChannelFeatures_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> ChannelFeatures {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing ChannelFeatures \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing ChannelFeatures \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
