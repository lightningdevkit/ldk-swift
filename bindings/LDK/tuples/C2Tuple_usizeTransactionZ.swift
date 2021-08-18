import LDKHeaders

public class C2Tuple_usizeTransactionZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKC2Tuple_usizeTransactionZ?;

    public init(pointer: LDKC2Tuple_usizeTransactionZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* TUPLE_METHODS_START */

    public func clone() -> C2Tuple_usizeTransactionZ {
    	
        return C2Tuple_usizeTransactionZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKC2Tuple_usizeTransactionZ>) in
C2Tuple_usizeTransactionZ_clone(origPointer)
});
    }

					internal func danglingClone() -> C2Tuple_usizeTransactionZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public class func new(a: UInt, b: [UInt8]) -> C2Tuple_usizeTransactionZ {
    	
        return C2Tuple_usizeTransactionZ(pointer: C2Tuple_usizeTransactionZ_new(a, Bindings.new_LDKTransaction(array: b)));
    }

    internal func free() -> Void {
    	
        return C2Tuple_usizeTransactionZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> C2Tuple_usizeTransactionZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							self.free()
						}
					}
				

    /* TUPLE_METHODS_END */

}
