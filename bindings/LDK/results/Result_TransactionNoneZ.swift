public class Result_TransactionNoneZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKCResult_TransactionNoneZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_TransactionNoneZ(contents: LDKCResult_TransactionNoneZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_TransactionNoneZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKCResult_TransactionNoneZ, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

	public func isOk() -> Bool {
		return self.cOpaqueStruct?.result_ok == true
	}

    /* RESULT_METHODS_START */

			public func getValue() -> [UInt8]? {
				if self.cOpaqueStruct?.result_ok == true {
					return Bindings.LDKTransaction_to_array(nativeType: self.cOpaqueStruct!.contents.result.pointee, deallocate: false)
				}
				return nil
			}
			
    public class func ok(o: [UInt8]) -> Result_TransactionNoneZ {
    	
						let oWrapper = Bindings.new_LDKTransactionWrapper(array: o)
						defer {
							oWrapper.noOpRetain()
						}
					
        return Result_TransactionNoneZ(pointer: CResult_TransactionNoneZ_ok(oWrapper.dangle().cOpaqueStruct!));
    }

    public class func err() -> Result_TransactionNoneZ {
    	
        return Result_TransactionNoneZ(pointer: CResult_TransactionNoneZ_err());
    }

    internal func free() -> Void {
    	
        return CResult_TransactionNoneZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_TransactionNoneZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_TransactionNoneZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_TransactionNoneZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_TransactionNoneZ {
    	
        return Result_TransactionNoneZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_TransactionNoneZ>) in
CResult_TransactionNoneZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_TransactionNoneZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}
