class ChannelManagerReadArgs {

    var cOpaqueStruct: LDKChannelManagerReadArgs?;

    init(keys_manager: KeysInterface, fee_estimator: FeeEstimator, chain_monitor: Watch, tx_broadcaster: BroadcasterInterface, logger: Logger, default_config: UserConfig, channel_monitors: [ChannelMonitor]) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = ChannelManagerReadArgs_new(keys_manager, fee_estimator, chain_monitor, tx_broadcaster, logger, default_config, channel_monitors)
    }

    private init(pointer: LDKChannelManagerReadArgs){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func get_keys_manager() -> KeysInterface {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManagerReadArgs>) in
							
			pointer
						
		}
					
        return ChannelManagerReadArgs_get_keys_manager(this_ptrPointer);
    }

    func set_keys_manager(val: KeysInterface) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelManagerReadArgs>) in
							
			pointer
						
		}
					
        return ChannelManagerReadArgs_set_keys_manager(this_ptrPointer, val);
    }

    func get_fee_estimator() -> FeeEstimator {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManagerReadArgs>) in
							
			pointer
						
		}
					
        return ChannelManagerReadArgs_get_fee_estimator(this_ptrPointer);
    }

    func set_fee_estimator(val: FeeEstimator) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelManagerReadArgs>) in
							
			pointer
						
		}
					
        return ChannelManagerReadArgs_set_fee_estimator(this_ptrPointer, val);
    }

    func get_chain_monitor() -> Watch {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManagerReadArgs>) in
							
			pointer
						
		}
					
        return ChannelManagerReadArgs_get_chain_monitor(this_ptrPointer);
    }

    func set_chain_monitor(val: Watch) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelManagerReadArgs>) in
							
			pointer
						
		}
					
        return ChannelManagerReadArgs_set_chain_monitor(this_ptrPointer, val);
    }

    func get_tx_broadcaster() -> BroadcasterInterface {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManagerReadArgs>) in
							
			pointer
						
		}
					
        return ChannelManagerReadArgs_get_tx_broadcaster(this_ptrPointer);
    }

    func set_tx_broadcaster(val: BroadcasterInterface) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelManagerReadArgs>) in
							
			pointer
						
		}
					
        return ChannelManagerReadArgs_set_tx_broadcaster(this_ptrPointer, val);
    }

    func get_logger() -> Logger {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManagerReadArgs>) in
							
			pointer
						
		}
					
        return ChannelManagerReadArgs_get_logger(this_ptrPointer);
    }

    func set_logger(val: Logger) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelManagerReadArgs>) in
							
			pointer
						
		}
					
        return ChannelManagerReadArgs_set_logger(this_ptrPointer, val);
    }

    func get_default_config() -> UserConfig {
    	
						
		let this_ptrPointer = withUnsafePointer(to: self.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChannelManagerReadArgs>) in
							
			pointer
						
		}
					
        return ChannelManagerReadArgs_get_default_config(this_ptrPointer);
    }

    func set_default_config(val: UserConfig) -> Void {
    	
						
		let this_ptrPointer = withUnsafeMutablePointer(to: &self.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKChannelManagerReadArgs>) in
							
			pointer
						
		}
					
        return ChannelManagerReadArgs_set_default_config(this_ptrPointer, val);
    }

				
	deinit {
					
					
		ChannelManagerReadArgs_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}
