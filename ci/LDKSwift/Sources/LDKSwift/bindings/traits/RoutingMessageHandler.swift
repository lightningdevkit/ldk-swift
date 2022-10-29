#if SWIFT_PACKAGE
import LDKHeaders
#endif

import Foundation

public typealias RoutingMessageHandler = Bindings.RoutingMessageHandler

extension Bindings {

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

			func get_next_channel_announcementCallback(pointer: UnsafeRawPointer?, starting_point: UInt64) -> LDKCOption_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ {
				let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "RoutingMessageHandler.swift::get_next_channel_announcement")
				
				return instance.get_next_channel_announcement(starting_point: starting_point).cOpaqueStruct!
			}

			func get_next_node_announcementCallback(pointer: UnsafeRawPointer?, starting_point: LDKPublicKey) -> LDKNodeAnnouncement {
				let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "RoutingMessageHandler.swift::get_next_node_announcement")
				
				return instance.get_next_node_announcement(starting_point: Bindings.tuple33_to_array(nativeType: starting_point.compressed_form)).cOpaqueStruct!
			}

			func peer_connectedCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, initValuePointer: UnsafePointer<LDKInit>) -> LDKCResult_NoneNoneZ {
				let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "RoutingMessageHandler.swift::peer_connected")
				let initValue = Init(pointer: initValuePointer.pointee).dangle().clone();

				return instance.peer_connected(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), initValue: initValue).cOpaqueStruct!
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

			func provided_node_featuresCallback(pointer: UnsafeRawPointer?) -> LDKNodeFeatures {
				let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "RoutingMessageHandler.swift::provided_node_features")
				
				return instance.provided_node_features().cOpaqueStruct!
			}

			func provided_init_featuresCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey) -> LDKInitFeatures {
				let instance: RoutingMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "RoutingMessageHandler.swift::provided_init_features")
				
				return instance.provided_init_features(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form)).cOpaqueStruct!
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
			get_next_channel_announcement: get_next_channel_announcementCallback,
			get_next_node_announcement: get_next_node_announcementCallback,
			peer_connected: peer_connectedCallback,
			handle_reply_channel_range: handle_reply_channel_rangeCallback,
			handle_reply_short_channel_ids_end: handle_reply_short_channel_ids_endCallback,
			handle_query_channel_range: handle_query_channel_rangeCallback,
			handle_query_short_channel_ids: handle_query_short_channel_idsCallback,
			provided_node_features: provided_node_featuresCallback,
			provided_init_features: provided_init_featuresCallback,
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
		
					Bindings.print("Error: RoutingMessageHandler::handle_node_announcement MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
					abort()
				
		}

		open func handle_channel_announcement(msg: ChannelAnnouncement) -> Result_boolLightningErrorZ {
			/* EDIT ME */
		
					Bindings.print("Error: RoutingMessageHandler::handle_channel_announcement MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
					abort()
				
		}

		open func handle_channel_update(msg: ChannelUpdate) -> Result_boolLightningErrorZ {
			/* EDIT ME */
		
					Bindings.print("Error: RoutingMessageHandler::handle_channel_update MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
					abort()
				
		}

		open func get_next_channel_announcement(starting_point: UInt64) -> Option_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ {
			/* EDIT ME */
		
					Bindings.print("Error: RoutingMessageHandler::get_next_channel_announcement MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
					abort()
				
		}

		open func get_next_node_announcement(starting_point: [UInt8]) -> NodeAnnouncement {
			/* EDIT ME */
		
					Bindings.print("Error: RoutingMessageHandler::get_next_node_announcement MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
					abort()
				
		}

		open func peer_connected(their_node_id: [UInt8], initValue: Init) -> Result_NoneNoneZ {
			/* EDIT ME */
		
					Bindings.print("Error: RoutingMessageHandler::peer_connected MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
					abort()
				
		}

		open func handle_reply_channel_range(their_node_id: [UInt8], msg: ReplyChannelRange) -> Result_NoneLightningErrorZ {
			/* EDIT ME */
		
					Bindings.print("Error: RoutingMessageHandler::handle_reply_channel_range MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
					abort()
				
		}

		open func handle_reply_short_channel_ids_end(their_node_id: [UInt8], msg: ReplyShortChannelIdsEnd) -> Result_NoneLightningErrorZ {
			/* EDIT ME */
		
					Bindings.print("Error: RoutingMessageHandler::handle_reply_short_channel_ids_end MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
					abort()
				
		}

		open func handle_query_channel_range(their_node_id: [UInt8], msg: QueryChannelRange) -> Result_NoneLightningErrorZ {
			/* EDIT ME */
		
					Bindings.print("Error: RoutingMessageHandler::handle_query_channel_range MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
					abort()
				
		}

		open func handle_query_short_channel_ids(their_node_id: [UInt8], msg: QueryShortChannelIds) -> Result_NoneLightningErrorZ {
			/* EDIT ME */
		
					Bindings.print("Error: RoutingMessageHandler::handle_query_short_channel_ids MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
					abort()
				
		}

		open func provided_node_features() -> NodeFeatures {
			/* EDIT ME */
		
					Bindings.print("Error: RoutingMessageHandler::provided_node_features MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
					abort()
				
		}

		open func provided_init_features(their_node_id: [UInt8]) -> InitFeatures {
			/* EDIT ME */
		
					Bindings.print("Error: RoutingMessageHandler::provided_init_features MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
					abort()
				
		}

		open func free() -> Void {
			/* EDIT ME */
		
					Bindings.print("Deactivating RoutingMessageHandler \(self.instanceNumber).")
					Bindings.removeInstancePointer(instance: self)
				
		}

		/* SWIFT_CALLBACKS_END */

	}

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

	public override func get_next_channel_announcement(starting_point: UInt64) -> Option_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ {
		
				
				return 
				Option_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ(pointer: self.cOpaqueStruct!.get_next_channel_announcement(self.cOpaqueStruct!.this_arg, starting_point))
				
			
	}

	public override func get_next_node_announcement(starting_point: [UInt8]) -> NodeAnnouncement {
		
				
				return 
				NodeAnnouncement(pointer: self.cOpaqueStruct!.get_next_node_announcement(self.cOpaqueStruct!.this_arg, Bindings.new_LDKPublicKey(array: starting_point)))
				
			
	}

	public override func peer_connected(their_node_id: [UInt8], initValue: Init) -> Result_NoneNoneZ {
		
				
				return withUnsafePointer(to: initValue.cOpaqueStruct!) { (initPointer: UnsafePointer<LDKInit>) in

				Result_NoneNoneZ(pointer: self.cOpaqueStruct!.peer_connected(self.cOpaqueStruct!.this_arg, Bindings.new_LDKPublicKey(array: their_node_id), initPointer))
				
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

	public override func provided_node_features() -> NodeFeatures {
		
				
				return 
				NodeFeatures(pointer: self.cOpaqueStruct!.provided_node_features(self.cOpaqueStruct!.this_arg))
				
			
	}

	public override func provided_init_features(their_node_id: [UInt8]) -> InitFeatures {
		
				
				return 
				InitFeatures(pointer: self.cOpaqueStruct!.provided_init_features(self.cOpaqueStruct!.this_arg, Bindings.new_LDKPublicKey(array: their_node_id)))
				
			
	}

	public override func free() -> Void {
		
				
				
				self.cOpaqueStruct!.free(self.cOpaqueStruct!.this_arg)
				
			
	}

	/* SWIFT_DEFAULT_CALLBACKS_END */
}
