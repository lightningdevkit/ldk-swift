#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class InvalidShutdownScript: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKInvalidShutdownScript?


	/* DEFAULT_CONSTRUCTOR_START */
    public init(script_arg: [UInt8]) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
						let script_argWrapper = Bindings.new_LDKCVec_u8ZWrapper(array: script_arg)
						defer {
							script_argWrapper.noOpRetain()
						}
					
        self.cOpaqueStruct = InvalidShutdownScript_new(script_argWrapper.dangle().cOpaqueStruct!)
        super.init(conflictAvoidingVariableName: 0)
        
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKInvalidShutdownScript){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKInvalidShutdownScript, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func get_script() -> [UInt8] {
    	
        return Bindings.LDKu8slice_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKInvalidShutdownScript>) in
InvalidShutdownScript_get_script(this_ptrPointer)
});
    }

    public func set_script(val: [UInt8]) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKInvalidShutdownScript>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
						let valWrapper = Bindings.new_LDKCVec_u8ZWrapper(array: val)
						defer {
							valWrapper.noOpRetain()
						}
					
        return InvalidShutdownScript_set_script(this_ptrPointer, valWrapper.dangle().cOpaqueStruct!);
    }

    public func clone() -> InvalidShutdownScript {
    	
        return InvalidShutdownScript(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKInvalidShutdownScript>) in
InvalidShutdownScript_clone(origPointer)
});
    }

					internal func danglingClone() -> InvalidShutdownScript {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    internal func free() -> Void {
    	
        return InvalidShutdownScript_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> InvalidShutdownScript {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing InvalidShutdownScript \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing InvalidShutdownScript \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
