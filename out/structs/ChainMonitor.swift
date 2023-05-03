
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// An implementation of [`chain::Watch`] for monitoring channels.
			/// 
			/// Connected and disconnected blocks must be provided to `ChainMonitor` as documented by
			/// [`chain::Watch`]. May be used in conjunction with [`ChannelManager`] to monitor channels locally
			/// or used independently to monitor channels remotely. See the [module-level documentation] for
			/// details.
			/// 
			/// [`ChannelManager`]: crate::ln::channelmanager::ChannelManager
			/// [module-level documentation]: crate::chain::chainmonitor
			public typealias ChainMonitor = Bindings.ChainMonitor

			extension Bindings {
		

				/// An implementation of [`chain::Watch`] for monitoring channels.
				/// 
				/// Connected and disconnected blocks must be provided to `ChainMonitor` as documented by
				/// [`chain::Watch`]. May be used in conjunction with [`ChannelManager`] to monitor channels locally
				/// or used independently to monitor channels remotely. See the [module-level documentation] for
				/// details.
				/// 
				/// [`ChannelManager`]: crate::ln::channelmanager::ChannelManager
				/// [module-level documentation]: crate::chain::chainmonitor
				public class ChainMonitor: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKChainMonitor?

					internal init(cType: LDKChainMonitor, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKChainMonitor, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the ChainMonitor, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ChainMonitor_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new `ChainMonitor` used to watch on-chain activity pertaining to channels.
					/// 
					/// When an optional chain source implementing [`chain::Filter`] is provided, the chain monitor
					/// will call back to it indicating transactions and outputs of interest. This allows clients to
					/// pre-filter blocks or only fetch blocks matching a compact filter. Otherwise, clients may
					/// always need to fetch full blocks absent another means for determining which blocks contain
					/// transactions relevant to the watched channels.
					public init(chainSource: Filter?, broadcaster: BroadcasterInterface, logger: Logger, feeest: FeeEstimator, persister: Persist) {
						// native call variable prep
						
						let chainSourceOption = Option_FilterZ(some: chainSource).dangle()
				

						// native method call
						let nativeCallResult = ChainMonitor_new(chainSourceOption.cType!, broadcaster.activate().cType!, logger.activate().cType!, feeest.activate().cType!, persister.activate().cType!)

						// cleanup
						
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = ChainMonitor(cType: nativeCallResult, instantiationContext: "ChainMonitor.swift::\(#function):\(#line)")
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0, instantiationContext: "ChainMonitor.swift::\(#function):\(#line)")
				
			
					}
		
					/// Gets the balances in the contained [`ChannelMonitor`]s which are claimable on-chain or
					/// claims which are awaiting confirmation.
					/// 
					/// Includes the balances from each [`ChannelMonitor`] *except* those included in
					/// `ignored_channels`, allowing you to filter out balances from channels which are still open
					/// (and whose balance should likely be pulled from the [`ChannelDetails`]).
					/// 
					/// See [`ChannelMonitor::get_claimable_balances`] for more details on the exact criteria for
					/// inclusion in the return value.
					public func getClaimableBalances(ignoredChannels: [ChannelDetails]) -> [Balance] {
						// native call variable prep
						
						let ignoredChannelsVector = Vec_ChannelDetailsZ(array: ignoredChannels).dangle()
				

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChainMonitor>) in
				ChainMonitor_get_claimable_balances(thisArgPointer, ignoredChannelsVector.cType!)
						}
				

						// cleanup
						
						// ignoredChannelsVector.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Vec_BalanceZ(cType: nativeCallResult, instantiationContext: "ChainMonitor.swift::\(#function):\(#line)", anchor: self).getValue()
						

						return returnValue
					}
		
					/// Gets the [`LockedChannelMonitor`] for a given funding outpoint, returning an `Err` if no
					/// such [`ChannelMonitor`] is currently being monitored for.
					/// 
					/// Note that the result holds a mutex over our monitor set, and should not be held
					/// indefinitely.
					public func getMonitor(fundingTxo: OutPoint) -> Result_LockedChannelMonitorNoneZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChainMonitor>) in
				ChainMonitor_get_monitor(thisArgPointer, fundingTxo.dynamicallyDangledClone().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_LockedChannelMonitorNoneZ(cType: nativeCallResult, instantiationContext: "ChainMonitor.swift::\(#function):\(#line)", anchor: self)
						

						return returnValue
					}
		
					/// Lists the funding outpoint of each [`ChannelMonitor`] being monitored.
					/// 
					/// Note that [`ChannelMonitor`]s are not removed when a channel is closed as they are always
					/// monitoring for on-chain state resolutions.
					public func listMonitors() -> [OutPoint] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChainMonitor>) in
				ChainMonitor_list_monitors(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_OutPointZ(cType: nativeCallResult, instantiationContext: "ChainMonitor.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Lists the pending updates for each [`ChannelMonitor`] (by `OutPoint` being monitored).
					public func listPendingMonitorUpdates() -> [(OutPoint, [MonitorUpdateId])] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChainMonitor>) in
				ChainMonitor_list_pending_monitor_updates(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_C2Tuple_OutPointCVec_MonitorUpdateIdZZZ(cType: nativeCallResult, instantiationContext: "ChainMonitor.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Indicates the persistence of a [`ChannelMonitor`] has completed after
					/// [`ChannelMonitorUpdateStatus::InProgress`] was returned from an update operation.
					/// 
					/// Thus, the anticipated use is, at a high level:
					/// 1) This [`ChainMonitor`] calls [`Persist::update_persisted_channel`] which stores the
					/// update to disk and begins updating any remote (e.g. watchtower/backup) copies,
					/// returning [`ChannelMonitorUpdateStatus::InProgress`],
					/// 2) once all remote copies are updated, you call this function with the
					/// `completed_update_id` that completed, and once all pending updates have completed the
					/// channel will be re-enabled.
					/// 
					/// Returns an [`APIError::APIMisuseError`] if `funding_txo` does not match any currently
					/// registered [`ChannelMonitor`]s.
					public func channelMonitorUpdated(fundingTxo: OutPoint, completedUpdateId: MonitorUpdateId) -> Result_NoneAPIErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChainMonitor>) in
				ChainMonitor_channel_monitor_updated(thisArgPointer, fundingTxo.dynamicallyDangledClone().cType!, completedUpdateId.dynamicallyDangledClone().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_NoneAPIErrorZ(cType: nativeCallResult, instantiationContext: "ChainMonitor.swift::\(#function):\(#line)", anchor: self)
						

						return returnValue
					}
		
					/// Constructs a new Listen which calls the relevant methods on this_arg.
					/// This copies the `inner` pointer in this_arg and thus the returned Listen must be freed before this_arg is
					public func asListen() -> Listen {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChainMonitor>) in
				ChainMonitor_as_Listen(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = NativelyImplementedListen(cType: nativeCallResult, instantiationContext: "ChainMonitor.swift::\(#function):\(#line)", anchor: self)
						

						return returnValue
					}
		
					/// Constructs a new Confirm which calls the relevant methods on this_arg.
					/// This copies the `inner` pointer in this_arg and thus the returned Confirm must be freed before this_arg is
					public func asConfirm() -> Confirm {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChainMonitor>) in
				ChainMonitor_as_Confirm(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = NativelyImplementedConfirm(cType: nativeCallResult, instantiationContext: "ChainMonitor.swift::\(#function):\(#line)", anchor: self)
						

						return returnValue
					}
		
					/// Constructs a new Watch which calls the relevant methods on this_arg.
					/// This copies the `inner` pointer in this_arg and thus the returned Watch must be freed before this_arg is
					public func asWatch() -> Watch {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChainMonitor>) in
				ChainMonitor_as_Watch(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = NativelyImplementedWatch(cType: nativeCallResult, instantiationContext: "ChainMonitor.swift::\(#function):\(#line)", anchor: self)
						

						return returnValue
					}
		
					/// Constructs a new EventsProvider which calls the relevant methods on this_arg.
					/// This copies the `inner` pointer in this_arg and thus the returned EventsProvider must be freed before this_arg is
					public func asEventsProvider() -> EventsProvider {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChainMonitor>) in
				ChainMonitor_as_EventsProvider(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = NativelyImplementedEventsProvider(cType: nativeCallResult, instantiationContext: "ChainMonitor.swift::\(#function):\(#line)", anchor: self)
						

						return returnValue
					}
		

					
					/// Indicates that this is the only struct which contains the same pointer.
					/// Rust functions which take ownership of an object provided via an argument require
					/// this to be true and invalidate the object pointed to by inner.
					public func isOwned() -> Bool {
						// return value (do some wrapping)
						let returnValue = self.cType!.is_owned

						return returnValue;
					}
		

					internal func dangle(_ shouldDangle: Bool = true) -> ChainMonitor {
						self.dangling = shouldDangle
						return self
					}

					
					internal func setCFreeability(freeable: Bool) -> ChainMonitor {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> ChainMonitor {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing ChainMonitor \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing ChainMonitor \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		