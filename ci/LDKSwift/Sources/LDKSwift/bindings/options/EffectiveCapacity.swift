#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class EffectiveCapacity: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKEffectiveCapacity?

	

    public init(pointer: LDKEffectiveCapacity){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKEffectiveCapacity, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* OPTION_METHODS_START */

				public enum EffectiveCapacityValueType {
					case ExactLiquidity, MaximumHTLC, Total
				}
				
				public func getValueType() -> EffectiveCapacityValueType? {
					switch self.cOpaqueStruct?.tag {
                    
					case LDKEffectiveCapacity_ExactLiquidity:
						return .ExactLiquidity
					case LDKEffectiveCapacity_MaximumHTLC:
						return .MaximumHTLC
					case LDKEffectiveCapacity_Total:
						return .Total
                    default:
                        return nil
                    }
				}
				
				
					public func getValueAsExactLiquidity() -> ExactLiquidity? {
						if self.cOpaqueStruct?.tag != LDKEffectiveCapacity_ExactLiquidity {
							return nil
						}
						return ExactLiquidity(pointer: self.cOpaqueStruct!.exact_liquidity, anchor: self)
					}
				
					public func getValueAsMaximumHTLC() -> MaximumHTLC? {
						if self.cOpaqueStruct?.tag != LDKEffectiveCapacity_MaximumHTLC {
							return nil
						}
						return MaximumHTLC(pointer: self.cOpaqueStruct!.maximum_htlc, anchor: self)
					}
				
					public func getValueAsTotal() -> Total? {
						if self.cOpaqueStruct?.tag != LDKEffectiveCapacity_Total {
							return nil
						}
						return Total(pointer: self.cOpaqueStruct!.total, anchor: self)
					}
				
			
    internal func free() -> Void {
    	
        return EffectiveCapacity_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> EffectiveCapacity {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing EffectiveCapacity \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing EffectiveCapacity \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> EffectiveCapacity {
    	
        return EffectiveCapacity(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKEffectiveCapacity>) in
EffectiveCapacity_clone(origPointer)
});
    }

					internal func danglingClone() -> EffectiveCapacity {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public class func exact_liquidity(liquidity_msat: UInt64) -> EffectiveCapacity {
    	
        return EffectiveCapacity(pointer: EffectiveCapacity_exact_liquidity(liquidity_msat));
    }

    public class func maximum_htlc(amount_msat: UInt64) -> EffectiveCapacity {
    	
        return EffectiveCapacity(pointer: EffectiveCapacity_maximum_htlc(amount_msat));
    }

    public class func total(capacity_msat: UInt64, htlc_maximum_msat: Option_u64Z) -> EffectiveCapacity {
    	
        return EffectiveCapacity(pointer: EffectiveCapacity_total(capacity_msat, htlc_maximum_msat.danglingClone().cOpaqueStruct!));
    }

    public class func infinite() -> EffectiveCapacity {
    	
        return EffectiveCapacity(pointer: EffectiveCapacity_infinite());
    }

    public class func unknown() -> EffectiveCapacity {
    	
        return EffectiveCapacity(pointer: EffectiveCapacity_unknown());
    }

    public func as_msat() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKEffectiveCapacity>) in
EffectiveCapacity_as_msat(this_argPointer)
};
    }

    /* OPTION_METHODS_END */

	

			public class ExactLiquidity: NativeTypeWrapper {
				
				
				var cOpaqueStruct: LDKEffectiveCapacity_LDKExactLiquidity_Body?;
				fileprivate init(pointer: LDKEffectiveCapacity_LDKExactLiquidity_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKEffectiveCapacity_LDKExactLiquidity_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			
				
				
					public func getLiquidity_msat() -> UInt64 {
						return self.cOpaqueStruct!.liquidity_msat
					}
				
				
			}
		

			public class MaximumHTLC: NativeTypeWrapper {
				
				
				var cOpaqueStruct: LDKEffectiveCapacity_LDKMaximumHTLC_Body?;
				fileprivate init(pointer: LDKEffectiveCapacity_LDKMaximumHTLC_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKEffectiveCapacity_LDKMaximumHTLC_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			
				
				
					public func getAmount_msat() -> UInt64 {
						return self.cOpaqueStruct!.amount_msat
					}
				
				
			}
		

			public class Total: NativeTypeWrapper {
				
				
				var cOpaqueStruct: LDKEffectiveCapacity_LDKTotal_Body?;
				fileprivate init(pointer: LDKEffectiveCapacity_LDKTotal_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKEffectiveCapacity_LDKTotal_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			
				
				
					public func getCapacity_msat() -> UInt64 {
						return self.cOpaqueStruct!.capacity_msat
					}
				
					public func getHtlc_maximum_msat() -> Option_u64Z {
						return Option_u64Z(pointer: self.cOpaqueStruct!.htlc_maximum_msat, anchor: self)
					}
				
				
			}
		
}
