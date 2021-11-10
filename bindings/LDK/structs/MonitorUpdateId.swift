public class MonitorUpdateId: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKMonitorUpdateId?


	

    public init(pointer: LDKMonitorUpdateId){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKMonitorUpdateId, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func clone() -> MonitorUpdateId {
    	
        return MonitorUpdateId(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKMonitorUpdateId>) in
MonitorUpdateId_clone(origPointer)
});
    }

					internal func danglingClone() -> MonitorUpdateId {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func hash() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (oPointer: UnsafePointer<LDKMonitorUpdateId>) in
MonitorUpdateId_hash(oPointer)
};
    }

    public class func eq(a: MonitorUpdateId, b: MonitorUpdateId) -> Bool {
    	
        return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKMonitorUpdateId>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKMonitorUpdateId>) in
MonitorUpdateId_eq(aPointer, bPointer)
}
};
    }

    internal func free() -> Void {
    	
        return MonitorUpdateId_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> MonitorUpdateId {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing MonitorUpdateId \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing MonitorUpdateId \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
