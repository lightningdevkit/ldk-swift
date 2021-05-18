public class Filter {

    var cOpaqueStruct: LDKFilter?;

    init() {

    	/* NATIVE_CALLBACKS_START */

		func register_txCallback(pointer: UnsafeRawPointer?, txidPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>?, script_pubkey: LDKu8slice) -> Void {
			let instance: Filter = Bindings.pointerToInstance(pointer: pointer!)
			
								var txid: [UInt8]? = nil
								if let txidUnwrapped = txidPointer {
									txid = Bindings.tuple32_to_array(nativeType: txidUnwrapped.pointee)
								}
							
			return instance.register_tx(txid: txid, script_pubkey: Bindings.LDKu8slice_to_array(nativeType: script_pubkey));
		}

		func register_outputCallback(pointer: UnsafeRawPointer?, output: LDKWatchedOutput) -> LDKCOption_C2Tuple_usizeTransactionZZ {
			let instance: Filter = Bindings.pointerToInstance(pointer: pointer!)
			
			return instance.register_output(output: WatchedOutput(pointer: output)).cOpaqueStruct!;
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: Filter = Bindings.pointerToInstance(pointer: pointer!)
			
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

    public func register_tx(txid: [UInt8]?, script_pubkey: [UInt8]) -> Void {
    	/* EDIT ME */
		
    }

    public func register_output(output: WatchedOutput) -> Option_C2Tuple_usizeTransactionZZ {
    	/* EDIT ME */
		return Option_C2Tuple_usizeTransactionZZ(pointer: LDKCOption_C2Tuple_usizeTransactionZZ())
    }

    public func free() -> Void {
    	/* EDIT ME */
		
    }

    /* SWIFT_CALLBACKS_END */

}
