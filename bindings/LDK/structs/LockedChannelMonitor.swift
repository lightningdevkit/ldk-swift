#if SWIFT_PACKAGE
import LDKHeaders
#endif

public class LockedChannelMonitor: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKLockedChannelMonitor?


	

    public init(pointer: LDKLockedChannelMonitor){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKLockedChannelMonitor, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* STRUCT_METHODS_START */

    internal func free() -> Void {
    	
        return LockedChannelMonitor_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> LockedChannelMonitor {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing LockedChannelMonitor \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing LockedChannelMonitor \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* STRUCT_METHODS_END */

}
