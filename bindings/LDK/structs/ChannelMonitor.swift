public class ChannelMonitor: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKChannelMonitor?


	

    public init(pointer: LDKChannelMonitor){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKChannelMonitor, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func clone() -> ChannelMonitor {
    	
        return ChannelMonitor(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKChannelMonitor>) in
ChannelMonitor_clone(origPointer)
});
    }

					internal func danglingClone() -> ChannelMonitor {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKChannelMonitor>) in
ChannelMonitor_write(objPointer)
});
    }

    public func update_monitor(updates: ChannelMonitorUpdate, broadcaster: BroadcasterInterface, fee_estimator: FeeEstimator, logger: Logger) -> Result_NoneNoneZ {
    	
        return Result_NoneNoneZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChannelMonitor>) in
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

    public func get_outputs_to_watch() -> [C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ] {
    	
        return Bindings.LDKCVec_C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZZ_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChannelMonitor>) in
ChannelMonitor_get_outputs_to_watch(this_argPointer)
})
						
						.map { (cOpaqueStruct) in
							C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ(pointer: cOpaqueStruct)
						}
					;
    }

    public func load_outputs_to_watch(filter: Filter) -> Void {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChannelMonitor>) in
withUnsafePointer(to: filter.cOpaqueStruct!) { (filterPointer: UnsafePointer<LDKFilter>) in
ChannelMonitor_load_outputs_to_watch(this_argPointer, filterPointer)
}
};
    }

    public func get_and_clear_pending_monitor_events() -> [MonitorEvent] {
    	
        return Bindings.LDKCVec_MonitorEventZ_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChannelMonitor>) in
ChannelMonitor_get_and_clear_pending_monitor_events(this_argPointer)
})
						
						.map { (cOpaqueStruct) in
							MonitorEvent(pointer: cOpaqueStruct)
						}
					;
    }

    public func get_and_clear_pending_events() -> [Event] {
    	
        return Bindings.LDKCVec_EventZ_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChannelMonitor>) in
ChannelMonitor_get_and_clear_pending_events(this_argPointer)
})
						
						.map { (cOpaqueStruct) in
							Event(pointer: cOpaqueStruct)
						}
					;
    }

    public func get_latest_holder_commitment_txn(logger: Logger) -> [[UInt8]] {
    	
        return Bindings.LDKCVec_TransactionZ_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChannelMonitor>) in
withUnsafePointer(to: logger.cOpaqueStruct!) { (loggerPointer: UnsafePointer<LDKLogger>) in
ChannelMonitor_get_latest_holder_commitment_txn(this_argPointer, loggerPointer)
}
});
    }

    public func block_connected(header: [UInt8], txdata: [C2Tuple_usizeTransactionZ], height: UInt32, broadcaster: BroadcasterInterface, fee_estimator: FeeEstimator, logger: Logger) -> [TransactionOutputs] {
    	
							let txdataUnwrapped = txdata.map { (txdataCurrentValue) in
							txdataCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
        return self.block_connected(header: header, txdata: txdataUnwrapped, height: height, broadcaster: broadcaster, fee_estimator: fee_estimator, logger: logger);
    }

    internal func block_connected(header: [UInt8], txdata: [LDKC2Tuple_usizeTransactionZ], height: UInt32, broadcaster: BroadcasterInterface, fee_estimator: FeeEstimator, logger: Logger) -> [TransactionOutputs] {
    	
						let txdataWrapper = Bindings.new_LDKCVec_C2Tuple_usizeTransactionZZWrapper(array: txdata)
						defer {
							txdataWrapper.noOpRetain()
						}
					
        return Bindings.LDKCVec_TransactionOutputsZ_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChannelMonitor>) in
withUnsafePointer(to: Bindings.array_to_tuple80(array: header)) { (headerPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in
ChannelMonitor_block_connected(this_argPointer, headerPointer, txdataWrapper.dangle().cOpaqueStruct!, height, broadcaster.activate().cOpaqueStruct!, fee_estimator.activate().cOpaqueStruct!, logger.activate().cOpaqueStruct!)
}
})
						
						.map { (cOpaqueStruct) in
							TransactionOutputs(pointer: cOpaqueStruct)
						}
					;
    }

    public func block_disconnected(header: [UInt8], height: UInt32, broadcaster: BroadcasterInterface, fee_estimator: FeeEstimator, logger: Logger) -> Void {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChannelMonitor>) in
withUnsafePointer(to: Bindings.array_to_tuple80(array: header)) { (headerPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in
ChannelMonitor_block_disconnected(this_argPointer, headerPointer, height, broadcaster.activate().cOpaqueStruct!, fee_estimator.activate().cOpaqueStruct!, logger.activate().cOpaqueStruct!)
}
};
    }

    public func transactions_confirmed(header: [UInt8], txdata: [C2Tuple_usizeTransactionZ], height: UInt32, broadcaster: BroadcasterInterface, fee_estimator: FeeEstimator, logger: Logger) -> [TransactionOutputs] {
    	
							let txdataUnwrapped = txdata.map { (txdataCurrentValue) in
							txdataCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
        return self.transactions_confirmed(header: header, txdata: txdataUnwrapped, height: height, broadcaster: broadcaster, fee_estimator: fee_estimator, logger: logger);
    }

    internal func transactions_confirmed(header: [UInt8], txdata: [LDKC2Tuple_usizeTransactionZ], height: UInt32, broadcaster: BroadcasterInterface, fee_estimator: FeeEstimator, logger: Logger) -> [TransactionOutputs] {
    	
						let txdataWrapper = Bindings.new_LDKCVec_C2Tuple_usizeTransactionZZWrapper(array: txdata)
						defer {
							txdataWrapper.noOpRetain()
						}
					
        return Bindings.LDKCVec_TransactionOutputsZ_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChannelMonitor>) in
withUnsafePointer(to: Bindings.array_to_tuple80(array: header)) { (headerPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in
ChannelMonitor_transactions_confirmed(this_argPointer, headerPointer, txdataWrapper.dangle().cOpaqueStruct!, height, broadcaster.activate().cOpaqueStruct!, fee_estimator.activate().cOpaqueStruct!, logger.activate().cOpaqueStruct!)
}
})
						
						.map { (cOpaqueStruct) in
							TransactionOutputs(pointer: cOpaqueStruct)
						}
					;
    }

    public func transaction_unconfirmed(txid: [UInt8], broadcaster: BroadcasterInterface, fee_estimator: FeeEstimator, logger: Logger) -> Void {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChannelMonitor>) in
withUnsafePointer(to: Bindings.array_to_tuple32(array: txid)) { (txidPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in
ChannelMonitor_transaction_unconfirmed(this_argPointer, txidPointer, broadcaster.activate().cOpaqueStruct!, fee_estimator.activate().cOpaqueStruct!, logger.activate().cOpaqueStruct!)
}
};
    }

    public func best_block_updated(header: [UInt8], height: UInt32, broadcaster: BroadcasterInterface, fee_estimator: FeeEstimator, logger: Logger) -> [TransactionOutputs] {
    	
        return Bindings.LDKCVec_TransactionOutputsZ_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChannelMonitor>) in
withUnsafePointer(to: Bindings.array_to_tuple80(array: header)) { (headerPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in
ChannelMonitor_best_block_updated(this_argPointer, headerPointer, height, broadcaster.activate().cOpaqueStruct!, fee_estimator.activate().cOpaqueStruct!, logger.activate().cOpaqueStruct!)
}
})
						
						.map { (cOpaqueStruct) in
							TransactionOutputs(pointer: cOpaqueStruct)
						}
					;
    }

    public func get_relevant_txids() -> [Txid] {
    	
        return Bindings.LDKCVec_TxidZ_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChannelMonitor>) in
ChannelMonitor_get_relevant_txids(this_argPointer)
})
					.map { (bytes) in
						   Bindings.LDKThirtyTwoBytes_to_array(nativeType: bytes)
					}
				;
    }

    public func current_best_block() -> BestBlock {
    	
        return BestBlock(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChannelMonitor>) in
ChannelMonitor_current_best_block(this_argPointer)
});
    }

    public func get_claimable_balances() -> [Balance] {
    	
        return Bindings.LDKCVec_BalanceZ_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChannelMonitor>) in
ChannelMonitor_get_claimable_balances(this_argPointer)
})
						
						.map { (cOpaqueStruct) in
							Balance(pointer: cOpaqueStruct)
						}
					;
    }

    internal func free() -> Void {
    	
        return ChannelMonitor_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> ChannelMonitor {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing ChannelMonitor \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing ChannelMonitor \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
