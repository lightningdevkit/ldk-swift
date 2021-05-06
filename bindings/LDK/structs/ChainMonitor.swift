public class ChainMonitor {

    var cOpaqueStruct: LDKChainMonitor?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(chain_source: Filter, broadcaster: BroadcasterInterface, logger: Logger, feeest: FeeEstimator, persister: Persist) {
    	
							
		let chain_sourcePointer = withUnsafeMutablePointer(to: &chain_source.cOpaqueStruct!) { (pointer: UnsafeMutablePointer<LDKFilter>) in
								
			pointer
							
		}
						
        self.cOpaqueStruct = ChainMonitor_new(chain_sourcePointer, broadcaster.cOpaqueStruct!, logger.cOpaqueStruct!, feeest.cOpaqueStruct!, persister.cOpaqueStruct!)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKChainMonitor){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func as_Listen(this_arg: ChainMonitor) -> Listen {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChainMonitor>) in
							
			pointer
						
		}
					
        return Listen(pointer: ChainMonitor_as_Listen(this_argPointer));
    }

    public func as_Confirm(this_arg: ChainMonitor) -> Confirm {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChainMonitor>) in
							
			pointer
						
		}
					
        return Confirm(pointer: ChainMonitor_as_Confirm(this_argPointer));
    }

    public func as_Watch(this_arg: ChainMonitor) -> Watch {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChainMonitor>) in
							
			pointer
						
		}
					
        return Watch(pointer: ChainMonitor_as_Watch(this_argPointer));
    }

    public func as_EventsProvider(this_arg: ChainMonitor) -> EventsProvider {
    	
						
		let this_argPointer = withUnsafePointer(to: this_arg.cOpaqueStruct!) { (pointer: UnsafePointer<LDKChainMonitor>) in
							
			pointer
						
		}
					
        return EventsProvider(pointer: ChainMonitor_as_EventsProvider(this_argPointer));
    }

				
	deinit {
					
					
		ChainMonitor_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}
