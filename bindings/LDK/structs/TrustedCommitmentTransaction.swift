#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class TrustedCommitmentTransaction: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKTrustedCommitmentTransaction?


	

    public init(pointer: LDKTrustedCommitmentTransaction){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKTrustedCommitmentTransaction, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
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

    public func opt_anchors() -> Bool {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKTrustedCommitmentTransaction>) in
TrustedCommitmentTransaction_opt_anchors(this_argPointer)
};
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

    internal func free() -> Void {
    	
        return TrustedCommitmentTransaction_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> TrustedCommitmentTransaction {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing TrustedCommitmentTransaction \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing TrustedCommitmentTransaction \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
