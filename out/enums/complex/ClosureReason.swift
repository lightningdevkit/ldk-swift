
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			/// 
			public typealias ClosureReason = Bindings.ClosureReason

			extension Bindings {

				/// The reason the channel was closed. See individual variants more details.
				public class ClosureReason: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKClosureReason?

					internal init(cType: LDKClosureReason) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKClosureReason, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public enum ClosureReasonType {
						
						/// Closure generated from receiving a peer error message.
						/// 
						/// Our counterparty may have broadcasted their latest commitment state, and we have
						/// as well.
						case CounterpartyForceClosed
			
						/// Closure generated from [`ChannelManager::force_close_channel`], called by the user.
						/// 
						/// [`ChannelManager::force_close_channel`]: crate::ln::channelmanager::ChannelManager::force_close_channel.
						case HolderForceClosed
			
						/// The channel was closed after negotiating a cooperative close and we've now broadcasted
						/// the cooperative close transaction. Note the shutdown may have been initiated by us.
						case CooperativeClosure
			
						/// A commitment transaction was confirmed on chain, closing the channel. Most likely this
						/// commitment transaction came from our counterparty, but it may also have come from
						/// a copy of our own `ChannelMonitor`.
						case CommitmentTxConfirmed
			
						/// The funding transaction failed to confirm in a timely manner on an inbound channel.
						case FundingTimedOut
			
						/// Closure generated from processing an event, likely a HTLC forward/relay/reception.
						case ProcessingError
			
						/// The peer disconnected prior to funding completing. In this case the spec mandates that we
						/// forget the channel entirely - we can attempt again if the peer reconnects.
						/// 
						/// This includes cases where we restarted prior to funding completion, including prior to the
						/// initial [`ChannelMonitor`] persistence completing.
						/// 
						/// In LDK versions prior to 0.0.107 this could also occur if we were unable to connect to the
						/// peer because of mutual incompatibility between us and our channel counterparty.
						/// 
						/// [`ChannelMonitor`]: crate::chain::channelmonitor::ChannelMonitor
						case DisconnectedPeer
			
						/// Closure generated from `ChannelManager::read` if the [`ChannelMonitor`] is newer than
						/// the [`ChannelManager`] deserialized.
						/// 
						/// [`ChannelMonitor`]: crate::chain::channelmonitor::ChannelMonitor
						/// [`ChannelManager`]: crate::ln::channelmanager::ChannelManager
						case OutdatedChannelManager
			
					}

					public func getValueType() -> ClosureReasonType {
						switch self.cType!.tag {
							case LDKClosureReason_CounterpartyForceClosed:
								return .CounterpartyForceClosed
			
							case LDKClosureReason_HolderForceClosed:
								return .HolderForceClosed
			
							case LDKClosureReason_CooperativeClosure:
								return .CooperativeClosure
			
							case LDKClosureReason_CommitmentTxConfirmed:
								return .CommitmentTxConfirmed
			
							case LDKClosureReason_FundingTimedOut:
								return .FundingTimedOut
			
							case LDKClosureReason_ProcessingError:
								return .ProcessingError
			
							case LDKClosureReason_DisconnectedPeer:
								return .DisconnectedPeer
			
							case LDKClosureReason_OutdatedChannelManager:
								return .OutdatedChannelManager
			
							default:
								Bindings.print("Error: Invalid value type for ClosureReason! Aborting.", severity: .ERROR)
								abort()
						}
		
					}

					
					/// Frees any resources used by the ClosureReason
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ClosureReason_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the ClosureReason
					internal func clone() -> ClosureReason {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKClosureReason>) in
				ClosureReason_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ClosureReason(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new CounterpartyForceClosed-variant ClosureReason
					public class func initWithCounterpartyForceClosed(peerMsg: Bindings.UntrustedString) -> ClosureReason {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ClosureReason_counterparty_force_closed(peerMsg.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ClosureReason(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new HolderForceClosed-variant ClosureReason
					public class func initWithHolderForceClosed() -> ClosureReason {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ClosureReason_holder_force_closed()

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ClosureReason(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new CooperativeClosure-variant ClosureReason
					public class func initWithCooperativeClosure() -> ClosureReason {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ClosureReason_cooperative_closure()

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ClosureReason(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new CommitmentTxConfirmed-variant ClosureReason
					public class func initWithCommitmentTxConfirmed() -> ClosureReason {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ClosureReason_commitment_tx_confirmed()

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ClosureReason(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new FundingTimedOut-variant ClosureReason
					public class func initWithFundingTimedOut() -> ClosureReason {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ClosureReason_funding_timed_out()

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ClosureReason(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new ProcessingError-variant ClosureReason
					public class func initWithProcessingError(err: String) -> ClosureReason {
						// native call variable prep
						
						let errPrimitiveWrapper = Str(value: err).dangle()
				

						// native method call
						let nativeCallResult = ClosureReason_processing_error(errPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						errPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = ClosureReason(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new DisconnectedPeer-variant ClosureReason
					public class func initWithDisconnectedPeer() -> ClosureReason {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ClosureReason_disconnected_peer()

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ClosureReason(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new OutdatedChannelManager-variant ClosureReason
					public class func initWithOutdatedChannelManager() -> ClosureReason {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ClosureReason_outdated_channel_manager()

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ClosureReason(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Checks if two ClosureReasons contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					public class func eq(a: ClosureReason, b: ClosureReason) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKClosureReason>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKClosureReason>) in
				ClosureReason_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Serialize the ClosureReason object into a byte array which can be read by ClosureReason_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKClosureReason>) in
				ClosureReason_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a ClosureReason from a byte array, created by ClosureReason_write
					public class func read(ser: [UInt8]) -> Result_COption_ClosureReasonZDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = ClosureReason_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_COption_ClosureReasonZDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		

					
					public func getValueAsCounterpartyForceClosed() -> CounterpartyForceClosed? {
						if self.cType?.tag != LDKClosureReason_CounterpartyForceClosed {
							return nil
						}

						return ClosureReason_LDKCounterpartyForceClosed_Body(cType: self.cType!.counterparty_force_closed, anchor: self)
					}
			
					public func getValueAsProcessingError() -> ProcessingError? {
						if self.cType?.tag != LDKClosureReason_ProcessingError {
							return nil
						}

						return ClosureReason_LDKProcessingError_Body(cType: self.cType!.processing_error, anchor: self)
					}
			

					internal func dangle(_ shouldDangle: Bool = true) -> ClosureReason {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> ClosureReason {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing ClosureReason \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing ClosureReason \(self.instanceNumber) due to dangle.")
						}
					}
			

					
					
					/// 
					internal typealias ClosureReason_LDKCounterpartyForceClosed_Body = CounterpartyForceClosed
			

					/// 
					public class CounterpartyForceClosed: NativeTypeWrapper {

						

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKClosureReason_LDKCounterpartyForceClosed_Body?

						internal init(cType: LDKClosureReason_LDKCounterpartyForceClosed_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
						}

						internal init(cType: LDKClosureReason_LDKCounterpartyForceClosed_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The error which the peer sent us.
						/// 
						/// Be careful about printing the peer_msg, a well-crafted message could exploit
						/// a security vulnerability in the terminal emulator or the logging subsystem.
						/// To be safe, use `Display` on `UntrustedString`
						/// 
						/// [`UntrustedString`]: crate::util::string::UntrustedString
						public func getPeerMsg() -> Bindings.UntrustedString {
							// return value (do some wrapping)
							let returnValue = Bindings.UntrustedString(cType: self.cType!.peer_msg, anchor: self)

							return returnValue;
						}
		

						internal func dangle(_ shouldDangle: Bool = true) -> CounterpartyForceClosed {
							self.dangling = shouldDangle
							return self
						}

											

					}

					
		
					
					/// 
					internal typealias ClosureReason_LDKProcessingError_Body = ProcessingError
			

					/// 
					public class ProcessingError: NativeTypeWrapper {

						

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKClosureReason_LDKProcessingError_Body?

						internal init(cType: LDKClosureReason_LDKProcessingError_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
						}

						internal init(cType: LDKClosureReason_LDKProcessingError_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// A developer-readable error message which we generated.
						public func getErr() -> String {
							// return value (do some wrapping)
							let returnValue = Str(cType: self.cType!.err, anchor: self).getValue()

							return returnValue;
						}
		

						internal func dangle(_ shouldDangle: Bool = true) -> ProcessingError {
							self.dangling = shouldDangle
							return self
						}

											

					}

					
		

				}

			}
		