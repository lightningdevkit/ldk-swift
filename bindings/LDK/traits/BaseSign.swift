class BaseSign {

    var cOpaqueStruct: LDKBaseSign?;

    init() {

    	/* NATIVE_CALLBACKS_START */

		func get_per_commitment_pointCallback(pointer: UnsafeRawPointer?, idx: UInt64) -> LDKPublicKey {
			let instance: BaseSign = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			return Bindings.new_LDKPublicKey(array: instance.get_per_commitment_point(idx: idx));
		}

		func release_commitment_secretCallback(pointer: UnsafeRawPointer?, idx: UInt64) -> LDKThirtyTwoBytes {
			let instance: BaseSign = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			return Bindings.new_LDKThirtyTwoBytes(array: instance.release_commitment_secret(idx: idx));
		}

		func channel_keys_idCallback(pointer: UnsafeRawPointer?) -> LDKThirtyTwoBytes {
			let instance: BaseSign = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			return Bindings.new_LDKThirtyTwoBytes(array: instance.channel_keys_id());
		}

		func sign_counterparty_commitmentCallback(pointer: UnsafeRawPointer?, commitment_tx: UnsafePointer<LDKCommitmentTransaction>) -> LDKCResult_C2Tuple_SignatureCVec_SignatureZZNoneZ {
			let instance: BaseSign = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			return instance.sign_counterparty_commitment(commitment_tx: commitment_tx).cOpaqueStruct!;
		}

		func sign_holder_commitment_and_htlcsCallback(pointer: UnsafeRawPointer?, commitment_tx: UnsafePointer<LDKHolderCommitmentTransaction>) -> LDKCResult_C2Tuple_SignatureCVec_SignatureZZNoneZ {
			let instance: BaseSign = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			return instance.sign_holder_commitment_and_htlcs(commitment_tx: commitment_tx).cOpaqueStruct!;
		}

		func sign_justice_transactionCallback(pointer: UnsafeRawPointer?, justice_tx: LDKTransaction, input: UInt, amount: UInt64, per_commitment_key: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>?, htlc: UnsafePointer<LDKHTLCOutputInCommitment>) -> LDKCResult_SignatureNoneZ {
			let instance: BaseSign = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			return instance.sign_justice_transaction(justice_tx: justice_tx, input: input, amount: amount, per_commitment_key: per_commitment_key, htlc: htlc).cOpaqueStruct!;
		}

		func sign_counterparty_htlc_transactionCallback(pointer: UnsafeRawPointer?, htlc_tx: LDKTransaction, input: UInt, amount: UInt64, per_commitment_point: LDKPublicKey, htlc: UnsafePointer<LDKHTLCOutputInCommitment>) -> LDKCResult_SignatureNoneZ {
			let instance: BaseSign = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			return instance.sign_counterparty_htlc_transaction(htlc_tx: htlc_tx, input: input, amount: amount, per_commitment_point: per_commitment_point, htlc: htlc).cOpaqueStruct!;
		}

		func sign_closing_transactionCallback(pointer: UnsafeRawPointer?, closing_tx: LDKTransaction) -> LDKCResult_SignatureNoneZ {
			let instance: BaseSign = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			return instance.sign_closing_transaction(closing_tx: closing_tx).cOpaqueStruct!;
		}

		func sign_channel_announcementCallback(pointer: UnsafeRawPointer?, msg: UnsafePointer<LDKUnsignedChannelAnnouncement>) -> LDKCResult_SignatureNoneZ {
			let instance: BaseSign = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			return instance.sign_channel_announcement(msg: msg).cOpaqueStruct!;
		}

		func ready_channelCallback(pointer: UnsafeMutableRawPointer?, channel_parameters: UnsafePointer<LDKChannelTransactionParameters>) -> Void {
			let instance: BaseSign = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			return instance.ready_channel(channel_parameters: channel_parameters);
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: BaseSign = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			return instance.free();
		}

		/* NATIVE_CALLBACKS_END */

        self.cOpaqueStruct = LDKBaseSign(this_arg: Bindings.instanceToPointer(instance: self), 
			get_per_commitment_point: get_per_commitment_pointCallback,
			release_commitment_secret: release_commitment_secretCallback,
			pubkeys: LDKChannelPublicKeys(),
			set_pubkeys: nil,
			channel_keys_id: channel_keys_idCallback,
			sign_counterparty_commitment: sign_counterparty_commitmentCallback,
			sign_holder_commitment_and_htlcs: sign_holder_commitment_and_htlcsCallback,
			sign_justice_transaction: sign_justice_transactionCallback,
			sign_counterparty_htlc_transaction: sign_counterparty_htlc_transactionCallback,
			sign_closing_transaction: sign_closing_transactionCallback,
			sign_channel_announcement: sign_channel_announcementCallback,
			ready_channel: ready_channelCallback,
			free: freeCallback)
    }

    init(pointer: LDKBaseSign){
		self.cOpaqueStruct = pointer
	}

    /* SWIFT_CALLBACKS_START */

    func get_per_commitment_point(idx: UInt64) -> [UInt8] {
    	/* EDIT ME */
		return [UInt8]()
    }

    func release_commitment_secret(idx: UInt64) -> [UInt8] {
    	/* EDIT ME */
		return [UInt8]()
    }

    func channel_keys_id() -> [UInt8] {
    	/* EDIT ME */
		return [UInt8]()
    }

    func sign_counterparty_commitment(commitment_tx: UnsafePointer<LDKCommitmentTransaction>) -> Result_C2Tuple_SignatureCVec_SignatureZZNoneZ {
    	/* EDIT ME */
		return Result_C2Tuple_SignatureCVec_SignatureZZNoneZ(pointer: LDKCResult_C2Tuple_SignatureCVec_SignatureZZNoneZ())
    }

    func sign_holder_commitment_and_htlcs(commitment_tx: UnsafePointer<LDKHolderCommitmentTransaction>) -> Result_C2Tuple_SignatureCVec_SignatureZZNoneZ {
    	/* EDIT ME */
		return Result_C2Tuple_SignatureCVec_SignatureZZNoneZ(pointer: LDKCResult_C2Tuple_SignatureCVec_SignatureZZNoneZ())
    }

    func sign_justice_transaction(justice_tx: LDKTransaction, input: UInt, amount: UInt64, per_commitment_key: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>?, htlc: UnsafePointer<LDKHTLCOutputInCommitment>) -> Result_SignatureNoneZ {
    	/* EDIT ME */
		return Result_SignatureNoneZ(pointer: LDKCResult_SignatureNoneZ())
    }

    func sign_counterparty_htlc_transaction(htlc_tx: LDKTransaction, input: UInt, amount: UInt64, per_commitment_point: LDKPublicKey, htlc: UnsafePointer<LDKHTLCOutputInCommitment>) -> Result_SignatureNoneZ {
    	/* EDIT ME */
		return Result_SignatureNoneZ(pointer: LDKCResult_SignatureNoneZ())
    }

    func sign_closing_transaction(closing_tx: LDKTransaction) -> Result_SignatureNoneZ {
    	/* EDIT ME */
		return Result_SignatureNoneZ(pointer: LDKCResult_SignatureNoneZ())
    }

    func sign_channel_announcement(msg: UnsafePointer<LDKUnsignedChannelAnnouncement>) -> Result_SignatureNoneZ {
    	/* EDIT ME */
		return Result_SignatureNoneZ(pointer: LDKCResult_SignatureNoneZ())
    }

    func ready_channel(channel_parameters: UnsafePointer<LDKChannelTransactionParameters>) -> Void {
    	/* EDIT ME */
		
    }

    func free() -> Void {
    	/* EDIT ME */
		
    }

    /* SWIFT_CALLBACKS_END */

}
