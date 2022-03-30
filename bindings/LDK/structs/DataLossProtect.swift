public class DataLossProtect: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKDataLossProtect?


	/* DEFAULT_CONSTRUCTOR_START */
    public init(your_last_per_commitment_secret_arg: [UInt8], my_current_per_commitment_point_arg: [UInt8]) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = DataLossProtect_new(Bindings.new_LDKThirtyTwoBytes(array: your_last_per_commitment_secret_arg), Bindings.new_LDKPublicKey(array: my_current_per_commitment_point_arg))
        super.init(conflictAvoidingVariableName: 0)
        
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKDataLossProtect){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKDataLossProtect, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func get_your_last_per_commitment_secret() -> [UInt8] {
    	
        return Bindings.tuple32_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKDataLossProtect>) in
DataLossProtect_get_your_last_per_commitment_secret(this_ptrPointer)
}.pointee);
    }

    public func set_your_last_per_commitment_secret(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKDataLossProtect>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return DataLossProtect_set_your_last_per_commitment_secret(this_ptrPointer, Bindings.new_LDKThirtyTwoBytes(array: val));
    }

    public func get_my_current_per_commitment_point() -> [UInt8] {
    	
        return Bindings.LDKPublicKey_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKDataLossProtect>) in
DataLossProtect_get_my_current_per_commitment_point(this_ptrPointer)
});
    }

    public func set_my_current_per_commitment_point(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKDataLossProtect>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return DataLossProtect_set_my_current_per_commitment_point(this_ptrPointer, Bindings.new_LDKPublicKey(array: val));
    }

    public func clone() -> DataLossProtect {
    	
        return DataLossProtect(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKDataLossProtect>) in
DataLossProtect_clone(origPointer)
});
    }

					internal func danglingClone() -> DataLossProtect {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    internal func free() -> Void {
    	
        return DataLossProtect_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> DataLossProtect {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing DataLossProtect \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing DataLossProtect \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
