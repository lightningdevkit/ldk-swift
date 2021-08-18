import LDKHeaders

public class Result_InMemorySignerDecodeErrorZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_InMemorySignerDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_InMemorySignerDecodeErrorZ(contents: LDKCResult_InMemorySignerDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_InMemorySignerDecodeErrorZ){
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
			
			public func getValue() -> InMemorySigner? {
				if self.cOpaqueStruct?.result_ok == true {
					return InMemorySigner(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: InMemorySigner) -> Result_InMemorySignerDecodeErrorZ {
    	
        return Result_InMemorySignerDecodeErrorZ(pointer: CResult_InMemorySignerDecodeErrorZ_ok(o.danglingClone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_InMemorySignerDecodeErrorZ {
    	
        return Result_InMemorySignerDecodeErrorZ(pointer: CResult_InMemorySignerDecodeErrorZ_err(e.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_InMemorySignerDecodeErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_InMemorySignerDecodeErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing Result_InMemorySignerDecodeErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing Result_InMemorySignerDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_InMemorySignerDecodeErrorZ {
    	
        return Result_InMemorySignerDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_InMemorySignerDecodeErrorZ>) in
CResult_InMemorySignerDecodeErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_InMemorySignerDecodeErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}
