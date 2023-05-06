
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// The unsigned part of a [`channel_update`] message.
			/// 
			/// [`channel_update`]: https://github.com/lightning/bolts/blob/master/07-routing-gossip.md#the-channel_update-message
			public typealias UnsignedChannelUpdate = Bindings.UnsignedChannelUpdate

			extension Bindings {
		

				/// The unsigned part of a [`channel_update`] message.
				/// 
				/// [`channel_update`]: https://github.com/lightning/bolts/blob/master/07-routing-gossip.md#the-channel_update-message
				public class UnsignedChannelUpdate: NativeTypeWrapper {

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

					internal var cType: LDKUnsignedChannelUpdate?

					internal init(cType: LDKUnsignedChannelUpdate, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKUnsignedChannelUpdate, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKUnsignedChannelUpdate, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the UnsignedChannelUpdate, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = UnsignedChannelUpdate_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The genesis hash of the blockchain where the channel is to be opened
					public func getChainHash() -> [UInt8]? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_get_chain_hash(thisPtrPointer)
						}
				

						// cleanup
						
						guard let nativeCallResult = nativeCallResult else {
							return nil
						}
			

						
						// return value (do some wrapping)
						let returnValue = Bindings.UInt8Tuple32ToArray(tuple: nativeCallResult.pointee)
						

						return returnValue
					}
		
					/// The genesis hash of the blockchain where the channel is to be opened
					public func setChainHash(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = ThirtyTwoBytes(value: val, instantiationContext: "UnsignedChannelUpdate.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_set_chain_hash(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The short channel ID
					public func getShortChannelId() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_get_short_channel_id(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The short channel ID
					public func setShortChannelId(val: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_set_short_channel_id(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// A strictly monotonic announcement counter, with gaps allowed, specific to this channel
					public func getTimestamp() -> UInt32 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_get_timestamp(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// A strictly monotonic announcement counter, with gaps allowed, specific to this channel
					public func setTimestamp(val: UInt32) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_set_timestamp(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Channel flags
					public func getFlags() -> UInt8 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_get_flags(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Channel flags
					public func setFlags(val: UInt8) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_set_flags(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The number of blocks such that if:
					/// `incoming_htlc.cltv_expiry < outgoing_htlc.cltv_expiry + cltv_expiry_delta`
					/// then we need to fail the HTLC backwards. When forwarding an HTLC, `cltv_expiry_delta` determines
					/// the outgoing HTLC's minimum `cltv_expiry` value -- so, if an incoming HTLC comes in with a
					/// `cltv_expiry` of 100000, and the node we're forwarding to has a `cltv_expiry_delta` value of 10,
					/// then we'll check that the outgoing HTLC's `cltv_expiry` value is at least 100010 before
					/// forwarding. Note that the HTLC sender is the one who originally sets this value when
					/// constructing the route.
					public func getCltvExpiryDelta() -> UInt16 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_get_cltv_expiry_delta(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The number of blocks such that if:
					/// `incoming_htlc.cltv_expiry < outgoing_htlc.cltv_expiry + cltv_expiry_delta`
					/// then we need to fail the HTLC backwards. When forwarding an HTLC, `cltv_expiry_delta` determines
					/// the outgoing HTLC's minimum `cltv_expiry` value -- so, if an incoming HTLC comes in with a
					/// `cltv_expiry` of 100000, and the node we're forwarding to has a `cltv_expiry_delta` value of 10,
					/// then we'll check that the outgoing HTLC's `cltv_expiry` value is at least 100010 before
					/// forwarding. Note that the HTLC sender is the one who originally sets this value when
					/// constructing the route.
					public func setCltvExpiryDelta(val: UInt16) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_set_cltv_expiry_delta(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The minimum HTLC size incoming to sender, in milli-satoshi
					public func getHtlcMinimumMsat() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_get_htlc_minimum_msat(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The minimum HTLC size incoming to sender, in milli-satoshi
					public func setHtlcMinimumMsat(val: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_set_htlc_minimum_msat(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The maximum HTLC value incoming to sender, in milli-satoshi.
					/// 
					/// This used to be optional.
					public func getHtlcMaximumMsat() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_get_htlc_maximum_msat(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The maximum HTLC value incoming to sender, in milli-satoshi.
					/// 
					/// This used to be optional.
					public func setHtlcMaximumMsat(val: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_set_htlc_maximum_msat(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The base HTLC fee charged by sender, in milli-satoshi
					public func getFeeBaseMsat() -> UInt32 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_get_fee_base_msat(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The base HTLC fee charged by sender, in milli-satoshi
					public func setFeeBaseMsat(val: UInt32) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_set_fee_base_msat(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The amount to fee multiplier, in micro-satoshi
					public func getFeeProportionalMillionths() -> UInt32 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_get_fee_proportional_millionths(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The amount to fee multiplier, in micro-satoshi
					public func setFeeProportionalMillionths(val: UInt32) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_set_fee_proportional_millionths(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Excess data which was signed as a part of the message which we do not (yet) understand how
					/// to decode.
					/// 
					/// This is stored to ensure forward-compatibility as new fields are added to the lightning gossip protocol.
					/// 
					/// Returns a copy of the field.
					public func getExcessData() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_get_excess_data(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, instantiationContext: "UnsignedChannelUpdate.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Excess data which was signed as a part of the message which we do not (yet) understand how
					/// to decode.
					/// 
					/// This is stored to ensure forward-compatibility as new fields are added to the lightning gossip protocol.
					public func setExcessData(val: [UInt8]) {
						// native call variable prep
						
						let valVector = Vec_u8Z(array: val, instantiationContext: "UnsignedChannelUpdate.swift::\(#function):\(#line)").dangle()
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_set_excess_data(thisPtrPointer, valVector.cType!)
						}
				

						// cleanup
						
						// valVector.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new UnsignedChannelUpdate given each field
					public init(chainHashArg: [UInt8], shortChannelIdArg: UInt64, timestampArg: UInt32, flagsArg: UInt8, cltvExpiryDeltaArg: UInt16, htlcMinimumMsatArg: UInt64, htlcMaximumMsatArg: UInt64, feeBaseMsatArg: UInt32, feeProportionalMillionthsArg: UInt32, excessDataArg: [UInt8]) {
						// native call variable prep
						
						let chainHashArgPrimitiveWrapper = ThirtyTwoBytes(value: chainHashArg, instantiationContext: "UnsignedChannelUpdate.swift::\(#function):\(#line)")
				
						let excessDataArgVector = Vec_u8Z(array: excessDataArg, instantiationContext: "UnsignedChannelUpdate.swift::\(#function):\(#line)").dangle()
				

						// native method call
						let nativeCallResult = UnsignedChannelUpdate_new(chainHashArgPrimitiveWrapper.cType!, shortChannelIdArg, timestampArg, flagsArg, cltvExpiryDeltaArg, htlcMinimumMsatArg, htlcMaximumMsatArg, feeBaseMsatArg, feeProportionalMillionthsArg, excessDataArgVector.cType!)

						// cleanup
						
						// for elided types, we need this
						chainHashArgPrimitiveWrapper.noOpRetain()
				
						// excessDataArgVector.noOpRetain()
				
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = UnsignedChannelUpdate(cType: nativeCallResult, instantiationContext: "UnsignedChannelUpdate.swift::\(#function):\(#line)")
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0, instantiationContext: "UnsignedChannelUpdate.swift::\(#function):\(#line)")
				
			
					}
		
					/// Creates a copy of the UnsignedChannelUpdate
					internal func clone() -> UnsignedChannelUpdate {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = UnsignedChannelUpdate(cType: nativeCallResult, instantiationContext: "UnsignedChannelUpdate.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Checks if two UnsignedChannelUpdates contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public class func eq(a: UnsignedChannelUpdate, b: UnsignedChannelUpdate) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Serialize the UnsignedChannelUpdate object into a byte array which can be read by UnsignedChannelUpdate_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKUnsignedChannelUpdate>) in
				UnsignedChannelUpdate_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, instantiationContext: "UnsignedChannelUpdate.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a UnsignedChannelUpdate from a byte array, created by UnsignedChannelUpdate_write
					public class func read(ser: [UInt8]) -> Result_UnsignedChannelUpdateDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser, instantiationContext: "UnsignedChannelUpdate.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = UnsignedChannelUpdate_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_UnsignedChannelUpdateDecodeErrorZ(cType: nativeCallResult, instantiationContext: "UnsignedChannelUpdate.swift::\(#function):\(#line)")
						

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> UnsignedChannelUpdate {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> UnsignedChannelUpdate {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> UnsignedChannelUpdate {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> UnsignedChannelUpdate {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> UnsignedChannelUpdate {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing UnsignedChannelUpdate \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing UnsignedChannelUpdate \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

				}

				
			}
		
		