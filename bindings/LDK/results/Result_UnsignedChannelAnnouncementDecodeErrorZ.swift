import LDKHeaders

public class Result_UnsignedChannelAnnouncementDecodeErrorZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKCResult_UnsignedChannelAnnouncementDecodeErrorZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_UnsignedChannelAnnouncementDecodeErrorZ(contents: LDKCResult_UnsignedChannelAnnouncementDecodeErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_UnsignedChannelAnnouncementDecodeErrorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
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
			
			public func getValue() -> UnsignedChannelAnnouncement? {
				if self.cOpaqueStruct?.result_ok == true {
					return UnsignedChannelAnnouncement(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: UnsignedChannelAnnouncement) -> Result_UnsignedChannelAnnouncementDecodeErrorZ {
    	
        return Result_UnsignedChannelAnnouncementDecodeErrorZ(pointer: CResult_UnsignedChannelAnnouncementDecodeErrorZ_ok(o.danglingClone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_UnsignedChannelAnnouncementDecodeErrorZ {
    	
        return Result_UnsignedChannelAnnouncementDecodeErrorZ(pointer: CResult_UnsignedChannelAnnouncementDecodeErrorZ_err(e.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_UnsignedChannelAnnouncementDecodeErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_UnsignedChannelAnnouncementDecodeErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing Result_UnsignedChannelAnnouncementDecodeErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing Result_UnsignedChannelAnnouncementDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_UnsignedChannelAnnouncementDecodeErrorZ {
    	
        return Result_UnsignedChannelAnnouncementDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_UnsignedChannelAnnouncementDecodeErrorZ>) in
CResult_UnsignedChannelAnnouncementDecodeErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_UnsignedChannelAnnouncementDecodeErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}
