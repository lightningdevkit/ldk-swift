public class Result_NoneAPIErrorZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKCResult_NoneAPIErrorZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_NoneAPIErrorZ(contents: LDKCResult_NoneAPIErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_NoneAPIErrorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKCResult_NoneAPIErrorZ, anchor: NativeTypeWrapper){
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

			public func getError() -> APIError? {
				if self.cOpaqueStruct?.result_ok == false {
					return APIError(pointer: self.cOpaqueStruct!.contents.err.pointee, anchor: self)
				}
				return nil
			}
			
		public func getValue() throws  {
			if self.cOpaqueStruct?.result_ok == true {
				return 
			}
			throw Bindings.Error.apiError(APIError(pointer: self.cOpaqueStruct!.contents.err.pointee, anchor: self))
			// return nil
		}
		
    public class func ok() -> Result_NoneAPIErrorZ {
    	
        return Result_NoneAPIErrorZ(pointer: CResult_NoneAPIErrorZ_ok());
    }

    public class func err(e: APIError) -> Result_NoneAPIErrorZ {
    	
        return Result_NoneAPIErrorZ(pointer: CResult_NoneAPIErrorZ_err(e.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_NoneAPIErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_NoneAPIErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_NoneAPIErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_NoneAPIErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_NoneAPIErrorZ {
    	
        return Result_NoneAPIErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_NoneAPIErrorZ>) in
CResult_NoneAPIErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_NoneAPIErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}
