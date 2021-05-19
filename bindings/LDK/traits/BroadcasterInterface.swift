open class BroadcasterInterface {

    public var cOpaqueStruct: LDKBroadcasterInterface?;

    public init() {

    	/* NATIVE_CALLBACKS_START */

		func broadcast_transactionCallback(pointer: UnsafeRawPointer?, tx: LDKTransaction) -> Void {
			let instance: BroadcasterInterface = Bindings.pointerToInstance(pointer: pointer!)
			
			return instance.broadcast_transaction(tx: Bindings.LDKTransaction_to_array(nativeType: tx));
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: BroadcasterInterface = Bindings.pointerToInstance(pointer: pointer!)
			
			return instance.free();
		}

		/* NATIVE_CALLBACKS_END */

        self.cOpaqueStruct = LDKBroadcasterInterface(this_arg: Bindings.instanceToPointer(instance: self), 
			broadcast_transaction: broadcast_transactionCallback,
			free: freeCallback)
    }

    public init(pointer: LDKBroadcasterInterface){
		self.cOpaqueStruct = pointer
	}

    /* SWIFT_CALLBACKS_START */

    open func broadcast_transaction(tx: [UInt8]) -> Void {
    	/* EDIT ME */
		
    }

    open func free() -> Void {
    	/* EDIT ME */
		
    }

    /* SWIFT_CALLBACKS_END */

}
