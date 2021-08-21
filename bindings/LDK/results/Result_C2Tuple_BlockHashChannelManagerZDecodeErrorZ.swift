public class Result_C2Tuple_BlockHashChannelManagerZDecodeErrorZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKCResult_C2Tuple_BlockHashChannelManagerZDecodeErrorZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_C2Tuple_BlockHashChannelManagerZDecodeErrorZ(contents: LDKCResult_C2Tuple_BlockHashChannelManagerZDecodeErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_C2Tuple_BlockHashChannelManagerZDecodeErrorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
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
			
			public func getValue() -> C2Tuple_BlockHashChannelManagerZ? {
				if self.cOpaqueStruct?.result_ok == true {
					return C2Tuple_BlockHashChannelManagerZ(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: C2Tuple_BlockHashChannelManagerZ) -> Result_C2Tuple_BlockHashChannelManagerZDecodeErrorZ {
    	
        return Result_C2Tuple_BlockHashChannelManagerZDecodeErrorZ(pointer: CResult_C2Tuple_BlockHashChannelManagerZDecodeErrorZ_ok(o.cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_C2Tuple_BlockHashChannelManagerZDecodeErrorZ {
    	
        return Result_C2Tuple_BlockHashChannelManagerZDecodeErrorZ(pointer: CResult_C2Tuple_BlockHashChannelManagerZDecodeErrorZ_err(e.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_C2Tuple_BlockHashChannelManagerZDecodeErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_C2Tuple_BlockHashChannelManagerZDecodeErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing Result_C2Tuple_BlockHashChannelManagerZDecodeErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing Result_C2Tuple_BlockHashChannelManagerZDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* RESULT_METHODS_END */

}
