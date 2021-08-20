public class Result_NetAddressDecodeErrorZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_NetAddressDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_NetAddressDecodeErrorZ(contents: LDKCResult_NetAddressDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_NetAddressDecodeErrorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
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
			
			public func getValue() -> NetAddress? {
				if self.cOpaqueStruct?.result_ok == true {
					return NetAddress(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: NetAddress) -> Result_NetAddressDecodeErrorZ {
    	
        return Result_NetAddressDecodeErrorZ(pointer: CResult_NetAddressDecodeErrorZ_ok(o.danglingClone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_NetAddressDecodeErrorZ {
    	
        return Result_NetAddressDecodeErrorZ(pointer: CResult_NetAddressDecodeErrorZ_err(e.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_NetAddressDecodeErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_NetAddressDecodeErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing Result_NetAddressDecodeErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing Result_NetAddressDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_NetAddressDecodeErrorZ {
    	
        return Result_NetAddressDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_NetAddressDecodeErrorZ>) in
CResult_NetAddressDecodeErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_NetAddressDecodeErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}
