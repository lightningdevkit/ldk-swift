
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			/// 
			public typealias GossipSync = Bindings.GossipSync

			extension Bindings {

				/// Either [`P2PGossipSync`] or [`RapidGossipSync`].
				public class GossipSync: NativeTypeWrapper {

					
					/// Set to false to suppress an individual type's deinit log statements.
					/// Only applicable when log threshold is set to `.Debug`.
					public static var enableDeinitLogging = true

					/// Set to true to suspend the freeing of this type's associated Rust memory.
					/// Should only ever be used for debugging purposes, and will likely be
					/// deprecated soon.
					public static var suspendFreedom = false

					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKGossipSync?

					internal init(cType: LDKGossipSync, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKGossipSync, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKGossipSync, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					public enum GossipSyncType {
						
						/// Gossip sync via the lightning peer-to-peer network as defined by BOLT 7.
						case P2P
			
						/// Rapid gossip sync from a trusted server.
						case Rapid
			
						/// No gossip sync.
						case None
			
					}

					public func getValueType() -> GossipSyncType {
						switch self.cType!.tag {
							case LDKGossipSync_P2P:
								return .P2P
			
							case LDKGossipSync_Rapid:
								return .Rapid
			
							case LDKGossipSync_None:
								return .None
			
							default:
								Bindings.print("Error: Invalid value type for GossipSync! Aborting.", severity: .ERROR)
								abort()
						}
		
					}

					
					/// Frees any resources used by the GossipSync
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = GossipSync_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Utility method to constructs a new P2P-variant GossipSync
					public class func initWithP2P(a: Bindings.P2PGossipSync) -> GossipSync {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKP2PGossipSync>) in
				GossipSync_p2_p(aPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = GossipSync(cType: nativeCallResult, instantiationContext: "GossipSync.swift::\(#function):\(#line)")
						

						try! returnValue.addAnchor(anchor: a)
return returnValue
					}
		
					/// Utility method to constructs a new Rapid-variant GossipSync
					public class func initWithRapid(a: Bindings.RapidGossipSync) -> GossipSync {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKRapidGossipSync>) in
				GossipSync_rapid(aPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = GossipSync(cType: nativeCallResult, instantiationContext: "GossipSync.swift::\(#function):\(#line)")
						

						try! returnValue.addAnchor(anchor: a)
return returnValue
					}
		
					/// Utility method to constructs a new None-variant GossipSync
					public class func none() -> GossipSync {
						// native call variable prep
						

						// native method call
						let nativeCallResult = GossipSync_none()

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = GossipSync(cType: nativeCallResult, instantiationContext: "GossipSync.swift::\(#function):\(#line)")
						

						return returnValue
					}
		

					
					public func getValueAsP2p() -> Bindings.P2PGossipSync? {
						if self.cType?.tag != LDKGossipSync_P2P {
							return nil
						}

						return P2PGossipSync(cType: self.cType!.p2p, instantiationContext: "GossipSync.swift::\(#function):\(#line)", anchor: self)
					}
			
					public func getValueAsRapid() -> Bindings.RapidGossipSync? {
						if self.cType?.tag != LDKGossipSync_Rapid {
							return nil
						}

						return RapidGossipSync(cType: self.cType!.rapid, instantiationContext: "GossipSync.swift::\(#function):\(#line)", anchor: self)
					}
			

					
					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing GossipSync \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing GossipSync \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

					

				}

			}
		