class ChannelMonitor {

    var cOpaqueStruct: LDKChannelMonitor?;

	

    init(pointer: LDKChannelMonitor){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func clone(orig: ChannelMonitor) -> ChannelMonitor {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelMonitor>) in
							
			pointer
						
		}
					
        return ChannelMonitor(pointer: ChannelMonitor_clone(origPointer));
    }

    func write(obj: ChannelMonitor) -> [UInt8] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelMonitor>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_u8Z_to_array(nativeType: ChannelMonitor_write(objPointer));
    }

    func update_monitor(this_arg: ChannelMonitor, updates: ChannelMonitorUpdate, broadcaster: BroadcasterInterface, fee_estimator: FeeEstimator, logger: Logger) -> Result_NoneMonitorUpdateErrorZ {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelMonitor>) in
							
			pointer
						
		}
					
						
		let updatesPointer = withUnsafePointer(to: updates.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelMonitorUpdate>) in
							
			pointer
						
		}
					
						
		let broadcasterPointer = withUnsafePointer(to: broadcaster.cOpaqueStruct!) { (pointer: UnsafePointer<LDKBroadcasterInterface>) in
							
			pointer
						
		}
					
						
		let fee_estimatorPointer = withUnsafePointer(to: fee_estimator.cOpaqueStruct!) { (pointer: UnsafePointer<LDKFeeEstimator>) in
							
			pointer
						
		}
					
						
		let loggerPointer = withUnsafePointer(to: logger.cOpaqueStruct!) { (pointer: UnsafePointer<LDKLogger>) in
							
			pointer
						
		}
					
        return Result_NoneMonitorUpdateErrorZ(pointer: ChannelMonitor_update_monitor(this_argPointer, updatesPointer, broadcasterPointer, fee_estimatorPointer, loggerPointer));
    }

    func get_latest_update_id(this_arg: ChannelMonitor) -> UInt64 {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelMonitor>) in
							
			pointer
						
		}
					
        return ChannelMonitor_get_latest_update_id(this_argPointer);
    }

    func get_funding_txo(this_arg: ChannelMonitor) -> C2Tuple_OutPointScriptZ {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelMonitor>) in
							
			pointer
						
		}
					
        return C2Tuple_OutPointScriptZ(pointer: ChannelMonitor_get_funding_txo(this_argPointer));
    }

    func get_outputs_to_watch(this_arg: ChannelMonitor) -> [LDKC2Tuple_TxidCVec_C2Tuple_u32ScriptZZZ] {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelMonitor>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_C2Tuple_TxidCVec_C2Tuple_u32ScriptZZZZ_to_array(nativeType: ChannelMonitor_get_outputs_to_watch(this_argPointer));
    }

    func load_outputs_to_watch(this_arg: ChannelMonitor, filter: Filter) -> Void {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelMonitor>) in
							
			pointer
						
		}
					
						
		let filterPointer = withUnsafePointer(to: filter.cOpaqueStruct!) { (pointer: UnsafePointer<LDKFilter>) in
							
			pointer
						
		}
					
        return ChannelMonitor_load_outputs_to_watch(this_argPointer, filterPointer);
    }

    func get_and_clear_pending_monitor_events(this_arg: ChannelMonitor) -> [LDKMonitorEvent] {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelMonitor>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_MonitorEventZ_to_array(nativeType: ChannelMonitor_get_and_clear_pending_monitor_events(this_argPointer));
    }

    func get_and_clear_pending_events(this_arg: ChannelMonitor) -> [LDKEvent] {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelMonitor>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_EventZ_to_array(nativeType: ChannelMonitor_get_and_clear_pending_events(this_argPointer));
    }

    func get_latest_holder_commitment_txn(this_arg: ChannelMonitor, logger: Logger) -> [LDK[LDKUInt8]] {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelMonitor>) in
							
			pointer
						
		}
					
						
		let loggerPointer = withUnsafePointer(to: logger.cOpaqueStruct!) { (pointer: UnsafePointer<LDKLogger>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_TransactionZ_to_array(nativeType: ChannelMonitor_get_latest_holder_commitment_txn(this_argPointer, loggerPointer));
    }

    func block_connected(this_arg: ChannelMonitor, header: [UInt8], txdata: [C2Tuple_usizeTransactionZ], height: UInt32, broadcaster: BroadcasterInterface, fee_estimator: FeeEstimator, logger: Logger) -> [LDKTransactionOutputs] {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelMonitor>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_TransactionOutputsZ_to_array(nativeType: ChannelMonitor_block_connected(this_argPointer, Bindings.array_to_tuple80(array: header), Bindings.new_LDKCVec_C2Tuple_usizeTransactionZZ(array: txdata), height, broadcaster.cOpaqueStruct!, fee_estimator.cOpaqueStruct!, logger.cOpaqueStruct!));
    }

    func block_disconnected(this_arg: ChannelMonitor, header: [UInt8], height: UInt32, broadcaster: BroadcasterInterface, fee_estimator: FeeEstimator, logger: Logger) -> Void {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelMonitor>) in
							
			pointer
						
		}
					
        return ChannelMonitor_block_disconnected(this_argPointer, Bindings.array_to_tuple80(array: header), height, broadcaster.cOpaqueStruct!, fee_estimator.cOpaqueStruct!, logger.cOpaqueStruct!);
    }

    func transactions_confirmed(this_arg: ChannelMonitor, header: [UInt8], txdata: [C2Tuple_usizeTransactionZ], height: UInt32, broadcaster: BroadcasterInterface, fee_estimator: FeeEstimator, logger: Logger) -> [LDKTransactionOutputs] {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelMonitor>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_TransactionOutputsZ_to_array(nativeType: ChannelMonitor_transactions_confirmed(this_argPointer, Bindings.array_to_tuple80(array: header), Bindings.new_LDKCVec_C2Tuple_usizeTransactionZZ(array: txdata), height, broadcaster.cOpaqueStruct!, fee_estimator.cOpaqueStruct!, logger.cOpaqueStruct!));
    }

    func transaction_unconfirmed(this_arg: ChannelMonitor, txid: [UInt8], broadcaster: BroadcasterInterface, fee_estimator: FeeEstimator, logger: Logger) -> Void {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelMonitor>) in
							
			pointer
						
		}
					
        return ChannelMonitor_transaction_unconfirmed(this_argPointer, Bindings.array_to_tuple32(array: txid), broadcaster.cOpaqueStruct!, fee_estimator.cOpaqueStruct!, logger.cOpaqueStruct!);
    }

    func best_block_updated(this_arg: ChannelMonitor, header: [UInt8], height: UInt32, broadcaster: BroadcasterInterface, fee_estimator: FeeEstimator, logger: Logger) -> [LDKTransactionOutputs] {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelMonitor>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_TransactionOutputsZ_to_array(nativeType: ChannelMonitor_best_block_updated(this_argPointer, Bindings.array_to_tuple80(array: header), height, broadcaster.cOpaqueStruct!, fee_estimator.cOpaqueStruct!, logger.cOpaqueStruct!));
    }

    func get_relevant_txids(this_arg: ChannelMonitor) -> [LDKTxid] {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelMonitor>) in
							
			pointer
						
		}
					
        return Bindings.LDKCVec_TxidZ_to_array(nativeType: ChannelMonitor_get_relevant_txids(this_argPointer));
    }

				
	deinit {
					
					
		ChannelMonitor_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}
