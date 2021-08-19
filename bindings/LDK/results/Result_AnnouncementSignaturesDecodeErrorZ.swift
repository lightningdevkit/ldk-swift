import LDKHeaders

public class Result_AnnouncementSignaturesDecodeErrorZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCResult_AnnouncementSignaturesDecodeErrorZ?;

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_AnnouncementSignaturesDecodeErrorZ(contents: LDKCResult_AnnouncementSignaturesDecodeErrorZPtr(), result_ok: true)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_AnnouncementSignaturesDecodeErrorZ){
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
			
			public func getValue() -> AnnouncementSignatures? {
				if self.cOpaqueStruct?.result_ok == true {
					return AnnouncementSignatures(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: AnnouncementSignatures) -> Result_AnnouncementSignaturesDecodeErrorZ {
    	
        return Result_AnnouncementSignaturesDecodeErrorZ(pointer: CResult_AnnouncementSignaturesDecodeErrorZ_ok(o.danglingClone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_AnnouncementSignaturesDecodeErrorZ {
    	
        return Result_AnnouncementSignaturesDecodeErrorZ(pointer: CResult_AnnouncementSignaturesDecodeErrorZ_err(e.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_AnnouncementSignaturesDecodeErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_AnnouncementSignaturesDecodeErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing Result_AnnouncementSignaturesDecodeErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing Result_AnnouncementSignaturesDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_AnnouncementSignaturesDecodeErrorZ {
    	
        return Result_AnnouncementSignaturesDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_AnnouncementSignaturesDecodeErrorZ>) in
CResult_AnnouncementSignaturesDecodeErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_AnnouncementSignaturesDecodeErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}
