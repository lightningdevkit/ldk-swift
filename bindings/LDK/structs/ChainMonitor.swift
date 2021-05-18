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

    public func as_Listen() -> Listen {
    	
        return Listen(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChainMonitor>) in
ChainMonitor_as_Listen(this_argPointer)
});
    }

    public func as_Confirm() -> Confirm {
    	
        return Confirm(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChainMonitor>) in
ChainMonitor_as_Confirm(this_argPointer)
});
    }

    public func as_Watch() -> Watch {
    	
        return Watch(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChainMonitor>) in
ChainMonitor_as_Watch(this_argPointer)
});
    }

    public func as_EventsProvider() -> EventsProvider {
    	
        return EventsProvider(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChainMonitor>) in
ChainMonitor_as_EventsProvider(this_argPointer)
});
    }

				
	deinit {
					if self.cOpaqueStruct?.is_owned == false {

					
					
		ChainMonitor_free(self.cOpaqueStruct!)
					
}
				
	}
			
    /* STRUCT_METHODS_END */

}
