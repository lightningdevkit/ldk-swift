class C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ {

    var cTuple: LDKC3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ?;

    init(swift_constructor_arguments) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cTuple = TupleType(native_constructor_arguments)
    }

    private init(pointer: LDKC3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ){
		self.cTuple = pointer
	}

    /* TUPLE_METHODS_START */

    func clone(orig: ThreeTuple<ChannelAnnouncement, ChannelUpdate>) -> ThreeTuple<ChannelAnnouncement, ChannelUpdate> {
    	
						
		let origPointer = withUnsafePointer(to: orig.cTuple!) { (pointer: UnsafePointer<LDKC3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ>) in
							
			pointer
						
		}
					
        return C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ_clone(origPointer);
    }

    func new(a: ChannelAnnouncement, b: ChannelUpdate, c: ChannelUpdate) -> ThreeTuple<ChannelAnnouncement, ChannelUpdate> {
    	
        return C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ_new(a, b, c);
    }

				
	deinit {
					
					
		C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ_free(_res)
				
	}
			
    /* TUPLE_METHODS_END */

}
