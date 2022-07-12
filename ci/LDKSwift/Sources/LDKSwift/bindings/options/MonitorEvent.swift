#if SWIFT_PACKAGE
import LDKHeaders
#endif

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
					case HTLCEvent, CommitmentTxConfirmed, UpdateCompleted, UpdateFailed
				}
				
				public func getValueType() -> MonitorEventValueType? {
					switch self.cOpaqueStruct?.tag {
                    
					case LDKMonitorEvent_HTLCEvent:
						return .HTLCEvent
					case LDKMonitorEvent_CommitmentTxConfirmed:
						return .CommitmentTxConfirmed
					case LDKMonitorEvent_UpdateCompleted:
						return .UpdateCompleted
					case LDKMonitorEvent_UpdateFailed:
						return .UpdateFailed
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
				
					public func getValueAsCommitmentTxConfirmed() -> OutPoint? {
						if self.cOpaqueStruct?.tag != LDKMonitorEvent_CommitmentTxConfirmed {
							return nil
						}
						return 
				{ () in
					let cStruct =
				self.cOpaqueStruct!.commitment_tx_confirmed;
				if cStruct.inner == nil {
					return nil
				}
				return OutPoint(pointer: cStruct, anchor: self)
				}()
			
					}
				
					public func getValueAsUpdateCompleted() -> UpdateCompleted? {
						if self.cOpaqueStruct?.tag != LDKMonitorEvent_UpdateCompleted {
							return nil
						}
						return UpdateCompleted(pointer: self.cOpaqueStruct!.update_completed, anchor: self)
					}
				
					public func getValueAsUpdateFailed() -> OutPoint? {
						if self.cOpaqueStruct?.tag != LDKMonitorEvent_UpdateFailed {
							return nil
						}
						return 
				{ () in
					let cStruct =
				self.cOpaqueStruct!.update_failed;
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

    public class func commitment_tx_confirmed(a: OutPoint) -> MonitorEvent {
    	
        return MonitorEvent(pointer: MonitorEvent_commitment_tx_confirmed(a.danglingClone().cOpaqueStruct!));
    }

    public class func update_completed(funding_txo: OutPoint, monitor_update_id: UInt64) -> MonitorEvent {
    	
        return MonitorEvent(pointer: MonitorEvent_update_completed(funding_txo.danglingClone().cOpaqueStruct!, monitor_update_id));
    }

    public class func update_failed(a: OutPoint) -> MonitorEvent {
    	
        return MonitorEvent(pointer: MonitorEvent_update_failed(a.danglingClone().cOpaqueStruct!));
    }

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKMonitorEvent>) in
MonitorEvent_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_COption_MonitorEventZDecodeErrorZ {
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_COption_MonitorEventZDecodeErrorZ(pointer: MonitorEvent_read(serWrapper.cOpaqueStruct!));
    }

    /* OPTION_METHODS_END */

	

			public class UpdateCompleted: NativeTypeWrapper {
				
				
				var cOpaqueStruct: LDKMonitorEvent_LDKUpdateCompleted_Body?;
				fileprivate init(pointer: LDKMonitorEvent_LDKUpdateCompleted_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKMonitorEvent_LDKUpdateCompleted_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			
				
				
					public func getFunding_txo() -> OutPoint? {
						return 
				{ () in
					let cStruct =
				self.cOpaqueStruct!.funding_txo;
				if cStruct.inner == nil {
					return nil
				}
				return OutPoint(pointer: cStruct, anchor: self)
				}()
			
					}
				
					public func getMonitor_update_id() -> UInt64 {
						return self.cOpaqueStruct!.monitor_update_id
					}
				
				
			}
		
}
