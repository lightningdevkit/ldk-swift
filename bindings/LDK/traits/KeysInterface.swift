class KeysInterface {

    var cOpaqueStruct: LDKKeysInterface?;

    init() {

    	/* NATIVE_CALLBACKS_START */

		func get_node_secretCallback(pointer: UnsafeRawPointer?) -> LDKSecretKey {
			let instance: KeysInterface = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.get_node_secret();
		}

		func get_destination_scriptCallback(pointer: UnsafeRawPointer?) -> LDKCVec_u8Z {
			let instance: KeysInterface = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.get_destination_script();
		}

		func get_shutdown_pubkeyCallback(pointer: UnsafeRawPointer?) -> LDKPublicKey {
			let instance: KeysInterface = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.get_shutdown_pubkey();
		}

		func get_channel_signerCallback(pointer: UnsafeRawPointer?, inbound: Bool, channel_value_satoshis: UInt64) -> LDKSign {
			let instance: KeysInterface = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.get_channel_signer(inbound: inbound, channel_value_satoshis: channel_value_satoshis);
		}

		func get_secure_random_bytesCallback(pointer: UnsafeRawPointer?) -> LDKThirtyTwoBytes {
			let instance: KeysInterface = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.get_secure_random_bytes();
		}

		func read_chan_signerCallback(pointer: UnsafeRawPointer?, reader: LDKu8slice) -> LDKCResult_SignDecodeErrorZ {
			let instance: KeysInterface = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.read_chan_signer(reader: reader);
		}

		func sign_invoiceCallback(pointer: UnsafeRawPointer?, invoice_preimage: LDKCVec_u8Z) -> LDKCResult_RecoverableSignatureNoneZ {
			let instance: KeysInterface = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.sign_invoice(invoice_preimage: invoice_preimage);
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: KeysInterface = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.free();
		}

		/* NATIVE_CALLBACKS_END */

        self.cOpaqueStruct = LDKKeysInterface(this_arg: Bindings.instanceToPointer(instance: self), get_node_secret: get_node_secretCallback,
			get_destination_script: get_destination_scriptCallback,
			get_shutdown_pubkey: get_shutdown_pubkeyCallback,
			get_channel_signer: get_channel_signerCallback,
			get_secure_random_bytes: get_secure_random_bytesCallback,
			read_chan_signer: read_chan_signerCallback,
			sign_invoice: sign_invoiceCallback,
			free: freeCallback)
    }

    init(pointer: LDKKeysInterface){
		self.cOpaqueStruct = pointer
	}

    /* SWIFT_CALLBACKS_START */

    func get_node_secret() -> Void {
    	/* EDIT ME */
    }

    func get_destination_script() -> Void {
    	/* EDIT ME */
    }

    func get_shutdown_pubkey() -> Void {
    	/* EDIT ME */
    }

    func get_channel_signer(inbound: Bool, channel_value_satoshis: UInt64) -> Void {
    	/* EDIT ME */
    }

    func get_secure_random_bytes() -> Void {
    	/* EDIT ME */
    }

    func read_chan_signer(reader: LDKu8slice) -> Void {
    	/* EDIT ME */
    }

    func sign_invoice(invoice_preimage: LDKCVec_u8Z) -> Void {
    	/* EDIT ME */
    }

    func free() -> Void {
    	/* EDIT ME */
    }

    /* SWIFT_CALLBACKS_END */

}
