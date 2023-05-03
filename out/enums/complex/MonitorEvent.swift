
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			/// 
			public typealias MonitorEvent = Bindings.MonitorEvent

			extension Bindings {

				/// An event to be processed by the ChannelManager.
				public class MonitorEvent: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKMonitorEvent?

					internal init(cType: LDKMonitorEvent, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKMonitorEvent, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public enum MonitorEventType {
						
						/// A monitor event containing an HTLCUpdate.
						case HTLCEvent
			
						/// A monitor event that the Channel's commitment transaction was confirmed.
						case CommitmentTxConfirmed
			
						/// Indicates a [`ChannelMonitor`] update has completed. See
						/// [`ChannelMonitorUpdateStatus::InProgress`] for more information on how this is used.
						/// 
						/// [`ChannelMonitorUpdateStatus::InProgress`]: super::ChannelMonitorUpdateStatus::InProgress
						case Completed
			
						/// Indicates a [`ChannelMonitor`] update has failed. See
						/// [`ChannelMonitorUpdateStatus::PermanentFailure`] for more information on how this is used.
						/// 
						/// [`ChannelMonitorUpdateStatus::PermanentFailure`]: super::ChannelMonitorUpdateStatus::PermanentFailure
						case UpdateFailed
			
					}

					public func getValueType() -> MonitorEventType {
						switch self.cType!.tag {
							case LDKMonitorEvent_HTLCEvent:
								return .HTLCEvent
			
							case LDKMonitorEvent_CommitmentTxConfirmed:
								return .CommitmentTxConfirmed
			
							case LDKMonitorEvent_Completed:
								return .Completed
			
							case LDKMonitorEvent_UpdateFailed:
								return .UpdateFailed
			
							default:
								Bindings.print("Error: Invalid value type for MonitorEvent! Aborting.", severity: .ERROR)
								abort()
						}
		
					}

					
					/// Frees any resources used by the MonitorEvent
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = MonitorEvent_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the MonitorEvent
					internal func clone() -> MonitorEvent {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKMonitorEvent>) in
				MonitorEvent_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = MonitorEvent(cType: nativeCallResult, instantiationContext: "MonitorEvent.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new HTLCEvent-variant MonitorEvent
					public class func initWithHtlcevent(a: Bindings.HTLCUpdate) -> MonitorEvent {
						// native call variable prep
						

						// native method call
						let nativeCallResult = MonitorEvent_htlcevent(a.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = MonitorEvent(cType: nativeCallResult, instantiationContext: "MonitorEvent.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new CommitmentTxConfirmed-variant MonitorEvent
					public class func initWithCommitmentTxConfirmed(a: Bindings.OutPoint) -> MonitorEvent {
						// native call variable prep
						

						// native method call
						let nativeCallResult = MonitorEvent_commitment_tx_confirmed(a.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = MonitorEvent(cType: nativeCallResult, instantiationContext: "MonitorEvent.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new Completed-variant MonitorEvent
					public class func initWithCompleted(fundingTxo: Bindings.OutPoint, monitorUpdateId: UInt64) -> MonitorEvent {
						// native call variable prep
						

						// native method call
						let nativeCallResult = MonitorEvent_completed(fundingTxo.dynamicallyDangledClone().cType!, monitorUpdateId)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = MonitorEvent(cType: nativeCallResult, instantiationContext: "MonitorEvent.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new UpdateFailed-variant MonitorEvent
					public class func initWithUpdateFailed(a: Bindings.OutPoint) -> MonitorEvent {
						// native call variable prep
						

						// native method call
						let nativeCallResult = MonitorEvent_update_failed(a.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = MonitorEvent(cType: nativeCallResult, instantiationContext: "MonitorEvent.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Checks if two MonitorEvents contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					public class func eq(a: MonitorEvent, b: MonitorEvent) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKMonitorEvent>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKMonitorEvent>) in
				MonitorEvent_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Serialize the MonitorEvent object into a byte array which can be read by MonitorEvent_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKMonitorEvent>) in
				MonitorEvent_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, instantiationContext: "MonitorEvent.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a MonitorEvent from a byte array, created by MonitorEvent_write
					public class func read(ser: [UInt8]) -> Result_COption_MonitorEventZDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = MonitorEvent_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_COption_MonitorEventZDecodeErrorZ(cType: nativeCallResult, instantiationContext: "MonitorEvent.swift::\(#function):\(#line)")
						

						return returnValue
					}
		

					
					public func getValueAsHtlcEvent() -> Bindings.HTLCUpdate? {
						if self.cType?.tag != LDKMonitorEvent_HTLCEvent {
							return nil
						}

						return HTLCUpdate(cType: self.cType!.htlc_event, instantiationContext: "MonitorEvent.swift::\(#function):\(#line)", anchor: self)
					}
			
					public func getValueAsCommitmentTxConfirmed() -> Bindings.OutPoint? {
						if self.cType?.tag != LDKMonitorEvent_CommitmentTxConfirmed {
							return nil
						}

						return OutPoint(cType: self.cType!.commitment_tx_confirmed, instantiationContext: "MonitorEvent.swift::\(#function):\(#line)", anchor: self)
					}
			
					public func getValueAsCompleted() -> Completed? {
						if self.cType?.tag != LDKMonitorEvent_Completed {
							return nil
						}

						return MonitorEvent_LDKCompleted_Body(cType: self.cType!.completed, instantiationContext: "MonitorEvent.swift::\(#function):\(#line)", anchor: self)
					}
			
					public func getValueAsUpdateFailed() -> Bindings.OutPoint? {
						if self.cType?.tag != LDKMonitorEvent_UpdateFailed {
							return nil
						}

						return OutPoint(cType: self.cType!.update_failed, instantiationContext: "MonitorEvent.swift::\(#function):\(#line)", anchor: self)
					}
			

					internal func dangle(_ shouldDangle: Bool = true) -> MonitorEvent {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> MonitorEvent {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing MonitorEvent \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing MonitorEvent \(self.instanceNumber) due to dangle.")
						}
					}
			

					
					
					/// 
					internal typealias MonitorEvent_LDKCompleted_Body = Completed
			

					/// 
					public class Completed: NativeTypeWrapper {

						

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKMonitorEvent_LDKCompleted_Body?

						internal init(cType: LDKMonitorEvent_LDKCompleted_Body, instantiationContext: String) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						}

						internal init(cType: LDKMonitorEvent_LDKCompleted_Body, instantiationContext: String, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The funding outpoint of the [`ChannelMonitor`] that was updated
						public func getFundingTxo() -> Bindings.OutPoint {
							// return value (do some wrapping)
							let returnValue = Bindings.OutPoint(cType: self.cType!.funding_txo, instantiationContext: "MonitorEvent.swift::\(#function):\(#line)", anchor: self)

							return returnValue;
						}
		
						/// The Update ID from [`ChannelMonitorUpdate::update_id`] which was applied or
						/// [`ChannelMonitor::get_latest_update_id`].
						/// 
						/// Note that this should only be set to a given update's ID if all previous updates for the
						/// same [`ChannelMonitor`] have been applied and persisted.
						public func getMonitorUpdateId() -> UInt64 {
							// return value (do some wrapping)
							let returnValue = self.cType!.monitor_update_id

							return returnValue;
						}
		

						internal func dangle(_ shouldDangle: Bool = true) -> Completed {
							self.dangling = shouldDangle
							return self
						}

											

					}

					
		

				}

			}
		