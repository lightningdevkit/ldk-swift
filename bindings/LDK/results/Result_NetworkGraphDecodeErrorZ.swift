public class Result_NetworkGraphDecodeErrorZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_NetworkGraphDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_NetworkGraphDecodeErrorZ(contents: LDKCResult_NetworkGraphDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_NetworkGraphDecodeErrorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
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
			
			public func getValue() -> NetworkGraph? {
				if self.cOpaqueStruct?.result_ok == true {
					return NetworkGraph(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: NetworkGraph) -> Result_NetworkGraphDecodeErrorZ {
    	
        return Result_NetworkGraphDecodeErrorZ(pointer: CResult_NetworkGraphDecodeErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_NetworkGraphDecodeErrorZ {
    	
        return Result_NetworkGraphDecodeErrorZ(pointer: CResult_NetworkGraphDecodeErrorZ_err(e.clone().cOpaqueStruct!));
    }

    public func free() -> Void {
    	
        return CResult_NetworkGraphDecodeErrorZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_NetworkGraphDecodeErrorZ {
    	
        return Result_NetworkGraphDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_NetworkGraphDecodeErrorZ>) in
CResult_NetworkGraphDecodeErrorZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}
