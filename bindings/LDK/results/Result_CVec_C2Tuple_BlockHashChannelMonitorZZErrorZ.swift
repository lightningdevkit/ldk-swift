public class Result_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKCResult_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ?

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

	public init(pointer: LDKCResult_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
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
			
		public func getValue() throws -> [C2Tuple_BlockHashChannelMonitorZ] {
			if self.cOpaqueStruct?.result_ok == true {
				return Bindings.LDKCVec_C2Tuple_BlockHashChannelMonitorZZ_to_array(nativeType: self.cOpaqueStruct!.contents.result.pointee, deallocate: false)
						
						.map { (cOpaqueStruct) in
							C2Tuple_BlockHashChannelMonitorZ(pointer: cOpaqueStruct).dangle()
						}
					
			}
			throw Bindings.Error.ldkioError(self.cOpaqueStruct!.contents.err.pointee)
			// return nil
		}
		
    public class func ok(o: [C2Tuple_BlockHashChannelMonitorZ]) -> Result_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ {
    	
							let oUnwrapped = o.map { (oCurrentValue) in
							oCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
						let oWrapper = Bindings.new_LDKCVec_C2Tuple_BlockHashChannelMonitorZZWrapper(array: oUnwrapped)
						defer {
							oWrapper.noOpRetain()
						}
					
        return Result_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ(pointer: CResult_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ_ok(oWrapper.dangle().cOpaqueStruct!));
    }

    #warning("This method passes non-cloneable objects by owned value. Here be dragons.")
@available(*, deprecated, message: "This method passes non-cloneable objects by owned value. Here be dragons.")
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
							Bindings.print("Freeing Result_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ {
    	
        return Result_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ>) in
CResult_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_CVec_C2Tuple_BlockHashChannelMonitorZZErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}
