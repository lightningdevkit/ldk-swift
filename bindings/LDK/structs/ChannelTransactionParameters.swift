public class ChannelTransactionParameters: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKChannelTransactionParameters?


	/* DEFAULT_CONSTRUCTOR_START */
    #warning("This method passes non-cloneable objects by owned value. Here be dragons.")
@available(*, deprecated, message: "This method passes non-cloneable objects by owned value. Here be dragons.")
public init(holder_pubkeys_arg: ChannelPublicKeys, holder_selected_contest_delay_arg: UInt16, is_outbound_from_holder_arg: Bool, counterparty_parameters_arg: CounterpartyChannelTransactionParameters, funding_outpoint_arg: OutPoint, opt_anchors_arg: LDKCOption_NoneZ) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = ChannelTransactionParameters_new(holder_pubkeys_arg.danglingClone().cOpaqueStruct!, holder_selected_contest_delay_arg, is_outbound_from_holder_arg, counterparty_parameters_arg.danglingClone().cOpaqueStruct!, funding_outpoint_arg.danglingClone().cOpaqueStruct!, opt_anchors_arg)
        super.init(conflictAvoidingVariableName: 0)
        
    }
    /* DEFAULT_CONSTRUCTOR_END */

    #warning("This method passes non-cloneable objects by owned value. Here be dragons.")
@available(*, deprecated, message: "This method passes non-cloneable objects by owned value. Here be dragons.")
public init(pointer: LDKChannelTransactionParameters){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	#warning("This method passes non-cloneable objects by owned value. Here be dragons.")
@available(*, deprecated, message: "This method passes non-cloneable objects by owned value. Here be dragons.")
public init(pointer: LDKChannelTransactionParameters, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
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
						
        return ChannelTransactionParameters_set_holder_pubkeys(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
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
						
        return ChannelTransactionParameters_set_counterparty_parameters(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func get_funding_outpoint() -> OutPoint? {
    	
        return 
				{ () in
					let cStruct =
				withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelTransactionParameters>) in
ChannelTransactionParameters_get_funding_outpoint(this_ptrPointer)
};
				if cStruct.inner == nil {
					return nil
				}
				return OutPoint(pointer: cStruct)
				}()
			;
    }

    public func set_funding_outpoint(val: OutPoint) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelTransactionParameters>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelTransactionParameters_set_funding_outpoint(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func get_opt_anchors() -> LDKCOption_NoneZ {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelTransactionParameters>) in
ChannelTransactionParameters_get_opt_anchors(this_ptrPointer)
};
    }

    public func set_opt_anchors(val: LDKCOption_NoneZ) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelTransactionParameters>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelTransactionParameters_set_opt_anchors(this_ptrPointer, val);
    }

    public func clone() -> ChannelTransactionParameters {
    	
        return ChannelTransactionParameters(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKChannelTransactionParameters>) in
ChannelTransactionParameters_clone(origPointer)
});
    }

					internal func danglingClone() -> ChannelTransactionParameters {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
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
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_ChannelTransactionParametersDecodeErrorZ(pointer: ChannelTransactionParameters_read(serWrapper.cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return ChannelTransactionParameters_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> ChannelTransactionParameters {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing ChannelTransactionParameters \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing ChannelTransactionParameters \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
