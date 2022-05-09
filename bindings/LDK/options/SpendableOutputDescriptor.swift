public class SpendableOutputDescriptor: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKSpendableOutputDescriptor?

	

    public init(pointer: LDKSpendableOutputDescriptor){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKSpendableOutputDescriptor, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
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
						return StaticOutput(pointer: self.cOpaqueStruct!.static_output, anchor: self)
					}
				
					public func getValueAsDelayedPaymentOutput() -> DelayedPaymentOutputDescriptor? {
						if self.cOpaqueStruct?.tag != LDKSpendableOutputDescriptor_DelayedPaymentOutput {
							return nil
						}
						return DelayedPaymentOutputDescriptor(pointer: self.cOpaqueStruct!.delayed_payment_output, anchor: self)
					}
				
					public func getValueAsStaticPaymentOutput() -> StaticPaymentOutputDescriptor? {
						if self.cOpaqueStruct?.tag != LDKSpendableOutputDescriptor_StaticPaymentOutput {
							return nil
						}
						return StaticPaymentOutputDescriptor(pointer: self.cOpaqueStruct!.static_payment_output, anchor: self)
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
							Bindings.print("Freeing SpendableOutputDescriptor \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing SpendableOutputDescriptor \(self.instanceNumber) due to dangle.")
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
				

    public class func static_output(outpoint: OutPoint, output: LDKTxOut) -> SpendableOutputDescriptor {
    	
        return SpendableOutputDescriptor(pointer: SpendableOutputDescriptor_static_output(outpoint.danglingClone().cOpaqueStruct!, output));
    }

    public class func delayed_payment_output(a: DelayedPaymentOutputDescriptor) -> SpendableOutputDescriptor {
    	
        return SpendableOutputDescriptor(pointer: SpendableOutputDescriptor_delayed_payment_output(a.danglingClone().cOpaqueStruct!));
    }

    public class func static_payment_output(a: StaticPaymentOutputDescriptor) -> SpendableOutputDescriptor {
    	
        return SpendableOutputDescriptor(pointer: SpendableOutputDescriptor_static_payment_output(a.danglingClone().cOpaqueStruct!));
    }

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKSpendableOutputDescriptor>) in
SpendableOutputDescriptor_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_SpendableOutputDescriptorDecodeErrorZ {
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_SpendableOutputDescriptorDecodeErrorZ(pointer: SpendableOutputDescriptor_read(serWrapper.cOpaqueStruct!));
    }

    /* OPTION_METHODS_END */

	

			public class StaticOutput: NativeTypeWrapper {
				
				
				var cOpaqueStruct: LDKSpendableOutputDescriptor_LDKStaticOutput_Body?;
				fileprivate init(pointer: LDKSpendableOutputDescriptor_LDKStaticOutput_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKSpendableOutputDescriptor_LDKStaticOutput_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			
				
				
					public func getOutpoint() -> OutPoint? {
						return 
				{ () in
					let cStruct =
				self.cOpaqueStruct!.outpoint;
				if cStruct.inner == nil {
					return nil
				}
				return OutPoint(pointer: cStruct, anchor: self)
				}()
			
					}
				
					public func getOutput() -> TxOut {
						return TxOut(pointer: self.cOpaqueStruct!.output, anchor: self)
					}
				
				
			}
		
}
