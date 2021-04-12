class ChainMonitor {

    var cOpaqueStruct: LDKChainMonitor?;

    init(chain_source: Filter, broadcaster: BroadcasterInterface, logger: Logger, feeest: FeeEstimator, persister: Persist) {
    	/* NATIVE_CONSTRUCTOR_PREP */
        self.cOpaqueStruct = ChainMonitor_new(chain_source, broadcaster, logger, feeest, persister)
    }

    private init(pointer: LDKChainMonitor){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    func block_connected(this_arg: ChainMonitor, header: [U], txdata: [TwoTuple<U>], height: U) -> Void {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChainMonitor>) in
							
			pointer
						
		}
					
        return ChainMonitor_block_connected(this_argPointer, header, txdata, height);
    }

    func block_disconnected(this_arg: ChainMonitor, header: [U], disconnected_height: U) -> Void {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChainMonitor>) in
							
			pointer
						
		}
					
        return ChainMonitor_block_disconnected(this_argPointer, header, disconnected_height);
    }

    func as_Watch(this_arg: ChainMonitor) -> Watch {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChainMonitor>) in
							
			pointer
						
		}
					
        return ChainMonitor_as_Watch(this_argPointer);
    }

    func as_EventsProvider(this_arg: ChainMonitor) -> EventsProvider {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChainMonitor>) in
							
			pointer
						
		}
					
        return ChainMonitor_as_EventsProvider(this_argPointer);
    }

				
	deinit {
					
					
		ChainMonitor_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}
