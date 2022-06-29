#if SWIFT_PACKAGE
import LDKHeaders
#endif

import Foundation

open class RoutingMessageHandler: NativeTraitWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKRoutingMessageHandler?

    public init() {
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter

    	/* NATIVE_CALLBACKS_START */

		func handle_node_announcementCallback(pointer: UnsafeRawPointer?, msgPointer: UnsafePointer<LDKNodeAnnouncement>) -> LDKCResult_boolLightningErrorZ {
			let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "RoutingMessageHandler.swift::handle_node_announcement")
			let msg = NodeAnnouncement(pointer: msgPointer.pointee).dangle().clone();

			return instance.handle_node_announcement(msg: msg).cOpaqueStruct!
		}

		func handle_channel_announcementCallback(pointer: UnsafeRawPointer?, msgPointer: UnsafePointer<LDKChannelAnnouncement>) -> LDKCResult_boolLightningErrorZ {
			let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "RoutingMessageHandler.swift::handle_channel_announcement")
			let msg = ChannelAnnouncement(pointer: msgPointer.pointee).dangle().clone();

			return instance.handle_channel_announcement(msg: msg).cOpaqueStruct!
		}

		func handle_channel_updateCallback(pointer: UnsafeRawPointer?, msgPointer: UnsafePointer<LDKChannelUpdate>) -> LDKCResult_boolLightningErrorZ {
			let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "RoutingMessageHandler.swift::handle_channel_update")
			let msg = ChannelUpdate(pointer: msgPointer.pointee).dangle().clone();

			return instance.handle_channel_update(msg: msg).cOpaqueStruct!
		}

		func get_next_channel_announcementsCallback(pointer: UnsafeRawPointer?, starting_point: UInt64, batch_amount: UInt8) -> LDKCVec_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ {
			let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "RoutingMessageHandler.swift::get_next_channel_announcements")
			
			
					let returnWrapper = Bindings.new_LDKCVec_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZWrapper(array: instance.get_next_channel_announcements(starting_point: starting_point, batch_amount: batch_amount))
					defer {
						returnWrapper.noOpRetain()
					}
					return returnWrapper.dangle().cOpaqueStruct!
				
		}

		func get_next_node_announcementsCallback(pointer: UnsafeRawPointer?, starting_point: LDKPublicKey, batch_amount: UInt8) -> LDKCVec_NodeAnnouncementZ {
			let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "RoutingMessageHandler.swift::get_next_node_announcements")
			
			
					let returnWrapper = Bindings.new_LDKCVec_NodeAnnouncementZWrapper(array: instance.get_next_node_announcements(starting_point: Bindings.tuple33_to_array(nativeType: starting_point.compressed_form), batch_amount: batch_amount))
					defer {
						returnWrapper.noOpRetain()
					}
					return returnWrapper.dangle().cOpaqueStruct!
				
		}

		func peer_connectedCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, initValuePointer: UnsafePointer<LDKInit>) -> Void {
			let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "RoutingMessageHandler.swift::peer_connected")
			let initValue = Init(pointer: initValuePointer.pointee).dangle().clone();

			return instance.peer_connected(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), initValue: initValue)
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

		super.init(conflictAvoidingVariableName: 0)
        self.cOpaqueStruct = LDKRoutingMessageHandler(this_arg: Bindings.instanceToPointer(instance: self), 
			handle_node_announcement: handle_node_announcementCallback,
			handle_channel_announcement: handle_channel_announcementCallback,
			handle_channel_update: handle_channel_updateCallback,
			get_next_channel_announcements: get_next_channel_announcementsCallback,
			get_next_node_announcements: get_next_node_announcementsCallback,
			peer_connected: peer_connectedCallback,
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
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKRoutingMessageHandler, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* SWIFT_CALLBACKS_START */



					internal func dangle() -> RoutingMessageHandler {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing RoutingMessageHandler \(self.instanceNumber).")
							// self.free()
						} else {
							Bindings.print("Not freeing RoutingMessageHandler \(self.instanceNumber) due to dangle.")
						}
					}
				

    open func handle_node_announcement(msg: NodeAnnouncement) -> Result_boolLightningErrorZ {
    	/* EDIT ME */
		Bindings.print("RoutingMessageHandler::handle_node_announcement should be overridden!", severity: .WARNING)

return Result_boolLightningErrorZ()
    }

    open func handle_channel_announcement(msg: ChannelAnnouncement) -> Result_boolLightningErrorZ {
    	/* EDIT ME */
		Bindings.print("RoutingMessageHandler::handle_channel_announcement should be overridden!", severity: .WARNING)

return Result_boolLightningErrorZ()
    }

    open func handle_channel_update(msg: ChannelUpdate) -> Result_boolLightningErrorZ {
    	/* EDIT ME */
		Bindings.print("RoutingMessageHandler::handle_channel_update should be overridden!", severity: .WARNING)

return Result_boolLightningErrorZ()
    }

    open func get_next_channel_announcements(starting_point: UInt64, batch_amount: UInt8) -> [LDKC3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ] {
    	/* EDIT ME */
		Bindings.print("RoutingMessageHandler::get_next_channel_announcements should be overridden!", severity: .WARNING)

return [LDKC3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ]()
    }

    open func get_next_node_announcements(starting_point: [UInt8], batch_amount: UInt8) -> [LDKNodeAnnouncement] {
    	/* EDIT ME */
		Bindings.print("RoutingMessageHandler::get_next_node_announcements should be overridden!", severity: .WARNING)

return [LDKNodeAnnouncement]()
    }

    open func peer_connected(their_node_id: [UInt8], initValue: Init) -> Void {
    	/* EDIT ME */
		Bindings.print("RoutingMessageHandler::peer_connected should be overridden!", severity: .WARNING)


    }

    open func handle_reply_channel_range(their_node_id: [UInt8], msg: ReplyChannelRange) -> Result_NoneLightningErrorZ {
    	/* EDIT ME */
		Bindings.print("RoutingMessageHandler::handle_reply_channel_range should be overridden!", severity: .WARNING)

return Result_NoneLightningErrorZ()
    }

    open func handle_reply_short_channel_ids_end(their_node_id: [UInt8], msg: ReplyShortChannelIdsEnd) -> Result_NoneLightningErrorZ {
    	/* EDIT ME */
		Bindings.print("RoutingMessageHandler::handle_reply_short_channel_ids_end should be overridden!", severity: .WARNING)

return Result_NoneLightningErrorZ()
    }

    open func handle_query_channel_range(their_node_id: [UInt8], msg: QueryChannelRange) -> Result_NoneLightningErrorZ {
    	/* EDIT ME */
		Bindings.print("RoutingMessageHandler::handle_query_channel_range should be overridden!", severity: .WARNING)

return Result_NoneLightningErrorZ()
    }

    open func handle_query_short_channel_ids(their_node_id: [UInt8], msg: QueryShortChannelIds) -> Result_NoneLightningErrorZ {
    	/* EDIT ME */
		Bindings.print("RoutingMessageHandler::handle_query_short_channel_ids should be overridden!", severity: .WARNING)

return Result_NoneLightningErrorZ()
    }

    open func free() -> Void {
    	/* EDIT ME */
		
					Bindings.print("Deactivating RoutingMessageHandler \(self.instanceNumber).")
					Bindings.removeInstancePointer(instance: self)
				
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

	public override func get_next_channel_announcements(starting_point: UInt64, batch_amount: UInt8) -> [LDKC3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ] {
		
				
				return 
				Bindings.LDKCVec_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ_to_array(nativeType: self.cOpaqueStruct!.get_next_channel_announcements(self.cOpaqueStruct!.this_arg, starting_point, batch_amount))
				
			
	}

	public override func get_next_node_announcements(starting_point: [UInt8], batch_amount: UInt8) -> [LDKNodeAnnouncement] {
		
				
				return 
				Bindings.LDKCVec_NodeAnnouncementZ_to_array(nativeType: self.cOpaqueStruct!.get_next_node_announcements(self.cOpaqueStruct!.this_arg, Bindings.new_LDKPublicKey(array: starting_point), batch_amount))
				
			
	}

	public override func peer_connected(their_node_id: [UInt8], initValue: Init) -> Void {
		
				
				withUnsafePointer(to: initValue.cOpaqueStruct!) { (initPointer: UnsafePointer<LDKInit>) in

				self.cOpaqueStruct!.peer_connected(self.cOpaqueStruct!.this_arg, Bindings.new_LDKPublicKey(array: their_node_id), initPointer)
				
}
			
	}

	public override func handle_reply_channel_range(their_node_id: [UInt8], msg: ReplyChannelRange) -> Result_NoneLightningErrorZ {
		
				
				return 
				Result_NoneLightningErrorZ(pointer: self.cOpaqueStruct!.handle_reply_channel_range(self.cOpaqueStruct!.this_arg, Bindings.new_LDKPublicKey(array: their_node_id), msg.danglingClone().cOpaqueStruct!))
				
			
	}

	public override func handle_reply_short_channel_ids_end(their_node_id: [UInt8], msg: ReplyShortChannelIdsEnd) -> Result_NoneLightningErrorZ {
		
				
				return 
				Result_NoneLightningErrorZ(pointer: self.cOpaqueStruct!.handle_reply_short_channel_ids_end(self.cOpaqueStruct!.this_arg, Bindings.new_LDKPublicKey(array: their_node_id), msg.danglingClone().cOpaqueStruct!))
				
			
	}

	public override func handle_query_channel_range(their_node_id: [UInt8], msg: QueryChannelRange) -> Result_NoneLightningErrorZ {
		
				
				return 
				Result_NoneLightningErrorZ(pointer: self.cOpaqueStruct!.handle_query_channel_range(self.cOpaqueStruct!.this_arg, Bindings.new_LDKPublicKey(array: their_node_id), msg.danglingClone().cOpaqueStruct!))
				
			
	}

	public override func handle_query_short_channel_ids(their_node_id: [UInt8], msg: QueryShortChannelIds) -> Result_NoneLightningErrorZ {
		
				
				return 
				Result_NoneLightningErrorZ(pointer: self.cOpaqueStruct!.handle_query_short_channel_ids(self.cOpaqueStruct!.this_arg, Bindings.new_LDKPublicKey(array: their_node_id), msg.danglingClone().cOpaqueStruct!))
				
			
	}

	public override func free() -> Void {
		
				
				
				self.cOpaqueStruct!.free(self.cOpaqueStruct!.this_arg)
				
			
	}

	/* SWIFT_DEFAULT_CALLBACKS_END */
}
