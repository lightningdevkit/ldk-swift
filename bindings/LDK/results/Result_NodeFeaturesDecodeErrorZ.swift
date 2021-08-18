public class Result_NodeFeaturesDecodeErrorZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_NodeFeaturesDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
        			self.cOpaqueStruct = LDKCResult_NodeFeaturesDecodeErrorZ(contents: LDKCResult_NodeFeaturesDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_NodeFeaturesDecodeErrorZ){
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
			
			public func getValue() -> NodeFeatures? {
				if self.cOpaqueStruct?.result_ok == true {
					return NodeFeatures(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: NodeFeatures) -> Result_NodeFeaturesDecodeErrorZ {
    	
        return Result_NodeFeaturesDecodeErrorZ(pointer: CResult_NodeFeaturesDecodeErrorZ_ok(o.clone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_NodeFeaturesDecodeErrorZ {
    	
        return Result_NodeFeaturesDecodeErrorZ(pointer: CResult_NodeFeaturesDecodeErrorZ_err(e.clone().cOpaqueStruct!));
    }

    public func free() -> Void {
    	
        return CResult_NodeFeaturesDecodeErrorZ_free(self.cOpaqueStruct!);
    }

    /* RESULT_METHODS_END */

}
