public class Result_TrustedClosingTransactionNoneZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKCResult_TrustedClosingTransactionNoneZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_TrustedClosingTransactionNoneZ(contents: LDKCResult_TrustedClosingTransactionNoneZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_TrustedClosingTransactionNoneZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKCResult_TrustedClosingTransactionNoneZ, anchor: NativeTypeWrapper){
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

		public func getValue() throws -> TrustedClosingTransaction {
			if self.cOpaqueStruct?.result_ok == true {
				return TrustedClosingTransaction(pointer: self.cOpaqueStruct!.contents.result.pointee, anchor: self)
			}
			throw Bindings.Error.void
			// return nil
		}
		
    #warning("This method passes non-cloneable objects by owned value. Here be dragons.")
@available(*, deprecated, message: "This method passes non-cloneable objects by owned value. Here be dragons.")
public class func ok(o: TrustedClosingTransaction) -> Result_TrustedClosingTransactionNoneZ {
    	
        return Result_TrustedClosingTransactionNoneZ(pointer: CResult_TrustedClosingTransactionNoneZ_ok(o.cOpaqueStruct!));
    }

    public class func err() -> Result_TrustedClosingTransactionNoneZ {
    	
        return Result_TrustedClosingTransactionNoneZ(pointer: CResult_TrustedClosingTransactionNoneZ_err());
    }

    internal func free() -> Void {
    	
        return CResult_TrustedClosingTransactionNoneZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_TrustedClosingTransactionNoneZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_TrustedClosingTransactionNoneZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_TrustedClosingTransactionNoneZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* RESULT_METHODS_END */

}
