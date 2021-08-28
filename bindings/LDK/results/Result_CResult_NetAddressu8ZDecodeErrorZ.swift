public class Result_CResult_NetAddressu8ZDecodeErrorZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKCResult_CResult_NetAddressu8ZDecodeErrorZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_CResult_NetAddressu8ZDecodeErrorZ(contents: LDKCResult_CResult_NetAddressu8ZDecodeErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_CResult_NetAddressu8ZDecodeErrorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKCResult_CResult_NetAddressu8ZDecodeErrorZ, anchor: NativeTypeWrapper){
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

			public func getError() -> DecodeError? {
				if self.cOpaqueStruct?.result_ok == false {
					return DecodeError(pointer: self.cOpaqueStruct!.contents.err.pointee, anchor: self)
				}
				return nil
			}
			
			public func getValue() -> Result_NetAddressu8Z? {
				if self.cOpaqueStruct?.result_ok == true {
					return Result_NetAddressu8Z(pointer: self.cOpaqueStruct!.contents.result.pointee, anchor: self)
				}
				return nil
			}
			
    public class func ok(o: Result_NetAddressu8Z) -> Result_CResult_NetAddressu8ZDecodeErrorZ {
    	
        return Result_CResult_NetAddressu8ZDecodeErrorZ(pointer: CResult_CResult_NetAddressu8ZDecodeErrorZ_ok(o.danglingClone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_CResult_NetAddressu8ZDecodeErrorZ {
    	
        return Result_CResult_NetAddressu8ZDecodeErrorZ(pointer: CResult_CResult_NetAddressu8ZDecodeErrorZ_err(e.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_CResult_NetAddressu8ZDecodeErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_CResult_NetAddressu8ZDecodeErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_CResult_NetAddressu8ZDecodeErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_CResult_NetAddressu8ZDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_CResult_NetAddressu8ZDecodeErrorZ {
    	
        return Result_CResult_NetAddressu8ZDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_CResult_NetAddressu8ZDecodeErrorZ>) in
CResult_CResult_NetAddressu8ZDecodeErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_CResult_NetAddressu8ZDecodeErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}
