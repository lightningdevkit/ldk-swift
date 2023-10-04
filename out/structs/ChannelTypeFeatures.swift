
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Features used within the channel_type field in an OpenChannel message.
			/// 
			/// A channel is always of some known \"type\", describing the transaction formats used and the exact
			/// semantics of our interaction with our peer.
			/// 
			/// Note that because a channel is a specific type which is proposed by the opener and accepted by
			/// the counterparty, only required features are allowed here.
			/// 
			/// This is serialized differently from other feature types - it is not prefixed by a length, and
			/// thus must only appear inside a TLV where its length is known in advance.
			public typealias ChannelTypeFeatures = Bindings.ChannelTypeFeatures

			extension Bindings {
		

				/// Features used within the channel_type field in an OpenChannel message.
				/// 
				/// A channel is always of some known \"type\", describing the transaction formats used and the exact
				/// semantics of our interaction with our peer.
				/// 
				/// Note that because a channel is a specific type which is proposed by the opener and accepted by
				/// the counterparty, only required features are allowed here.
				/// 
				/// This is serialized differently from other feature types - it is not prefixed by a length, and
				/// thus must only appear inside a TLV where its length is known in advance.
				public class ChannelTypeFeatures: NativeTypeWrapper {

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

					internal var cType: LDKChannelTypeFeatures?

					internal init(cType: LDKChannelTypeFeatures, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKChannelTypeFeatures, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKChannelTypeFeatures, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Checks if two ChannelTypeFeaturess contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public class func eq(a: ChannelTypeFeatures, b: ChannelTypeFeatures) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKChannelTypeFeatures>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKChannelTypeFeatures>) in
				ChannelTypeFeatures_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the ChannelTypeFeatures
					internal func clone() -> ChannelTypeFeatures {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKChannelTypeFeatures>) in
				ChannelTypeFeatures_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ChannelTypeFeatures(cType: nativeCallResult, instantiationContext: "ChannelTypeFeatures.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Frees any resources used by the ChannelTypeFeatures, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ChannelTypeFeatures_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Create a blank Features with no features set
					public class func initWithEmpty() -> ChannelTypeFeatures {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ChannelTypeFeatures_empty()

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ChannelTypeFeatures(cType: nativeCallResult, instantiationContext: "ChannelTypeFeatures.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Returns true if this `Features` object contains required features unknown by `other`.
					public func requiresUnknownBitsFrom() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelTypeFeatures>) in
				
						withUnsafePointer(to: self.cType!) { (otherPointer: UnsafePointer<LDKChannelTypeFeatures>) in
				ChannelTypeFeatures_requires_unknown_bits_from(thisArgPointer, otherPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Returns true if this `Features` object contains unknown feature flags which are set as
					/// \"required\".
					public func requiresUnknownBits() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelTypeFeatures>) in
				ChannelTypeFeatures_requires_unknown_bits(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Sets a required feature bit. Errors if `bit` is outside the feature range as defined
					/// by [BOLT 9].
					/// 
					/// Note: Required bits are even. If an odd bit is given, then the corresponding even bit will
					/// be set instead (i.e., `bit - 1`).
					/// 
					/// [BOLT 9]: https://github.com/lightning/bolts/blob/master/09-features.md
					public func setRequiredFeatureBit(bit: UInt) -> Result_NoneNoneZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKChannelTypeFeatures>) in
				ChannelTypeFeatures_set_required_feature_bit(thisArgPointer, bit)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_NoneNoneZ(cType: nativeCallResult, instantiationContext: "ChannelTypeFeatures.swift::\(#function):\(#line)", anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// Sets an optional feature bit. Errors if `bit` is outside the feature range as defined
					/// by [BOLT 9].
					/// 
					/// Note: Optional bits are odd. If an even bit is given, then the corresponding odd bit will be
					/// set instead (i.e., `bit + 1`).
					/// 
					/// [BOLT 9]: https://github.com/lightning/bolts/blob/master/09-features.md
					public func setOptionalFeatureBit(bit: UInt) -> Result_NoneNoneZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKChannelTypeFeatures>) in
				ChannelTypeFeatures_set_optional_feature_bit(thisArgPointer, bit)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_NoneNoneZ(cType: nativeCallResult, instantiationContext: "ChannelTypeFeatures.swift::\(#function):\(#line)", anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// Sets a required custom feature bit. Errors if `bit` is outside the custom range as defined
					/// by [bLIP 2] or if it is a known `T` feature.
					/// 
					/// Note: Required bits are even. If an odd bit is given, then the corresponding even bit will
					/// be set instead (i.e., `bit - 1`).
					/// 
					/// [bLIP 2]: https://github.com/lightning/blips/blob/master/blip-0002.md#feature-bits
					public func setRequiredCustomBit(bit: UInt) -> Result_NoneNoneZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKChannelTypeFeatures>) in
				ChannelTypeFeatures_set_required_custom_bit(thisArgPointer, bit)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_NoneNoneZ(cType: nativeCallResult, instantiationContext: "ChannelTypeFeatures.swift::\(#function):\(#line)", anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// Sets an optional custom feature bit. Errors if `bit` is outside the custom range as defined
					/// by [bLIP 2] or if it is a known `T` feature.
					/// 
					/// Note: Optional bits are odd. If an even bit is given, then the corresponding odd bit will be
					/// set instead (i.e., `bit + 1`).
					/// 
					/// [bLIP 2]: https://github.com/lightning/blips/blob/master/blip-0002.md#feature-bits
					public func setOptionalCustomBit(bit: UInt) -> Result_NoneNoneZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKChannelTypeFeatures>) in
				ChannelTypeFeatures_set_optional_custom_bit(thisArgPointer, bit)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_NoneNoneZ(cType: nativeCallResult, instantiationContext: "ChannelTypeFeatures.swift::\(#function):\(#line)", anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// Serialize the ChannelTypeFeatures object into a byte array which can be read by ChannelTypeFeatures_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKChannelTypeFeatures>) in
				ChannelTypeFeatures_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, instantiationContext: "ChannelTypeFeatures.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a ChannelTypeFeatures from a byte array, created by ChannelTypeFeatures_write
					public class func read(ser: [UInt8]) -> Result_ChannelTypeFeaturesDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser, instantiationContext: "ChannelTypeFeatures.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = ChannelTypeFeatures_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_ChannelTypeFeaturesDecodeErrorZ(cType: nativeCallResult, instantiationContext: "ChannelTypeFeatures.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Set this feature as optional.
					public func setStaticRemoteKeyOptional() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKChannelTypeFeatures>) in
				ChannelTypeFeatures_set_static_remote_key_optional(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Set this feature as required.
					public func setStaticRemoteKeyRequired() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKChannelTypeFeatures>) in
				ChannelTypeFeatures_set_static_remote_key_required(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if this feature is supported.
					public func supportsStaticRemoteKey() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelTypeFeatures>) in
				ChannelTypeFeatures_supports_static_remote_key(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if this feature is required.
					public func requiresStaticRemoteKey() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelTypeFeatures>) in
				ChannelTypeFeatures_requires_static_remote_key(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Set this feature as optional.
					public func setAnchorsNonzeroFeeHtlcTxOptional() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKChannelTypeFeatures>) in
				ChannelTypeFeatures_set_anchors_nonzero_fee_htlc_tx_optional(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Set this feature as required.
					public func setAnchorsNonzeroFeeHtlcTxRequired() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKChannelTypeFeatures>) in
				ChannelTypeFeatures_set_anchors_nonzero_fee_htlc_tx_required(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if this feature is supported.
					public func supportsAnchorsNonzeroFeeHtlcTx() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelTypeFeatures>) in
				ChannelTypeFeatures_supports_anchors_nonzero_fee_htlc_tx(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if this feature is required.
					public func requiresAnchorsNonzeroFeeHtlcTx() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelTypeFeatures>) in
				ChannelTypeFeatures_requires_anchors_nonzero_fee_htlc_tx(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Set this feature as optional.
					public func setAnchorsZeroFeeHtlcTxOptional() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKChannelTypeFeatures>) in
				ChannelTypeFeatures_set_anchors_zero_fee_htlc_tx_optional(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Set this feature as required.
					public func setAnchorsZeroFeeHtlcTxRequired() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKChannelTypeFeatures>) in
				ChannelTypeFeatures_set_anchors_zero_fee_htlc_tx_required(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if this feature is supported.
					public func supportsAnchorsZeroFeeHtlcTx() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelTypeFeatures>) in
				ChannelTypeFeatures_supports_anchors_zero_fee_htlc_tx(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if this feature is required.
					public func requiresAnchorsZeroFeeHtlcTx() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelTypeFeatures>) in
				ChannelTypeFeatures_requires_anchors_zero_fee_htlc_tx(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Set this feature as optional.
					public func setTaprootOptional() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKChannelTypeFeatures>) in
				ChannelTypeFeatures_set_taproot_optional(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Set this feature as required.
					public func setTaprootRequired() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKChannelTypeFeatures>) in
				ChannelTypeFeatures_set_taproot_required(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if this feature is supported.
					public func supportsTaproot() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelTypeFeatures>) in
				ChannelTypeFeatures_supports_taproot(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if this feature is required.
					public func requiresTaproot() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelTypeFeatures>) in
				ChannelTypeFeatures_requires_taproot(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Set this feature as optional.
					public func setScidPrivacyOptional() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKChannelTypeFeatures>) in
				ChannelTypeFeatures_set_scid_privacy_optional(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Set this feature as required.
					public func setScidPrivacyRequired() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKChannelTypeFeatures>) in
				ChannelTypeFeatures_set_scid_privacy_required(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if this feature is supported.
					public func supportsScidPrivacy() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelTypeFeatures>) in
				ChannelTypeFeatures_supports_scid_privacy(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if this feature is required.
					public func requiresScidPrivacy() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelTypeFeatures>) in
				ChannelTypeFeatures_requires_scid_privacy(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Set this feature as optional.
					public func setZeroConfOptional() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKChannelTypeFeatures>) in
				ChannelTypeFeatures_set_zero_conf_optional(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Set this feature as required.
					public func setZeroConfRequired() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKChannelTypeFeatures>) in
				ChannelTypeFeatures_set_zero_conf_required(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if this feature is supported.
					public func supportsZeroConf() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelTypeFeatures>) in
				ChannelTypeFeatures_supports_zero_conf(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if this feature is required.
					public func requiresZeroConf() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKChannelTypeFeatures>) in
				ChannelTypeFeatures_requires_zero_conf(thisArgPointer)
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
		

					
					internal func danglingClone() -> ChannelTypeFeatures {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> ChannelTypeFeatures {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> ChannelTypeFeatures {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> ChannelTypeFeatures {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing ChannelTypeFeatures \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing ChannelTypeFeatures \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

				}

				
			}
		
		