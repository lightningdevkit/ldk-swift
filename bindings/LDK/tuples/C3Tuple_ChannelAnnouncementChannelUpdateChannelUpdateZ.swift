class C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ {

    var cOpaqueStruct: LDKC3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ?;

    init(pointer: LDKC3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ){
		self.cOpaqueStruct = pointer
	}

    /* TUPLE_METHODS_START */

    func clone(orig: C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ) -> C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKC3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ>) in
							
			pointer
						
		}
					
        return C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ(pointer: C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ_clone(origPointer));
    }

    func new(a: ChannelAnnouncement, b: ChannelUpdate, c: ChannelUpdate) -> C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ {
    	
        return C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ(pointer: C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ_new(a.cOpaqueStruct!, b.cOpaqueStruct!, c.cOpaqueStruct!));
    }

				
	deinit {
					
					
		C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ_free(self.cOpaqueStruct!)
				
	}
			
    /* TUPLE_METHODS_END */

}
