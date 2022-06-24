#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class Result_PaymentSecretNoneZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKCResult_PaymentSecretNoneZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_PaymentSecretNoneZ(contents: LDKCResult_PaymentSecretNoneZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_PaymentSecretNoneZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKCResult_PaymentSecretNoneZ, anchor: NativeTypeWrapper){
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
					return Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.contents.result.pointee)
				}
				return nil
			}
			
    public class func ok(o: [UInt8]) -> Result_PaymentSecretNoneZ {
    	
        return Result_PaymentSecretNoneZ(pointer: CResult_PaymentSecretNoneZ_ok(Bindings.new_LDKThirtyTwoBytes(array: o)));
    }

    public class func err() -> Result_PaymentSecretNoneZ {
    	
        return Result_PaymentSecretNoneZ(pointer: CResult_PaymentSecretNoneZ_err());
    }

    internal func free() -> Void {
    	
        return CResult_PaymentSecretNoneZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_PaymentSecretNoneZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_PaymentSecretNoneZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_PaymentSecretNoneZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_PaymentSecretNoneZ {
    	
        return Result_PaymentSecretNoneZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_PaymentSecretNoneZ>) in
CResult_PaymentSecretNoneZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_PaymentSecretNoneZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}
