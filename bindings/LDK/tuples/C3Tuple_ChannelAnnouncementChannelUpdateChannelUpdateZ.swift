public class C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKC3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ?;

    public init(pointer: LDKC3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* TUPLE_METHODS_START */

    public func clone() -> C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ {
    	
        return C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKC3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ>) in
C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ_clone(origPointer)
});
    }

					internal func danglingClone() -> C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ {
        				var dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public class func new(a: ChannelAnnouncement, b: ChannelUpdate, c: ChannelUpdate) -> C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ {
    	
        return C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ(pointer: C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ_new(a.danglingClone().cOpaqueStruct!, b.danglingClone().cOpaqueStruct!, c.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							self.free()
						}
					}
				

    /* TUPLE_METHODS_END */

}
