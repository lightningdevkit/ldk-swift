public class Result_UpdateFulfillHTLCDecodeErrorZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKCResult_UpdateFulfillHTLCDecodeErrorZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_UpdateFulfillHTLCDecodeErrorZ(contents: LDKCResult_UpdateFulfillHTLCDecodeErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_UpdateFulfillHTLCDecodeErrorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKCResult_UpdateFulfillHTLCDecodeErrorZ, anchor: NativeTypeWrapper){
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
			
			public func getValue() -> UpdateFulfillHTLC? {
				if self.cOpaqueStruct?.result_ok == true {
					return UpdateFulfillHTLC(pointer: self.cOpaqueStruct!.contents.result.pointee, anchor: self)
				}
				return nil
			}
			
    public class func ok(o: UpdateFulfillHTLC) -> Result_UpdateFulfillHTLCDecodeErrorZ {
    	
        return Result_UpdateFulfillHTLCDecodeErrorZ(pointer: CResult_UpdateFulfillHTLCDecodeErrorZ_ok(o.danglingClone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_UpdateFulfillHTLCDecodeErrorZ {
    	
        return Result_UpdateFulfillHTLCDecodeErrorZ(pointer: CResult_UpdateFulfillHTLCDecodeErrorZ_err(e.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_UpdateFulfillHTLCDecodeErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_UpdateFulfillHTLCDecodeErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_UpdateFulfillHTLCDecodeErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_UpdateFulfillHTLCDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_UpdateFulfillHTLCDecodeErrorZ {
    	
        return Result_UpdateFulfillHTLCDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_UpdateFulfillHTLCDecodeErrorZ>) in
CResult_UpdateFulfillHTLCDecodeErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_UpdateFulfillHTLCDecodeErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}
