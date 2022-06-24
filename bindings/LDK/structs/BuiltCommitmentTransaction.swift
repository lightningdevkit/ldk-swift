#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class BuiltCommitmentTransaction: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKBuiltCommitmentTransaction?


	/* DEFAULT_CONSTRUCTOR_START */
    public init(transaction_arg: [UInt8], txid_arg: [UInt8]) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
						let transaction_argWrapper = Bindings.new_LDKTransactionWrapper(array: transaction_arg)
						defer {
							transaction_argWrapper.noOpRetain()
						}
					
        self.cOpaqueStruct = BuiltCommitmentTransaction_new(transaction_argWrapper.dangle().cOpaqueStruct!, Bindings.new_LDKThirtyTwoBytes(array: txid_arg))
        super.init(conflictAvoidingVariableName: 0)
        
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKBuiltCommitmentTransaction){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKBuiltCommitmentTransaction, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func get_transaction() -> [UInt8] {
    	
        return Bindings.LDKTransaction_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKBuiltCommitmentTransaction>) in
BuiltCommitmentTransaction_get_transaction(this_ptrPointer)
});
    }

    public func set_transaction(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKBuiltCommitmentTransaction>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
						let valWrapper = Bindings.new_LDKTransactionWrapper(array: val)
						defer {
							valWrapper.noOpRetain()
						}
					
        return BuiltCommitmentTransaction_set_transaction(this_ptrPointer, valWrapper.dangle().cOpaqueStruct!);
    }

    public func get_txid() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKBuiltCommitmentTransaction>) in
BuiltCommitmentTransaction_get_txid(this_ptrPointer)
}.pointee);
    }

    public func set_txid(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKBuiltCommitmentTransaction>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return BuiltCommitmentTransaction_set_txid(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func clone() -> BuiltCommitmentTransaction {
    	
        return BuiltCommitmentTransaction(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKBuiltCommitmentTransaction>) in
BuiltCommitmentTransaction_clone(origPointer)
});
    }

					internal func danglingClone() -> BuiltCommitmentTransaction {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKBuiltCommitmentTransaction>) in
BuiltCommitmentTransaction_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_BuiltCommitmentTransactionDecodeErrorZ {
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_BuiltCommitmentTransactionDecodeErrorZ(pointer: BuiltCommitmentTransaction_read(serWrapper.cOpaqueStruct!));
    }

    public func get_sighash_all(funding_redeemscript: [UInt8], channel_value_satoshis: UInt64) -> [UInt8] {
    	
						let funding_redeemscriptWrapper = Bindings.new_LDKu8sliceWrapper(array: funding_redeemscript)
						defer {
							funding_redeemscriptWrapper.noOpRetain()
						}
					
        return Bindings.LDKThirtyTwoBytes_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKBuiltCommitmentTransaction>) in
BuiltCommitmentTransaction_get_sighash_all(this_argPointer, funding_redeemscriptWrapper.cOpaqueStruct!, channel_value_satoshis)
});
    }

    public func sign(funding_key: [UInt8], funding_redeemscript: [UInt8], channel_value_satoshis: UInt64) -> [UInt8] {
    	
						let funding_redeemscriptWrapper = Bindings.new_LDKu8sliceWrapper(array: funding_redeemscript)
						defer {
							funding_redeemscriptWrapper.noOpRetain()
						}
					
        return Bindings.LDKSignature_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKBuiltCommitmentTransaction>) in
withUnsafePointer(to: Bindings.array_to_tuple32(array: funding_key)) { (funding_keyPointer: UnsafePointer<(UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8,UInt8)>) in
BuiltCommitmentTransaction_sign(this_argPointer, funding_keyPointer, funding_redeemscriptWrapper.cOpaqueStruct!, channel_value_satoshis)
}
});
    }

    internal func free() -> Void {
    	
        return BuiltCommitmentTransaction_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> BuiltCommitmentTransaction {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing BuiltCommitmentTransaction \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing BuiltCommitmentTransaction \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
