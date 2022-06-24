#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class ClosingTransaction: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKClosingTransaction?


	/* DEFAULT_CONSTRUCTOR_START */
    public init(to_holder_value_sat: UInt64, to_counterparty_value_sat: UInt64, to_holder_script: [UInt8], to_counterparty_script: [UInt8], funding_outpoint: OutPoint) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
						let to_holder_scriptWrapper = Bindings.new_LDKCVec_u8ZWrapper(array: to_holder_script)
						defer {
							to_holder_scriptWrapper.noOpRetain()
						}
					
						let to_counterparty_scriptWrapper = Bindings.new_LDKCVec_u8ZWrapper(array: to_counterparty_script)
						defer {
							to_counterparty_scriptWrapper.noOpRetain()
						}
					
        self.cOpaqueStruct = ClosingTransaction_new(to_holder_value_sat, to_counterparty_value_sat, to_holder_scriptWrapper.dangle().cOpaqueStruct!, to_counterparty_scriptWrapper.dangle().cOpaqueStruct!, funding_outpoint.danglingClone().cOpaqueStruct!)
        super.init(conflictAvoidingVariableName: 0)
        
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKClosingTransaction){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKClosingTransaction, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func clone() -> ClosingTransaction {
    	
        return ClosingTransaction(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKClosingTransaction>) in
ClosingTransaction_clone(origPointer)
});
    }

					internal func danglingClone() -> ClosingTransaction {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func hash() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKClosingTransaction>) in
ClosingTransaction_hash(oPointer)
};
    }

    public func trust() -> TrustedClosingTransaction {
    	
        return TrustedClosingTransaction(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKClosingTransaction>) in
ClosingTransaction_trust(this_argPointer)
});
    }

    public func verify(funding_outpoint: OutPoint) -> Result_TrustedClosingTransactionNoneZ {
    	
        return Result_TrustedClosingTransactionNoneZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKClosingTransaction>) in
ClosingTransaction_verify(this_argPointer, funding_outpoint.danglingClone().cOpaqueStruct!)
});
    }

    public func to_holder_value_sat() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKClosingTransaction>) in
ClosingTransaction_to_holder_value_sat(this_argPointer)
};
    }

    public func to_counterparty_value_sat() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKClosingTransaction>) in
ClosingTransaction_to_counterparty_value_sat(this_argPointer)
};
    }

    public func to_holder_script() -> [UInt8] {
    	
        return Bindings.LDKu8slice_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKClosingTransaction>) in
ClosingTransaction_to_holder_script(this_argPointer)
});
    }

    public func to_counterparty_script() -> [UInt8] {
    	
        return Bindings.LDKu8slice_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKClosingTransaction>) in
ClosingTransaction_to_counterparty_script(this_argPointer)
});
    }

    internal func free() -> Void {
    	
        return ClosingTransaction_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> ClosingTransaction {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing ClosingTransaction \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing ClosingTransaction \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
