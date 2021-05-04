class RoutingMessageHandler {

    var cOpaqueStruct: LDKRoutingMessageHandler?;

    init() {

    	/* NATIVE_CALLBACKS_START */

		func handle_node_announcementCallback(pointer: UnsafeRawPointer?, msg: UnsafePointer<LDKNodeAnnouncement>) -> LDKCResult_boolLightningErrorZ {
			let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.handle_node_announcement(msg: msg);
		}

		func handle_channel_announcementCallback(pointer: UnsafeRawPointer?, msg: UnsafePointer<LDKChannelAnnouncement>) -> LDKCResult_boolLightningErrorZ {
			let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.handle_channel_announcement(msg: msg);
		}

		func handle_channel_updateCallback(pointer: UnsafeRawPointer?, msg: UnsafePointer<LDKChannelUpdate>) -> LDKCResult_boolLightningErrorZ {
			let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.handle_channel_update(msg: msg);
		}

		func handle_htlc_fail_channel_updateCallback(pointer: UnsafeRawPointer?, update: UnsafePointer<LDKHTLCFailChannelUpdate>) -> Void {
			let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.handle_htlc_fail_channel_update(update: update);
		}

		func get_next_channel_announcementsCallback(pointer: UnsafeRawPointer?, starting_point: UInt64, batch_amount: UInt8) -> LDKCVec_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ {
			let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.get_next_channel_announcements(starting_point: starting_point, batch_amount: batch_amount);
		}

		func get_next_node_announcementsCallback(pointer: UnsafeRawPointer?, starting_point: LDKPublicKey, batch_amount: UInt8) -> LDKCVec_NodeAnnouncementZ {
			let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.get_next_node_announcements(starting_point: starting_point, batch_amount: batch_amount);
		}

		func sync_routing_tableCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, init: UnsafePointer<LDKInit>) -> Void {
			let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.sync_routing_table(their_node_id: their_node_id, init: init);
		}

		func handle_reply_channel_rangeCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msg: LDKReplyChannelRange) -> LDKCResult_NoneLightningErrorZ {
			let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.handle_reply_channel_range(their_node_id: their_node_id, msg: msg);
		}

		func handle_reply_short_channel_ids_endCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msg: LDKReplyShortChannelIdsEnd) -> LDKCResult_NoneLightningErrorZ {
			let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.handle_reply_short_channel_ids_end(their_node_id: their_node_id, msg: msg);
		}

		func handle_query_channel_rangeCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msg: LDKQueryChannelRange) -> LDKCResult_NoneLightningErrorZ {
			let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.handle_query_channel_range(their_node_id: their_node_id, msg: msg);
		}

		func handle_query_short_channel_idsCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msg: LDKQueryShortChannelIds) -> LDKCResult_NoneLightningErrorZ {
			let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.handle_query_short_channel_ids(their_node_id: their_node_id, msg: msg);
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.free();
		}

		/* NATIVE_CALLBACKS_END */

        self.cOpaqueStruct = LDKRoutingMessageHandler(this_arg: Bindings.instanceToPointer(instance: self), handle_node_announcement: handle_node_announcementCallback,
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

    init(pointer: LDKRoutingMessageHandler){
		self.cOpaqueStruct = pointer
	}

    /* SWIFT_CALLBACKS_START */

    func handle_node_announcement(msg: UnsafePointer<LDKNodeAnnouncement>) -> Void {
    	/* EDIT ME */
    }

    func handle_channel_announcement(msg: UnsafePointer<LDKChannelAnnouncement>) -> Void {
    	/* EDIT ME */
    }

    func handle_channel_update(msg: UnsafePointer<LDKChannelUpdate>) -> Void {
    	/* EDIT ME */
    }

    func handle_htlc_fail_channel_update(update: UnsafePointer<LDKHTLCFailChannelUpdate>) -> Void {
    	/* EDIT ME */
    }

    func get_next_channel_announcements(starting_point: UInt64, batch_amount: UInt8) -> Void {
    	/* EDIT ME */
    }

    func get_next_node_announcements(starting_point: LDKPublicKey, batch_amount: UInt8) -> Void {
    	/* EDIT ME */
    }

    func sync_routing_table(their_node_id: LDKPublicKey, init: UnsafePointer<LDKInit>) -> Void {
    	/* EDIT ME */
    }

    func handle_reply_channel_range(their_node_id: LDKPublicKey, msg: LDKReplyChannelRange) -> Void {
    	/* EDIT ME */
    }

    func handle_reply_short_channel_ids_end(their_node_id: LDKPublicKey, msg: LDKReplyShortChannelIdsEnd) -> Void {
    	/* EDIT ME */
    }

    func handle_query_channel_range(their_node_id: LDKPublicKey, msg: LDKQueryChannelRange) -> Void {
    	/* EDIT ME */
    }

    func handle_query_short_channel_ids(their_node_id: LDKPublicKey, msg: LDKQueryShortChannelIds) -> Void {
    	/* EDIT ME */
    }

    func free() -> Void {
    	/* EDIT ME */
    }

    /* SWIFT_CALLBACKS_END */

}
