open class RoutingMessageHandler {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public var cOpaqueStruct: LDKRoutingMessageHandler?
    internal private(set) var anchor: AnyObject? = nil

    public init() {
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter

    	/* NATIVE_CALLBACKS_START */

		func handle_node_announcementCallback(pointer: UnsafeRawPointer?, msgPointer: UnsafePointer<LDKNodeAnnouncement>) -> LDKCResult_boolLightningErrorZ {
			let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "RoutingMessageHandler.swift::handle_node_announcement")
			let msg = NodeAnnouncement(pointer: msgPointer.pointee);

			return instance.handle_node_announcement(msg: msg).cOpaqueStruct!
		}

		func handle_channel_announcementCallback(pointer: UnsafeRawPointer?, msgPointer: UnsafePointer<LDKChannelAnnouncement>) -> LDKCResult_boolLightningErrorZ {
			let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "RoutingMessageHandler.swift::handle_channel_announcement")
			let msg = ChannelAnnouncement(pointer: msgPointer.pointee);

			return instance.handle_channel_announcement(msg: msg).cOpaqueStruct!
		}

		func handle_channel_updateCallback(pointer: UnsafeRawPointer?, msgPointer: UnsafePointer<LDKChannelUpdate>) -> LDKCResult_boolLightningErrorZ {
			let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "RoutingMessageHandler.swift::handle_channel_update")
			let msg = ChannelUpdate(pointer: msgPointer.pointee);

			return instance.handle_channel_update(msg: msg).cOpaqueStruct!
		}

		func handle_htlc_fail_channel_updateCallback(pointer: UnsafeRawPointer?, updatePointer: UnsafePointer<LDKHTLCFailChannelUpdate>) -> Void {
			let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "RoutingMessageHandler.swift::handle_htlc_fail_channel_update")
			let update = HTLCFailChannelUpdate(pointer: updatePointer.pointee);

			return instance.handle_htlc_fail_channel_update(update: update)
		}

		func get_next_channel_announcementsCallback(pointer: UnsafeRawPointer?, starting_point: UInt64, batch_amount: UInt8) -> LDKCVec_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ {
			let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "RoutingMessageHandler.swift::get_next_channel_announcements")
			
			return Bindings.new_LDKCVec_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ(array: instance.get_next_channel_announcements(starting_point: starting_point, batch_amount: batch_amount))
		}

		func get_next_node_announcementsCallback(pointer: UnsafeRawPointer?, starting_point: LDKPublicKey, batch_amount: UInt8) -> LDKCVec_NodeAnnouncementZ {
			let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "RoutingMessageHandler.swift::get_next_node_announcements")
			
			return Bindings.new_LDKCVec_NodeAnnouncementZ(array: instance.get_next_node_announcements(starting_point: Bindings.tuple33_to_array(nativeType: starting_point.compressed_form), batch_amount: batch_amount))
		}

		func sync_routing_tableCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, initValuePointer: UnsafePointer<LDKInit>) -> Void {
			let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "RoutingMessageHandler.swift::sync_routing_table")
			let initValue = Init(pointer: initValuePointer.pointee);

			return instance.sync_routing_table(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), initValue: initValue)
		}

		func handle_reply_channel_rangeCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msg: LDKReplyChannelRange) -> LDKCResult_NoneLightningErrorZ {
			let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "RoutingMessageHandler.swift::handle_reply_channel_range")
			
			return instance.handle_reply_channel_range(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), msg: ReplyChannelRange(pointer: msg)).cOpaqueStruct!
		}

		func handle_reply_short_channel_ids_endCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msg: LDKReplyShortChannelIdsEnd) -> LDKCResult_NoneLightningErrorZ {
			let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "RoutingMessageHandler.swift::handle_reply_short_channel_ids_end")
			
			return instance.handle_reply_short_channel_ids_end(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), msg: ReplyShortChannelIdsEnd(pointer: msg)).cOpaqueStruct!
		}

		func handle_query_channel_rangeCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msg: LDKQueryChannelRange) -> LDKCResult_NoneLightningErrorZ {
			let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "RoutingMessageHandler.swift::handle_query_channel_range")
			
			return instance.handle_query_channel_range(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), msg: QueryChannelRange(pointer: msg)).cOpaqueStruct!
		}

		func handle_query_short_channel_idsCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msg: LDKQueryShortChannelIds) -> LDKCResult_NoneLightningErrorZ {
			let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "RoutingMessageHandler.swift::handle_query_short_channel_ids")
			
			return instance.handle_query_short_channel_ids(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), msg: QueryShortChannelIds(pointer: msg)).cOpaqueStruct!
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "RoutingMessageHandler.swift::free")
			
			return instance.free()
		}

		/* NATIVE_CALLBACKS_END */

        self.cOpaqueStruct = LDKRoutingMessageHandler(this_arg: Bindings.instanceToPointer(instance: self), 
			handle_node_announcement: handle_node_announcementCallback,
			handle_channel_announcement: handle_channel_announcementCallback,
			handle_channel_update: handle_channel_updateCallback,
			handle_htlc_fail_channel_update: handle_htlc_fail_channel_updateCallback,
			get_next_channel_announcements: get_next_channel_announcementsCallback,
			get_next_node_announcements: get_next_node_announcementsCallback,
			sync_routing_table: sync_routing_tableCallback,
			handle_reply_channel_range: handle_reply_channel_rangeCallback,
			handle_reply_short_channel_ids_end: handle_reply_short_channel_ids_endCallback,
			handle_query_channel_range: handle_query_channel_rangeCallback,
			handle_query_short_channel_ids: handle_query_short_channel_idsCallback,
			MessageSendEventsProvider: LDKMessageSendEventsProvider(),
			free: freeCallback)
    }

    public init(pointer: LDKRoutingMessageHandler){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

	public init(pointer: LDKRoutingMessageHandler, anchor: AnyObject){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.dangling = true
		self.anchor = anchor
		self.cOpaqueStruct = pointer
	}

    /* SWIFT_CALLBACKS_START */



					internal func dangle() -> RoutingMessageHandler {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing RoutingMessageHandler \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing RoutingMessageHandler \(self.instanceNumber) due to dangle.")
						}
					}
				

    open func handle_node_announcement(msg: NodeAnnouncement) -> Result_boolLightningErrorZ {
    	/* EDIT ME */
		return Result_boolLightningErrorZ(pointer: LDKCResult_boolLightningErrorZ())
    }

    open func handle_channel_announcement(msg: ChannelAnnouncement) -> Result_boolLightningErrorZ {
    	/* EDIT ME */
		return Result_boolLightningErrorZ(pointer: LDKCResult_boolLightningErrorZ())
    }

    open func handle_channel_update(msg: ChannelUpdate) -> Result_boolLightningErrorZ {
    	/* EDIT ME */
		return Result_boolLightningErrorZ(pointer: LDKCResult_boolLightningErrorZ())
    }

    open func handle_htlc_fail_channel_update(update: HTLCFailChannelUpdate) -> Void {
    	/* EDIT ME */
		
    }

    open func get_next_channel_announcements(starting_point: UInt64, batch_amount: UInt8) -> [LDKC3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ] {
    	/* EDIT ME */
		return [LDKC3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ]()
    }

    open func get_next_node_announcements(starting_point: [UInt8], batch_amount: UInt8) -> [LDKNodeAnnouncement] {
    	/* EDIT ME */
		return [LDKNodeAnnouncement]()
    }

    open func sync_routing_table(their_node_id: [UInt8], initValue: Init) -> Void {
    	/* EDIT ME */
		
    }

    open func handle_reply_channel_range(their_node_id: [UInt8], msg: ReplyChannelRange) -> Result_NoneLightningErrorZ {
    	/* EDIT ME */
		return Result_NoneLightningErrorZ(pointer: LDKCResult_NoneLightningErrorZ())
    }

    open func handle_reply_short_channel_ids_end(their_node_id: [UInt8], msg: ReplyShortChannelIdsEnd) -> Result_NoneLightningErrorZ {
    	/* EDIT ME */
		return Result_NoneLightningErrorZ(pointer: LDKCResult_NoneLightningErrorZ())
    }

    open func handle_query_channel_range(their_node_id: [UInt8], msg: QueryChannelRange) -> Result_NoneLightningErrorZ {
    	/* EDIT ME */
		return Result_NoneLightningErrorZ(pointer: LDKCResult_NoneLightningErrorZ())
    }

    open func handle_query_short_channel_ids(their_node_id: [UInt8], msg: QueryShortChannelIds) -> Result_NoneLightningErrorZ {
    	/* EDIT ME */
		return Result_NoneLightningErrorZ(pointer: LDKCResult_NoneLightningErrorZ())
    }

    open func free() -> Void {
    	/* EDIT ME */
		
    }

    /* SWIFT_CALLBACKS_END */

}


public class NativelyImplementedRoutingMessageHandler: RoutingMessageHandler {
	/* SWIFT_DEFAULT_CALLBACKS_START */

	public override func handle_node_announcement(msg: NodeAnnouncement) -> Result_boolLightningErrorZ {
		
				return withUnsafePointer(to: msg.cOpaqueStruct!) { (msgPointer: UnsafePointer<LDKNodeAnnouncement>) in

				Result_boolLightningErrorZ(pointer: self.cOpaqueStruct!.handle_node_announcement(self.cOpaqueStruct!.this_arg, msgPointer))
				
}
			
	}

	public override func handle_channel_announcement(msg: ChannelAnnouncement) -> Result_boolLightningErrorZ {
		
				return withUnsafePointer(to: msg.cOpaqueStruct!) { (msgPointer: UnsafePointer<LDKChannelAnnouncement>) in

				Result_boolLightningErrorZ(pointer: self.cOpaqueStruct!.handle_channel_announcement(self.cOpaqueStruct!.this_arg, msgPointer))
				
}
			
	}

	public override func handle_channel_update(msg: ChannelUpdate) -> Result_boolLightningErrorZ {
		
				return withUnsafePointer(to: msg.cOpaqueStruct!) { (msgPointer: UnsafePointer<LDKChannelUpdate>) in

				Result_boolLightningErrorZ(pointer: self.cOpaqueStruct!.handle_channel_update(self.cOpaqueStruct!.this_arg, msgPointer))
				
}
			
	}

	public override func handle_htlc_fail_channel_update(update: HTLCFailChannelUpdate) -> Void {
		
				withUnsafePointer(to: update.cOpaqueStruct!) { (updatePointer: UnsafePointer<LDKHTLCFailChannelUpdate>) in

				self.cOpaqueStruct!.handle_htlc_fail_channel_update(self.cOpaqueStruct!.this_arg, updatePointer)
				
}
			
	}

	public override func get_next_channel_announcements(starting_point: UInt64, batch_amount: UInt8) -> [LDKC3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ] {
		
				return 
				Bindings.LDKCVec_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ_to_array(nativeType: self.cOpaqueStruct!.get_next_channel_announcements(self.cOpaqueStruct!.this_arg, starting_point, batch_amount))
				
			
	}

	public override func get_next_node_announcements(starting_point: [UInt8], batch_amount: UInt8) -> [LDKNodeAnnouncement] {
		
				return 
				Bindings.LDKCVec_NodeAnnouncementZ_to_array(nativeType: self.cOpaqueStruct!.get_next_node_announcements(self.cOpaqueStruct!.this_arg, Bindings.new_LDKPublicKey(array: starting_point).cOpaqueStruct!, batch_amount))
				
			
	}

	public override func sync_routing_table(their_node_id: [UInt8], initValue: Init) -> Void {
		
				withUnsafePointer(to: initValue.cOpaqueStruct!) { (initPointer: UnsafePointer<LDKInit>) in

				self.cOpaqueStruct!.sync_routing_table(self.cOpaqueStruct!.this_arg, Bindings.new_LDKPublicKey(array: their_node_id).cOpaqueStruct!, initPointer)
				
}
			
	}

	public override func handle_reply_channel_range(their_node_id: [UInt8], msg: ReplyChannelRange) -> Result_NoneLightningErrorZ {
		
				return 
				Result_NoneLightningErrorZ(pointer: self.cOpaqueStruct!.handle_reply_channel_range(self.cOpaqueStruct!.this_arg, Bindings.new_LDKPublicKey(array: their_node_id).cOpaqueStruct!, msg.danglingClone().cOpaqueStruct!))
				
			
	}

	public override func handle_reply_short_channel_ids_end(their_node_id: [UInt8], msg: ReplyShortChannelIdsEnd) -> Result_NoneLightningErrorZ {
		
				return 
				Result_NoneLightningErrorZ(pointer: self.cOpaqueStruct!.handle_reply_short_channel_ids_end(self.cOpaqueStruct!.this_arg, Bindings.new_LDKPublicKey(array: their_node_id).cOpaqueStruct!, msg.danglingClone().cOpaqueStruct!))
				
			
	}

	public override func handle_query_channel_range(their_node_id: [UInt8], msg: QueryChannelRange) -> Result_NoneLightningErrorZ {
		
				return 
				Result_NoneLightningErrorZ(pointer: self.cOpaqueStruct!.handle_query_channel_range(self.cOpaqueStruct!.this_arg, Bindings.new_LDKPublicKey(array: their_node_id).cOpaqueStruct!, msg.danglingClone().cOpaqueStruct!))
				
			
	}

	public override func handle_query_short_channel_ids(their_node_id: [UInt8], msg: QueryShortChannelIds) -> Result_NoneLightningErrorZ {
		
				return 
				Result_NoneLightningErrorZ(pointer: self.cOpaqueStruct!.handle_query_short_channel_ids(self.cOpaqueStruct!.this_arg, Bindings.new_LDKPublicKey(array: their_node_id).cOpaqueStruct!, msg.danglingClone().cOpaqueStruct!))
				
			
	}

	public override func free() -> Void {
		
				
				self.cOpaqueStruct!.free(self.cOpaqueStruct!.this_arg)
				
			
	}

	/* SWIFT_DEFAULT_CALLBACKS_END */
}
