public class Result_NetworkGraphDecodeErrorZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKCResult_NetworkGraphDecodeErrorZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_NetworkGraphDecodeErrorZ(contents: LDKCResult_NetworkGraphDecodeErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_NetworkGraphDecodeErrorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKCResult_NetworkGraphDecodeErrorZ, anchor: NativeTypeWrapper){
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

			public func getError() -> DecodeError? {
				if self.cOpaqueStruct?.result_ok == false {
					return DecodeError(pointer: self.cOpaqueStruct!.contents.err.pointee, anchor: self)
				}
				return nil
			}
			
			public func getValue() -> NetworkGraph? {
				if self.cOpaqueStruct?.result_ok == true {
					return NetworkGraph(pointer: self.cOpaqueStruct!.contents.result.pointee, anchor: self)
				}
				return nil
			}
			
    #warning("This method passes non-cloneable objects by owned value. Here be dragons.")
@available(*, deprecated, message: "This method passes non-cloneable objects by owned value. Here be dragons.")
public class func ok(o: NetworkGraph) -> Result_NetworkGraphDecodeErrorZ {
    	
        return Result_NetworkGraphDecodeErrorZ(pointer: CResult_NetworkGraphDecodeErrorZ_ok(o.cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_NetworkGraphDecodeErrorZ {
    	
        return Result_NetworkGraphDecodeErrorZ(pointer: CResult_NetworkGraphDecodeErrorZ_err(e.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_NetworkGraphDecodeErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_NetworkGraphDecodeErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_NetworkGraphDecodeErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_NetworkGraphDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* RESULT_METHODS_END */

}
