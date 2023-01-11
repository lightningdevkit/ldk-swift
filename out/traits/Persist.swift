
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			// necessary for abort() calls
			import Foundation

			/// `Persist` defines behavior for persisting channel monitors: this could mean
			/// writing once to disk, and/or uploading to one or more backup services.
			/// 
			/// Each method can return three possible values:
			/// * If persistence (including any relevant `fsync()` calls) happens immediately, the
			/// implementation should return [`ChannelMonitorUpdateStatus::Completed`], indicating normal
			/// channel operation should continue.
			/// * If persistence happens asynchronously, implementations should first ensure the
			/// [`ChannelMonitor`] or [`ChannelMonitorUpdate`] are written durably to disk, and then return
			/// [`ChannelMonitorUpdateStatus::InProgress`] while the update continues in the background.
			/// Once the update completes, [`ChainMonitor::channel_monitor_updated`] should be called with
			/// the corresponding [`MonitorUpdateId`].
			/// 
			/// Note that unlike the direct [`chain::Watch`] interface,
			/// [`ChainMonitor::channel_monitor_updated`] must be called once for *each* update which occurs.
			/// 
			/// * If persistence fails for some reason, implementations should return
			/// [`ChannelMonitorUpdateStatus::PermanentFailure`], in which case the channel will likely be
			/// closed without broadcasting the latest state. See
			/// [`ChannelMonitorUpdateStatus::PermanentFailure`] for more details.
			public typealias Persist = Bindings.Persist

			extension Bindings {

				/// `Persist` defines behavior for persisting channel monitors: this could mean
				/// writing once to disk, and/or uploading to one or more backup services.
				/// 
				/// Each method can return three possible values:
				/// * If persistence (including any relevant `fsync()` calls) happens immediately, the
				/// implementation should return [`ChannelMonitorUpdateStatus::Completed`], indicating normal
				/// channel operation should continue.
				/// * If persistence happens asynchronously, implementations should first ensure the
				/// [`ChannelMonitor`] or [`ChannelMonitorUpdate`] are written durably to disk, and then return
				/// [`ChannelMonitorUpdateStatus::InProgress`] while the update continues in the background.
				/// Once the update completes, [`ChainMonitor::channel_monitor_updated`] should be called with
				/// the corresponding [`MonitorUpdateId`].
				/// 
				/// Note that unlike the direct [`chain::Watch`] interface,
				/// [`ChainMonitor::channel_monitor_updated`] must be called once for *each* update which occurs.
				/// 
				/// * If persistence fails for some reason, implementations should return
				/// [`ChannelMonitorUpdateStatus::PermanentFailure`], in which case the channel will likely be
				/// closed without broadcasting the latest state. See
				/// [`ChannelMonitorUpdateStatus::PermanentFailure`] for more details.
				open class Persist: NativeTraitWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKPersist?

					internal init(cType: LDKPersist) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKPersist, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init() {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						super.init(conflictAvoidingVariableName: 0)

						let thisArg = Bindings.instanceToPointer(instance: self)

						

						
						func persistNewChannelLambda(this_arg: UnsafeRawPointer?, channel_id: LDKOutPoint, data: UnsafePointer<LDKChannelMonitor>, update_id: LDKMonitorUpdateId) -> LDKChannelMonitorUpdateStatus {
							let instance: Persist = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Persist::persistNewChannelLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.persistNewChannel(channelId: OutPoint(cType: channel_id), data: ChannelMonitor(cType: data.pointee).dangle().clone(), updateId: MonitorUpdateId(cType: update_id))

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.getCValue()

							return returnValue
						}
		
						func updatePersistedChannelLambda(this_arg: UnsafeRawPointer?, channel_id: LDKOutPoint, update: UnsafePointer<LDKChannelMonitorUpdate>, data: UnsafePointer<LDKChannelMonitor>, update_id: LDKMonitorUpdateId) -> LDKChannelMonitorUpdateStatus {
							let instance: Persist = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Persist::updatePersistedChannelLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.updatePersistedChannel(channelId: OutPoint(cType: channel_id), update: ChannelMonitorUpdate(cType: update.pointee).dangle().clone(), data: ChannelMonitor(cType: data.pointee).dangle().clone(), updateId: MonitorUpdateId(cType: update_id))

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.getCValue()

							return returnValue
						}
		
						func freeLambda(this_arg: UnsafeMutableRawPointer?) -> Void {
							let instance: Persist = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Persist::freeLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.free()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		

						self.cType = LDKPersist(							
							this_arg: thisArg,
							persist_new_channel: persistNewChannelLambda,
							update_persisted_channel: updatePersistedChannelLambda,
							free: freeLambda
						)
					}

					
					/// Persist a new channel's data in response to a [`chain::Watch::watch_channel`] call. This is
					/// called by [`ChannelManager`] for new channels, or may be called directly, e.g. on startup.
					/// 
					/// The data can be stored any way you want, but the identifier provided by LDK is the
					/// channel's outpoint (and it is up to you to maintain a correct mapping between the outpoint
					/// and the stored channel data). Note that you **must** persist every new monitor to disk.
					/// 
					/// The `update_id` is used to identify this call to [`ChainMonitor::channel_monitor_updated`],
					/// if you return [`ChannelMonitorUpdateStatus::InProgress`].
					/// 
					/// See [`Writeable::write`] on [`ChannelMonitor`] for writing out a `ChannelMonitor`
					/// and [`ChannelMonitorUpdateStatus`] for requirements when returning errors.
					/// 
					/// [`ChannelManager`]: crate::ln::channelmanager::ChannelManager
					/// [`Writeable::write`]: crate::util::ser::Writeable::write
					open func persistNewChannel(channelId: OutPoint, data: ChannelMonitor, updateId: MonitorUpdateId) -> ChannelMonitorUpdateStatus {
						
						Bindings.print("Error: Persist::persistNewChannel MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Update one channel's data. The provided [`ChannelMonitor`] has already applied the given
					/// update.
					/// 
					/// Note that on every update, you **must** persist either the [`ChannelMonitorUpdate`] or the
					/// updated monitor itself to disk/backups. See the [`Persist`] trait documentation for more
					/// details.
					/// 
					/// During blockchain synchronization operations, this may be called with no
					/// [`ChannelMonitorUpdate`], in which case the full [`ChannelMonitor`] needs to be persisted.
					/// Note that after the full [`ChannelMonitor`] is persisted any previous
					/// [`ChannelMonitorUpdate`]s which were persisted should be discarded - they can no longer be
					/// applied to the persisted [`ChannelMonitor`] as they were already applied.
					/// 
					/// If an implementer chooses to persist the updates only, they need to make
					/// sure that all the updates are applied to the `ChannelMonitors` *before*
					/// the set of channel monitors is given to the `ChannelManager`
					/// deserialization routine. See [`ChannelMonitor::update_monitor`] for
					/// applying a monitor update to a monitor. If full `ChannelMonitors` are
					/// persisted, then there is no need to persist individual updates.
					/// 
					/// Note that there could be a performance tradeoff between persisting complete
					/// channel monitors on every update vs. persisting only updates and applying
					/// them in batches. The size of each monitor grows `O(number of state updates)`
					/// whereas updates are small and `O(1)`.
					/// 
					/// The `update_id` is used to identify this call to [`ChainMonitor::channel_monitor_updated`],
					/// if you return [`ChannelMonitorUpdateStatus::InProgress`].
					/// 
					/// See [`Writeable::write`] on [`ChannelMonitor`] for writing out a `ChannelMonitor`,
					/// [`Writeable::write`] on [`ChannelMonitorUpdate`] for writing out an update, and
					/// [`ChannelMonitorUpdateStatus`] for requirements when returning errors.
					/// 
					/// [`Writeable::write`]: crate::util::ser::Writeable::write
					/// 
					/// Note that update (or a relevant inner pointer) may be NULL or all-0s to represent None
					open func updatePersistedChannel(channelId: OutPoint, update: ChannelMonitorUpdate, data: ChannelMonitor, updateId: MonitorUpdateId) -> ChannelMonitorUpdateStatus {
						
						Bindings.print("Error: Persist::updatePersistedChannel MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
					internal func free() -> Void {
						
				// TODO: figure out something smarter
				return; // the semicolon is necessary because Swift is whitespace-agnostic
			
						Bindings.print("Error: Persist::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		

					

					

					internal func dangle(_ shouldDangle: Bool = true) -> Persist {
        				self.dangling = shouldDangle
						return self
					}

					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Persist \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Persist \(self.instanceNumber) due to dangle.")
						}
					}
				}

				internal class NativelyImplementedPersist: Persist {
					
					/// Persist a new channel's data in response to a [`chain::Watch::watch_channel`] call. This is
					/// called by [`ChannelManager`] for new channels, or may be called directly, e.g. on startup.
					/// 
					/// The data can be stored any way you want, but the identifier provided by LDK is the
					/// channel's outpoint (and it is up to you to maintain a correct mapping between the outpoint
					/// and the stored channel data). Note that you **must** persist every new monitor to disk.
					/// 
					/// The `update_id` is used to identify this call to [`ChainMonitor::channel_monitor_updated`],
					/// if you return [`ChannelMonitorUpdateStatus::InProgress`].
					/// 
					/// See [`Writeable::write`] on [`ChannelMonitor`] for writing out a `ChannelMonitor`
					/// and [`ChannelMonitorUpdateStatus`] for requirements when returning errors.
					/// 
					/// [`ChannelManager`]: crate::ln::channelmanager::ChannelManager
					/// [`Writeable::write`]: crate::util::ser::Writeable::write
					public override func persistNewChannel(channelId: OutPoint, data: ChannelMonitor, updateId: MonitorUpdateId) -> ChannelMonitorUpdateStatus {
						// native call variable prep
						

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: data.cType!) { (dataPointer: UnsafePointer<LDKChannelMonitor>) in
				self.cType!.persist_new_channel(self.cType!.this_arg, channelId.dynamicallyDangledClone().cType!, dataPointer, updateId.dynamicallyDangledClone().cType!)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = ChannelMonitorUpdateStatus(value: nativeCallResult)

						return returnValue
					}
		
					/// Update one channel's data. The provided [`ChannelMonitor`] has already applied the given
					/// update.
					/// 
					/// Note that on every update, you **must** persist either the [`ChannelMonitorUpdate`] or the
					/// updated monitor itself to disk/backups. See the [`Persist`] trait documentation for more
					/// details.
					/// 
					/// During blockchain synchronization operations, this may be called with no
					/// [`ChannelMonitorUpdate`], in which case the full [`ChannelMonitor`] needs to be persisted.
					/// Note that after the full [`ChannelMonitor`] is persisted any previous
					/// [`ChannelMonitorUpdate`]s which were persisted should be discarded - they can no longer be
					/// applied to the persisted [`ChannelMonitor`] as they were already applied.
					/// 
					/// If an implementer chooses to persist the updates only, they need to make
					/// sure that all the updates are applied to the `ChannelMonitors` *before*
					/// the set of channel monitors is given to the `ChannelManager`
					/// deserialization routine. See [`ChannelMonitor::update_monitor`] for
					/// applying a monitor update to a monitor. If full `ChannelMonitors` are
					/// persisted, then there is no need to persist individual updates.
					/// 
					/// Note that there could be a performance tradeoff between persisting complete
					/// channel monitors on every update vs. persisting only updates and applying
					/// them in batches. The size of each monitor grows `O(number of state updates)`
					/// whereas updates are small and `O(1)`.
					/// 
					/// The `update_id` is used to identify this call to [`ChainMonitor::channel_monitor_updated`],
					/// if you return [`ChannelMonitorUpdateStatus::InProgress`].
					/// 
					/// See [`Writeable::write`] on [`ChannelMonitor`] for writing out a `ChannelMonitor`,
					/// [`Writeable::write`] on [`ChannelMonitorUpdate`] for writing out an update, and
					/// [`ChannelMonitorUpdateStatus`] for requirements when returning errors.
					/// 
					/// [`Writeable::write`]: crate::util::ser::Writeable::write
					/// 
					/// Note that update (or a relevant inner pointer) may be NULL or all-0s to represent None
					public override func updatePersistedChannel(channelId: OutPoint, update: ChannelMonitorUpdate, data: ChannelMonitor, updateId: MonitorUpdateId) -> ChannelMonitorUpdateStatus {
						// native call variable prep
						

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: update.cType!) { (updatePointer: UnsafePointer<LDKChannelMonitorUpdate>) in
				
						withUnsafePointer(to: data.cType!) { (dataPointer: UnsafePointer<LDKChannelMonitor>) in
				self.cType!.update_persisted_channel(self.cType!.this_arg, channelId.dynamicallyDangledClone().cType!, updatePointer, dataPointer, updateId.dynamicallyDangledClone().cType!)
						}
				
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = ChannelMonitorUpdateStatus(value: nativeCallResult)

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
		