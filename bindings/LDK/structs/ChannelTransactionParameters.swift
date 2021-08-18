public class ChannelTransactionParameters {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKChannelTransactionParameters?;


	/* DEFAULT_CONSTRUCTOR_START */
    public init(holder_pubkeys_arg: ChannelPublicKeys, holder_selected_contest_delay_arg: UInt16, is_outbound_from_holder_arg: Bool, counterparty_parameters_arg: CounterpartyChannelTransactionParameters, funding_outpoint_arg: OutPoint) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = ChannelTransactionParameters_new(holder_pubkeys_arg.clone().cOpaqueStruct!, holder_selected_contest_delay_arg, is_outbound_from_holder_arg, counterparty_parameters_arg.clone().cOpaqueStruct!, funding_outpoint_arg.clone().cOpaqueStruct!)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKChannelTransactionParameters){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_holder_pubkeys() -> ChannelPublicKeys {
    	
        return ChannelPublicKeys(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelTransactionParameters>) in
ChannelTransactionParameters_get_holder_pubkeys(this_ptrPointer)
});
    }

    public func set_holder_pubkeys(val: ChannelPublicKeys) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelTransactionParameters>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelTransactionParameters_set_holder_pubkeys(this_ptrPointer, val.clone().cOpaqueStruct!);
    }

    public func get_holder_selected_contest_delay() -> UInt16 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelTransactionParameters>) in
ChannelTransactionParameters_get_holder_selected_contest_delay(this_ptrPointer)
};
    }

    public func set_holder_selected_contest_delay(val: UInt16) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelTransactionParameters>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelTransactionParameters_set_holder_selected_contest_delay(this_ptrPointer, val);
    }

    public func get_is_outbound_from_holder() -> Bool {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelTransactionParameters>) in
ChannelTransactionParameters_get_is_outbound_from_holder(this_ptrPointer)
};
    }

    public func set_is_outbound_from_holder(val: Bool) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelTransactionParameters>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelTransactionParameters_set_is_outbound_from_holder(this_ptrPointer, val);
    }

    public func get_counterparty_parameters() -> CounterpartyChannelTransactionParameters {
    	
        return CounterpartyChannelTransactionParameters(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelTransactionParameters>) in
ChannelTransactionParameters_get_counterparty_parameters(this_ptrPointer)
});
    }

    public func set_counterparty_parameters(val: CounterpartyChannelTransactionParameters) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelTransactionParameters>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelTransactionParameters_set_counterparty_parameters(this_ptrPointer, val.clone().cOpaqueStruct!);
    }

    public func get_funding_outpoint() -> OutPoint {
    	
        return OutPoint(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelTransactionParameters>) in
ChannelTransactionParameters_get_funding_outpoint(this_ptrPointer)
});
    }

    public func set_funding_outpoint(val: OutPoint) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelTransactionParameters>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelTransactionParameters_set_funding_outpoint(this_ptrPointer, val.clone().cOpaqueStruct!);
    }

    public func clone() -> ChannelTransactionParameters {
    	
        return ChannelTransactionParameters(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKChannelTransactionParameters>) in
ChannelTransactionParameters_clone(origPointer)
});
    }

    public func is_populated() -> Bool {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChannelTransactionParameters>) in
ChannelTransactionParameters_is_populated(this_argPointer)
};
    }

    public func as_holder_broadcastable() -> DirectedChannelTransactionParameters {
    	
        return DirectedChannelTransactionParameters(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChannelTransactionParameters>) in
ChannelTransactionParameters_as_holder_broadcastable(this_argPointer)
});
    }

    public func as_counterparty_broadcastable() -> DirectedChannelTransactionParameters {
    	
        return DirectedChannelTransactionParameters(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKChannelTransactionParameters>) in
ChannelTransactionParameters_as_counterparty_broadcastable(this_argPointer)
});
    }

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKChannelTransactionParameters>) in
ChannelTransactionParameters_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_ChannelTransactionParametersDecodeErrorZ {
    	
        return Result_ChannelTransactionParametersDecodeErrorZ(pointer: ChannelTransactionParameters_read(Bindings.new_LDKu8slice(array: ser)));
    }

				
	deinit {
					
					
					
		ChannelTransactionParameters_free(self.cOpaqueStruct!)
					
				
	}
			
    /* STRUCT_METHODS_END */

}
