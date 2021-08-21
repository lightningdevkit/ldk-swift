public class Result_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKCResult_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ(contents: LDKCResult_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
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
    	
						let oWrapper = Bindings.new_LDKCVec_C2Tuple_BlockHashChannelMonitorZZWrapper(array: o)
						defer {
							oWrapper.noOpRetain()
						}
					
        return Result_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ(pointer: CResult_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ_ok(oWrapper.dangle().cOpaqueStruct!));
    }

    public class func err(e: LDKIOError) -> Result_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ {
    	
        return Result_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ(pointer: CResult_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ_err(e));
    }

    internal func free() -> Void {
    	
        return CResult_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing Result_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing Result_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* RESULT_METHODS_END */

}
