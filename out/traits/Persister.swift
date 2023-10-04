
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			// necessary for abort() calls
			import Foundation

			/// Trait that handles persisting a [`ChannelManager`], [`NetworkGraph`], and [`WriteableScore`] to disk.
			public typealias Persister = Bindings.Persister

			extension Bindings {

				/// Trait that handles persisting a [`ChannelManager`], [`NetworkGraph`], and [`WriteableScore`] to disk.
				open class Persister: NativeTraitWrapper {

					
					/// Set to false to suppress an individual type's deinit log statements.
					/// Only applicable when log threshold is set to `.Debug`.
					public static var enableDeinitLogging = true

					/// Set to true to suspend the freeing of this type's associated Rust memory.
					/// Should only ever be used for debugging purposes, and will likely be
					/// deprecated soon.
					public static var suspendFreedom = false

					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKPersister?

					internal init(cType: LDKPersister, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKPersister, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKPersister, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
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
						super.init(conflictAvoidingVariableName: 0, instantiationContext: "Persister.swift::\(#function):\(#line)")

						let thisArg = Bindings.instanceToPointer(instance: self)

						

						
						func persistManagerLambda(this_arg: UnsafeRawPointer?, channel_manager: UnsafePointer<LDKChannelManager>) -> LDKCResult_NoneIOErrorZ {
							let instance: Persister = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Persister::persistManagerLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.persistManager(channelManager: ChannelManager(cType: channel_manager.pointee, instantiationContext: "Persister.swift::init()::\(#function):\(#line)").dangle())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.danglingClone().cType!

							return returnValue
						}
		
						func persistGraphLambda(this_arg: UnsafeRawPointer?, network_graph: UnsafePointer<LDKNetworkGraph>) -> LDKCResult_NoneIOErrorZ {
							let instance: Persister = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Persister::persistGraphLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.persistGraph(networkGraph: NetworkGraph(cType: network_graph.pointee, instantiationContext: "Persister.swift::init()::\(#function):\(#line)").dangle())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.danglingClone().cType!

							return returnValue
						}
		
						func persistScorerLambda(this_arg: UnsafeRawPointer?, scorer: UnsafePointer<LDKWriteableScore>) -> LDKCResult_NoneIOErrorZ {
							let instance: Persister = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Persister::persistScorerLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.persistScorer(scorer: NativelyImplementedWriteableScore(cType: scorer.pointee, instantiationContext: "Persister.swift::init()::\(#function):\(#line)"))

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.danglingClone().cType!

							return returnValue
						}
		
						func freeLambda(this_arg: UnsafeMutableRawPointer?) -> Void {
							let instance: Persister = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Persister::freeLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.free()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		

						self.cType = LDKPersister(							
							this_arg: thisArg,
							persist_manager: persistManagerLambda,
							persist_graph: persistGraphLambda,
							persist_scorer: persistScorerLambda,
							free: freeLambda
						)
					}

					
			/// Persist the given ['ChannelManager'] to disk, returning an error if persistence failed.
			open func persistManager(channelManager: ChannelManager) -> Result_NoneIOErrorZ {
				
				Bindings.print("Error: Persister::persistManager MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
				abort()
			}
		
			/// Persist the given [`NetworkGraph`] to disk, returning an error if persistence failed.
			open func persistGraph(networkGraph: NetworkGraph) -> Result_NoneIOErrorZ {
				
				Bindings.print("Error: Persister::persistGraph MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
				abort()
			}
		
			/// Persist the given [`WriteableScore`] to disk, returning an error if persistence failed.
			open func persistScorer(scorer: WriteableScore) -> Result_NoneIOErrorZ {
				
				Bindings.print("Error: Persister::persistScorer MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
				abort()
			}
		
			/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
			internal func free() -> Void {
				
				// TODO: figure out something smarter
				return () // the empty tuple (aka Void) is necessary because Swift is whitespace-agnostic
			
				Bindings.print("Error: Persister::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
				abort()
			}
		

					

					

					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing Persister \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing Persister \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
				}

				internal class NativelyImplementedPersister: Persister {
					
			/// Persist the given ['ChannelManager'] to disk, returning an error if persistence failed.
			public override func persistManager(channelManager: ChannelManager) -> Result_NoneIOErrorZ {
				// native call variable prep
				

				

				// native method call
				let nativeCallResult = 
						withUnsafePointer(to: channelManager.cType!) { (channelManagerPointer: UnsafePointer<LDKChannelManager>) in
				self.cType!.persist_manager(self.cType!.this_arg, channelManagerPointer)
						}
				

				// cleanup
				

				// return value (do some wrapping)
				let returnValue = Result_NoneIOErrorZ(cType: nativeCallResult, instantiationContext: "Persister.swift::\(#function):\(#line)")

				return returnValue
			}
		
			/// Persist the given [`NetworkGraph`] to disk, returning an error if persistence failed.
			public override func persistGraph(networkGraph: NetworkGraph) -> Result_NoneIOErrorZ {
				// native call variable prep
				

				

				// native method call
				let nativeCallResult = 
						withUnsafePointer(to: networkGraph.cType!) { (networkGraphPointer: UnsafePointer<LDKNetworkGraph>) in
				self.cType!.persist_graph(self.cType!.this_arg, networkGraphPointer)
						}
				

				// cleanup
				

				// return value (do some wrapping)
				let returnValue = Result_NoneIOErrorZ(cType: nativeCallResult, instantiationContext: "Persister.swift::\(#function):\(#line)")

				return returnValue
			}
		
			/// Persist the given [`WriteableScore`] to disk, returning an error if persistence failed.
			public override func persistScorer(scorer: WriteableScore) -> Result_NoneIOErrorZ {
				// native call variable prep
				

				

				// native method call
				let nativeCallResult = 
						withUnsafePointer(to: scorer.activate().cType!) { (scorerPointer: UnsafePointer<LDKWriteableScore>) in
				self.cType!.persist_scorer(self.cType!.this_arg, scorerPointer)
						}
				

				// cleanup
				

				// return value (do some wrapping)
				let returnValue = Result_NoneIOErrorZ(cType: nativeCallResult, instantiationContext: "Persister.swift::\(#function):\(#line)")

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
		