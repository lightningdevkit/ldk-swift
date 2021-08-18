public class SpendableOutputDescriptor {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKSpendableOutputDescriptor?;

	

    public init(pointer: LDKSpendableOutputDescriptor){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* OPTION_METHODS_START */

				public enum SpendableOutputDescriptorValueType {
					case StaticOutput, DelayedPaymentOutput, StaticPaymentOutput
				}
				
				public func getValueType() -> SpendableOutputDescriptorValueType? {
					switch self.cOpaqueStruct?.tag {
                    
					case LDKSpendableOutputDescriptor_StaticOutput:
						return .StaticOutput
					case LDKSpendableOutputDescriptor_DelayedPaymentOutput:
						return .DelayedPaymentOutput
					case LDKSpendableOutputDescriptor_StaticPaymentOutput:
						return .StaticPaymentOutput
                    default:
                        return nil
                    }
				}
				
				
					public func getValueAsStaticOutput() -> StaticOutput? {
						if self.cOpaqueStruct?.tag != LDKSpendableOutputDescriptor_StaticOutput {
							return nil
						}
						return StaticOutput(pointer: self.cOpaqueStruct!.static_output)
					}
				
					public func getValueAsDelayedPaymentOutput() -> DelayedPaymentOutputDescriptor? {
						if self.cOpaqueStruct?.tag != LDKSpendableOutputDescriptor_DelayedPaymentOutput {
							return nil
						}
						return DelayedPaymentOutputDescriptor(pointer: self.cOpaqueStruct!.delayed_payment_output)
					}
				
					public func getValueAsStaticPaymentOutput() -> StaticPaymentOutputDescriptor? {
						if self.cOpaqueStruct?.tag != LDKSpendableOutputDescriptor_StaticPaymentOutput {
							return nil
						}
						return StaticPaymentOutputDescriptor(pointer: self.cOpaqueStruct!.static_payment_output)
					}
				
			
    internal func free() -> Void {
    	
        return SpendableOutputDescriptor_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> SpendableOutputDescriptor {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing SpendableOutputDescriptor \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing SpendableOutputDescriptor \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> SpendableOutputDescriptor {
    	
        return SpendableOutputDescriptor(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKSpendableOutputDescriptor>) in
SpendableOutputDescriptor_clone(origPointer)
});
    }

					internal func danglingClone() -> SpendableOutputDescriptor {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKSpendableOutputDescriptor>) in
SpendableOutputDescriptor_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_SpendableOutputDescriptorDecodeErrorZ {
    	
        return Result_SpendableOutputDescriptorDecodeErrorZ(pointer: SpendableOutputDescriptor_read(Bindings.new_LDKu8slice(array: ser)));
    }

    /* OPTION_METHODS_END */

	

			public class StaticOutput {
				
				
				var cOpaqueStruct: LDKSpendableOutputDescriptor_LDKStaticOutput_Body?;
				fileprivate init(pointer: LDKSpendableOutputDescriptor_LDKStaticOutput_Body) {
					self.cOpaqueStruct = pointer
				}
			
				
				
					public func getOutpoint() -> OutPoint {
						return OutPoint(pointer: self.cOpaqueStruct!.outpoint)
					}
				
					public func getOutput() -> TxOut {
						return TxOut(pointer: self.cOpaqueStruct!.output)
					}
				
				
			}
		
}
