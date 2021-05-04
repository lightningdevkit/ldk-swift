class ChannelMessageHandler {

    var cOpaqueStruct: LDKChannelMessageHandler?;

    init() {

    	/* NATIVE_CALLBACKS_START */

		func handle_open_channelCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, their_features: LDKInitFeatures, msg: UnsafePointer<LDKOpenChannel>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.handle_open_channel(their_node_id: their_node_id, their_features: their_features, msg: msg);
		}

		func handle_accept_channelCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, their_features: LDKInitFeatures, msg: UnsafePointer<LDKAcceptChannel>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.handle_accept_channel(their_node_id: their_node_id, their_features: their_features, msg: msg);
		}

		func handle_funding_createdCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msg: UnsafePointer<LDKFundingCreated>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.handle_funding_created(their_node_id: their_node_id, msg: msg);
		}

		func handle_funding_signedCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msg: UnsafePointer<LDKFundingSigned>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.handle_funding_signed(their_node_id: their_node_id, msg: msg);
		}

		func handle_funding_lockedCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msg: UnsafePointer<LDKFundingLocked>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.handle_funding_locked(their_node_id: their_node_id, msg: msg);
		}

		func handle_shutdownCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, their_features: UnsafePointer<LDKInitFeatures>, msg: UnsafePointer<LDKShutdown>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.handle_shutdown(their_node_id: their_node_id, their_features: their_features, msg: msg);
		}

		func handle_closing_signedCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msg: UnsafePointer<LDKClosingSigned>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.handle_closing_signed(their_node_id: their_node_id, msg: msg);
		}

		func handle_update_add_htlcCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msg: UnsafePointer<LDKUpdateAddHTLC>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.handle_update_add_htlc(their_node_id: their_node_id, msg: msg);
		}

		func handle_update_fulfill_htlcCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msg: UnsafePointer<LDKUpdateFulfillHTLC>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.handle_update_fulfill_htlc(their_node_id: their_node_id, msg: msg);
		}

		func handle_update_fail_htlcCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msg: UnsafePointer<LDKUpdateFailHTLC>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.handle_update_fail_htlc(their_node_id: their_node_id, msg: msg);
		}

		func handle_update_fail_malformed_htlcCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msg: UnsafePointer<LDKUpdateFailMalformedHTLC>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.handle_update_fail_malformed_htlc(their_node_id: their_node_id, msg: msg);
		}

		func handle_commitment_signedCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msg: UnsafePointer<LDKCommitmentSigned>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.handle_commitment_signed(their_node_id: their_node_id, msg: msg);
		}

		func handle_revoke_and_ackCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msg: UnsafePointer<LDKRevokeAndACK>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.handle_revoke_and_ack(their_node_id: their_node_id, msg: msg);
		}

		func handle_update_feeCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msg: UnsafePointer<LDKUpdateFee>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.handle_update_fee(their_node_id: their_node_id, msg: msg);
		}

		func handle_announcement_signaturesCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msg: UnsafePointer<LDKAnnouncementSignatures>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.handle_announcement_signatures(their_node_id: their_node_id, msg: msg);
		}

		func peer_disconnectedCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, no_connection_possible: Bool) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.peer_disconnected(their_node_id: their_node_id, no_connection_possible: no_connection_possible);
		}

		func peer_connectedCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msg: UnsafePointer<LDKInit>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.peer_connected(their_node_id: their_node_id, msg: msg);
		}

		func handle_channel_reestablishCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msg: UnsafePointer<LDKChannelReestablish>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.handle_channel_reestablish(their_node_id: their_node_id, msg: msg);
		}

		func handle_channel_updateCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msg: UnsafePointer<LDKChannelUpdate>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.handle_channel_update(their_node_id: their_node_id, msg: msg);
		}

		func handle_errorCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msg: UnsafePointer<LDKErrorMessage>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.handle_error(their_node_id: their_node_id, msg: msg);
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.free();
		}

		/* NATIVE_CALLBACKS_END */

        self.cOpaqueStruct = LDKChannelMessageHandler(this_arg: Bindings.instanceToPointer(instance: self), handle_open_channel: handle_open_channelCallback,
			handle_accept_channel: handle_accept_channelCallback,
			handle_funding_created: handle_funding_createdCallback,
			handle_funding_signed: handle_funding_signedCallback,
			handle_funding_locked: handle_funding_lockedCallback,
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

    init(pointer: LDKChannelMessageHandler){
		self.cOpaqueStruct = pointer
	}

    /* SWIFT_CALLBACKS_START */

    func handle_open_channel(their_node_id: LDKPublicKey, their_features: LDKInitFeatures, msg: UnsafePointer<LDKOpenChannel>) -> Void {
    	/* EDIT ME */
    }

    func handle_accept_channel(their_node_id: LDKPublicKey, their_features: LDKInitFeatures, msg: UnsafePointer<LDKAcceptChannel>) -> Void {
    	/* EDIT ME */
    }

    func handle_funding_created(their_node_id: LDKPublicKey, msg: UnsafePointer<LDKFundingCreated>) -> Void {
    	/* EDIT ME */
    }

    func handle_funding_signed(their_node_id: LDKPublicKey, msg: UnsafePointer<LDKFundingSigned>) -> Void {
    	/* EDIT ME */
    }

    func handle_funding_locked(their_node_id: LDKPublicKey, msg: UnsafePointer<LDKFundingLocked>) -> Void {
    	/* EDIT ME */
    }

    func handle_shutdown(their_node_id: LDKPublicKey, their_features: UnsafePointer<LDKInitFeatures>, msg: UnsafePointer<LDKShutdown>) -> Void {
    	/* EDIT ME */
    }

    func handle_closing_signed(their_node_id: LDKPublicKey, msg: UnsafePointer<LDKClosingSigned>) -> Void {
    	/* EDIT ME */
    }

    func handle_update_add_htlc(their_node_id: LDKPublicKey, msg: UnsafePointer<LDKUpdateAddHTLC>) -> Void {
    	/* EDIT ME */
    }

    func handle_update_fulfill_htlc(their_node_id: LDKPublicKey, msg: UnsafePointer<LDKUpdateFulfillHTLC>) -> Void {
    	/* EDIT ME */
    }

    func handle_update_fail_htlc(their_node_id: LDKPublicKey, msg: UnsafePointer<LDKUpdateFailHTLC>) -> Void {
    	/* EDIT ME */
    }

    func handle_update_fail_malformed_htlc(their_node_id: LDKPublicKey, msg: UnsafePointer<LDKUpdateFailMalformedHTLC>) -> Void {
    	/* EDIT ME */
    }

    func handle_commitment_signed(their_node_id: LDKPublicKey, msg: UnsafePointer<LDKCommitmentSigned>) -> Void {
    	/* EDIT ME */
    }

    func handle_revoke_and_ack(their_node_id: LDKPublicKey, msg: UnsafePointer<LDKRevokeAndACK>) -> Void {
    	/* EDIT ME */
    }

    func handle_update_fee(their_node_id: LDKPublicKey, msg: UnsafePointer<LDKUpdateFee>) -> Void {
    	/* EDIT ME */
    }

    func handle_announcement_signatures(their_node_id: LDKPublicKey, msg: UnsafePointer<LDKAnnouncementSignatures>) -> Void {
    	/* EDIT ME */
    }

    func peer_disconnected(their_node_id: LDKPublicKey, no_connection_possible: Bool) -> Void {
    	/* EDIT ME */
    }

    func peer_connected(their_node_id: LDKPublicKey, msg: UnsafePointer<LDKInit>) -> Void {
    	/* EDIT ME */
    }

    func handle_channel_reestablish(their_node_id: LDKPublicKey, msg: UnsafePointer<LDKChannelReestablish>) -> Void {
    	/* EDIT ME */
    }

    func handle_channel_update(their_node_id: LDKPublicKey, msg: UnsafePointer<LDKChannelUpdate>) -> Void {
    	/* EDIT ME */
    }

    func handle_error(their_node_id: LDKPublicKey, msg: UnsafePointer<LDKErrorMessage>) -> Void {
    	/* EDIT ME */
    }

    func free() -> Void {
    	/* EDIT ME */
    }

    /* SWIFT_CALLBACKS_END */

}
