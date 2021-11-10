public class MonitorUpdateError: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKMonitorUpdateError?


	/* DEFAULT_CONSTRUCTOR_START */
    public init(a_arg: String) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = MonitorUpdateError_new(Bindings.new_LDKStr(string: a_arg))
        super.init(conflictAvoidingVariableName: 0)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKMonitorUpdateError){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKMonitorUpdateError, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func get_a() -> String {
    	
        return Bindings.LDKStr_to_string(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKMonitorUpdateError>) in
MonitorUpdateError_get_a(this_ptrPointer)
});
    }

    public func set_a(val: String) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKMonitorUpdateError>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return MonitorUpdateError_set_a(this_ptrPointer, Bindings.new_LDKStr(string: val));
    }

    public func clone() -> MonitorUpdateError {
    	
        return MonitorUpdateError(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKMonitorUpdateError>) in
MonitorUpdateError_clone(origPointer)
});
    }

					internal func danglingClone() -> MonitorUpdateError {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    internal func free() -> Void {
    	
        return MonitorUpdateError_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> MonitorUpdateError {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing MonitorUpdateError \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing MonitorUpdateError \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
