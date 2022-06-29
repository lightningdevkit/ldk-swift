#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class DirectedChannelInfo: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKDirectedChannelInfo?


	

    public init(pointer: LDKDirectedChannelInfo){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKDirectedChannelInfo, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    public func clone() -> DirectedChannelInfo {
    	
        return DirectedChannelInfo(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKDirectedChannelInfo>) in
DirectedChannelInfo_clone(origPointer)
});
    }

					internal func danglingClone() -> DirectedChannelInfo {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public func channel() -> ChannelInfo {
    	
        return ChannelInfo(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKDirectedChannelInfo>) in
DirectedChannelInfo_channel(this_argPointer)
});
    }

    public func direction() -> ChannelUpdateInfo {
    	
        return ChannelUpdateInfo(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKDirectedChannelInfo>) in
DirectedChannelInfo_direction(this_argPointer)
});
    }

    public func htlc_maximum_msat() -> UInt64 {
    	
        return withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKDirectedChannelInfo>) in
DirectedChannelInfo_htlc_maximum_msat(this_argPointer)
};
    }

    public func effective_capacity() -> EffectiveCapacity {
    	
        return EffectiveCapacity(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (this_argPointer: UnsafePointer<LDKDirectedChannelInfo>) in
DirectedChannelInfo_effective_capacity(this_argPointer)
});
    }

    internal func free() -> Void {
    	
        return DirectedChannelInfo_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> DirectedChannelInfo {
        				self.dangling = true
						return self
					}

					deinit {
						if !self.dangling {
							Bindings.print("Freeing DirectedChannelInfo \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing DirectedChannelInfo \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
