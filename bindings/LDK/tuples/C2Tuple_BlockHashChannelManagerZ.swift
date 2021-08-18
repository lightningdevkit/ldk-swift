import LDKHeaders

public class C2Tuple_BlockHashChannelManagerZ {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKC2Tuple_BlockHashChannelManagerZ?;

    public init(pointer: LDKC2Tuple_BlockHashChannelManagerZ){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* TUPLE_METHODS_START */

    public class func new(a: [UInt8], b: ChannelManager) -> C2Tuple_BlockHashChannelManagerZ {
    	
        return C2Tuple_BlockHashChannelManagerZ(pointer: C2Tuple_BlockHashChannelManagerZ_new(Bindings.new_LDKThirtyTwoBytes(array: a), b.cOpaqueStruct!));
    }

    internal func free() -> Void {
    	
        return C2Tuple_BlockHashChannelManagerZ_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> C2Tuple_BlockHashChannelManagerZ {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							self.free()
						}
					}
				

    /* TUPLE_METHODS_END */

}
