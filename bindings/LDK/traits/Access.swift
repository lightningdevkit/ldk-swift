class Access {

    var cOpaqueStruct: LDKAccess?;

    init() {

    	/* NATIVE_CALLBACKS_START */

		func get_utxoCallback(pointer: UnsafeRawPointer?, genesis_hash: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>?, short_channel_id: UInt64) -> LDKCResult_TxOutAccessErrorZ {
			let instance: Access = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			return instance.get_utxo(genesis_hash: genesis_hash, short_channel_id: short_channel_id).cOpaqueStruct!;
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: Access = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			return instance.free();
		}

		/* NATIVE_CALLBACKS_END */

        self.cOpaqueStruct = LDKAccess(this_arg: Bindings.instanceToPointer(instance: self), 
			get_utxo: get_utxoCallback,
			free: freeCallback)
    }

    init(pointer: LDKAccess){
		self.cOpaqueStruct = pointer
	}

    /* SWIFT_CALLBACKS_START */

    func get_utxo(genesis_hash: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>?, short_channel_id: UInt64) -> Result_TxOutAccessErrorZ {
    	/* EDIT ME */
		return Result_TxOutAccessErrorZ(pointer: LDKCResult_TxOutAccessErrorZ())
    }

    func free() -> Void {
    	/* EDIT ME */
		
    }

    /* SWIFT_CALLBACKS_END */

}
