
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Represents a future resolution of a [`UtxoLookup::get_utxo`] query resolving async.
			/// 
			/// See [`UtxoResult::Async`] and [`UtxoFuture::resolve`] for more info.
			public typealias UtxoFuture = Bindings.UtxoFuture

			extension Bindings {
		

				/// Represents a future resolution of a [`UtxoLookup::get_utxo`] query resolving async.
				/// 
				/// See [`UtxoResult::Async`] and [`UtxoFuture::resolve`] for more info.
				public class UtxoFuture: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					public static var enableDeinitLogging = true
					public static var suspendFreedom = false
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKUtxoFuture?

					internal init(cType: LDKUtxoFuture, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKUtxoFuture, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the UtxoFuture, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = UtxoFuture_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the UtxoFuture
					internal func clone() -> UtxoFuture {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKUtxoFuture>) in
				UtxoFuture_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = UtxoFuture(cType: nativeCallResult, instantiationContext: "UtxoFuture.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Builds a new future for later resolution.
					public init() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = UtxoFuture_new()

						// cleanup
						
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = UtxoFuture(cType: nativeCallResult, instantiationContext: "UtxoFuture.swift::\(#function):\(#line)")
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0, instantiationContext: "UtxoFuture.swift::\(#function):\(#line)")
				
			
					}
		
					/// Resolves this future against the given `graph` and with the given `result`.
					/// 
					/// This is identical to calling [`UtxoFuture::resolve`] with a dummy `gossip`, disabling
					/// forwarding the validated gossip message onwards to peers.
					/// 
					/// Because this may cause the [`NetworkGraph`]'s [`processing_queue_high`] to flip, in order
					/// to allow us to interact with peers again, you should call [`PeerManager::process_events`]
					/// after this.
					/// 
					/// [`processing_queue_high`]: crate::ln::msgs::RoutingMessageHandler::processing_queue_high
					/// [`PeerManager::process_events`]: crate::ln::peer_handler::PeerManager::process_events
					public func resolveWithoutForwarding(graph: NetworkGraph, result: Result_TxOutUtxoLookupErrorZ) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKUtxoFuture>) in
				
						withUnsafePointer(to: graph.cType!) { (graphPointer: UnsafePointer<LDKNetworkGraph>) in
				UtxoFuture_resolve_without_forwarding(thisArgPointer, graphPointer, result.danglingClone().cType!)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Resolves this future against the given `graph` and with the given `result`.
					/// 
					/// The given `gossip` is used to broadcast any validated messages onwards to all peers which
					/// have available buffer space.
					/// 
					/// Because this may cause the [`NetworkGraph`]'s [`processing_queue_high`] to flip, in order
					/// to allow us to interact with peers again, you should call [`PeerManager::process_events`]
					/// after this.
					/// 
					/// [`processing_queue_high`]: crate::ln::msgs::RoutingMessageHandler::processing_queue_high
					/// [`PeerManager::process_events`]: crate::ln::peer_handler::PeerManager::process_events
					public func resolve(graph: NetworkGraph, gossip: P2PGossipSync, result: Result_TxOutUtxoLookupErrorZ) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKUtxoFuture>) in
				
						withUnsafePointer(to: graph.cType!) { (graphPointer: UnsafePointer<LDKNetworkGraph>) in
				
						withUnsafePointer(to: gossip.cType!) { (gossipPointer: UnsafePointer<LDKP2PGossipSync>) in
				UtxoFuture_resolve(thisArgPointer, graphPointer, gossipPointer, result.danglingClone().cType!)
						}
				
						}
				
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
		

					internal func dangle(_ shouldDangle: Bool = true) -> UtxoFuture {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> UtxoFuture {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> UtxoFuture {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> UtxoFuture {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> UtxoFuture {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing UtxoFuture \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing UtxoFuture \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

				}

				
			}
		
		