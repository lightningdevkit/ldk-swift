public class ShutdownScript {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKShutdownScript?;


	/* DEFAULT_CONSTRUCTOR_START */
    public init(script_hash: [UInt8]) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = withUnsafePointer(to: Bindings.array_to_tuple32(array: script_hash)) { (script_hashPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in
ShutdownScript_new_p2wsh(script_hashPointer)
}
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKShutdownScript){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func clone() -> ShutdownScript {
    	
        return ShutdownScript(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKShutdownScript>) in
ShutdownScript_clone(origPointer)
});
    }

					internal func danglingClone() -> ShutdownScript {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKShutdownScript>) in
ShutdownScript_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_ShutdownScriptDecodeErrorZ {
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_ShutdownScriptDecodeErrorZ(pointer: ShutdownScript_read(serWrapper.cOpaqueStruct!));
    }

    public class func new_witness_program(version: UInt8, program: [UInt8]) -> Result_ShutdownScriptInvalidShutdownScriptZ {
    	
						let programWrapper = Bindings.new_LDKu8sliceWrapper(array: program)
						defer {
							programWrapper.noOpRetain()
						}
					
        return Result_ShutdownScriptInvalidShutdownScriptZ(pointer: ShutdownScript_new_witness_program(version, programWrapper.cOpaqueStruct!));
    }

    public func into_inner() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: ShutdownScript_into_inner(self.danglingClone().cOpaqueStruct!));
    }

    public func as_legacy_pubkey() -> [UInt8] {
    	
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKShutdownScript>) in
ShutdownScript_as_legacy_pubkey(this_argPointer)
});
    }

    public func is_compatible(features: InitFeatures) -> Bool {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKShutdownScript>) in
withUnsafePointer(to: features.cOpaqueStruct!) { (featuresPointer: UnsafePointer<LDKInitFeatures>) in
ShutdownScript_is_compatible(this_argPointer, featuresPointer)
}
};
    }

    internal func free() -> Void {
    	
        return ShutdownScript_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> ShutdownScript {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing ShutdownScript \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing ShutdownScript \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
