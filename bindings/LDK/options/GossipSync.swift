public class GossipSync: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKGossipSync?

	

    public init(pointer: LDKGossipSync){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKGossipSync, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* OPTION_METHODS_START */

				public enum GossipSyncValueType {
					case P2P, Rapid
				}
				
				public func getValueType() -> GossipSyncValueType? {
					switch self.cOpaqueStruct?.tag {
                    
					case LDKGossipSync_P2P:
						return .P2P
					case LDKGossipSync_Rapid:
						return .Rapid
                    default:
                        return nil
                    }
				}
				
				
					public func getValueAsP2P() -> P2PGossipSync? {
						if self.cOpaqueStruct?.tag != LDKGossipSync_P2P {
							return nil
						}
						return P2PGossipSync(pointer: self.cOpaqueStruct!.p2p, anchor: self)
					}
				
					public func getValueAsRapid() -> RapidGossipSync? {
						if self.cOpaqueStruct?.tag != LDKGossipSync_Rapid {
							return nil
						}
						return RapidGossipSync(pointer: self.cOpaqueStruct!.rapid, anchor: self)
					}
				
			
    internal func free() -> Void {
    	
        return GossipSync_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> GossipSync {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing GossipSync \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing GossipSync \(self.instanceNumber) due to dangle.")
						}
					}
				

    public class func p2_p(a: P2PGossipSync) -> GossipSync {
    	
        return GossipSync(pointer: GossipSync_p2_p(a.cOpaqueStruct!));
    }

    public class func rapid(a: RapidGossipSync) -> GossipSync {
    	
        return GossipSync(pointer: GossipSync_rapid(a.cOpaqueStruct!));
    }

    public class func none() -> GossipSync {
    	
        return GossipSync(pointer: GossipSync_none());
    }

    /* OPTION_METHODS_END */

	/* TYPE_CLASSES */
}
