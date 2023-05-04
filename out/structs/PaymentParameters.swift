
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// The recipient of a payment.
			public typealias PaymentParameters = Bindings.PaymentParameters

			extension Bindings {
		

				/// The recipient of a payment.
				public class PaymentParameters: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					public static var enableDeinitLogging = true
					public static var suspendFreedom = false
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKPaymentParameters?

					internal init(cType: LDKPaymentParameters, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKPaymentParameters, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the PaymentParameters, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = PaymentParameters_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The node id of the payee.
					public func getPayeePubkey() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKPaymentParameters>) in
				PaymentParameters_get_payee_pubkey(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = PublicKey(cType: nativeCallResult, instantiationContext: "PaymentParameters.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// The node id of the payee.
					public func setPayeePubkey(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = PublicKey(value: val, instantiationContext: "PaymentParameters.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKPaymentParameters>) in
				PaymentParameters_set_payee_pubkey(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Features supported by the payee.
					/// 
					/// May be set from the payee's invoice or via [`for_keysend`]. May be `None` if the invoice
					/// does not contain any features.
					/// 
					/// [`for_keysend`]: Self::for_keysend
					/// 
					/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func getFeatures() -> InvoiceFeatures? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKPaymentParameters>) in
				PaymentParameters_get_features(thisPtrPointer)
						}
				

						// cleanup
						
				// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
				// Type group: RustStruct
				// Type: LDKInvoiceFeatures
			
					if nativeCallResult.inner == nil {
						return nil
					}

					let pointerValue = UInt(bitPattern: nativeCallResult.inner)
					if pointerValue == 0 {
						return nil
					}
				

						
						// return value (do some wrapping)
						let returnValue = InvoiceFeatures(cType: nativeCallResult, instantiationContext: "PaymentParameters.swift::\(#function):\(#line)", anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// Features supported by the payee.
					/// 
					/// May be set from the payee's invoice or via [`for_keysend`]. May be `None` if the invoice
					/// does not contain any features.
					/// 
					/// [`for_keysend`]: Self::for_keysend
					/// 
					/// Note that val (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func setFeatures(val: InvoiceFeatures) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKPaymentParameters>) in
				PaymentParameters_set_features(thisPtrPointer, val.dynamicallyDangledClone().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Hints for routing to the payee, containing channels connecting the payee to public nodes.
					public func getRouteHints() -> [RouteHint] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKPaymentParameters>) in
				PaymentParameters_get_route_hints(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_RouteHintZ(cType: nativeCallResult, instantiationContext: "PaymentParameters.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Hints for routing to the payee, containing channels connecting the payee to public nodes.
					public func setRouteHints(val: [RouteHint]) {
						// native call variable prep
						
						let valVector = Vec_RouteHintZ(array: val, instantiationContext: "PaymentParameters.swift::\(#function):\(#line)").dangle()
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKPaymentParameters>) in
				PaymentParameters_set_route_hints(thisPtrPointer, valVector.cType!)
						}
				

						// cleanup
						
						// valVector.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Expiration of a payment to the payee, in seconds relative to the UNIX epoch.
					public func getExpiryTime() -> UInt64? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKPaymentParameters>) in
				PaymentParameters_get_expiry_time(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Option_u64Z(cType: nativeCallResult, instantiationContext: "PaymentParameters.swift::\(#function):\(#line)", anchor: self).getValue()
						

						return returnValue
					}
		
					/// Expiration of a payment to the payee, in seconds relative to the UNIX epoch.
					public func setExpiryTime(val: UInt64?) {
						// native call variable prep
						
						let valOption = Option_u64Z(some: val, instantiationContext: "PaymentParameters.swift::\(#function):\(#line)").danglingClone()
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKPaymentParameters>) in
				PaymentParameters_set_expiry_time(thisPtrPointer, valOption.cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The maximum total CLTV delta we accept for the route.
					/// Defaults to [`DEFAULT_MAX_TOTAL_CLTV_EXPIRY_DELTA`].
					public func getMaxTotalCltvExpiryDelta() -> UInt32 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKPaymentParameters>) in
				PaymentParameters_get_max_total_cltv_expiry_delta(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The maximum total CLTV delta we accept for the route.
					/// Defaults to [`DEFAULT_MAX_TOTAL_CLTV_EXPIRY_DELTA`].
					public func setMaxTotalCltvExpiryDelta(val: UInt32) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKPaymentParameters>) in
				PaymentParameters_set_max_total_cltv_expiry_delta(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The maximum number of paths that may be used by (MPP) payments.
					/// Defaults to [`DEFAULT_MAX_PATH_COUNT`].
					public func getMaxPathCount() -> UInt8 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKPaymentParameters>) in
				PaymentParameters_get_max_path_count(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The maximum number of paths that may be used by (MPP) payments.
					/// Defaults to [`DEFAULT_MAX_PATH_COUNT`].
					public func setMaxPathCount(val: UInt8) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKPaymentParameters>) in
				PaymentParameters_set_max_path_count(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Selects the maximum share of a channel's total capacity which will be sent over a channel,
					/// as a power of 1/2. A higher value prefers to send the payment using more MPP parts whereas
					/// a lower value prefers to send larger MPP parts, potentially saturating channels and
					/// increasing failure probability for those paths.
					/// 
					/// Note that this restriction will be relaxed during pathfinding after paths which meet this
					/// restriction have been found. While paths which meet this criteria will be searched for, it
					/// is ultimately up to the scorer to select them over other paths.
					/// 
					/// A value of 0 will allow payments up to and including a channel's total announced usable
					/// capacity, a value of one will only use up to half its capacity, two 1/4, etc.
					/// 
					/// Default value: 2
					public func getMaxChannelSaturationPowerOfHalf() -> UInt8 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKPaymentParameters>) in
				PaymentParameters_get_max_channel_saturation_power_of_half(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Selects the maximum share of a channel's total capacity which will be sent over a channel,
					/// as a power of 1/2. A higher value prefers to send the payment using more MPP parts whereas
					/// a lower value prefers to send larger MPP parts, potentially saturating channels and
					/// increasing failure probability for those paths.
					/// 
					/// Note that this restriction will be relaxed during pathfinding after paths which meet this
					/// restriction have been found. While paths which meet this criteria will be searched for, it
					/// is ultimately up to the scorer to select them over other paths.
					/// 
					/// A value of 0 will allow payments up to and including a channel's total announced usable
					/// capacity, a value of one will only use up to half its capacity, two 1/4, etc.
					/// 
					/// Default value: 2
					public func setMaxChannelSaturationPowerOfHalf(val: UInt8) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKPaymentParameters>) in
				PaymentParameters_set_max_channel_saturation_power_of_half(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// A list of SCIDs which this payment was previously attempted over and which caused the
					/// payment to fail. Future attempts for the same payment shouldn't be relayed through any of
					/// these SCIDs.
					/// 
					/// Returns a copy of the field.
					public func getPreviouslyFailedChannels() -> [UInt64] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKPaymentParameters>) in
				PaymentParameters_get_previously_failed_channels(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u64Z(cType: nativeCallResult, instantiationContext: "PaymentParameters.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// A list of SCIDs which this payment was previously attempted over and which caused the
					/// payment to fail. Future attempts for the same payment shouldn't be relayed through any of
					/// these SCIDs.
					public func setPreviouslyFailedChannels(val: [UInt64]) {
						// native call variable prep
						
						let valVector = Vec_u64Z(array: val, instantiationContext: "PaymentParameters.swift::\(#function):\(#line)").dangle()
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKPaymentParameters>) in
				PaymentParameters_set_previously_failed_channels(thisPtrPointer, valVector.cType!)
						}
				

						// cleanup
						
						// valVector.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The minimum CLTV delta at the end of the route. This value must not be zero.
					public func getFinalCltvExpiryDelta() -> UInt32 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKPaymentParameters>) in
				PaymentParameters_get_final_cltv_expiry_delta(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The minimum CLTV delta at the end of the route. This value must not be zero.
					public func setFinalCltvExpiryDelta(val: UInt32) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKPaymentParameters>) in
				PaymentParameters_set_final_cltv_expiry_delta(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new PaymentParameters given each field
					public init(payeePubkeyArg: [UInt8], featuresArg: InvoiceFeatures, routeHintsArg: [RouteHint], expiryTimeArg: UInt64?, maxTotalCltvExpiryDeltaArg: UInt32, maxPathCountArg: UInt8, maxChannelSaturationPowerOfHalfArg: UInt8, previouslyFailedChannelsArg: [UInt64], finalCltvExpiryDeltaArg: UInt32) {
						// native call variable prep
						
						let payeePubkeyArgPrimitiveWrapper = PublicKey(value: payeePubkeyArg, instantiationContext: "PaymentParameters.swift::\(#function):\(#line)")
				
						let routeHintsArgVector = Vec_RouteHintZ(array: routeHintsArg, instantiationContext: "PaymentParameters.swift::\(#function):\(#line)").dangle()
				
						let expiryTimeArgOption = Option_u64Z(some: expiryTimeArg, instantiationContext: "PaymentParameters.swift::\(#function):\(#line)").danglingClone()
				
						let previouslyFailedChannelsArgVector = Vec_u64Z(array: previouslyFailedChannelsArg, instantiationContext: "PaymentParameters.swift::\(#function):\(#line)").dangle()
				

						// native method call
						let nativeCallResult = PaymentParameters_new(payeePubkeyArgPrimitiveWrapper.cType!, featuresArg.dynamicallyDangledClone().cType!, routeHintsArgVector.cType!, expiryTimeArgOption.cType!, maxTotalCltvExpiryDeltaArg, maxPathCountArg, maxChannelSaturationPowerOfHalfArg, previouslyFailedChannelsArgVector.cType!, finalCltvExpiryDeltaArg)

						// cleanup
						
						// for elided types, we need this
						payeePubkeyArgPrimitiveWrapper.noOpRetain()
				
						// routeHintsArgVector.noOpRetain()
				
						// previouslyFailedChannelsArgVector.noOpRetain()
				
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = PaymentParameters(cType: nativeCallResult, instantiationContext: "PaymentParameters.swift::\(#function):\(#line)")
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0, instantiationContext: "PaymentParameters.swift::\(#function):\(#line)")
				
			
					}
		
					/// Creates a copy of the PaymentParameters
					internal func clone() -> PaymentParameters {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKPaymentParameters>) in
				PaymentParameters_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = PaymentParameters(cType: nativeCallResult, instantiationContext: "PaymentParameters.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Checks if two PaymentParameterss contain equal inner contents.
					public func hash() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKPaymentParameters>) in
				PaymentParameters_hash(oPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if two PaymentParameterss contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public class func eq(a: PaymentParameters, b: PaymentParameters) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKPaymentParameters>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKPaymentParameters>) in
				PaymentParameters_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Serialize the PaymentParameters object into a byte array which can be read by PaymentParameters_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKPaymentParameters>) in
				PaymentParameters_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, instantiationContext: "PaymentParameters.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a PaymentParameters from a byte array, created by PaymentParameters_write
					public class func read(ser: [UInt8], arg: UInt32) -> Result_PaymentParametersDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser, instantiationContext: "PaymentParameters.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = PaymentParameters_read(serPrimitiveWrapper.cType!, arg)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_PaymentParametersDecodeErrorZ(cType: nativeCallResult, instantiationContext: "PaymentParameters.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Creates a payee with the node id of the given `pubkey`.
					/// 
					/// The `final_cltv_expiry_delta` should match the expected final CLTV delta the recipient has
					/// provided.
					public class func initWithNodeId(payeePubkey: [UInt8], finalCltvExpiryDelta: UInt32) -> PaymentParameters {
						// native call variable prep
						
						let payeePubkeyPrimitiveWrapper = PublicKey(value: payeePubkey, instantiationContext: "PaymentParameters.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = PaymentParameters_from_node_id(payeePubkeyPrimitiveWrapper.cType!, finalCltvExpiryDelta)

						// cleanup
						
						// for elided types, we need this
						payeePubkeyPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = PaymentParameters(cType: nativeCallResult, instantiationContext: "PaymentParameters.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Creates a payee with the node id of the given `pubkey` to use for keysend payments.
					/// 
					/// The `final_cltv_expiry_delta` should match the expected final CLTV delta the recipient has
					/// provided.
					public class func initForKeysend(payeePubkey: [UInt8], finalCltvExpiryDelta: UInt32) -> PaymentParameters {
						// native call variable prep
						
						let payeePubkeyPrimitiveWrapper = PublicKey(value: payeePubkey, instantiationContext: "PaymentParameters.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = PaymentParameters_for_keysend(payeePubkeyPrimitiveWrapper.cType!, finalCltvExpiryDelta)

						// cleanup
						
						// for elided types, we need this
						payeePubkeyPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = PaymentParameters(cType: nativeCallResult, instantiationContext: "PaymentParameters.swift::\(#function):\(#line)")
						

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> PaymentParameters {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> PaymentParameters {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> PaymentParameters {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> PaymentParameters {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> PaymentParameters {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing PaymentParameters \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing PaymentParameters \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

				}

				
			}
		
		