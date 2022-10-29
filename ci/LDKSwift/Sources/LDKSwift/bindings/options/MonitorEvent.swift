#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias MonitorEvent = Bindings.MonitorEvent

extension Bindings {

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
					case HTLCEvent, CommitmentTxConfirmed, Completed, UpdateFailed
				}

				public func getValueType() -> MonitorEventValueType? {
					switch self.cOpaqueStruct?.tag {
                    
					case LDKMonitorEvent_HTLCEvent:
						return .HTLCEvent
					case LDKMonitorEvent_CommitmentTxConfirmed:
						return .CommitmentTxConfirmed
					case LDKMonitorEvent_Completed:
						return .Completed
					case LDKMonitorEvent_UpdateFailed:
						return .UpdateFailed
                    default:
                        return nil
                    }
				}

				
					public func getValueAsHTLCEvent() -> Bindings.HTLCUpdate? {
						if self.cOpaqueStruct?.tag != LDKMonitorEvent_HTLCEvent {
							return nil
						}
						return Bindings.HTLCUpdate(pointer: self.cOpaqueStruct!.htlc_event, anchor: self)
					}
				
					public func getValueAsCommitmentTxConfirmed() -> Bindings.OutPoint? {
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
				return Bindings.OutPoint(pointer: cStruct, anchor: self)
				}()
			
					}
				
					public func getValueAsCompleted() -> Completed? {
						if self.cOpaqueStruct?.tag != LDKMonitorEvent_Completed {
							return nil
						}
						return Completed(pointer: self.cOpaqueStruct!.completed, anchor: self)
					}
				
					public func getValueAsUpdateFailed() -> Bindings.OutPoint? {
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
				return Bindings.OutPoint(pointer: cStruct, anchor: self)
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
				

		public class func htlcevent(a: Bindings.HTLCUpdate) -> MonitorEvent {
			
			return MonitorEvent(pointer: MonitorEvent_htlcevent(a.danglingClone().cOpaqueStruct!));
		}

		public class func commitment_tx_confirmed(a: Bindings.OutPoint) -> MonitorEvent {
			
			return MonitorEvent(pointer: MonitorEvent_commitment_tx_confirmed(a.danglingClone().cOpaqueStruct!));
		}

		public class func completed(funding_txo: Bindings.OutPoint, monitor_update_id: UInt64) -> MonitorEvent {
			
			return MonitorEvent(pointer: MonitorEvent_completed(funding_txo.danglingClone().cOpaqueStruct!, monitor_update_id));
		}

		public class func update_failed(a: Bindings.OutPoint) -> MonitorEvent {
			
			return MonitorEvent(pointer: MonitorEvent_update_failed(a.danglingClone().cOpaqueStruct!));
		}

		public class func eq(a: Bindings.MonitorEvent, b: Bindings.MonitorEvent) -> Bool {
			
			return withUnsafePointer(to: a.cOpaqueStruct!) { (aPointer: UnsafePointer<LDKMonitorEvent>) in
withUnsafePointer(to: b.cOpaqueStruct!) { (bPointer: UnsafePointer<LDKMonitorEvent>) in
MonitorEvent_eq(aPointer, bPointer)
}
};
		}

		public func write() -> [UInt8] {
			
			return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKMonitorEvent>) in
MonitorEvent_write(objPointer)
}, callerContext: "MonitorEvent::write");
		}

		public class func read(ser: [UInt8]) -> Result_COption_MonitorEventZDecodeErrorZ {
			
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
			return Result_COption_MonitorEventZDecodeErrorZ(pointer: MonitorEvent_read(serWrapper.cOpaqueStruct!));
		}

		/* OPTION_METHODS_END */

		

			public class Completed: NativeTypeWrapper {

				
				var cOpaqueStruct: LDKMonitorEvent_LDKCompleted_Body?;
				fileprivate init(pointer: LDKMonitorEvent_LDKCompleted_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKMonitorEvent_LDKCompleted_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			

				
					public func getFunding_txo() -> Bindings.OutPoint? {
						return 
				{ () in
					let cStruct =
				self.cOpaqueStruct!.funding_txo;
				if cStruct.inner == nil {
					return nil
				}
				return Bindings.OutPoint(pointer: cStruct, anchor: self)
				}()
			
					}
				
					public func getMonitor_update_id() -> UInt64 {
						return self.cOpaqueStruct!.monitor_update_id
					}
				

			}
		
	}

}
