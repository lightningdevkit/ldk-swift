public class PeerHandleError {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKPeerHandleError?;


	/* DEFAULT_CONSTRUCTOR_START */
    public init(no_connection_possible_arg: Bool) {
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
    	
        self.cOpaqueStruct = PeerHandleError_new(no_connection_possible_arg)
    }
    /* DEFAULT_CONSTRUCTOR_END */

    public init(pointer: LDKPeerHandleError){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* STRUCT_METHODS_START */

    public func get_no_connection_possible() -> Bool {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_ptrPointer: UnsafePointer<LDKPeerHandleError>) in
PeerHandleError_get_no_connection_possible(this_ptrPointer)
};
    }

    public func set_no_connection_possible(val: Bool) -> Void {
    	
							let this_ptrPointer = UnsafeMutablePointer<LDKPeerHandleError>.allocate(capacity: 1)
							this_ptrPointer.initialize(to: self.cOpaqueStruct!)
						
        return PeerHandleError_set_no_connection_possible(this_ptrPointer, val);
    }

    public func clone() -> PeerHandleError {
    	
        return PeerHandleError(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKPeerHandleError>) in
PeerHandleError_clone(origPointer)
});
    }

					internal func danglingClone() -> PeerHandleError {
        				var dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    internal func free() -> Void {
    	
        return PeerHandleError_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> PeerHandleError {
        				self.dangling = true
						return self
					}
					
					deinit {
						self.free()
					}
				

    /* STRUCT_METHODS_END */

}
