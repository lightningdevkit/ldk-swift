
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			/// 
			public typealias NetworkUpdate = Bindings.NetworkUpdate

			extension Bindings {

				/// Update to the [`NetworkGraph`] based on payment failure information conveyed via the Onion
				/// return packet by a node along the route. See [BOLT #4] for details.
				/// 
				/// [BOLT #4]: https://github.com/lightning/bolts/blob/master/04-onion-routing.md
				public class NetworkUpdate: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKNetworkUpdate?

					internal init(cType: LDKNetworkUpdate, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKNetworkUpdate, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public enum NetworkUpdateType {
						
						/// An error indicating a `channel_update` messages should be applied via
						/// [`NetworkGraph::update_channel`].
						case ChannelUpdateMessage
			
						/// An error indicating that a channel failed to route a payment, which should be applied via
						/// [`NetworkGraph::channel_failed`].
						case ChannelFailure
			
						/// An error indicating that a node failed to route a payment, which should be applied via
						/// [`NetworkGraph::node_failed_permanent`] if permanent.
						case NodeFailure
			
					}

					public func getValueType() -> NetworkUpdateType {
						switch self.cType!.tag {
							case LDKNetworkUpdate_ChannelUpdateMessage:
								return .ChannelUpdateMessage
			
							case LDKNetworkUpdate_ChannelFailure:
								return .ChannelFailure
			
							case LDKNetworkUpdate_NodeFailure:
								return .NodeFailure
			
							default:
								Bindings.print("Error: Invalid value type for NetworkUpdate! Aborting.", severity: .ERROR)
								abort()
						}
		
					}

					
					/// Frees any resources used by the NetworkUpdate
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = NetworkUpdate_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the NetworkUpdate
					internal func clone() -> NetworkUpdate {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKNetworkUpdate>) in
				NetworkUpdate_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = NetworkUpdate(cType: nativeCallResult, instantiationContext: "NetworkUpdate.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new ChannelUpdateMessage-variant NetworkUpdate
					public class func initWithChannelUpdateMessage(msg: Bindings.ChannelUpdate) -> NetworkUpdate {
						// native call variable prep
						

						// native method call
						let nativeCallResult = NetworkUpdate_channel_update_message(msg.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = NetworkUpdate(cType: nativeCallResult, instantiationContext: "NetworkUpdate.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new ChannelFailure-variant NetworkUpdate
					public class func initWithChannelFailure(shortChannelId: UInt64, isPermanent: Bool) -> NetworkUpdate {
						// native call variable prep
						

						// native method call
						let nativeCallResult = NetworkUpdate_channel_failure(shortChannelId, isPermanent)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = NetworkUpdate(cType: nativeCallResult, instantiationContext: "NetworkUpdate.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new NodeFailure-variant NetworkUpdate
					public class func initWithNodeFailure(nodeId: [UInt8], isPermanent: Bool) -> NetworkUpdate {
						// native call variable prep
						
						let nodeIdPrimitiveWrapper = PublicKey(value: nodeId)
				

						// native method call
						let nativeCallResult = NetworkUpdate_node_failure(nodeIdPrimitiveWrapper.cType!, isPermanent)

						// cleanup
						
						// for elided types, we need this
						nodeIdPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = NetworkUpdate(cType: nativeCallResult, instantiationContext: "NetworkUpdate.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Checks if two NetworkUpdates contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					public class func eq(a: NetworkUpdate, b: NetworkUpdate) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKNetworkUpdate>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKNetworkUpdate>) in
				NetworkUpdate_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Serialize the NetworkUpdate object into a byte array which can be read by NetworkUpdate_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKNetworkUpdate>) in
				NetworkUpdate_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, instantiationContext: "NetworkUpdate.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a NetworkUpdate from a byte array, created by NetworkUpdate_write
					public class func read(ser: [UInt8]) -> Result_COption_NetworkUpdateZDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = NetworkUpdate_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_COption_NetworkUpdateZDecodeErrorZ(cType: nativeCallResult, instantiationContext: "NetworkUpdate.swift::\(#function):\(#line)")
						

						return returnValue
					}
		

					
					public func getValueAsChannelUpdateMessage() -> ChannelUpdateMessage? {
						if self.cType?.tag != LDKNetworkUpdate_ChannelUpdateMessage {
							return nil
						}

						return NetworkUpdate_LDKChannelUpdateMessage_Body(cType: self.cType!.channel_update_message, instantiationContext: "NetworkUpdate.swift::\(#function):\(#line)", anchor: self)
					}
			
					public func getValueAsChannelFailure() -> ChannelFailure? {
						if self.cType?.tag != LDKNetworkUpdate_ChannelFailure {
							return nil
						}

						return NetworkUpdate_LDKChannelFailure_Body(cType: self.cType!.channel_failure, instantiationContext: "NetworkUpdate.swift::\(#function):\(#line)", anchor: self)
					}
			
					public func getValueAsNodeFailure() -> NodeFailure? {
						if self.cType?.tag != LDKNetworkUpdate_NodeFailure {
							return nil
						}

						return NetworkUpdate_LDKNodeFailure_Body(cType: self.cType!.node_failure, instantiationContext: "NetworkUpdate.swift::\(#function):\(#line)", anchor: self)
					}
			

					internal func dangle(_ shouldDangle: Bool = true) -> NetworkUpdate {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> NetworkUpdate {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing NetworkUpdate \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing NetworkUpdate \(self.instanceNumber) due to dangle.")
						}
					}
			

					
					
					/// 
					internal typealias NetworkUpdate_LDKChannelUpdateMessage_Body = ChannelUpdateMessage
			

					/// 
					public class ChannelUpdateMessage: NativeTypeWrapper {

						

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKNetworkUpdate_LDKChannelUpdateMessage_Body?

						internal init(cType: LDKNetworkUpdate_LDKChannelUpdateMessage_Body, instantiationContext: String) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						}

						internal init(cType: LDKNetworkUpdate_LDKChannelUpdateMessage_Body, instantiationContext: String, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The update to apply via [`NetworkGraph::update_channel`].
						public func getMsg() -> Bindings.ChannelUpdate {
							// return value (do some wrapping)
							let returnValue = Bindings.ChannelUpdate(cType: self.cType!.msg, instantiationContext: "NetworkUpdate.swift::\(#function):\(#line)", anchor: self)

							return returnValue;
						}
		

						internal func dangle(_ shouldDangle: Bool = true) -> ChannelUpdateMessage {
							self.dangling = shouldDangle
							return self
						}

											

					}

					
		
					
					/// 
					internal typealias NetworkUpdate_LDKChannelFailure_Body = ChannelFailure
			

					/// 
					public class ChannelFailure: NativeTypeWrapper {

						

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKNetworkUpdate_LDKChannelFailure_Body?

						internal init(cType: LDKNetworkUpdate_LDKChannelFailure_Body, instantiationContext: String) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						}

						internal init(cType: LDKNetworkUpdate_LDKChannelFailure_Body, instantiationContext: String, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The short channel id of the closed channel.
						public func getShortChannelId() -> UInt64 {
							// return value (do some wrapping)
							let returnValue = self.cType!.short_channel_id

							return returnValue;
						}
		
						/// Whether the channel should be permanently removed or temporarily disabled until a new
						/// `channel_update` message is received.
						public func isPermanent() -> Bool {
							// return value (do some wrapping)
							let returnValue = self.cType!.is_permanent

							return returnValue;
						}
		

						internal func dangle(_ shouldDangle: Bool = true) -> ChannelFailure {
							self.dangling = shouldDangle
							return self
						}

											

					}

					
		
					
					/// 
					internal typealias NetworkUpdate_LDKNodeFailure_Body = NodeFailure
			

					/// 
					public class NodeFailure: NativeTypeWrapper {

						

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKNetworkUpdate_LDKNodeFailure_Body?

						internal init(cType: LDKNetworkUpdate_LDKNodeFailure_Body, instantiationContext: String) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						}

						internal init(cType: LDKNetworkUpdate_LDKNodeFailure_Body, instantiationContext: String, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The node id of the failed node.
						public func getNodeId() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = PublicKey(cType: self.cType!.node_id, instantiationContext: "NetworkUpdate.swift::\(#function):\(#line)", anchor: self).getValue()

							return returnValue;
						}
		
						/// Whether the node should be permanently removed from consideration or can be restored
						/// when a new `channel_update` message is received.
						public func isPermanent() -> Bool {
							// return value (do some wrapping)
							let returnValue = self.cType!.is_permanent

							return returnValue;
						}
		

						internal func dangle(_ shouldDangle: Bool = true) -> NodeFailure {
							self.dangling = shouldDangle
							return self
						}

											

					}

					
		

				}

			}
		