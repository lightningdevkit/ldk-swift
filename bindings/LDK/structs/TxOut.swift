import LDKHeaders

public class TxOut {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKTxOut?;


	/* DEFAULT_CONSTRUCTOR_START */
    public init(script_pubkey: [UInt8], value: UInt64) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
						let script_pubkeyWrapper = Bindings.new_LDKCVec_u8ZWrapper(array: script_pubkey)
						defer {
							script_pubkeyWrapper.noOpRetain()
						}
					
        self.cOpaqueStruct = TxOut_new(script_pubkeyWrapper.dangle().cOpaqueStruct!, value)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKTxOut){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func clone() -> TxOut {
    	
        return TxOut(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKTxOut>) in
TxOut_clone(origPointer)
});
    }

					internal func danglingClone() -> TxOut {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    internal func free() -> Void {
    	
        return TxOut_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> TxOut {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing TxOut \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing TxOut \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func get_script_pubkey() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: self.cOpaqueStruct!.script_pubkey);
    }

    public func get_value() -> UInt64 {
    	
        return self.cOpaqueStruct!.value;
    }

    /* STRUCT_METHODS_END */

}
