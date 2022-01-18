public class Result_COption_ClosureReasonZDecodeErrorZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKCResult_COption_ClosureReasonZDecodeErrorZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_COption_ClosureReasonZDecodeErrorZ(contents: LDKCResult_COption_ClosureReasonZDecodeErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_COption_ClosureReasonZDecodeErrorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKCResult_COption_ClosureReasonZDecodeErrorZ, anchor: NativeTypeWrapper){
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
			
		public func getValue() throws -> Option_ClosureReasonZ {
			if self.cOpaqueStruct?.result_ok == true {
				return Option_ClosureReasonZ(pointer: self.cOpaqueStruct!.contents.result.pointee, anchor: self)
			}
			throw Bindings.Error.decodeError(DecodeError(pointer: self.cOpaqueStruct!.contents.err.pointee, anchor: self))
			// return nil
		}
		
    public class func ok(o: Option_ClosureReasonZ) -> Result_COption_ClosureReasonZDecodeErrorZ {
    	
        return Result_COption_ClosureReasonZDecodeErrorZ(pointer: CResult_COption_ClosureReasonZDecodeErrorZ_ok(o.danglingClone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_COption_ClosureReasonZDecodeErrorZ {
    	
        return Result_COption_ClosureReasonZDecodeErrorZ(pointer: CResult_COption_ClosureReasonZDecodeErrorZ_err(e.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_COption_ClosureReasonZDecodeErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_COption_ClosureReasonZDecodeErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_COption_ClosureReasonZDecodeErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_COption_ClosureReasonZDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_COption_ClosureReasonZDecodeErrorZ {
    	
        return Result_COption_ClosureReasonZDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_COption_ClosureReasonZDecodeErrorZ>) in
CResult_COption_ClosureReasonZDecodeErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_COption_ClosureReasonZDecodeErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}
