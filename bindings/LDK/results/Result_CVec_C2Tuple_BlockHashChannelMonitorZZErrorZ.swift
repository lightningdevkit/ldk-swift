public class Result_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ(contents: LDKCResult_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getError() -> LDKIOError? {
				if self.cOpaqueStruct?.result_ok == false {
					return self.cOpaqueStruct!.contents.err.pointee
				}
				return nil
			}
			
			public func getValue() -> [LDKC2Tuple_BlockHashChannelMonitorZ]? {
				if self.cOpaqueStruct?.result_ok == true {
					return Bindings.LDKCVec_C2Tuple_BlockHashChannelMonitorZZ_to_array(nativeType: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: [LDKC2Tuple_BlockHashChannelMonitorZ]) -> Result_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ {
    	
        return Result_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ(pointer: CResult_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ_ok(Bindings.new_LDKCVec_C2Tuple_BlockHashChannelMonitorZZ(array: o)));
    }

    public class func err(e: LDKIOError) -> Result_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ {
    	
        return Result_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ(pointer: CResult_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ_err(e));
    }

    public func free() -> Void {
    	
        return CResult_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ_free(self.cOpaqueStruct!);
    }

    /* RESULT_METHODS_END */

}
