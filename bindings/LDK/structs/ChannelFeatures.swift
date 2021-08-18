public class ChannelFeatures {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKChannelFeatures?;


	/* DEFAULT_CONSTRUCTOR_START */
    public init() {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = ChannelFeatures_known()
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKChannelFeatures){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
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
        				var dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKChannelFeatures>) in
ChannelFeatures_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_ChannelFeaturesDecodeErrorZ {
    	
        return Result_ChannelFeaturesDecodeErrorZ(pointer: ChannelFeatures_read(Bindings.new_LDKu8slice(array: ser)));
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
							self.free()
						}
					}
				

    /* STRUCT_METHODS_END */

}
