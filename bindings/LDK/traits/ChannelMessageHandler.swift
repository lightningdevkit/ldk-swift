public class ChannelMessageHandler {

    var cOpaqueStruct: LDKChannelMessageHandler?;

    init() {

    	/* NATIVE_CALLBACKS_START */

		func handle_open_channelCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, their_features: LDKInitFeatures, msgPointer: UnsafePointer<LDKOpenChannel>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			let msg = OpenChannel(pointer: msgPointer.pointee);

			return instance.handle_open_channel(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), their_features: InitFeatures(pointer: their_features), msg: msg);
		}

		func handle_accept_channelCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, their_features: LDKInitFeatures, msgPointer: UnsafePointer<LDKAcceptChannel>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			let msg = AcceptChannel(pointer: msgPointer.pointee);

			return instance.handle_accept_channel(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), their_features: InitFeatures(pointer: their_features), msg: msg);
		}

		func handle_funding_createdCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msgPointer: UnsafePointer<LDKFundingCreated>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			let msg = FundingCreated(pointer: msgPointer.pointee);

			return instance.handle_funding_created(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), msg: msg);
		}

		func handle_funding_signedCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msgPointer: UnsafePointer<LDKFundingSigned>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			let msg = FundingSigned(pointer: msgPointer.pointee);

			return instance.handle_funding_signed(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), msg: msg);
		}

		func handle_funding_lockedCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msgPointer: UnsafePointer<LDKFundingLocked>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			let msg = FundingLocked(pointer: msgPointer.pointee);

			return instance.handle_funding_locked(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), msg: msg);
		}

		func handle_shutdownCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, their_featuresPointer: UnsafePointer<LDKInitFeatures>, msgPointer: UnsafePointer<LDKShutdown>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			let their_features = InitFeatures(pointer: their_featuresPointer.pointee);
let msg = Shutdown(pointer: msgPointer.pointee);

			return instance.handle_shutdown(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), their_features: their_features, msg: msg);
		}

		func handle_closing_signedCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msgPointer: UnsafePointer<LDKClosingSigned>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			let msg = ClosingSigned(pointer: msgPointer.pointee);

			return instance.handle_closing_signed(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), msg: msg);
		}

		func handle_update_add_htlcCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msgPointer: UnsafePointer<LDKUpdateAddHTLC>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			let msg = UpdateAddHTLC(pointer: msgPointer.pointee);

			return instance.handle_update_add_htlc(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), msg: msg);
		}

		func handle_update_fulfill_htlcCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msgPointer: UnsafePointer<LDKUpdateFulfillHTLC>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			let msg = UpdateFulfillHTLC(pointer: msgPointer.pointee);

			return instance.handle_update_fulfill_htlc(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), msg: msg);
		}

		func handle_update_fail_htlcCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msgPointer: UnsafePointer<LDKUpdateFailHTLC>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			let msg = UpdateFailHTLC(pointer: msgPointer.pointee);

			return instance.handle_update_fail_htlc(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), msg: msg);
		}

		func handle_update_fail_malformed_htlcCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msgPointer: UnsafePointer<LDKUpdateFailMalformedHTLC>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			let msg = UpdateFailMalformedHTLC(pointer: msgPointer.pointee);

			return instance.handle_update_fail_malformed_htlc(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), msg: msg);
		}

		func handle_commitment_signedCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msgPointer: UnsafePointer<LDKCommitmentSigned>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			let msg = CommitmentSigned(pointer: msgPointer.pointee);

			return instance.handle_commitment_signed(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), msg: msg);
		}

		func handle_revoke_and_ackCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msgPointer: UnsafePointer<LDKRevokeAndACK>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			let msg = RevokeAndACK(pointer: msgPointer.pointee);

			return instance.handle_revoke_and_ack(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), msg: msg);
		}

		func handle_update_feeCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msgPointer: UnsafePointer<LDKUpdateFee>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			let msg = UpdateFee(pointer: msgPointer.pointee);

			return instance.handle_update_fee(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), msg: msg);
		}

		func handle_announcement_signaturesCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msgPointer: UnsafePointer<LDKAnnouncementSignatures>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			let msg = AnnouncementSignatures(pointer: msgPointer.pointee);

			return instance.handle_announcement_signatures(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), msg: msg);
		}

		func peer_disconnectedCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, no_connection_possible: Bool) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			
			return instance.peer_disconnected(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), no_connection_possible: no_connection_possible);
		}

		func peer_connectedCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msgPointer: UnsafePointer<LDKInit>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			let msg = Init(pointer: msgPointer.pointee);

			return instance.peer_connected(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), msg: msg);
		}

		func handle_channel_reestablishCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msgPointer: UnsafePointer<LDKChannelReestablish>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			let msg = ChannelReestablish(pointer: msgPointer.pointee);

			return instance.handle_channel_reestablish(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), msg: msg);
		}

		func handle_channel_updateCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msgPointer: UnsafePointer<LDKChannelUpdate>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			let msg = ChannelUpdate(pointer: msgPointer.pointee);

			return instance.handle_channel_update(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), msg: msg);
		}

		func handle_errorCallback(pointer: UnsafeRawPointer?, their_node_id: LDKPublicKey, msgPointer: UnsafePointer<LDKErrorMessage>) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			let msg = ErrorMessage(pointer: msgPointer.pointee);

			return instance.handle_error(their_node_id: Bindings.tuple33_to_array(nativeType: their_node_id.compressed_form), msg: msg);
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: ChannelMessageHandler = Bindings.pointerToInstance(pointer: pointer!)
			
			return instance.free();
		}

		/* NATIVE_CALLBACKS_END */

        self.cOpaqueStruct = LDKChannelMessageHandler(this_arg: Bindings.instanceToPointer(instance: self), 
			handle_open_channel: handle_open_channelCallback,
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

    public func handle_open_channel(their_node_id: [UInt8], their_features: InitFeatures, msg: OpenChannel) -> Void {
    	/* EDIT ME */
		
    }

    public func handle_accept_channel(their_node_id: [UInt8], their_features: InitFeatures, msg: AcceptChannel) -> Void {
    	/* EDIT ME */
		
    }

    public func handle_funding_created(their_node_id: [UInt8], msg: FundingCreated) -> Void {
    	/* EDIT ME */
		
    }

    public func handle_funding_signed(their_node_id: [UInt8], msg: FundingSigned) -> Void {
    	/* EDIT ME */
		
    }

    public func handle_funding_locked(their_node_id: [UInt8], msg: FundingLocked) -> Void {
    	/* EDIT ME */
		
    }

    public func handle_shutdown(their_node_id: [UInt8], their_features: InitFeatures, msg: Shutdown) -> Void {
    	/* EDIT ME */
		
    }

    public func handle_closing_signed(their_node_id: [UInt8], msg: ClosingSigned) -> Void {
    	/* EDIT ME */
		
    }

    public func handle_update_add_htlc(their_node_id: [UInt8], msg: UpdateAddHTLC) -> Void {
    	/* EDIT ME */
		
    }

    public func handle_update_fulfill_htlc(their_node_id: [UInt8], msg: UpdateFulfillHTLC) -> Void {
    	/* EDIT ME */
		
    }

    public func handle_update_fail_htlc(their_node_id: [UInt8], msg: UpdateFailHTLC) -> Void {
    	/* EDIT ME */
		
    }

    public func handle_update_fail_malformed_htlc(their_node_id: [UInt8], msg: UpdateFailMalformedHTLC) -> Void {
    	/* EDIT ME */
		
    }

    public func handle_commitment_signed(their_node_id: [UInt8], msg: CommitmentSigned) -> Void {
    	/* EDIT ME */
		
    }

    public func handle_revoke_and_ack(their_node_id: [UInt8], msg: RevokeAndACK) -> Void {
    	/* EDIT ME */
		
    }

    public func handle_update_fee(their_node_id: [UInt8], msg: UpdateFee) -> Void {
    	/* EDIT ME */
		
    }

    public func handle_announcement_signatures(their_node_id: [UInt8], msg: AnnouncementSignatures) -> Void {
    	/* EDIT ME */
		
    }

    public func peer_disconnected(their_node_id: [UInt8], no_connection_possible: Bool) -> Void {
    	/* EDIT ME */
		
    }

    public func peer_connected(their_node_id: [UInt8], msg: Init) -> Void {
    	/* EDIT ME */
		
    }

    public func handle_channel_reestablish(their_node_id: [UInt8], msg: ChannelReestablish) -> Void {
    	/* EDIT ME */
		
    }

    public func handle_channel_update(their_node_id: [UInt8], msg: ChannelUpdate) -> Void {
    	/* EDIT ME */
		
    }

    public func handle_error(their_node_id: [UInt8], msg: ErrorMessage) -> Void {
    	/* EDIT ME */
		
    }

    public func free() -> Void {
    	/* EDIT ME */
		
    }

    /* SWIFT_CALLBACKS_END */

}
