public class ChannelMonitor {

    public internal(set) var cOpaqueStruct: LDKChannelMonitor?;

	

    public init(pointer: LDKChannelMonitor){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKChannelMonitor>) in
ChannelMonitor_write(objPointer)
});
    }

    public func update_monitor(updates: ChannelMonitorUpdate, broadcaster: BroadcasterInterface, fee_estimator: FeeEstimator, logger: Logger) -> Result_NoneMonitorUpdateErrorZ {
    	
        return Result_NoneMonitorUpdateErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChannelMonitor>) in
withUnsafePointer(to: updates.cOpaqueStruct!) { (updatesPointer: UnsafePointer<LDKChannelMonitorUpdate>) in
withUnsafePointer(to: broadcaster.cOpaqueStruct!) { (broadcasterPointer: UnsafePointer<LDKBroadcasterInterface>) in
withUnsafePointer(to: fee_estimator.cOpaqueStruct!) { (fee_estimatorPointer: UnsafePointer<LDKFeeEstimator>) in
withUnsafePointer(to: logger.cOpaqueStruct!) { (loggerPointer: UnsafePointer<LDKLogger>) in
ChannelMonitor_update_monitor(this_argPointer, updatesPointer, broadcasterPointer, fee_estimatorPointer, loggerPointer)
}
}
}
}
});
    }

    public func get_latest_update_id() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChannelMonitor>) in
ChannelMonitor_get_latest_update_id(this_argPointer)
};
    }

    public func get_funding_txo() -> C2Tuple_OutPointScriptZ {
    	
        return C2Tuple_OutPointScriptZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChannelMonitor>) in
ChannelMonitor_get_funding_txo(this_argPointer)
});
    }

    public func get_outputs_to_watch() -> [LDKC2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ] {
    	
        return Bindings.LDKCVec_C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZZ_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChannelMonitor>) in
ChannelMonitor_get_outputs_to_watch(this_argPointer)
});
    }

    public func load_outputs_to_watch(filter: Filter) -> Void {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChannelMonitor>) in
withUnsafePointer(to: filter.cOpaqueStruct!) { (filterPointer: UnsafePointer<LDKFilter>) in
ChannelMonitor_load_outputs_to_watch(this_argPointer, filterPointer)
}
};
    }

    public func get_and_clear_pending_monitor_events() -> [LDKMonitorEvent] {
    	
        return Bindings.LDKCVec_MonitorEventZ_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChannelMonitor>) in
ChannelMonitor_get_and_clear_pending_monitor_events(this_argPointer)
});
    }

    public func get_and_clear_pending_events() -> [LDKEvent] {
    	
        return Bindings.LDKCVec_EventZ_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChannelMonitor>) in
ChannelMonitor_get_and_clear_pending_events(this_argPointer)
});
    }

    public func get_latest_holder_commitment_txn(logger: Logger) -> [[UInt8]] {
    	
        return Bindings.LDKCVec_TransactionZ_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChannelMonitor>) in
withUnsafePointer(to: logger.cOpaqueStruct!) { (loggerPointer: UnsafePointer<LDKLogger>) in
ChannelMonitor_get_latest_holder_commitment_txn(this_argPointer, loggerPointer)
}
});
    }

    public func block_connected(header: [UInt8], txdata: [LDKC2Tuple_usizeTransactionZ], height: UInt32, broadcaster: BroadcasterInterface, fee_estimator: FeeEstimator, logger: Logger) -> [LDKTransactionOutputs] {
    	
        return Bindings.LDKCVec_TransactionOutputsZ_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChannelMonitor>) in
withUnsafePointer(to: Bindings.array_to_tuple80(array: header)) { (headerPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in
ChannelMonitor_block_connected(this_argPointer, headerPointer, Bindings.new_LDKCVec_C2Tuple_usizeTransactionZZ(array: txdata), height, broadcaster.cOpaqueStruct!, fee_estimator.cOpaqueStruct!, logger.cOpaqueStruct!)
}
});
    }

    public func block_disconnected(header: [UInt8], height: UInt32, broadcaster: BroadcasterInterface, fee_estimator: FeeEstimator, logger: Logger) -> Void {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChannelMonitor>) in
withUnsafePointer(to: Bindings.array_to_tuple80(array: header)) { (headerPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in
ChannelMonitor_block_disconnected(this_argPointer, headerPointer, height, broadcaster.cOpaqueStruct!, fee_estimator.cOpaqueStruct!, logger.cOpaqueStruct!)
}
};
    }

    public func transactions_confirmed(header: [UInt8], txdata: [LDKC2Tuple_usizeTransactionZ], height: UInt32, broadcaster: BroadcasterInterface, fee_estimator: FeeEstimator, logger: Logger) -> [LDKTransactionOutputs] {
    	
        return Bindings.LDKCVec_TransactionOutputsZ_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChannelMonitor>) in
withUnsafePointer(to: Bindings.array_to_tuple80(array: header)) { (headerPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in
ChannelMonitor_transactions_confirmed(this_argPointer, headerPointer, Bindings.new_LDKCVec_C2Tuple_usizeTransactionZZ(array: txdata), height, broadcaster.cOpaqueStruct!, fee_estimator.cOpaqueStruct!, logger.cOpaqueStruct!)
}
});
    }

    public func transaction_unconfirmed(txid: [UInt8], broadcaster: BroadcasterInterface, fee_estimator: FeeEstimator, logger: Logger) -> Void {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChannelMonitor>) in
withUnsafePointer(to: Bindings.array_to_tuple32(array: txid)) { (txidPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in
ChannelMonitor_transaction_unconfirmed(this_argPointer, txidPointer, broadcaster.cOpaqueStruct!, fee_estimator.cOpaqueStruct!, logger.cOpaqueStruct!)
}
};
    }

    public func best_block_updated(header: [UInt8], height: UInt32, broadcaster: BroadcasterInterface, fee_estimator: FeeEstimator, logger: Logger) -> [LDKTransactionOutputs] {
    	
        return Bindings.LDKCVec_TransactionOutputsZ_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChannelMonitor>) in
withUnsafePointer(to: Bindings.array_to_tuple80(array: header)) { (headerPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in
ChannelMonitor_best_block_updated(this_argPointer, headerPointer, height, broadcaster.cOpaqueStruct!, fee_estimator.cOpaqueStruct!, logger.cOpaqueStruct!)
}
});
    }

    public func get_relevant_txids() -> [LDKTxid] {
    	
        return Bindings.LDKCVec_TxidZ_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChannelMonitor>) in
ChannelMonitor_get_relevant_txids(this_argPointer)
});
    }

    public func current_best_block() -> BestBlock {
    	
        return BestBlock(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChannelMonitor>) in
ChannelMonitor_current_best_block(this_argPointer)
});
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		ChannelMonitor_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}
