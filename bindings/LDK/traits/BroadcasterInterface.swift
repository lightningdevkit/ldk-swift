open class BroadcasterInterface {

    public var cOpaqueStruct: LDKBroadcasterInterface?;

    public init() {

    	/* NATIVE_CALLBACKS_START */

		func broadcast_transactionCallback(pointer: UnsafeRawPointer?, tx: LDKTransaction) -> Void {
			let instance: BroadcasterInterface = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "BroadcasterInterface.swift::broadcast_transaction")
			
			return instance.broadcast_transaction(tx: Bindings.LDKTransaction_to_array(nativeType: tx));
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: BroadcasterInterface = Bindings.pointerToInstance(pointer: pointer!, sourceMarker: "BroadcasterInterface.swift::free")
			
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


public class NativelyImplementedBroadcasterInterface: BroadcasterInterface {
	/* SWIFT_DEFAULT_CALLBACKS_START */

	public override func broadcast_transaction(tx: [UInt8]) -> Void {
		
				
				self.cOpaqueStruct!.broadcast_transaction(self.cOpaqueStruct!.this_arg, Bindings.new_LDKTransaction(array: tx))
				
			
	}

	public override func free() -> Void {
		
				
				self.cOpaqueStruct!.free(self.cOpaqueStruct!.this_arg)
				
			
	}

	/* SWIFT_DEFAULT_CALLBACKS_END */
}
