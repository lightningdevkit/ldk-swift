public class Filter {

    var cOpaqueStruct: LDKFilter?;

    init() {

    	/* NATIVE_CALLBACKS_START */

		func register_txCallback(pointer: UnsafeRawPointer?, txid: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>?, script_pubkey: LDKu8slice) -> Void {
			let instance: Filter = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			return instance.register_tx(txid: txid, script_pubkey: script_pubkey);
		}

		func register_outputCallback(pointer: UnsafeRawPointer?, output: LDKWatchedOutput) -> LDKCOption_C2Tuple_usizeTransactionZZ {
			let instance: Filter = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			return instance.register_output(output: output).cOpaqueStruct!;
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: Filter = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			return instance.free();
		}

		/* NATIVE_CALLBACKS_END */

        self.cOpaqueStruct = LDKFilter(this_arg: Bindings.instanceToPointer(instance: self), 
			register_tx: register_txCallback,
			register_output: register_outputCallback,
			free: freeCallback)
    }

    init(pointer: LDKFilter){
		self.cOpaqueStruct = pointer
	}

    /* SWIFT_CALLBACKS_START */

    public func register_tx(txid: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>?, script_pubkey: LDKu8slice) -> Void {
    	/* EDIT ME */
		
    }

    public func register_output(output: LDKWatchedOutput) -> Option_C2Tuple_usizeTransactionZZ {
    	/* EDIT ME */
		return Option_C2Tuple_usizeTransactionZZ(pointer: LDKCOption_C2Tuple_usizeTransactionZZ())
    }

    public func free() -> Void {
    	/* EDIT ME */
		
    }

    /* SWIFT_CALLBACKS_END */

}
