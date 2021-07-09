public class Confirm {

    var cOpaqueStruct: LDKConfirm?;

    init() {

    	/* NATIVE_CALLBACKS_START */

		func transactions_confirmedCallback(pointer: UnsafeRawPointer?, header: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>?, txdata: LDKCVec_C2Tuple_usizeTransactionZZ, height: UInt32) -> Void {
			let instance: Confirm = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			return instance.transactions_confirmed(header: header, txdata: txdata, height: height);
		}

		func transaction_unconfirmedCallback(pointer: UnsafeRawPointer?, txid: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>?) -> Void {
			let instance: Confirm = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			return instance.transaction_unconfirmed(txid: txid);
		}

		func best_block_updatedCallback(pointer: UnsafeRawPointer?, header: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>?, height: UInt32) -> Void {
			let instance: Confirm = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			return instance.best_block_updated(header: header, height: height);
		}

		func get_relevant_txidsCallback(pointer: UnsafeRawPointer?) -> LDKCVec_TxidZ {
			let instance: Confirm = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			return Bindings.new_LDKCVec_TxidZ(array: instance.get_relevant_txids());
		}

		func freeCallback(pointer: UnsafeMutableRawPointer?) -> Void {
			let instance: Confirm = Bindings.pointerToInstance(pointer: pointer!)
			/* SWIFT_CALLBACK_PREP */
			return instance.free();
		}

		/* NATIVE_CALLBACKS_END */

        self.cOpaqueStruct = LDKConfirm(this_arg: Bindings.instanceToPointer(instance: self), 
			transactions_confirmed: transactions_confirmedCallback,
			transaction_unconfirmed: transaction_unconfirmedCallback,
			best_block_updated: best_block_updatedCallback,
			get_relevant_txids: get_relevant_txidsCallback,
			free: freeCallback)
    }

    init(pointer: LDKConfirm){
		self.cOpaqueStruct = pointer
	}

    /* SWIFT_CALLBACKS_START */

    public func transactions_confirmed(header: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>?, txdata: LDKCVec_C2Tuple_usizeTransactionZZ, height: UInt32) -> Void {
    	/* EDIT ME */
		
    }

    public func transaction_unconfirmed(txid: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>?) -> Void {
    	/* EDIT ME */
		
    }

    public func best_block_updated(header: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>?, height: UInt32) -> Void {
    	/* EDIT ME */
		
    }

    public func get_relevant_txids() -> [LDKTxid] {
    	/* EDIT ME */
		return [LDKTxid]()
    }

    public func free() -> Void {
    	/* EDIT ME */
		
    }

    /* SWIFT_CALLBACKS_END */

}
