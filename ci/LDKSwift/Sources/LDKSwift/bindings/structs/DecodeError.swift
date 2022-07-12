#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class DecodeError: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKDecodeError?


	

    public init(pointer: LDKDecodeError){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKDecodeError, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func clone() -> DecodeError {
    	
        return DecodeError(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKDecodeError>) in
DecodeError_clone(origPointer)
});
    }

					internal func danglingClone() -> DecodeError {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    internal func free() -> Void {
    	
        return DecodeError_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> DecodeError {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing DecodeError \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing DecodeError \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
