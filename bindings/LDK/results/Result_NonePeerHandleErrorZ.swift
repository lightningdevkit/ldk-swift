public class Result_NonePeerHandleErrorZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKCResult_NonePeerHandleErrorZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_NonePeerHandleErrorZ(contents: LDKCResult_NonePeerHandleErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_NonePeerHandleErrorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKCResult_NonePeerHandleErrorZ, anchor: NativeTypeWrapper){
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

			public func getError() -> PeerHandleError? {
				if self.cOpaqueStruct?.result_ok == false {
					return PeerHandleError(pointer: self.cOpaqueStruct!.contents.err.pointee, anchor: self)
				}
				return nil
			}
			
		public func getValue() throws  {
			if self.cOpaqueStruct?.result_ok == true {
				return 
			}
			throw Bindings.Error.peerHandleError(PeerHandleError(pointer: self.cOpaqueStruct!.contents.err.pointee, anchor: self))
			// return nil
		}
		
    public class func ok() -> Result_NonePeerHandleErrorZ {
    	
        return Result_NonePeerHandleErrorZ(pointer: CResult_NonePeerHandleErrorZ_ok());
    }

    public class func err(e: PeerHandleError) -> Result_NonePeerHandleErrorZ {
    	
        return Result_NonePeerHandleErrorZ(pointer: CResult_NonePeerHandleErrorZ_err(e.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_NonePeerHandleErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_NonePeerHandleErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_NonePeerHandleErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_NonePeerHandleErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_NonePeerHandleErrorZ {
    	
        return Result_NonePeerHandleErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_NonePeerHandleErrorZ>) in
CResult_NonePeerHandleErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_NonePeerHandleErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}
