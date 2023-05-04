
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Static channel fields used to build transactions given per-commitment fields, organized by
			/// broadcaster/countersignatory.
			/// 
			/// This is derived from the holder/counterparty-organized ChannelTransactionParameters via the
			/// as_holder_broadcastable and as_counterparty_broadcastable functions.
			public typealias DirectedChannelTransactionParameters = Bindings.DirectedChannelTransactionParameters

			extension Bindings {
		

				/// Static channel fields used to build transactions given per-commitment fields, organized by
				/// broadcaster/countersignatory.
				/// 
				/// This is derived from the holder/counterparty-organized ChannelTransactionParameters via the
				/// as_holder_broadcastable and as_counterparty_broadcastable functions.
				public class DirectedChannelTransactionParameters: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					public static var enableDeinitLogging = true
					public static var suspendFreedom = false
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKDirectedChannelTransactionParameters?

					internal init(cType: LDKDirectedChannelTransactionParameters, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKDirectedChannelTransactionParameters, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the DirectedChannelTransactionParameters, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = DirectedChannelTransactionParameters_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Get the channel pubkeys for the broadcaster
					public func broadcasterPubkeys() -> ChannelPublicKeys {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKDirectedChannelTransactionParameters>) in
				DirectedChannelTransactionParameters_broadcaster_pubkeys(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ChannelPublicKeys(cType: nativeCallResult, instantiationContext: "DirectedChannelTransactionParameters.swift::\(#function):\(#line)", anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// Get the channel pubkeys for the countersignatory
					public func countersignatoryPubkeys() -> ChannelPublicKeys {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKDirectedChannelTransactionParameters>) in
				DirectedChannelTransactionParameters_countersignatory_pubkeys(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ChannelPublicKeys(cType: nativeCallResult, instantiationContext: "DirectedChannelTransactionParameters.swift::\(#function):\(#line)", anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// Get the contest delay applicable to the transactions.
					/// Note that the contest delay was selected by the countersignatory.
					public func contestDelay() -> UInt16 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKDirectedChannelTransactionParameters>) in
				DirectedChannelTransactionParameters_contest_delay(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Whether the channel is outbound from the broadcaster.
					/// 
					/// The boolean representing the side that initiated the channel is
					/// an input to the commitment number obscure factor computation.
					public func isOutbound() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKDirectedChannelTransactionParameters>) in
				DirectedChannelTransactionParameters_is_outbound(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The funding outpoint
					public func fundingOutpoint() -> OutPoint {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKDirectedChannelTransactionParameters>) in
				DirectedChannelTransactionParameters_funding_outpoint(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = OutPoint(cType: nativeCallResult, instantiationContext: "DirectedChannelTransactionParameters.swift::\(#function):\(#line)", anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// Whether to use anchors for this channel
					public func optAnchors() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKDirectedChannelTransactionParameters>) in
				DirectedChannelTransactionParameters_opt_anchors(thisArgPointer)
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
		

					internal func dangle(_ shouldDangle: Bool = true) -> DirectedChannelTransactionParameters {
						self.dangling = shouldDangle
						return self
					}

					
					internal func setCFreeability(freeable: Bool) -> DirectedChannelTransactionParameters {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> DirectedChannelTransactionParameters {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing DirectedChannelTransactionParameters \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing DirectedChannelTransactionParameters \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

				}

				
			}
		
		