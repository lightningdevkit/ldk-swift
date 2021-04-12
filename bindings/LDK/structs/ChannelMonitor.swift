class ChannelMonitor {

    var cOpaqueStruct: LDKChannelMonitor?;

    init(swift_constructor_arguments) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = OpaqueStructType(native_constructor_arguments)
    }

    private init(pointer: LDKChannelMonitor){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func clone(orig: ChannelMonitor) -> ChannelMonitor {
    	
						
		let origPointer = withUnsafePointer(to: orig.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelMonitor>) in
							
			pointer
						
		}
					
        return ChannelMonitor(pointer: ChannelMonitor_clone(origPointer));
    }

    func write(obj: ChannelMonitor) -> [U] {
    	
						
		let objPointer = withUnsafePointer(to: obj.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelMonitor>) in
							
			pointer
						
		}
					
        return ChannelMonitor_write(objPointer);
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
					
        return ChannelMonitor_update_monitor(this_argPointer, updatesPointer, broadcasterPointer, fee_estimatorPointer, loggerPointer);
    }

    func get_latest_update_id(this_arg: ChannelMonitor) -> U {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelMonitor>) in
							
			pointer
						
		}
					
        return ChannelMonitor_get_latest_update_id(this_argPointer);
    }

    func get_funding_txo(this_arg: ChannelMonitor) -> TwoTuple<OutPoint> {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelMonitor>) in
							
			pointer
						
		}
					
        return ChannelMonitor_get_funding_txo(this_argPointer);
    }

    func get_outputs_to_watch(this_arg: ChannelMonitor) -> [TwoTuple<[U]>] {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelMonitor>) in
							
			pointer
						
		}
					
        return ChannelMonitor_get_outputs_to_watch(this_argPointer);
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

    func get_and_clear_pending_monitor_events(this_arg: ChannelMonitor) -> [MonitorEvent] {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelMonitor>) in
							
			pointer
						
		}
					
        return ChannelMonitor_get_and_clear_pending_monitor_events(this_argPointer);
    }

    func get_and_clear_pending_events(this_arg: ChannelMonitor) -> [Event] {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelMonitor>) in
							
			pointer
						
		}
					
        return ChannelMonitor_get_and_clear_pending_events(this_argPointer);
    }

    func get_latest_holder_commitment_txn(this_arg: ChannelMonitor, logger: Logger) -> [[U]] {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelMonitor>) in
							
			pointer
						
		}
					
						
		let loggerPointer = withUnsafePointer(to: logger.cOpaqueStruct!) { (pointer: UnsafePointer<LDKLogger>) in
							
			pointer
						
		}
					
        return ChannelMonitor_get_latest_holder_commitment_txn(this_argPointer, loggerPointer);
    }

    func block_connected(this_arg: ChannelMonitor, header: [U], txdata: [TwoTuple<U>], height: U, broadcaster: BroadcasterInterface, fee_estimator: FeeEstimator, logger: Logger) -> [TwoTuple<[U]>] {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelMonitor>) in
							
			pointer
						
		}
					
        return ChannelMonitor_block_connected(this_argPointer, header, txdata, height, broadcaster, fee_estimator, logger);
    }

    func block_disconnected(this_arg: ChannelMonitor, header: [U], height: U, broadcaster: BroadcasterInterface, fee_estimator: FeeEstimator, logger: Logger) -> Void {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelMonitor>) in
							
			pointer
						
		}
					
        return ChannelMonitor_block_disconnected(this_argPointer, header, height, broadcaster, fee_estimator, logger);
    }

				
	deinit {
					
					
		ChannelMonitor_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}
