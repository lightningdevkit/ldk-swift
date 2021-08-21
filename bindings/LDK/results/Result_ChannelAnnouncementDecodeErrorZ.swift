import LDKHeaders

public class Result_ChannelAnnouncementDecodeErrorZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKCResult_ChannelAnnouncementDecodeErrorZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_ChannelAnnouncementDecodeErrorZ(contents: LDKCResult_ChannelAnnouncementDecodeErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_ChannelAnnouncementDecodeErrorZ){
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
			
			public func getValue() -> ChannelAnnouncement? {
				if self.cOpaqueStruct?.result_ok == true {
					return ChannelAnnouncement(pointer: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: ChannelAnnouncement) -> Result_ChannelAnnouncementDecodeErrorZ {
    	
        return Result_ChannelAnnouncementDecodeErrorZ(pointer: CResult_ChannelAnnouncementDecodeErrorZ_ok(o.danglingClone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_ChannelAnnouncementDecodeErrorZ {
    	
        return Result_ChannelAnnouncementDecodeErrorZ(pointer: CResult_ChannelAnnouncementDecodeErrorZ_err(e.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_ChannelAnnouncementDecodeErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_ChannelAnnouncementDecodeErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing Result_ChannelAnnouncementDecodeErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing Result_ChannelAnnouncementDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_ChannelAnnouncementDecodeErrorZ {
    	
        return Result_ChannelAnnouncementDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_ChannelAnnouncementDecodeErrorZ>) in
CResult_ChannelAnnouncementDecodeErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_ChannelAnnouncementDecodeErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}
