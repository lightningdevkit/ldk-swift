public class Result_NetAddressu8Z: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKCResult_NetAddressu8Z?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_NetAddressu8Z(contents: LDKCResult_NetAddressu8ZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_NetAddressu8Z){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKCResult_NetAddressu8Z, anchor: NativeTypeWrapper){
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

			public func getError() -> UInt8? {
				if self.cOpaqueStruct?.result_ok == false {
					return self.cOpaqueStruct!.contents.err.pointee
				}
				return nil
			}
			
			public func getValue() -> NetAddress? {
				if self.cOpaqueStruct?.result_ok == true {
					return NetAddress(pointer: self.cOpaqueStruct!.contents.result.pointee, anchor: self)
				}
				return nil
			}
			
    public class func ok(o: NetAddress) -> Result_NetAddressu8Z {
    	
        return Result_NetAddressu8Z(pointer: CResult_NetAddressu8Z_ok(o.danglingClone().cOpaqueStruct!));
    }

    public class func err(e: UInt8) -> Result_NetAddressu8Z {
    	
        return Result_NetAddressu8Z(pointer: CResult_NetAddressu8Z_err(e));
    }

    internal func free() -> Void {
    	
        return CResult_NetAddressu8Z_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_NetAddressu8Z {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_NetAddressu8Z \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_NetAddressu8Z \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_NetAddressu8Z {
    	
        return Result_NetAddressu8Z(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_NetAddressu8Z>) in
CResult_NetAddressu8Z_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_NetAddressu8Z {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}
