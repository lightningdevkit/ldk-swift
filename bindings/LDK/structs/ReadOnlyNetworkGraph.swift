#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class ReadOnlyNetworkGraph: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKReadOnlyNetworkGraph?


	

    public init(pointer: LDKReadOnlyNetworkGraph){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKReadOnlyNetworkGraph, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func get_addresses(pubkey: [UInt8]) -> Option_CVec_NetAddressZZ {
    	
        return Option_CVec_NetAddressZZ(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKReadOnlyNetworkGraph>) in
ReadOnlyNetworkGraph_get_addresses(this_argPointer, Bindings.new_LDKPublicKey(array: pubkey))
});
    }

    internal func free() -> Void {
    	
        return ReadOnlyNetworkGraph_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> ReadOnlyNetworkGraph {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing ReadOnlyNetworkGraph \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing ReadOnlyNetworkGraph \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
