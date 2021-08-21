import LDKHeaders

public class ChannelCounterparty: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKChannelCounterparty?


	

    public init(pointer: LDKChannelCounterparty){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

    /* STRUCT_METHODS_START */

    public func get_node_id() -> [UInt8] {
    	
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelCounterparty>) in
ChannelCounterparty_get_node_id(this_ptrPointer)
});
    }

    public func set_node_id(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelCounterparty>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelCounterparty_set_node_id(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    public func get_features() -> InitFeatures {
    	
        return InitFeatures(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelCounterparty>) in
ChannelCounterparty_get_features(this_ptrPointer)
});
    }

    public func set_features(val: InitFeatures) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelCounterparty>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelCounterparty_set_features(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func get_unspendable_punishment_reserve() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChannelCounterparty>) in
ChannelCounterparty_get_unspendable_punishment_reserve(this_ptrPointer)
};
    }

    public func set_unspendable_punishment_reserve(val: UInt64) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChannelCounterparty>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChannelCounterparty_set_unspendable_punishment_reserve(this_ptrPointer, val);
    }

    public func clone() -> ChannelCounterparty {
    	
        return ChannelCounterparty(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKChannelCounterparty>) in
ChannelCounterparty_clone(origPointer)
});
    }

					internal func danglingClone() -> ChannelCounterparty {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    internal func free() -> Void {
    	
        return ChannelCounterparty_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> ChannelCounterparty {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing ChannelCounterparty \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing ChannelCounterparty \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
