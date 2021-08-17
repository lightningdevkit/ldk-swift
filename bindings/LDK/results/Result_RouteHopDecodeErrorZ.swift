import LDKHeaders

public class Result_RouteHopDecodeErrorZ {

    public internal(set) var cOpaqueStruct: LDKCResult_RouteHopDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_RouteHopDecodeErrorZ(contents: LDKCResult_RouteHopDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_RouteHopDecodeErrorZ){
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
			
			public func getValue() -> RouteHop? {
				if self.cOpaqueStruct?.result_ok == true {
					return RouteHop(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: RouteHop) -> Result_RouteHopDecodeErrorZ {
    	
        return Result_RouteHopDecodeErrorZ(pointer: CResult_RouteHopDecodeErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_RouteHopDecodeErrorZ {
    	
        return Result_RouteHopDecodeErrorZ(pointer: CResult_RouteHopDecodeErrorZ_err(e.clone().cOpaqueStruct!));
    }

    public func free() -> Void {
    	
        return CResult_RouteHopDecodeErrorZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_RouteHopDecodeErrorZ {
    	
        return Result_RouteHopDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_RouteHopDecodeErrorZ>) in
CResult_RouteHopDecodeErrorZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}
