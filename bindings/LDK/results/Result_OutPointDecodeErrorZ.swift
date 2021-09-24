public class Result_OutPointDecodeErrorZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKCResult_OutPointDecodeErrorZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_OutPointDecodeErrorZ(contents: LDKCResult_OutPointDecodeErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_OutPointDecodeErrorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKCResult_OutPointDecodeErrorZ, anchor: NativeTypeWrapper){
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
			
			public func getValue() -> OutPoint? {
				if self.cOpaqueStruct?.result_ok == true {
					return OutPoint(pointer: self.cOpaqueStruct!.contents.result.pointee, anchor: self)
				}
				return nil
			}
			
    public class func ok(o: OutPoint) -> Result_OutPointDecodeErrorZ {
    	
        return Result_OutPointDecodeErrorZ(pointer: CResult_OutPointDecodeErrorZ_ok(o.danglingClone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_OutPointDecodeErrorZ {
    	
        return Result_OutPointDecodeErrorZ(pointer: CResult_OutPointDecodeErrorZ_err(e.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_OutPointDecodeErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_OutPointDecodeErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_OutPointDecodeErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_OutPointDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_OutPointDecodeErrorZ {
    	
        return Result_OutPointDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_OutPointDecodeErrorZ>) in
CResult_OutPointDecodeErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_OutPointDecodeErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}
