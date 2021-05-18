public class ChainMonitor {

    var cOpaqueStruct: LDKChainMonitor?;

	/* DEFAULT_CONSTRUCTOR_START */
    public init(chain_source: Filter, broadcaster: BroadcasterInterface, logger: Logger, feeest: FeeEstimator, persister: Persist) {
    	
						let chain_sourcePointer = UnsafeMutablePointer<LDKFilter>.allocate(capacity: 1)
						chain_sourcePointer.initialize(to: chain_source.cOpaqueStruct!)
					
        self.cOpaqueStruct = ChainMonitor_new(chain_sourcePointer, broadcaster.cOpaqueStruct!, logger.cOpaqueStruct!, feeest.cOpaqueStruct!, persister.cOpaqueStruct!)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKChainMonitor){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func as_Listen(this_arg: ChainMonitor) -> Listen {
    	
        return Listen(pointer: withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChainMonitor>) in
ChainMonitor_as_Listen(this_argPointer)
});
    }

    public func as_Confirm(this_arg: ChainMonitor) -> Confirm {
    	
        return Confirm(pointer: withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChainMonitor>) in
ChainMonitor_as_Confirm(this_argPointer)
});
    }

    public func as_Watch(this_arg: ChainMonitor) -> Watch {
    	
        return Watch(pointer: withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChainMonitor>) in
ChainMonitor_as_Watch(this_argPointer)
});
    }

    public func as_EventsProvider(this_arg: ChainMonitor) -> EventsProvider {
    	
        return EventsProvider(pointer: withUnsafePointer(to: this_arg.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChainMonitor>) in
ChainMonitor_as_EventsProvider(this_argPointer)
});
    }

				
	deinit {
					
					
		ChainMonitor_free(self.cOpaqueStruct!)
				
	}
			
    /* STRUCT_METHODS_END */

}
