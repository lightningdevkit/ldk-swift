public class MonitorEvent: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKMonitorEvent?

	

    public init(pointer: LDKMonitorEvent){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKMonitorEvent, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* OPTION_METHODS_START */

				public enum MonitorEventValueType {
					case HTLCEvent, CommitmentTxBroadcasted
				}
				
				public func getValueType() -> MonitorEventValueType? {
					switch self.cOpaqueStruct?.tag {
                    
					case LDKMonitorEvent_HTLCEvent:
						return .HTLCEvent
					case LDKMonitorEvent_CommitmentTxBroadcasted:
						return .CommitmentTxBroadcasted
                    default:
                        return nil
                    }
				}
				
				
					public func getValueAsHTLCEvent() -> HTLCUpdate? {
						if self.cOpaqueStruct?.tag != LDKMonitorEvent_HTLCEvent {
							return nil
						}
						return HTLCUpdate(pointer: self.cOpaqueStruct!.htlc_event, anchor: self)
					}
				
					public func getValueAsCommitmentTxBroadcasted() -> OutPoint? {
						if self.cOpaqueStruct?.tag != LDKMonitorEvent_CommitmentTxBroadcasted {
							return nil
						}
						return 
				{ () in
					let cStruct =
				self.cOpaqueStruct!.commitment_tx_broadcasted;
				if cStruct.inner == nil {
					return nil
				}	
				return OutPoint(pointer: cStruct, anchor: self)
				}()
			
					}
				
			
    internal func free() -> Void {
    	
        return MonitorEvent_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> MonitorEvent {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing MonitorEvent \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing MonitorEvent \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> MonitorEvent {
    	
        return MonitorEvent(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKMonitorEvent>) in
MonitorEvent_clone(origPointer)
});
    }

					internal func danglingClone() -> MonitorEvent {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public class func htlcevent(a: HTLCUpdate) -> MonitorEvent {
    	
        return MonitorEvent(pointer: MonitorEvent_htlcevent(a.danglingClone().cOpaqueStruct!));
    }

    public class func commitment_tx_broadcasted(a: OutPoint) -> MonitorEvent {
    	
        return MonitorEvent(pointer: MonitorEvent_commitment_tx_broadcasted(a.danglingClone().cOpaqueStruct!));
    }

    /* OPTION_METHODS_END */

	/* TYPE_CLASSES */
}
