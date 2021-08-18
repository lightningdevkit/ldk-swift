import LDKHeaders

public class C2Tuple_BlockHashChannelMonitorZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKC2Tuple_BlockHashChannelMonitorZ?;

    public init(pointer: LDKC2Tuple_BlockHashChannelMonitorZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* TUPLE_METHODS_START */

    public class func new(a: [UInt8], b: ChannelMonitor) -> C2Tuple_BlockHashChannelMonitorZ {
    	
        return C2Tuple_BlockHashChannelMonitorZ(pointer: C2Tuple_BlockHashChannelMonitorZ_new(Bindings.new_LDKThirtyTwoBytes(array: a), b.cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return C2Tuple_BlockHashChannelMonitorZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> C2Tuple_BlockHashChannelMonitorZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							print("Freeing C2Tuple_BlockHashChannelMonitorZ \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing C2Tuple_BlockHashChannelMonitorZ \(self.instanceNumber) due to dangle.")
						}
					}
				

    /* TUPLE_METHODS_END */

}
