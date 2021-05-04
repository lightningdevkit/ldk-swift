class BroadcasterInterface {

    var cOpaqueStruct: LDKBroadcasterInterface?;

    init() {

    	/* NATIVE_CALLBACKS_START */

		func broadcast_transactionCallback(pointer: UnsafeRawPointer?, tx: LDKTransaction) -> Void {
			let instance: BroadcasterInterface = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.broadcast_transaction(tx: tx);
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: BroadcasterInterface = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			instance.free();
		}

		/* NATIVE_CALLBACKS_END */

        self.cOpaqueStruct = LDKBroadcasterInterface(this_arg: Bindings.instanceToPointer(instance: self), broadcast_transaction: broadcast_transactionCallback,
			free: freeCallback)
    }

    init(pointer: LDKBroadcasterInterface){
		self.cOpaqueStruct = pointer
	}

    /* SWIFT_CALLBACKS_START */

    func broadcast_transaction(tx: LDKTransaction) -> Void {
    	/* EDIT ME */
    }

    func free() -> Void {
    	/* EDIT ME */
    }

    /* SWIFT_CALLBACKS_END */

}
