#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class Result_COption_HTLCDestinationZDecodeErrorZ: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKCResult_COption_HTLCDestinationZDecodeErrorZ?

	/* DEFAULT_CONSTRUCTOR_START */

				public init() {
					Self.instanceCounter += 1
					self.instanceNumber = Self.instanceCounter
        			self.cOpaqueStruct = LDKCResult_COption_HTLCDestinationZDecodeErrorZ(contents: LDKCResult_COption_HTLCDestinationZDecodeErrorZPtr(), result_ok: true)
        			super.init(conflictAvoidingVariableName: 0)
				}
			
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKCResult_COption_HTLCDestinationZDecodeErrorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKCResult_COption_HTLCDestinationZDecodeErrorZ, anchor: NativeTypeWrapper){
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
			
			public func getValue() -> Option_HTLCDestinationZ? {
				if self.cOpaqueStruct?.result_ok == true {
					return Option_HTLCDestinationZ(pointer: self.cOpaqueStruct!.contents.result.pointee, anchor: self)
				}
				return nil
			}
			
    public class func ok(o: Option_HTLCDestinationZ) -> Result_COption_HTLCDestinationZDecodeErrorZ {
    	
        return Result_COption_HTLCDestinationZDecodeErrorZ(pointer: CResult_COption_HTLCDestinationZDecodeErrorZ_ok(o.danglingClone().cOpaqueStruct!));
    }

    public class func err(e: DecodeError) -> Result_COption_HTLCDestinationZDecodeErrorZ {
    	
        return Result_COption_HTLCDestinationZDecodeErrorZ(pointer: CResult_COption_HTLCDestinationZDecodeErrorZ_err(e.danglingClone().cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return CResult_COption_HTLCDestinationZDecodeErrorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Result_COption_HTLCDestinationZDecodeErrorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Result_COption_HTLCDestinationZDecodeErrorZ \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Result_COption_HTLCDestinationZDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Result_COption_HTLCDestinationZDecodeErrorZ {
    	
        return Result_COption_HTLCDestinationZDecodeErrorZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKCResult_COption_HTLCDestinationZDecodeErrorZ>) in
CResult_COption_HTLCDestinationZDecodeErrorZ_clone(origPointer)
});
    }

					internal func danglingClone() -> Result_COption_HTLCDestinationZDecodeErrorZ {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    /* RESULT_METHODS_END */

}
