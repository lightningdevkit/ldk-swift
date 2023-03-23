
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			/// 
			public typealias UnsignedGossipMessage = Bindings.UnsignedGossipMessage

			extension Bindings {

				/// Represents the set of gossip messages that require a signature from a node's identity key.
				public class UnsignedGossipMessage: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKUnsignedGossipMessage?

					internal init(cType: LDKUnsignedGossipMessage) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKUnsignedGossipMessage, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public enum UnsignedGossipMessageType {
						
						/// An unsigned channel announcement.
						case ChannelAnnouncement
			
						/// An unsigned channel update.
						case ChannelUpdate
			
						/// An unsigned node announcement.
						case NodeAnnouncement
			
					}

					public func getValueType() -> UnsignedGossipMessageType {
						switch self.cType!.tag {
							case LDKUnsignedGossipMessage_ChannelAnnouncement:
								return .ChannelAnnouncement
			
							case LDKUnsignedGossipMessage_ChannelUpdate:
								return .ChannelUpdate
			
							case LDKUnsignedGossipMessage_NodeAnnouncement:
								return .NodeAnnouncement
			
							default:
								Bindings.print("Error: Invalid value type for UnsignedGossipMessage! Aborting.", severity: .ERROR)
								abort()
						}
		
					}

					
					/// Frees any resources used by the UnsignedGossipMessage
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = UnsignedGossipMessage_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the UnsignedGossipMessage
					internal func clone() -> UnsignedGossipMessage {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKUnsignedGossipMessage>) in
				UnsignedGossipMessage_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = UnsignedGossipMessage(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new ChannelAnnouncement-variant UnsignedGossipMessage
					public class func initWithChannelAnnouncement(a: Bindings.UnsignedChannelAnnouncement) -> UnsignedGossipMessage {
						// native call variable prep
						

						// native method call
						let nativeCallResult = UnsignedGossipMessage_channel_announcement(a.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = UnsignedGossipMessage(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new ChannelUpdate-variant UnsignedGossipMessage
					public class func initWithChannelUpdate(a: Bindings.UnsignedChannelUpdate) -> UnsignedGossipMessage {
						// native call variable prep
						

						// native method call
						let nativeCallResult = UnsignedGossipMessage_channel_update(a.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = UnsignedGossipMessage(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new NodeAnnouncement-variant UnsignedGossipMessage
					public class func initWithNodeAnnouncement(a: Bindings.UnsignedNodeAnnouncement) -> UnsignedGossipMessage {
						// native call variable prep
						

						// native method call
						let nativeCallResult = UnsignedGossipMessage_node_announcement(a.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = UnsignedGossipMessage(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Serialize the UnsignedGossipMessage object into a byte array which can be read by UnsignedGossipMessage_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKUnsignedGossipMessage>) in
				UnsignedGossipMessage_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		

					
					public func getValueAsChannelAnnouncement() -> Bindings.UnsignedChannelAnnouncement? {
						if self.cType?.tag != LDKUnsignedGossipMessage_ChannelAnnouncement {
							return nil
						}

						return UnsignedChannelAnnouncement(cType: self.cType!.channel_announcement, anchor: self)
					}
			
					public func getValueAsChannelUpdate() -> Bindings.UnsignedChannelUpdate? {
						if self.cType?.tag != LDKUnsignedGossipMessage_ChannelUpdate {
							return nil
						}

						return UnsignedChannelUpdate(cType: self.cType!.channel_update, anchor: self)
					}
			
					public func getValueAsNodeAnnouncement() -> Bindings.UnsignedNodeAnnouncement? {
						if self.cType?.tag != LDKUnsignedGossipMessage_NodeAnnouncement {
							return nil
						}

						return UnsignedNodeAnnouncement(cType: self.cType!.node_announcement, anchor: self)
					}
			

					internal func dangle(_ shouldDangle: Bool = true) -> UnsignedGossipMessage {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> UnsignedGossipMessage {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing UnsignedGossipMessage \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing UnsignedGossipMessage \(self.instanceNumber) due to dangle.")
						}
					}
			

					

				}

			}
		