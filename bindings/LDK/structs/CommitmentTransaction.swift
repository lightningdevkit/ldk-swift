public class CommitmentTransaction {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKCommitmentTransaction?;


	

    public init(pointer: LDKCommitmentTransaction){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func clone() -> CommitmentTransaction {
    	
        return CommitmentTransaction(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCommitmentTransaction>) in
CommitmentTransaction_clone(origPointer)
});
    }

					internal func danglingClone() -> CommitmentTransaction {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKCommitmentTransaction>) in
CommitmentTransaction_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_CommitmentTransactionDecodeErrorZ {
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_CommitmentTransactionDecodeErrorZ(pointer: CommitmentTransaction_read(serWrapper.cOpaqueStruct!));
    }

    public func commitment_number() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKCommitmentTransaction>) in
CommitmentTransaction_commitment_number(this_argPointer)
};
    }

    public func to_broadcaster_value_sat() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKCommitmentTransaction>) in
CommitmentTransaction_to_broadcaster_value_sat(this_argPointer)
};
    }

    public func to_countersignatory_value_sat() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKCommitmentTransaction>) in
CommitmentTransaction_to_countersignatory_value_sat(this_argPointer)
};
    }

    public func feerate_per_kw() -> UInt32 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKCommitmentTransaction>) in
CommitmentTransaction_feerate_per_kw(this_argPointer)
};
    }

    public func trust() -> TrustedCommitmentTransaction {
    	
        return TrustedCommitmentTransaction(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKCommitmentTransaction>) in
CommitmentTransaction_trust(this_argPointer)
});
    }

    public func verify(channel_parameters: DirectedChannelTransactionParameters, broadcaster_keys: ChannelPublicKeys, countersignatory_keys: ChannelPublicKeys) -> Result_TrustedCommitmentTransactionNoneZ {
    	
        return Result_TrustedCommitmentTransactionNoneZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKCommitmentTransaction>) in
withUnsafePointer(to: channel_parameters.cOpaqueStruct!) { (channel_parametersPointer: UnsafePointer<LDKDirectedChannelTransactionParameters>) in
withUnsafePointer(to: broadcaster_keys.cOpaqueStruct!) { (broadcaster_keysPointer: UnsafePointer<LDKChannelPublicKeys>) in
withUnsafePointer(to: countersignatory_keys.cOpaqueStruct!) { (countersignatory_keysPointer: UnsafePointer<LDKChannelPublicKeys>) in
CommitmentTransaction_verify(this_argPointer, channel_parametersPointer, broadcaster_keysPointer, countersignatory_keysPointer)
}
}
}
});
    }

    internal func free() -> Void {
    	
        return CommitmentTransaction_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> CommitmentTransaction {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing CommitmentTransaction \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing CommitmentTransaction \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
