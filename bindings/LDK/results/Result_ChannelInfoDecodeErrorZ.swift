public class Result_ChannelInfoDecodeErrorZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_ChannelInfoDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_ChannelInfoDecodeErrorZ(contents: LDKCResult_ChannelInfoDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_ChannelInfoDecodeErrorZ){
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
			
			public func getValue() -> ChannelInfo? {
				if self.cOpaqueStruct?.result_ok == true {
					return ChannelInfo(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: ChannelInfo) -> Result_ChannelInfoDecodeErrorZ {
    	
        return Result_ChannelInfoDecodeErrorZ(pointer: CResult_ChannelInfoDecodeErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_ChannelInfoDecodeErrorZ {
    	
        return Result_ChannelInfoDecodeErrorZ(pointer: CResult_ChannelInfoDecodeErrorZ_err(e.clone().cOpaqueStruct!));
    }

    public func free() -> Void {
    	
        return CResult_ChannelInfoDecodeErrorZ_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Result_ChannelInfoDecodeErrorZ {
    	
        return Result_ChannelInfoDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_ChannelInfoDecodeErrorZ>) in
CResult_ChannelInfoDecodeErrorZ_clone(origPointer)
});
    }

    /* RESULT_METHODS_END */

}
