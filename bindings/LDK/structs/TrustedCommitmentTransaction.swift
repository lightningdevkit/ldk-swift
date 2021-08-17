import LDKHeaders

public class TrustedCommitmentTransaction {

    public internal(set) var cOpaqueStruct: LDKTrustedCommitmentTransaction?;

	

    public init(pointer: LDKTrustedCommitmentTransaction){
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func txid() -> [UInt8] {
    	
        return Bindings.LDKThirtyTwoBytes_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKTrustedCommitmentTransaction>) in
TrustedCommitmentTransaction_txid(this_argPointer)
});
    }

    public func built_transaction() -> BuiltCommitmentTransaction {
    	
        return BuiltCommitmentTransaction(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKTrustedCommitmentTransaction>) in
TrustedCommitmentTransaction_built_transaction(this_argPointer)
});
    }

    public func keys() -> TxCreationKeys {
    	
        return TxCreationKeys(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKTrustedCommitmentTransaction>) in
TrustedCommitmentTransaction_keys(this_argPointer)
});
    }

    public func get_htlc_sigs(htlc_base_key: [UInt8], channel_parameters: DirectedChannelTransactionParameters) -> Result_CVec_SignatureZNoneZ {
    	
        return Result_CVec_SignatureZNoneZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKTrustedCommitmentTransaction>) in
withUnsafePointer(to: Bindings.array_to_tuple32(array: htlc_base_key)) { (htlc_base_keyPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in
withUnsafePointer(to: channel_parameters.cOpaqueStruct!) { (channel_parametersPointer: UnsafePointer<LDKDirectedChannelTransactionParameters>) in
TrustedCommitmentTransaction_get_htlc_sigs(this_argPointer, htlc_base_keyPointer, channel_parametersPointer)
}
}
});
    }

				
	deinit {
					
					
					
		TrustedCommitmentTransaction_free(self.cOpaqueStruct!)
					
				
	}
			
    /* STRUCT_METHODS_END */

}
