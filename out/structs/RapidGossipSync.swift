
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// The main Rapid Gossip Sync object.
			/// 
			/// See [crate-level documentation] for usage.
			/// 
			/// [crate-level documentation]: crate
			public typealias RapidGossipSync = Bindings.RapidGossipSync

			extension Bindings {
		

				/// The main Rapid Gossip Sync object.
				/// 
				/// See [crate-level documentation] for usage.
				/// 
				/// [crate-level documentation]: crate
				public class RapidGossipSync: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					/// Set to false to suppress an individual type's deinit log statements.
					/// Only applicable when log threshold is set to `.Debug`.
					public static var enableDeinitLogging = true

					/// Set to true to suspend the freeing of this type's associated Rust memory.
					/// Should only ever be used for debugging purposes, and will likely be
					/// deprecated soon.
					public static var suspendFreedom = false

					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKRapidGossipSync?

					internal init(cType: LDKRapidGossipSync, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKRapidGossipSync, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKRapidGossipSync, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the RapidGossipSync, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = RapidGossipSync_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Instantiate a new [`RapidGossipSync`] instance.
					public init(networkGraph: NetworkGraph, logger: Logger) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: networkGraph.cType!) { (networkGraphPointer: UnsafePointer<LDKNetworkGraph>) in
				RapidGossipSync_new(networkGraphPointer, logger.activate().cType!)
						}
				

						// cleanup
						
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = RapidGossipSync(cType: nativeCallResult, instantiationContext: "RapidGossipSync.swift::\(#function):\(#line)")
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0, instantiationContext: "RapidGossipSync.swift::\(#function):\(#line)")
				try! self.addAnchor(anchor: networkGraph)

			
					}
		
					/// Update network graph from binary data.
					/// Returns the last sync timestamp to be used the next time rapid sync data is queried.
					/// 
					/// `update_data`: `&[u8]` binary stream that comprises the update data
					public func updateNetworkGraph(updateData: [UInt8]) -> Result_u32GraphSyncErrorZ {
						// native call variable prep
						
						let updateDataPrimitiveWrapper = u8slice(value: updateData, instantiationContext: "RapidGossipSync.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRapidGossipSync>) in
				RapidGossipSync_update_network_graph(thisArgPointer, updateDataPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						updateDataPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_u32GraphSyncErrorZ(cType: nativeCallResult, instantiationContext: "RapidGossipSync.swift::\(#function):\(#line)", anchor: self)
						

						return returnValue
					}
		
					/// Update network graph from binary data.
					/// Returns the last sync timestamp to be used the next time rapid sync data is queried.
					/// 
					/// `update_data`: `&[u8]` binary stream that comprises the update data
					/// `current_time_unix`: `Option<u64>` optional current timestamp to verify data age
					public func updateNetworkGraphNoStd(updateData: [UInt8], currentTimeUnix: UInt64?) -> Result_u32GraphSyncErrorZ {
						// native call variable prep
						
						let updateDataPrimitiveWrapper = u8slice(value: updateData, instantiationContext: "RapidGossipSync.swift::\(#function):\(#line)")
				
						let currentTimeUnixOption = Option_u64Z(some: currentTimeUnix, instantiationContext: "RapidGossipSync.swift::\(#function):\(#line)").danglingClone()
				

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRapidGossipSync>) in
				RapidGossipSync_update_network_graph_no_std(thisArgPointer, updateDataPrimitiveWrapper.cType!, currentTimeUnixOption.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						updateDataPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_u32GraphSyncErrorZ(cType: nativeCallResult, instantiationContext: "RapidGossipSync.swift::\(#function):\(#line)", anchor: self)
						

						return returnValue
					}
		
					/// Returns whether a rapid gossip sync has completed at least once.
					public func isInitialSyncComplete() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRapidGossipSync>) in
				RapidGossipSync_is_initial_sync_complete(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> RapidGossipSync {
						self.dangling = shouldDangle
						return self
					}

					
					internal func setCFreeability(freeable: Bool) -> RapidGossipSync {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> RapidGossipSync {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing RapidGossipSync \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing RapidGossipSync \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

				}

				
			}
		
		