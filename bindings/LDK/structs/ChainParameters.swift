public class ChainParameters: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    public internal(set) var cOpaqueStruct: LDKChainParameters?


	/* DEFAULT_CONSTRUCTOR_START */
    public init(network_arg: LDKNetwork, best_block_arg: BestBlock) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = ChainParameters_new(network_arg, best_block_arg.danglingClone().cOpaqueStruct!)
        super.init(conflictAvoidingVariableName: 0)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKChainParameters){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

    /* STRUCT_METHODS_START */

    public func get_network() -> LDKNetwork {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChainParameters>) in
ChainParameters_get_network(this_ptrPointer)
};
    }

    public func set_network(val: LDKNetwork) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChainParameters>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChainParameters_set_network(this_ptrPointer, val);
    }

    public func get_best_block() -> BestBlock {
    	
        return BestBlock(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKChainParameters>) in
ChainParameters_get_best_block(this_ptrPointer)
});
    }

    public func set_best_block(val: BestBlock) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKChainParameters>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return ChainParameters_set_best_block(this_ptrPointer, val.danglingClone().cOpaqueStruct!);
    }

    public func clone() -> ChainParameters {
    	
        return ChainParameters(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKChainParameters>) in
ChainParameters_clone(origPointer)
});
    }

					internal func danglingClone() -> ChainParameters {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    internal func free() -> Void {
    	
        return ChainParameters_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> ChainParameters {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing ChainParameters \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing ChainParameters \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
