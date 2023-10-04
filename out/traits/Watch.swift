
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			// necessary for abort() calls
			import Foundation

			/// The `Watch` trait defines behavior for watching on-chain activity pertaining to channels as
			/// blocks are connected and disconnected.
			/// 
			/// Each channel is associated with a [`ChannelMonitor`]. Implementations of this trait are
			/// responsible for maintaining a set of monitors such that they can be updated as channel state
			/// changes. On each update, *all copies* of a [`ChannelMonitor`] must be updated and the update
			/// persisted to disk to ensure that the latest [`ChannelMonitor`] state can be reloaded if the
			/// application crashes.
			/// 
			/// See method documentation and [`ChannelMonitorUpdateStatus`] for specific requirements.
			public typealias Watch = Bindings.Watch

			extension Bindings {

				/// The `Watch` trait defines behavior for watching on-chain activity pertaining to channels as
				/// blocks are connected and disconnected.
				/// 
				/// Each channel is associated with a [`ChannelMonitor`]. Implementations of this trait are
				/// responsible for maintaining a set of monitors such that they can be updated as channel state
				/// changes. On each update, *all copies* of a [`ChannelMonitor`] must be updated and the update
				/// persisted to disk to ensure that the latest [`ChannelMonitor`] state can be reloaded if the
				/// application crashes.
				/// 
				/// See method documentation and [`ChannelMonitorUpdateStatus`] for specific requirements.
				open class Watch: NativeTraitWrapper {

					
					/// Set to false to suppress an individual type's deinit log statements.
					/// Only applicable when log threshold is set to `.Debug`.
					public static var enableDeinitLogging = true

					/// Set to true to suspend the freeing of this type's associated Rust memory.
					/// Should only ever be used for debugging purposes, and will likely be
					/// deprecated soon.
					public static var suspendFreedom = false

					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKWatch?

					internal init(cType: LDKWatch, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKWatch, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKWatch, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					public init() {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						super.init(conflictAvoidingVariableName: 0, instantiationContext: "Watch.swift::\(#function):\(#line)")

						let thisArg = Bindings.instanceToPointer(instance: self)

						

						
						func watchChannelLambda(this_arg: UnsafeRawPointer?, funding_txo: LDKOutPoint, monitor: LDKChannelMonitor) -> LDKCResult_ChannelMonitorUpdateStatusNoneZ {
							let instance: Watch = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Watch::watchChannelLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.watchChannel(fundingTxo: OutPoint(cType: funding_txo, instantiationContext: "Watch.swift::init()::\(#function):\(#line)"), monitor: ChannelMonitor(cType: monitor, instantiationContext: "Watch.swift::init()::\(#function):\(#line)"))

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.danglingClone().cType!

							return returnValue
						}
		
						func updateChannelLambda(this_arg: UnsafeRawPointer?, funding_txo: LDKOutPoint, update: UnsafePointer<LDKChannelMonitorUpdate>) -> LDKChannelMonitorUpdateStatus {
							let instance: Watch = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Watch::updateChannelLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.updateChannel(fundingTxo: OutPoint(cType: funding_txo, instantiationContext: "Watch.swift::init()::\(#function):\(#line)"), update: ChannelMonitorUpdate(cType: update.pointee, instantiationContext: "Watch.swift::init()::\(#function):\(#line)").dangle().clone())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.getCValue()

							return returnValue
						}
		
						func releasePendingMonitorEventsLambda(this_arg: UnsafeRawPointer?) -> LDKCVec_C3Tuple_OutPointCVec_MonitorEventZPublicKeyZZ {
							let instance: Watch = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Watch::releasePendingMonitorEventsLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.releasePendingMonitorEvents()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = Vec_C3Tuple_OutPointCVec_MonitorEventZPublicKeyZZ(array: swiftCallbackResult, instantiationContext: "Watch.swift::init()::\(#function):\(#line)").dangleRecursively().cType!

							return returnValue
						}
		
						func freeLambda(this_arg: UnsafeMutableRawPointer?) -> Void {
							let instance: Watch = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Watch::freeLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.free()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		

						self.cType = LDKWatch(							
							this_arg: thisArg,
							watch_channel: watchChannelLambda,
							update_channel: updateChannelLambda,
							release_pending_monitor_events: releasePendingMonitorEventsLambda,
							free: freeLambda
						)
					}

					
			/// Watches a channel identified by `funding_txo` using `monitor`.
					/// 
					/// Implementations are responsible for watching the chain for the funding transaction along
					/// with any spends of outputs returned by [`get_outputs_to_watch`]. In practice, this means
					/// calling [`block_connected`] and [`block_disconnected`] on the monitor.
					/// 
					/// A return of `Err(())` indicates that the channel should immediately be force-closed without
					/// broadcasting the funding transaction.
					/// 
					/// If the given `funding_txo` has previously been registered via `watch_channel`, `Err(())`
					/// must be returned.
					/// 
					/// [`get_outputs_to_watch`]: channelmonitor::ChannelMonitor::get_outputs_to_watch
					/// [`block_connected`]: channelmonitor::ChannelMonitor::block_connected
					/// [`block_disconnected`]: channelmonitor::ChannelMonitor::block_disconnected
			open func watchChannel(fundingTxo: OutPoint, monitor: ChannelMonitor) -> Result_ChannelMonitorUpdateStatusNoneZ {
				
				Bindings.print("Error: Watch::watchChannel MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
				abort()
			}
		
			/// Updates a channel identified by `funding_txo` by applying `update` to its monitor.
					/// 
					/// Implementations must call [`ChannelMonitor::update_monitor`] with the given update. This
					/// may fail (returning an `Err(())`), in which case this should return
					/// [`ChannelMonitorUpdateStatus::InProgress`] (and the update should never complete). This
					/// generally implies the channel has been closed (either by the funding outpoint being spent
					/// on-chain or the [`ChannelMonitor`] having decided to do so and broadcasted a transaction),
					/// and the [`ChannelManager`] state will be updated once it sees the funding spend on-chain.
					/// 
					/// In general, persistence failures should be retried after returning
					/// [`ChannelMonitorUpdateStatus::InProgress`] and eventually complete. If a failure truly
					/// cannot be retried, the node should shut down immediately after returning
					/// [`ChannelMonitorUpdateStatus::UnrecoverableError`], see its documentation for more info.
					/// 
					/// [`ChannelManager`]: crate::ln::channelmanager::ChannelManager
			open func updateChannel(fundingTxo: OutPoint, update: ChannelMonitorUpdate) -> ChannelMonitorUpdateStatus {
				
				Bindings.print("Error: Watch::updateChannel MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
				abort()
			}
		
			/// Returns any monitor events since the last call. Subsequent calls must only return new
					/// events.
					/// 
					/// Note that after any block- or transaction-connection calls to a [`ChannelMonitor`], no
					/// further events may be returned here until the [`ChannelMonitor`] has been fully persisted
					/// to disk.
					/// 
					/// For details on asynchronous [`ChannelMonitor`] updating and returning
					/// [`MonitorEvent::Completed`] here, see [`ChannelMonitorUpdateStatus::InProgress`].
			open func releasePendingMonitorEvents() -> [(OutPoint, [MonitorEvent], [UInt8])] {
				
				Bindings.print("Error: Watch::releasePendingMonitorEvents MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
				abort()
			}
		
			/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
			internal func free() -> Void {
				
				// TODO: figure out something smarter
				return () // the empty tuple (aka Void) is necessary because Swift is whitespace-agnostic
			
				Bindings.print("Error: Watch::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
				abort()
			}
		

					

					

					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing Watch \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing Watch \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
				}

				internal class NativelyImplementedWatch: Watch {
					
			/// Watches a channel identified by `funding_txo` using `monitor`.
					/// 
					/// Implementations are responsible for watching the chain for the funding transaction along
					/// with any spends of outputs returned by [`get_outputs_to_watch`]. In practice, this means
					/// calling [`block_connected`] and [`block_disconnected`] on the monitor.
					/// 
					/// A return of `Err(())` indicates that the channel should immediately be force-closed without
					/// broadcasting the funding transaction.
					/// 
					/// If the given `funding_txo` has previously been registered via `watch_channel`, `Err(())`
					/// must be returned.
					/// 
					/// [`get_outputs_to_watch`]: channelmonitor::ChannelMonitor::get_outputs_to_watch
					/// [`block_connected`]: channelmonitor::ChannelMonitor::block_connected
					/// [`block_disconnected`]: channelmonitor::ChannelMonitor::block_disconnected
			public override func watchChannel(fundingTxo: OutPoint, monitor: ChannelMonitor) -> Result_ChannelMonitorUpdateStatusNoneZ {
				// native call variable prep
				

				

				// native method call
				let nativeCallResult = self.cType!.watch_channel(self.cType!.this_arg, fundingTxo.dynamicallyDangledClone().cType!, monitor.dynamicallyDangledClone().cType!)

				// cleanup
				

				// return value (do some wrapping)
				let returnValue = Result_ChannelMonitorUpdateStatusNoneZ(cType: nativeCallResult, instantiationContext: "Watch.swift::\(#function):\(#line)")

				return returnValue
			}
		
			/// Updates a channel identified by `funding_txo` by applying `update` to its monitor.
					/// 
					/// Implementations must call [`ChannelMonitor::update_monitor`] with the given update. This
					/// may fail (returning an `Err(())`), in which case this should return
					/// [`ChannelMonitorUpdateStatus::InProgress`] (and the update should never complete). This
					/// generally implies the channel has been closed (either by the funding outpoint being spent
					/// on-chain or the [`ChannelMonitor`] having decided to do so and broadcasted a transaction),
					/// and the [`ChannelManager`] state will be updated once it sees the funding spend on-chain.
					/// 
					/// In general, persistence failures should be retried after returning
					/// [`ChannelMonitorUpdateStatus::InProgress`] and eventually complete. If a failure truly
					/// cannot be retried, the node should shut down immediately after returning
					/// [`ChannelMonitorUpdateStatus::UnrecoverableError`], see its documentation for more info.
					/// 
					/// [`ChannelManager`]: crate::ln::channelmanager::ChannelManager
			public override func updateChannel(fundingTxo: OutPoint, update: ChannelMonitorUpdate) -> ChannelMonitorUpdateStatus {
				// native call variable prep
				

				

				// native method call
				let nativeCallResult = 
						withUnsafePointer(to: update.cType!) { (updatePointer: UnsafePointer<LDKChannelMonitorUpdate>) in
				self.cType!.update_channel(self.cType!.this_arg, fundingTxo.dynamicallyDangledClone().cType!, updatePointer)
						}
				

				// cleanup
				

				// return value (do some wrapping)
				let returnValue = ChannelMonitorUpdateStatus(value: nativeCallResult)

				return returnValue
			}
		
			/// Returns any monitor events since the last call. Subsequent calls must only return new
					/// events.
					/// 
					/// Note that after any block- or transaction-connection calls to a [`ChannelMonitor`], no
					/// further events may be returned here until the [`ChannelMonitor`] has been fully persisted
					/// to disk.
					/// 
					/// For details on asynchronous [`ChannelMonitor`] updating and returning
					/// [`MonitorEvent::Completed`] here, see [`ChannelMonitorUpdateStatus::InProgress`].
			public override func releasePendingMonitorEvents() -> [(OutPoint, [MonitorEvent], [UInt8])] {
				// native call variable prep
				

				

				// native method call
				let nativeCallResult = self.cType!.release_pending_monitor_events(self.cType!.this_arg)

				// cleanup
				

				// return value (do some wrapping)
				let returnValue = Vec_C3Tuple_OutPointCVec_MonitorEventZPublicKeyZZ(cType: nativeCallResult, instantiationContext: "Watch.swift::\(#function):\(#line)").getValue()

				return returnValue
			}
		
			/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
			public override func free() {
				// native call variable prep
				

				
				// natively wrapped traits may not necessarily be properly initialized
				// for now just don't free these things
				// self.cType?.free(self.cType?.this_arg)
				return;
			

				// native method call
				let nativeCallResult = self.cType!.free(self.cType!.this_arg)

				// cleanup
				

				// return value (do some wrapping)
				let returnValue = nativeCallResult

				return returnValue
			}
		
				}

			}
		