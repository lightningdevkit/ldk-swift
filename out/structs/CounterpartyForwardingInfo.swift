
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Information needed for constructing an invoice route hint for this channel.
			public typealias CounterpartyForwardingInfo = Bindings.CounterpartyForwardingInfo

			extension Bindings {
		

				/// Information needed for constructing an invoice route hint for this channel.
				public class CounterpartyForwardingInfo: NativeTypeWrapper {

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

					internal var cType: LDKCounterpartyForwardingInfo?

					internal init(cType: LDKCounterpartyForwardingInfo, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCounterpartyForwardingInfo, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKCounterpartyForwardingInfo, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the CounterpartyForwardingInfo, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CounterpartyForwardingInfo_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Base routing fee in millisatoshis.
					public func getFeeBaseMsat() -> UInt32 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCounterpartyForwardingInfo>) in
				CounterpartyForwardingInfo_get_fee_base_msat(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Base routing fee in millisatoshis.
					public func setFeeBaseMsat(val: UInt32) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKCounterpartyForwardingInfo>) in
				CounterpartyForwardingInfo_set_fee_base_msat(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Amount in millionths of a satoshi the channel will charge per transferred satoshi.
					public func getFeeProportionalMillionths() -> UInt32 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCounterpartyForwardingInfo>) in
				CounterpartyForwardingInfo_get_fee_proportional_millionths(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Amount in millionths of a satoshi the channel will charge per transferred satoshi.
					public func setFeeProportionalMillionths(val: UInt32) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKCounterpartyForwardingInfo>) in
				CounterpartyForwardingInfo_set_fee_proportional_millionths(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The minimum difference in cltv_expiry between an ingoing HTLC and its outgoing counterpart,
					/// such that the outgoing HTLC is forwardable to this counterparty. See `msgs::ChannelUpdate`'s
					/// `cltv_expiry_delta` for more details.
					public func getCltvExpiryDelta() -> UInt16 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCounterpartyForwardingInfo>) in
				CounterpartyForwardingInfo_get_cltv_expiry_delta(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The minimum difference in cltv_expiry between an ingoing HTLC and its outgoing counterpart,
					/// such that the outgoing HTLC is forwardable to this counterparty. See `msgs::ChannelUpdate`'s
					/// `cltv_expiry_delta` for more details.
					public func setCltvExpiryDelta(val: UInt16) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKCounterpartyForwardingInfo>) in
				CounterpartyForwardingInfo_set_cltv_expiry_delta(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new CounterpartyForwardingInfo given each field
					public init(feeBaseMsatArg: UInt32, feeProportionalMillionthsArg: UInt32, cltvExpiryDeltaArg: UInt16) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CounterpartyForwardingInfo_new(feeBaseMsatArg, feeProportionalMillionthsArg, cltvExpiryDeltaArg)

						// cleanup
						
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = CounterpartyForwardingInfo(cType: nativeCallResult, instantiationContext: "CounterpartyForwardingInfo.swift::\(#function):\(#line)")
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0, instantiationContext: "CounterpartyForwardingInfo.swift::\(#function):\(#line)")
				
			
					}
		
					/// Creates a copy of the CounterpartyForwardingInfo
					internal func clone() -> CounterpartyForwardingInfo {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCounterpartyForwardingInfo>) in
				CounterpartyForwardingInfo_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = CounterpartyForwardingInfo(cType: nativeCallResult, instantiationContext: "CounterpartyForwardingInfo.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Serialize the CounterpartyForwardingInfo object into a byte array which can be read by CounterpartyForwardingInfo_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKCounterpartyForwardingInfo>) in
				CounterpartyForwardingInfo_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, instantiationContext: "CounterpartyForwardingInfo.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a CounterpartyForwardingInfo from a byte array, created by CounterpartyForwardingInfo_write
					public class func read(ser: [UInt8]) -> Result_CounterpartyForwardingInfoDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser, instantiationContext: "CounterpartyForwardingInfo.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = CounterpartyForwardingInfo_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_CounterpartyForwardingInfoDecodeErrorZ(cType: nativeCallResult, instantiationContext: "CounterpartyForwardingInfo.swift::\(#function):\(#line)")
						

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> CounterpartyForwardingInfo {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> CounterpartyForwardingInfo {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> CounterpartyForwardingInfo {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> CounterpartyForwardingInfo {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> CounterpartyForwardingInfo {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing CounterpartyForwardingInfo \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing CounterpartyForwardingInfo \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

				}

				
			}
		
		