public class Result_RouteLightningErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_RouteLightningErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_RouteLightningErrorZ(contents: LDKCResult_RouteLightningErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_RouteLightningErrorZ){
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getError() -> LightningError? {
				if self.cOpaqueStruct?.result_ok == false {
					return LightningError(pointer: self.cOpaqueStruct!.contents.err.pointee)
				}
				return nil
			}
			
    /* RESULT_METHODS_END */

}
