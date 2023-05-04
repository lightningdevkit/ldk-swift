
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			/// 
			public typealias HTLCDestination = Bindings.HTLCDestination

			extension Bindings {

				/// Intended destination of a failed HTLC as indicated in [`Event::HTLCHandlingFailed`].
				public class HTLCDestination: NativeTypeWrapper {

					
					public static var enableDeinitLogging = true
					public static var suspendFreedom = false
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKHTLCDestination?

					internal init(cType: LDKHTLCDestination, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKHTLCDestination, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public enum HTLCDestinationType {
						
						/// We tried forwarding to a channel but failed to do so. An example of such an instance is when
						/// there is insufficient capacity in our outbound channel.
						case NextHopChannel
			
						/// Scenario where we are unsure of the next node to forward the HTLC to.
						case UnknownNextHop
			
						/// We couldn't forward to the outgoing scid. An example would be attempting to send a duplicate
						/// intercept HTLC.
						case InvalidForward
			
						/// Failure scenario where an HTLC may have been forwarded to be intended for us,
						/// but is invalid for some reason, so we reject it.
						/// 
						/// Some of the reasons may include:
						/// * HTLC Timeouts
						/// * Expected MPP amount to claim does not equal HTLC total
						/// * Claimable amount does not match expected amount
						case FailedPayment
			
					}

					public func getValueType() -> HTLCDestinationType {
						switch self.cType!.tag {
							case LDKHTLCDestination_NextHopChannel:
								return .NextHopChannel
			
							case LDKHTLCDestination_UnknownNextHop:
								return .UnknownNextHop
			
							case LDKHTLCDestination_InvalidForward:
								return .InvalidForward
			
							case LDKHTLCDestination_FailedPayment:
								return .FailedPayment
			
							default:
								Bindings.print("Error: Invalid value type for HTLCDestination! Aborting.", severity: .ERROR)
								abort()
						}
		
					}

					
					/// Frees any resources used by the HTLCDestination
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = HTLCDestination_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the HTLCDestination
					internal func clone() -> HTLCDestination {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKHTLCDestination>) in
				HTLCDestination_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = HTLCDestination(cType: nativeCallResult, instantiationContext: "HTLCDestination.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new NextHopChannel-variant HTLCDestination
					public class func initWithNextHopChannel(nodeId: [UInt8], channelId: [UInt8]) -> HTLCDestination {
						// native call variable prep
						
						let nodeIdPrimitiveWrapper = PublicKey(value: nodeId, instantiationContext: "HTLCDestination.swift::\(#function):\(#line)")
				
						let channelIdPrimitiveWrapper = ThirtyTwoBytes(value: channelId, instantiationContext: "HTLCDestination.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = HTLCDestination_next_hop_channel(nodeIdPrimitiveWrapper.cType!, channelIdPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						nodeIdPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						channelIdPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = HTLCDestination(cType: nativeCallResult, instantiationContext: "HTLCDestination.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new UnknownNextHop-variant HTLCDestination
					public class func initWithUnknownNextHop(requestedForwardScid: UInt64) -> HTLCDestination {
						// native call variable prep
						

						// native method call
						let nativeCallResult = HTLCDestination_unknown_next_hop(requestedForwardScid)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = HTLCDestination(cType: nativeCallResult, instantiationContext: "HTLCDestination.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new InvalidForward-variant HTLCDestination
					public class func initWithInvalidForward(requestedForwardScid: UInt64) -> HTLCDestination {
						// native call variable prep
						

						// native method call
						let nativeCallResult = HTLCDestination_invalid_forward(requestedForwardScid)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = HTLCDestination(cType: nativeCallResult, instantiationContext: "HTLCDestination.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new FailedPayment-variant HTLCDestination
					public class func initWithFailedPayment(paymentHash: [UInt8]) -> HTLCDestination {
						// native call variable prep
						
						let paymentHashPrimitiveWrapper = ThirtyTwoBytes(value: paymentHash, instantiationContext: "HTLCDestination.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = HTLCDestination_failed_payment(paymentHashPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						paymentHashPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = HTLCDestination(cType: nativeCallResult, instantiationContext: "HTLCDestination.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Checks if two HTLCDestinations contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					public class func eq(a: HTLCDestination, b: HTLCDestination) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKHTLCDestination>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKHTLCDestination>) in
				HTLCDestination_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Serialize the HTLCDestination object into a byte array which can be read by HTLCDestination_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKHTLCDestination>) in
				HTLCDestination_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, instantiationContext: "HTLCDestination.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a HTLCDestination from a byte array, created by HTLCDestination_write
					public class func read(ser: [UInt8]) -> Result_COption_HTLCDestinationZDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser, instantiationContext: "HTLCDestination.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = HTLCDestination_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_COption_HTLCDestinationZDecodeErrorZ(cType: nativeCallResult, instantiationContext: "HTLCDestination.swift::\(#function):\(#line)")
						

						return returnValue
					}
		

					
					public func getValueAsNextHopChannel() -> NextHopChannel? {
						if self.cType?.tag != LDKHTLCDestination_NextHopChannel {
							return nil
						}

						return HTLCDestination_LDKNextHopChannel_Body(cType: self.cType!.next_hop_channel, instantiationContext: "HTLCDestination.swift::\(#function):\(#line)", anchor: self)
					}
			
					public func getValueAsUnknownNextHop() -> UnknownNextHop? {
						if self.cType?.tag != LDKHTLCDestination_UnknownNextHop {
							return nil
						}

						return HTLCDestination_LDKUnknownNextHop_Body(cType: self.cType!.unknown_next_hop, instantiationContext: "HTLCDestination.swift::\(#function):\(#line)", anchor: self)
					}
			
					public func getValueAsInvalidForward() -> InvalidForward? {
						if self.cType?.tag != LDKHTLCDestination_InvalidForward {
							return nil
						}

						return HTLCDestination_LDKInvalidForward_Body(cType: self.cType!.invalid_forward, instantiationContext: "HTLCDestination.swift::\(#function):\(#line)", anchor: self)
					}
			
					public func getValueAsFailedPayment() -> FailedPayment? {
						if self.cType?.tag != LDKHTLCDestination_FailedPayment {
							return nil
						}

						return HTLCDestination_LDKFailedPayment_Body(cType: self.cType!.failed_payment, instantiationContext: "HTLCDestination.swift::\(#function):\(#line)", anchor: self)
					}
			

					internal func dangle(_ shouldDangle: Bool = true) -> HTLCDestination {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> HTLCDestination {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing HTLCDestination \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing HTLCDestination \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

					
					
					/// 
					internal typealias HTLCDestination_LDKNextHopChannel_Body = NextHopChannel
			

					/// 
					public class NextHopChannel: NativeTypeWrapper {

						

						
						public static var enableDeinitLogging = true
						public static var suspendFreedom = false
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKHTLCDestination_LDKNextHopChannel_Body?

						internal init(cType: LDKHTLCDestination_LDKNextHopChannel_Body, instantiationContext: String) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						}

						internal init(cType: LDKHTLCDestination_LDKNextHopChannel_Body, instantiationContext: String, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The `node_id` of the next node. For backwards compatibility, this field is
						/// marked as optional, versions prior to 0.0.110 may not always be able to provide
						/// counterparty node information.
						/// 
						/// Note that this (or a relevant inner pointer) may be NULL or all-0s to represent None
						public func getNodeId() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = PublicKey(cType: self.cType!.node_id, instantiationContext: "HTLCDestination.swift::\(#function):\(#line)", anchor: self).getValue()

							return returnValue;
						}
		
						/// The outgoing `channel_id` between us and the next node.
						public func getChannelId() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = ThirtyTwoBytes(cType: self.cType!.channel_id, instantiationContext: "HTLCDestination.swift::\(#function):\(#line)", anchor: self).getValue()

							return returnValue;
						}
		

						internal func dangle(_ shouldDangle: Bool = true) -> NextHopChannel {
							self.dangling = shouldDangle
							return self
						}

											

					}

					
		
					
					/// 
					internal typealias HTLCDestination_LDKUnknownNextHop_Body = UnknownNextHop
			

					/// 
					public class UnknownNextHop: NativeTypeWrapper {

						

						
						public static var enableDeinitLogging = true
						public static var suspendFreedom = false
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKHTLCDestination_LDKUnknownNextHop_Body?

						internal init(cType: LDKHTLCDestination_LDKUnknownNextHop_Body, instantiationContext: String) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						}

						internal init(cType: LDKHTLCDestination_LDKUnknownNextHop_Body, instantiationContext: String, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// Short channel id we are requesting to forward an HTLC to.
						public func getRequestedForwardScid() -> UInt64 {
							// return value (do some wrapping)
							let returnValue = self.cType!.requested_forward_scid

							return returnValue;
						}
		

						internal func dangle(_ shouldDangle: Bool = true) -> UnknownNextHop {
							self.dangling = shouldDangle
							return self
						}

											

					}

					
		
					
					/// 
					internal typealias HTLCDestination_LDKInvalidForward_Body = InvalidForward
			

					/// 
					public class InvalidForward: NativeTypeWrapper {

						

						
						public static var enableDeinitLogging = true
						public static var suspendFreedom = false
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKHTLCDestination_LDKInvalidForward_Body?

						internal init(cType: LDKHTLCDestination_LDKInvalidForward_Body, instantiationContext: String) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						}

						internal init(cType: LDKHTLCDestination_LDKInvalidForward_Body, instantiationContext: String, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// Short channel id we are requesting to forward an HTLC to.
						public func getRequestedForwardScid() -> UInt64 {
							// return value (do some wrapping)
							let returnValue = self.cType!.requested_forward_scid

							return returnValue;
						}
		

						internal func dangle(_ shouldDangle: Bool = true) -> InvalidForward {
							self.dangling = shouldDangle
							return self
						}

											

					}

					
		
					
					/// 
					internal typealias HTLCDestination_LDKFailedPayment_Body = FailedPayment
			

					/// 
					public class FailedPayment: NativeTypeWrapper {

						

						
						public static var enableDeinitLogging = true
						public static var suspendFreedom = false
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKHTLCDestination_LDKFailedPayment_Body?

						internal init(cType: LDKHTLCDestination_LDKFailedPayment_Body, instantiationContext: String) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						}

						internal init(cType: LDKHTLCDestination_LDKFailedPayment_Body, instantiationContext: String, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The payment hash of the payment we attempted to process.
						public func getPaymentHash() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = ThirtyTwoBytes(cType: self.cType!.payment_hash, instantiationContext: "HTLCDestination.swift::\(#function):\(#line)", anchor: self).getValue()

							return returnValue;
						}
		

						internal func dangle(_ shouldDangle: Bool = true) -> FailedPayment {
							self.dangling = shouldDangle
							return self
						}

											

					}

					
		

				}

			}
		