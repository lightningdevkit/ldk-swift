#if SWIFT_PACKAGE
import LDKHeaders
#endif

import Foundation

open class ChannelMessageHandler: NativeTraitWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKChannelMessageHandler?

    public init() {
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter

    	/* NATIVE_CALLBACKS_START */

		func handle_open_channelCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, their_features: LDKInitFeatures, msgPointer: UnsafePointer<LDKOpenChannel>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "ChannelMessageHandler.swift::handle_open_channel")
			let msg = OpenChannel(pointer: msgPointer.pointee).dangle().clone();

			return instance.handle_open_channel(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), their_features: InitFeatures(pointer: their_features), msg: msg)
		}

		func handle_accept_channelCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, their_features: LDKInitFeatures, msgPointer: UnsafePointer<LDKAcceptChannel>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "ChannelMessageHandler.swift::handle_accept_channel")
			let msg = AcceptChannel(pointer: msgPointer.pointee).dangle().clone();

			return instance.handle_accept_channel(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), their_features: InitFeatures(pointer: their_features), msg: msg)
		}

		func handle_funding_createdCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msgPointer: UnsafePointer<LDKFundingCreated>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "ChannelMessageHandler.swift::handle_funding_created")
			let msg = FundingCreated(pointer: msgPointer.pointee).dangle().clone();

			return instance.handle_funding_created(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), msg: msg)
		}

		func handle_funding_signedCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msgPointer: UnsafePointer<LDKFundingSigned>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "ChannelMessageHandler.swift::handle_funding_signed")
			let msg = FundingSigned(pointer: msgPointer.pointee).dangle().clone();

			return instance.handle_funding_signed(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), msg: msg)
		}

		func handle_channel_readyCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msgPointer: UnsafePointer<LDKChannelReady>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "ChannelMessageHandler.swift::handle_channel_ready")
			let msg = ChannelReady(pointer: msgPointer.pointee).dangle().clone();

			return instance.handle_channel_ready(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), msg: msg)
		}

		func handle_shutdownCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, their_featuresPointer: UnsafePointer<LDKInitFeatures>, msgPointer: UnsafePointer<LDKShutdown>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "ChannelMessageHandler.swift::handle_shutdown")
			let their_features = InitFeatures(pointer: their_featuresPointer.pointee).dangle().clone();
let msg = Shutdown(pointer: msgPointer.pointee).dangle().clone();

			return instance.handle_shutdown(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), their_features: their_features, msg: msg)
		}

		func handle_closing_signedCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msgPointer: UnsafePointer<LDKClosingSigned>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "ChannelMessageHandler.swift::handle_closing_signed")
			let msg = ClosingSigned(pointer: msgPointer.pointee).dangle().clone();

			return instance.handle_closing_signed(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), msg: msg)
		}

		func handle_update_add_htlcCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msgPointer: UnsafePointer<LDKUpdateAddHTLC>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "ChannelMessageHandler.swift::handle_update_add_htlc")
			let msg = UpdateAddHTLC(pointer: msgPointer.pointee).dangle().clone();

			return instance.handle_update_add_htlc(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), msg: msg)
		}

		func handle_update_fulfill_htlcCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msgPointer: UnsafePointer<LDKUpdateFulfillHTLC>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "ChannelMessageHandler.swift::handle_update_fulfill_htlc")
			let msg = UpdateFulfillHTLC(pointer: msgPointer.pointee).dangle().clone();

			return instance.handle_update_fulfill_htlc(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), msg: msg)
		}

		func handle_update_fail_htlcCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msgPointer: UnsafePointer<LDKUpdateFailHTLC>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "ChannelMessageHandler.swift::handle_update_fail_htlc")
			let msg = UpdateFailHTLC(pointer: msgPointer.pointee).dangle().clone();

			return instance.handle_update_fail_htlc(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), msg: msg)
		}

		func handle_update_fail_malformed_htlcCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msgPointer: UnsafePointer<LDKUpdateFailMalformedHTLC>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "ChannelMessageHandler.swift::handle_update_fail_malformed_htlc")
			let msg = UpdateFailMalformedHTLC(pointer: msgPointer.pointee).dangle().clone();

			return instance.handle_update_fail_malformed_htlc(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), msg: msg)
		}

		func handle_commitment_signedCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msgPointer: UnsafePointer<LDKCommitmentSigned>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "ChannelMessageHandler.swift::handle_commitment_signed")
			let msg = CommitmentSigned(pointer: msgPointer.pointee).dangle().clone();

			return instance.handle_commitment_signed(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), msg: msg)
		}

		func handle_revoke_and_ackCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msgPointer: UnsafePointer<LDKRevokeAndACK>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "ChannelMessageHandler.swift::handle_revoke_and_ack")
			let msg = RevokeAndACK(pointer: msgPointer.pointee).dangle().clone();

			return instance.handle_revoke_and_ack(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), msg: msg)
		}

		func handle_update_feeCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msgPointer: UnsafePointer<LDKUpdateFee>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "ChannelMessageHandler.swift::handle_update_fee")
			let msg = UpdateFee(pointer: msgPointer.pointee).dangle().clone();

			return instance.handle_update_fee(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), msg: msg)
		}

		func handle_announcement_signaturesCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msgPointer: UnsafePointer<LDKAnnouncementSignatures>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "ChannelMessageHandler.swift::handle_announcement_signatures")
			let msg = AnnouncementSignatures(pointer: msgPointer.pointee).dangle().clone();

			return instance.handle_announcement_signatures(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), msg: msg)
		}

		func peer_disconnectedCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, no_connection_possible: Bool) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "ChannelMessageHandler.swift::peer_disconnected")
			
			return instance.peer_disconnected(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), no_connection_possible: no_connection_possible)
		}

		func peer_connectedCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msgPointer: UnsafePointer<LDKInit>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "ChannelMessageHandler.swift::peer_connected")
			let msg = Init(pointer: msgPointer.pointee).dangle().clone();

			return instance.peer_connected(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), msg: msg)
		}

		func handle_channel_reestablishCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msgPointer: UnsafePointer<LDKChannelReestablish>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "ChannelMessageHandler.swift::handle_channel_reestablish")
			let msg = ChannelReestablish(pointer: msgPointer.pointee).dangle().clone();

			return instance.handle_channel_reestablish(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), msg: msg)
		}

		func handle_channel_updateCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msgPointer: UnsafePointer<LDKChannelUpdate>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "ChannelMessageHandler.swift::handle_channel_update")
			let msg = ChannelUpdate(pointer: msgPointer.pointee).dangle().clone();

			return instance.handle_channel_update(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), msg: msg)
		}

		func handle_errorCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msgPointer: UnsafePointer<LDKErrorMessage>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "ChannelMessageHandler.swift::handle_error")
			let msg = ErrorMessage(pointer: msgPointer.pointee).dangle().clone();

			return instance.handle_error(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), msg: msg)
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "ChannelMessageHandler.swift::free")
			
			return instance.free()
		}

		/* NATIVE_CALLBACKS_END */

		super.init(conflictAvoidingVariableName: 0)
        self.cOpaqueStruct = LDKChannelMessageHandler(this_arg: Bindings.instanceToPointer(instance: self), 
			handle_open_channel: handle_open_channelCallback,
			handle_accept_channel: handle_accept_channelCallback,
			handle_funding_created: handle_funding_createdCallback,
			handle_funding_signed: handle_funding_signedCallback,
			handle_channel_ready: handle_channel_readyCallback,
			handle_shutdown: handle_shutdownCallback,
			handle_closing_signed: handle_closing_signedCallback,
			handle_update_add_htlc: handle_update_add_htlcCallback,
			handle_update_fulfill_htlc: handle_update_fulfill_htlcCallback,
			handle_update_fail_htlc: handle_update_fail_htlcCallback,
			handle_update_fail_malformed_htlc: handle_update_fail_malformed_htlcCallback,
			handle_commitment_signed: handle_commitment_signedCallback,
			handle_revoke_and_ack: handle_revoke_and_ackCallback,
			handle_update_fee: handle_update_feeCallback,
			handle_announcement_signatures: handle_announcement_signaturesCallback,
			peer_disconnected: peer_disconnectedCallback,
			peer_connected: peer_connectedCallback,
			handle_channel_reestablish: handle_channel_reestablishCallback,
			handle_channel_update: handle_channel_updateCallback,
			handle_error: handle_errorCallback,
			MessageSendEventsProvider: LDKMessageSendEventsProvider(),
			free: freeCallback)

    }

    public init(pointer: LDKChannelMessageHandler){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKChannelMessageHandler, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* SWIFT_CALLBACKS_START */



					internal func dangle() -> ChannelMessageHandler {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing ChannelMessageHandler \(self.instanceNumber).")
							// self.free()
						} else {
							Bindings.print("Not freeing ChannelMessageHandler \(self.instanceNumber) due to dangle.")
						}
					}
				

    open func handle_open_channel(their_node_id: [UInt8], their_features: InitFeatures, msg: OpenChannel) -> Void {
    	/* EDIT ME */
		Bindings.print("ChannelMessageHandler::handle_open_channel should be overridden!", severity: .WARNING)


    }

    open func handle_accept_channel(their_node_id: [UInt8], their_features: InitFeatures, msg: AcceptChannel) -> Void {
    	/* EDIT ME */
		Bindings.print("ChannelMessageHandler::handle_accept_channel should be overridden!", severity: .WARNING)


    }

    open func handle_funding_created(their_node_id: [UInt8], msg: FundingCreated) -> Void {
    	/* EDIT ME */
		Bindings.print("ChannelMessageHandler::handle_funding_created should be overridden!", severity: .WARNING)


    }

    open func handle_funding_signed(their_node_id: [UInt8], msg: FundingSigned) -> Void {
    	/* EDIT ME */
		Bindings.print("ChannelMessageHandler::handle_funding_signed should be overridden!", severity: .WARNING)


    }

    open func handle_channel_ready(their_node_id: [UInt8], msg: ChannelReady) -> Void {
    	/* EDIT ME */
		Bindings.print("ChannelMessageHandler::handle_channel_ready should be overridden!", severity: .WARNING)


    }

    open func handle_shutdown(their_node_id: [UInt8], their_features: InitFeatures, msg: Shutdown) -> Void {
    	/* EDIT ME */
		Bindings.print("ChannelMessageHandler::handle_shutdown should be overridden!", severity: .WARNING)


    }

    open func handle_closing_signed(their_node_id: [UInt8], msg: ClosingSigned) -> Void {
    	/* EDIT ME */
		Bindings.print("ChannelMessageHandler::handle_closing_signed should be overridden!", severity: .WARNING)


    }

    open func handle_update_add_htlc(their_node_id: [UInt8], msg: UpdateAddHTLC) -> Void {
    	/* EDIT ME */
		Bindings.print("ChannelMessageHandler::handle_update_add_htlc should be overridden!", severity: .WARNING)


    }

    open func handle_update_fulfill_htlc(their_node_id: [UInt8], msg: UpdateFulfillHTLC) -> Void {
    	/* EDIT ME */
		Bindings.print("ChannelMessageHandler::handle_update_fulfill_htlc should be overridden!", severity: .WARNING)


    }

    open func handle_update_fail_htlc(their_node_id: [UInt8], msg: UpdateFailHTLC) -> Void {
    	/* EDIT ME */
		Bindings.print("ChannelMessageHandler::handle_update_fail_htlc should be overridden!", severity: .WARNING)


    }

    open func handle_update_fail_malformed_htlc(their_node_id: [UInt8], msg: UpdateFailMalformedHTLC) -> Void {
    	/* EDIT ME */
		Bindings.print("ChannelMessageHandler::handle_update_fail_malformed_htlc should be overridden!", severity: .WARNING)


    }

    open func handle_commitment_signed(their_node_id: [UInt8], msg: CommitmentSigned) -> Void {
    	/* EDIT ME */
		Bindings.print("ChannelMessageHandler::handle_commitment_signed should be overridden!", severity: .WARNING)


    }

    open func handle_revoke_and_ack(their_node_id: [UInt8], msg: RevokeAndACK) -> Void {
    	/* EDIT ME */
		Bindings.print("ChannelMessageHandler::handle_revoke_and_ack should be overridden!", severity: .WARNING)


    }

    open func handle_update_fee(their_node_id: [UInt8], msg: UpdateFee) -> Void {
    	/* EDIT ME */
		Bindings.print("ChannelMessageHandler::handle_update_fee should be overridden!", severity: .WARNING)


    }

    open func handle_announcement_signatures(their_node_id: [UInt8], msg: AnnouncementSignatures) -> Void {
    	/* EDIT ME */
		Bindings.print("ChannelMessageHandler::handle_announcement_signatures should be overridden!", severity: .WARNING)


    }

    open func peer_disconnected(their_node_id: [UInt8], no_connection_possible: Bool) -> Void {
    	/* EDIT ME */
		Bindings.print("ChannelMessageHandler::peer_disconnected should be overridden!", severity: .WARNING)


    }

    open func peer_connected(their_node_id: [UInt8], msg: Init) -> Void {
    	/* EDIT ME */
		Bindings.print("ChannelMessageHandler::peer_connected should be overridden!", severity: .WARNING)


    }

    open func handle_channel_reestablish(their_node_id: [UInt8], msg: ChannelReestablish) -> Void {
    	/* EDIT ME */
		Bindings.print("ChannelMessageHandler::handle_channel_reestablish should be overridden!", severity: .WARNING)


    }

    open func handle_channel_update(their_node_id: [UInt8], msg: ChannelUpdate) -> Void {
    	/* EDIT ME */
		Bindings.print("ChannelMessageHandler::handle_channel_update should be overridden!", severity: .WARNING)


    }

    open func handle_error(their_node_id: [UInt8], msg: ErrorMessage) -> Void {
    	/* EDIT ME */
		Bindings.print("ChannelMessageHandler::handle_error should be overridden!", severity: .WARNING)


    }

    open func free() -> Void {
    	/* EDIT ME */
		
					Bindings.print("Deactivating ChannelMessageHandler \(self.instanceNumber).")
					Bindings.removeInstancePointer(instance: self)
				
    }

    /* SWIFT_CALLBACKS_END */

}


public class NativelyImplementedChannelMessageHandler: ChannelMessageHandler {
	/* SWIFT_DEFAULT_CALLBACKS_START */

	public override func handle_open_channel(their_node_id: [UInt8], their_features: InitFeatures, msg: OpenChannel) -> Void {
		
				
				withUnsafePointer(to: msg.cOpaqueStruct!) { (msgPointer: UnsafePointer<LDKOpenChannel>) in

				self.cOpaqueStruct!.handle_open_channel(self.cOpaqueStruct!.this_arg, Bindings.new_LDKPublicKey(array: their_node_id), their_features.danglingClone().cOpaqueStruct!, msgPointer)
				
}
			
	}

	public override func handle_accept_channel(their_node_id: [UInt8], their_features: InitFeatures, msg: AcceptChannel) -> Void {
		
				
				withUnsafePointer(to: msg.cOpaqueStruct!) { (msgPointer: UnsafePointer<LDKAcceptChannel>) in

				self.cOpaqueStruct!.handle_accept_channel(self.cOpaqueStruct!.this_arg, Bindings.new_LDKPublicKey(array: their_node_id), their_features.danglingClone().cOpaqueStruct!, msgPointer)
				
}
			
	}

	public override func handle_funding_created(their_node_id: [UInt8], msg: FundingCreated) -> Void {
		
				
				withUnsafePointer(to: msg.cOpaqueStruct!) { (msgPointer: UnsafePointer<LDKFundingCreated>) in

				self.cOpaqueStruct!.handle_funding_created(self.cOpaqueStruct!.this_arg, Bindings.new_LDKPublicKey(array: their_node_id), msgPointer)
				
}
			
	}

	public override func handle_funding_signed(their_node_id: [UInt8], msg: FundingSigned) -> Void {
		
				
				withUnsafePointer(to: msg.cOpaqueStruct!) { (msgPointer: UnsafePointer<LDKFundingSigned>) in

				self.cOpaqueStruct!.handle_funding_signed(self.cOpaqueStruct!.this_arg, Bindings.new_LDKPublicKey(array: their_node_id), msgPointer)
				
}
			
	}

	public override func handle_channel_ready(their_node_id: [UInt8], msg: ChannelReady) -> Void {
		
				
				withUnsafePointer(to: msg.cOpaqueStruct!) { (msgPointer: UnsafePointer<LDKChannelReady>) in

				self.cOpaqueStruct!.handle_channel_ready(self.cOpaqueStruct!.this_arg, Bindings.new_LDKPublicKey(array: their_node_id), msgPointer)
				
}
			
	}

	public override func handle_shutdown(their_node_id: [UInt8], their_features: InitFeatures, msg: Shutdown) -> Void {
		
				
				withUnsafePointer(to: their_features.cOpaqueStruct!) { (their_featuresPointer: UnsafePointer<LDKInitFeatures>) in
withUnsafePointer(to: msg.cOpaqueStruct!) { (msgPointer: UnsafePointer<LDKShutdown>) in

				self.cOpaqueStruct!.handle_shutdown(self.cOpaqueStruct!.this_arg, Bindings.new_LDKPublicKey(array: their_node_id), their_featuresPointer, msgPointer)
				
}
}
			
	}

	public override func handle_closing_signed(their_node_id: [UInt8], msg: ClosingSigned) -> Void {
		
				
				withUnsafePointer(to: msg.cOpaqueStruct!) { (msgPointer: UnsafePointer<LDKClosingSigned>) in

				self.cOpaqueStruct!.handle_closing_signed(self.cOpaqueStruct!.this_arg, Bindings.new_LDKPublicKey(array: their_node_id), msgPointer)
				
}
			
	}

	public override func handle_update_add_htlc(their_node_id: [UInt8], msg: UpdateAddHTLC) -> Void {
		
				
				withUnsafePointer(to: msg.cOpaqueStruct!) { (msgPointer: UnsafePointer<LDKUpdateAddHTLC>) in

				self.cOpaqueStruct!.handle_update_add_htlc(self.cOpaqueStruct!.this_arg, Bindings.new_LDKPublicKey(array: their_node_id), msgPointer)
				
}
			
	}

	public override func handle_update_fulfill_htlc(their_node_id: [UInt8], msg: UpdateFulfillHTLC) -> Void {
		
				
				withUnsafePointer(to: msg.cOpaqueStruct!) { (msgPointer: UnsafePointer<LDKUpdateFulfillHTLC>) in

				self.cOpaqueStruct!.handle_update_fulfill_htlc(self.cOpaqueStruct!.this_arg, Bindings.new_LDKPublicKey(array: their_node_id), msgPointer)
				
}
			
	}

	public override func handle_update_fail_htlc(their_node_id: [UInt8], msg: UpdateFailHTLC) -> Void {
		
				
				withUnsafePointer(to: msg.cOpaqueStruct!) { (msgPointer: UnsafePointer<LDKUpdateFailHTLC>) in

				self.cOpaqueStruct!.handle_update_fail_htlc(self.cOpaqueStruct!.this_arg, Bindings.new_LDKPublicKey(array: their_node_id), msgPointer)
				
}
			
	}

	public override func handle_update_fail_malformed_htlc(their_node_id: [UInt8], msg: UpdateFailMalformedHTLC) -> Void {
		
				
				withUnsafePointer(to: msg.cOpaqueStruct!) { (msgPointer: UnsafePointer<LDKUpdateFailMalformedHTLC>) in

				self.cOpaqueStruct!.handle_update_fail_malformed_htlc(self.cOpaqueStruct!.this_arg, Bindings.new_LDKPublicKey(array: their_node_id), msgPointer)
				
}
			
	}

	public override func handle_commitment_signed(their_node_id: [UInt8], msg: CommitmentSigned) -> Void {
		
				
				withUnsafePointer(to: msg.cOpaqueStruct!) { (msgPointer: UnsafePointer<LDKCommitmentSigned>) in

				self.cOpaqueStruct!.handle_commitment_signed(self.cOpaqueStruct!.this_arg, Bindings.new_LDKPublicKey(array: their_node_id), msgPointer)
				
}
			
	}

	public override func handle_revoke_and_ack(their_node_id: [UInt8], msg: RevokeAndACK) -> Void {
		
				
				withUnsafePointer(to: msg.cOpaqueStruct!) { (msgPointer: UnsafePointer<LDKRevokeAndACK>) in

				self.cOpaqueStruct!.handle_revoke_and_ack(self.cOpaqueStruct!.this_arg, Bindings.new_LDKPublicKey(array: their_node_id), msgPointer)
				
}
			
	}

	public override func handle_update_fee(their_node_id: [UInt8], msg: UpdateFee) -> Void {
		
				
				withUnsafePointer(to: msg.cOpaqueStruct!) { (msgPointer: UnsafePointer<LDKUpdateFee>) in

				self.cOpaqueStruct!.handle_update_fee(self.cOpaqueStruct!.this_arg, Bindings.new_LDKPublicKey(array: their_node_id), msgPointer)
				
}
			
	}

	public override func handle_announcement_signatures(their_node_id: [UInt8], msg: AnnouncementSignatures) -> Void {
		
				
				withUnsafePointer(to: msg.cOpaqueStruct!) { (msgPointer: UnsafePointer<LDKAnnouncementSignatures>) in

				self.cOpaqueStruct!.handle_announcement_signatures(self.cOpaqueStruct!.this_arg, Bindings.new_LDKPublicKey(array: their_node_id), msgPointer)
				
}
			
	}

	public override func peer_disconnected(their_node_id: [UInt8], no_connection_possible: Bool) -> Void {
		
				
				
				self.cOpaqueStruct!.peer_disconnected(self.cOpaqueStruct!.this_arg, Bindings.new_LDKPublicKey(array: their_node_id), no_connection_possible)
				
			
	}

	public override func peer_connected(their_node_id: [UInt8], msg: Init) -> Void {
		
				
				withUnsafePointer(to: msg.cOpaqueStruct!) { (msgPointer: UnsafePointer<LDKInit>) in

				self.cOpaqueStruct!.peer_connected(self.cOpaqueStruct!.this_arg, Bindings.new_LDKPublicKey(array: their_node_id), msgPointer)
				
}
			
	}

	public override func handle_channel_reestablish(their_node_id: [UInt8], msg: ChannelReestablish) -> Void {
		
				
				withUnsafePointer(to: msg.cOpaqueStruct!) { (msgPointer: UnsafePointer<LDKChannelReestablish>) in

				self.cOpaqueStruct!.handle_channel_reestablish(self.cOpaqueStruct!.this_arg, Bindings.new_LDKPublicKey(array: their_node_id), msgPointer)
				
}
			
	}

	public override func handle_channel_update(their_node_id: [UInt8], msg: ChannelUpdate) -> Void {
		
				
				withUnsafePointer(to: msg.cOpaqueStruct!) { (msgPointer: UnsafePointer<LDKChannelUpdate>) in

				self.cOpaqueStruct!.handle_channel_update(self.cOpaqueStruct!.this_arg, Bindings.new_LDKPublicKey(array: their_node_id), msgPointer)
				
}
			
	}

	public override func handle_error(their_node_id: [UInt8], msg: ErrorMessage) -> Void {
		
				
				withUnsafePointer(to: msg.cOpaqueStruct!) { (msgPointer: UnsafePointer<LDKErrorMessage>) in

				self.cOpaqueStruct!.handle_error(self.cOpaqueStruct!.this_arg, Bindings.new_LDKPublicKey(array: their_node_id), msgPointer)
				
}
			
	}

	public override func free() -> Void {
		
				
				
				self.cOpaqueStruct!.free(self.cOpaqueStruct!.this_arg)
				
			
	}

	/* SWIFT_DEFAULT_CALLBACKS_END */
}
