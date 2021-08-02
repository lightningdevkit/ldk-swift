public class Result_RoutingFeesDecodeErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_RoutingFeesDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_RoutingFeesDecodeErrorZ(contents: LDKCResult_RoutingFeesDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_RoutingFeesDecodeErrorZ){
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getError() -> DecodeError? {
				if self.cOpaqueStruct?.result_ok == false {
					return DecodeError(pointer: self.cOpaqueStruct!.contents.err.pointee)
				}
				return nil
			}
			
			public func getValue() -> RoutingFees? {
				if self.cOpaqueStruct?.result_ok == true {
					return RoutingFees(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: RoutingFees) -> Result_RoutingFeesDecodeErrorZ {
    	
        return Result_RoutingFeesDecodeErrorZ(pointer: CResult_RoutingFeesDecodeErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_RoutingFeesDecodeErrorZ {
    	
        return Result_RoutingFeesDecodeErrorZ(pointer: CResult_RoutingFeesDecodeErrorZ_err(e.clone().cOpaqueStruct!));
    }

    public func free() -> Void {
    	
        return CResult_RoutingFeesDecodeErrorZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_RoutingFeesDecodeErrorZ {
    	
        return Result_RoutingFeesDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_RoutingFeesDecodeErrorZ>) in
CResult_RoutingFeesDecodeErrorZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}
