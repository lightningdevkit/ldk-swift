public class Result_CVec_CVec_u8ZZNoneZ {

    public internal(set) var cOpaqueStruct: LDKCResult_CVec_CVec_u8ZZNoneZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_CVec_CVec_u8ZZNoneZ(contents: LDKCResult_CVec_CVec_u8ZZNoneZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_CVec_CVec_u8ZZNoneZ){
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getValue() -> [[UInt8]]? {
				if self.cOpaqueStruct?.result_ok == true {
					return Bindings.LDKCVec_CVec_u8ZZ_to_array(nativeType: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    /* RESULT_METHODS_END */

}
