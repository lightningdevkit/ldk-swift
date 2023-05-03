
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Arguments for the creation of a ChannelManager that are not deserialized.
			/// 
			/// At a high-level, the process for deserializing a ChannelManager and resuming normal operation
			/// is:
			/// 1) Deserialize all stored [`ChannelMonitor`]s.
			/// 2) Deserialize the [`ChannelManager`] by filling in this struct and calling:
			/// `<(BlockHash, ChannelManager)>::read(reader, args)`
			/// This may result in closing some channels if the [`ChannelMonitor`] is newer than the stored
			/// [`ChannelManager`] state to ensure no loss of funds. Thus, transactions may be broadcasted.
			/// 3) If you are not fetching full blocks, register all relevant [`ChannelMonitor`] outpoints the
			/// same way you would handle a [`chain::Filter`] call using
			/// [`ChannelMonitor::get_outputs_to_watch`] and [`ChannelMonitor::get_funding_txo`].
			/// 4) Reconnect blocks on your [`ChannelMonitor`]s.
			/// 5) Disconnect/connect blocks on the [`ChannelManager`].
			/// 6) Re-persist the [`ChannelMonitor`]s to ensure the latest state is on disk.
			/// Note that if you're using a [`ChainMonitor`] for your [`chain::Watch`] implementation, you
			/// will likely accomplish this as a side-effect of calling [`chain::Watch::watch_channel`] in
			/// the next step.
			/// 7) Move the [`ChannelMonitor`]s into your local [`chain::Watch`]. If you're using a
			/// [`ChainMonitor`], this is done by calling [`chain::Watch::watch_channel`].
			/// 
			/// Note that the ordering of #4-7 is not of importance, however all four must occur before you
			/// call any other methods on the newly-deserialized [`ChannelManager`].
			/// 
			/// Note that because some channels may be closed during deserialization, it is critical that you
			/// always deserialize only the latest version of a ChannelManager and ChannelMonitors available to
			/// you. If you deserialize an old ChannelManager (during which force-closure transactions may be
			/// broadcast), and then later deserialize a newer version of the same ChannelManager (which will
			/// not force-close the same channels but consider them live), you may end up revoking a state for
			/// which you've already broadcasted the transaction.
			/// 
			/// [`ChainMonitor`]: crate::chain::chainmonitor::ChainMonitor
			public typealias ChannelManagerReadArgs = Bindings.ChannelManagerReadArgs

			extension Bindings {
		

				/// Arguments for the creation of a ChannelManager that are not deserialized.
				/// 
				/// At a high-level, the process for deserializing a ChannelManager and resuming normal operation
				/// is:
				/// 1) Deserialize all stored [`ChannelMonitor`]s.
				/// 2) Deserialize the [`ChannelManager`] by filling in this struct and calling:
				/// `<(BlockHash, ChannelManager)>::read(reader, args)`
				/// This may result in closing some channels if the [`ChannelMonitor`] is newer than the stored
				/// [`ChannelManager`] state to ensure no loss of funds. Thus, transactions may be broadcasted.
				/// 3) If you are not fetching full blocks, register all relevant [`ChannelMonitor`] outpoints the
				/// same way you would handle a [`chain::Filter`] call using
				/// [`ChannelMonitor::get_outputs_to_watch`] and [`ChannelMonitor::get_funding_txo`].
				/// 4) Reconnect blocks on your [`ChannelMonitor`]s.
				/// 5) Disconnect/connect blocks on the [`ChannelManager`].
				/// 6) Re-persist the [`ChannelMonitor`]s to ensure the latest state is on disk.
				/// Note that if you're using a [`ChainMonitor`] for your [`chain::Watch`] implementation, you
				/// will likely accomplish this as a side-effect of calling [`chain::Watch::watch_channel`] in
				/// the next step.
				/// 7) Move the [`ChannelMonitor`]s into your local [`chain::Watch`]. If you're using a
				/// [`ChainMonitor`], this is done by calling [`chain::Watch::watch_channel`].
				/// 
				/// Note that the ordering of #4-7 is not of importance, however all four must occur before you
				/// call any other methods on the newly-deserialized [`ChannelManager`].
				/// 
				/// Note that because some channels may be closed during deserialization, it is critical that you
				/// always deserialize only the latest version of a ChannelManager and ChannelMonitors available to
				/// you. If you deserialize an old ChannelManager (during which force-closure transactions may be
				/// broadcast), and then later deserialize a newer version of the same ChannelManager (which will
				/// not force-close the same channels but consider them live), you may end up revoking a state for
				/// which you've already broadcasted the transaction.
				/// 
				/// [`ChainMonitor`]: crate::chain::chainmonitor::ChainMonitor
				public class ChannelManagerReadArgs: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKChannelManagerReadArgs?

					internal init(cType: LDKChannelManagerReadArgs, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKChannelManagerReadArgs, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the ChannelManagerReadArgs, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ChannelManagerReadArgs_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// A cryptographically secure source of entropy.
					public func getEntropySource() -> EntropySource? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelManagerReadArgs>) in
				ChannelManagerReadArgs_get_entropy_source(thisPtrPointer)
						}
				

						// cleanup
						
						guard let nativeCallResult = nativeCallResult else {
							return nil
						}
			

						
						// return value (do some wrapping)
						let returnValue = NativelyImplementedEntropySource(cType: nativeCallResult.pointee, instantiationContext: "ChannelManagerReadArgs.swift::\(#function):\(#line)", anchor: self)
						

						return returnValue
					}
		
					/// A cryptographically secure source of entropy.
					public func setEntropySource(val: EntropySource) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelManagerReadArgs>) in
				ChannelManagerReadArgs_set_entropy_source(thisPtrPointer, val.activate().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// A signer that is able to perform node-scoped cryptographic operations.
					public func getNodeSigner() -> NodeSigner? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelManagerReadArgs>) in
				ChannelManagerReadArgs_get_node_signer(thisPtrPointer)
						}
				

						// cleanup
						
						guard let nativeCallResult = nativeCallResult else {
							return nil
						}
			

						
						// return value (do some wrapping)
						let returnValue = NativelyImplementedNodeSigner(cType: nativeCallResult.pointee, instantiationContext: "ChannelManagerReadArgs.swift::\(#function):\(#line)", anchor: self)
						

						return returnValue
					}
		
					/// A signer that is able to perform node-scoped cryptographic operations.
					public func setNodeSigner(val: NodeSigner) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelManagerReadArgs>) in
				ChannelManagerReadArgs_set_node_signer(thisPtrPointer, val.activate().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The keys provider which will give us relevant keys. Some keys will be loaded during
					/// deserialization and KeysInterface::read_chan_signer will be used to read per-Channel
					/// signing data.
					public func getSignerProvider() -> SignerProvider? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelManagerReadArgs>) in
				ChannelManagerReadArgs_get_signer_provider(thisPtrPointer)
						}
				

						// cleanup
						
						guard let nativeCallResult = nativeCallResult else {
							return nil
						}
			

						
						// return value (do some wrapping)
						let returnValue = NativelyImplementedSignerProvider(cType: nativeCallResult.pointee, instantiationContext: "ChannelManagerReadArgs.swift::\(#function):\(#line)", anchor: self)
						

						return returnValue
					}
		
					/// The keys provider which will give us relevant keys. Some keys will be loaded during
					/// deserialization and KeysInterface::read_chan_signer will be used to read per-Channel
					/// signing data.
					public func setSignerProvider(val: SignerProvider) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelManagerReadArgs>) in
				ChannelManagerReadArgs_set_signer_provider(thisPtrPointer, val.activate().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The fee_estimator for use in the ChannelManager in the future.
					/// 
					/// No calls to the FeeEstimator will be made during deserialization.
					public func getFeeEstimator() -> FeeEstimator? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelManagerReadArgs>) in
				ChannelManagerReadArgs_get_fee_estimator(thisPtrPointer)
						}
				

						// cleanup
						
						guard let nativeCallResult = nativeCallResult else {
							return nil
						}
			

						
						// return value (do some wrapping)
						let returnValue = NativelyImplementedFeeEstimator(cType: nativeCallResult.pointee, instantiationContext: "ChannelManagerReadArgs.swift::\(#function):\(#line)", anchor: self)
						

						return returnValue
					}
		
					/// The fee_estimator for use in the ChannelManager in the future.
					/// 
					/// No calls to the FeeEstimator will be made during deserialization.
					public func setFeeEstimator(val: FeeEstimator) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelManagerReadArgs>) in
				ChannelManagerReadArgs_set_fee_estimator(thisPtrPointer, val.activate().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The chain::Watch for use in the ChannelManager in the future.
					/// 
					/// No calls to the chain::Watch will be made during deserialization. It is assumed that
					/// you have deserialized ChannelMonitors separately and will add them to your
					/// chain::Watch after deserializing this ChannelManager.
					public func getChainMonitor() -> Watch? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelManagerReadArgs>) in
				ChannelManagerReadArgs_get_chain_monitor(thisPtrPointer)
						}
				

						// cleanup
						
						guard let nativeCallResult = nativeCallResult else {
							return nil
						}
			

						
						// return value (do some wrapping)
						let returnValue = NativelyImplementedWatch(cType: nativeCallResult.pointee, instantiationContext: "ChannelManagerReadArgs.swift::\(#function):\(#line)", anchor: self)
						

						return returnValue
					}
		
					/// The chain::Watch for use in the ChannelManager in the future.
					/// 
					/// No calls to the chain::Watch will be made during deserialization. It is assumed that
					/// you have deserialized ChannelMonitors separately and will add them to your
					/// chain::Watch after deserializing this ChannelManager.
					public func setChainMonitor(val: Watch) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelManagerReadArgs>) in
				ChannelManagerReadArgs_set_chain_monitor(thisPtrPointer, val.activate().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The BroadcasterInterface which will be used in the ChannelManager in the future and may be
					/// used to broadcast the latest local commitment transactions of channels which must be
					/// force-closed during deserialization.
					public func getTxBroadcaster() -> BroadcasterInterface? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelManagerReadArgs>) in
				ChannelManagerReadArgs_get_tx_broadcaster(thisPtrPointer)
						}
				

						// cleanup
						
						guard let nativeCallResult = nativeCallResult else {
							return nil
						}
			

						
						// return value (do some wrapping)
						let returnValue = NativelyImplementedBroadcasterInterface(cType: nativeCallResult.pointee, instantiationContext: "ChannelManagerReadArgs.swift::\(#function):\(#line)", anchor: self)
						

						return returnValue
					}
		
					/// The BroadcasterInterface which will be used in the ChannelManager in the future and may be
					/// used to broadcast the latest local commitment transactions of channels which must be
					/// force-closed during deserialization.
					public func setTxBroadcaster(val: BroadcasterInterface) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelManagerReadArgs>) in
				ChannelManagerReadArgs_set_tx_broadcaster(thisPtrPointer, val.activate().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The router which will be used in the ChannelManager in the future for finding routes
					/// on-the-fly for trampoline payments. Absent in private nodes that don't support forwarding.
					/// 
					/// No calls to the router will be made during deserialization.
					public func getRouter() -> Router? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelManagerReadArgs>) in
				ChannelManagerReadArgs_get_router(thisPtrPointer)
						}
				

						// cleanup
						
						guard let nativeCallResult = nativeCallResult else {
							return nil
						}
			

						
						// return value (do some wrapping)
						let returnValue = NativelyImplementedRouter(cType: nativeCallResult.pointee, instantiationContext: "ChannelManagerReadArgs.swift::\(#function):\(#line)", anchor: self)
						

						return returnValue
					}
		
					/// The router which will be used in the ChannelManager in the future for finding routes
					/// on-the-fly for trampoline payments. Absent in private nodes that don't support forwarding.
					/// 
					/// No calls to the router will be made during deserialization.
					public func setRouter(val: Router) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelManagerReadArgs>) in
				ChannelManagerReadArgs_set_router(thisPtrPointer, val.activate().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The Logger for use in the ChannelManager and which may be used to log information during
					/// deserialization.
					public func getLogger() -> Logger? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelManagerReadArgs>) in
				ChannelManagerReadArgs_get_logger(thisPtrPointer)
						}
				

						// cleanup
						
						guard let nativeCallResult = nativeCallResult else {
							return nil
						}
			

						
						// return value (do some wrapping)
						let returnValue = NativelyImplementedLogger(cType: nativeCallResult.pointee, instantiationContext: "ChannelManagerReadArgs.swift::\(#function):\(#line)", anchor: self)
						

						return returnValue
					}
		
					/// The Logger for use in the ChannelManager and which may be used to log information during
					/// deserialization.
					public func setLogger(val: Logger) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelManagerReadArgs>) in
				ChannelManagerReadArgs_set_logger(thisPtrPointer, val.activate().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Default settings used for new channels. Any existing channels will continue to use the
					/// runtime settings which were stored when the ChannelManager was serialized.
					public func getDefaultConfig() -> UserConfig {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelManagerReadArgs>) in
				ChannelManagerReadArgs_get_default_config(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = UserConfig(cType: nativeCallResult, instantiationContext: "ChannelManagerReadArgs.swift::\(#function):\(#line)", anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// Default settings used for new channels. Any existing channels will continue to use the
					/// runtime settings which were stored when the ChannelManager was serialized.
					public func setDefaultConfig(val: UserConfig) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelManagerReadArgs>) in
				ChannelManagerReadArgs_set_default_config(thisPtrPointer, val.dynamicallyDangledClone().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Simple utility function to create a ChannelManagerReadArgs which creates the monitor
					/// HashMap for you. This is primarily useful for C bindings where it is not practical to
					/// populate a HashMap directly from C.
					public init(entropySource: EntropySource, nodeSigner: NodeSigner, signerProvider: SignerProvider, feeEstimator: FeeEstimator, chainMonitor: Watch, txBroadcaster: BroadcasterInterface, router: Router, logger: Logger, defaultConfig: UserConfig, channelMonitors: [ChannelMonitor]) {
						// native call variable prep
						
						let channelMonitorsVector = Vec_ChannelMonitorZ(array: channelMonitors, instantiationContext: "ChannelManagerReadArgs.swift::\(#function):\(#line)").dangle()
				

						// native method call
						let nativeCallResult = ChannelManagerReadArgs_new(entropySource.activate().cType!, nodeSigner.activate().cType!, signerProvider.activate().cType!, feeEstimator.activate().cType!, chainMonitor.activate().cType!, txBroadcaster.activate().cType!, router.activate().cType!, logger.activate().cType!, defaultConfig.dynamicallyDangledClone().cType!, channelMonitorsVector.cType!)

						// cleanup
						
						// channelMonitorsVector.noOpRetain()
				
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = ChannelManagerReadArgs(cType: nativeCallResult, instantiationContext: "ChannelManagerReadArgs.swift::\(#function):\(#line)")
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0, instantiationContext: "ChannelManagerReadArgs.swift::\(#function):\(#line)")
				
			
					}
		

					
					/// Indicates that this is the only struct which contains the same pointer.
					/// Rust functions which take ownership of an object provided via an argument require
					/// this to be true and invalidate the object pointed to by inner.
					public func isOwned() -> Bool {
						// return value (do some wrapping)
						let returnValue = self.cType!.is_owned

						return returnValue;
					}
		

					internal func dangle(_ shouldDangle: Bool = true) -> ChannelManagerReadArgs {
						self.dangling = shouldDangle
						return self
					}

					
					internal func setCFreeability(freeable: Bool) -> ChannelManagerReadArgs {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> ChannelManagerReadArgs {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing ChannelManagerReadArgs \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing ChannelManagerReadArgs \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		