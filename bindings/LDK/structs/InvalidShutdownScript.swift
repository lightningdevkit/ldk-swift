import LDKHeaders

public class InvalidShutdownScript {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKInvalidShutdownScript?;


	/* DEFAULT_CONSTRUCTOR_START */
    public init(script_arg: [UInt8]) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
						let script_argWrapper = Bindings.new_LDKCVec_u8ZWrapper(array: script_arg)
						defer {
							script_argWrapper.noOpRetain()
						}
					
        self.cOpaqueStruct = InvalidShutdownScript_new(script_argWrapper.cOpaqueStruct!)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKInvalidShutdownScript){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
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
					
        return InvalidShutdownScript_set_script(this_ptrPointer, valWrapper.cOpaqueStruct!);
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
							print("Freeing InvalidShutdownScript \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing InvalidShutdownScript \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
