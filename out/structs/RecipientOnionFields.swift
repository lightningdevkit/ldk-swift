
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Information which is provided, encrypted, to the payment recipient when sending HTLCs.
			/// 
			/// This should generally be constructed with data communicated to us from the recipient (via a
			/// BOLT11 or BOLT12 invoice).
			public typealias RecipientOnionFields = Bindings.RecipientOnionFields

			extension Bindings {
		

				/// Information which is provided, encrypted, to the payment recipient when sending HTLCs.
				/// 
				/// This should generally be constructed with data communicated to us from the recipient (via a
				/// BOLT11 or BOLT12 invoice).
				public class RecipientOnionFields: NativeTypeWrapper {

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

					internal var cType: LDKRecipientOnionFields?

					internal init(cType: LDKRecipientOnionFields, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKRecipientOnionFields, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKRecipientOnionFields, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the RecipientOnionFields, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = RecipientOnionFields_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The [`PaymentSecret`] is an arbitrary 32 bytes provided by the recipient for us to repeat
					/// in the onion. It is unrelated to `payment_hash` (or [`PaymentPreimage`]) and exists to
					/// authenticate the sender to the recipient and prevent payment-probing (deanonymization)
					/// attacks.
					/// 
					/// If you do not have one, the [`Route`] you pay over must not contain multiple paths as
					/// multi-path payments require a recipient-provided secret.
					/// 
					/// Some implementations may reject spontaneous payments with payment secrets, so you may only
					/// want to provide a secret for a spontaneous payment if MPP is needed and you know your
					/// recipient will not reject it.
					public func getPaymentSecret() -> [UInt8]? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKRecipientOnionFields>) in
				RecipientOnionFields_get_payment_secret(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Option_ThirtyTwoBytesZ(cType: nativeCallResult, instantiationContext: "RecipientOnionFields.swift::\(#function):\(#line)", anchor: self).getValue()
						

						return returnValue
					}
		
					/// The [`PaymentSecret`] is an arbitrary 32 bytes provided by the recipient for us to repeat
					/// in the onion. It is unrelated to `payment_hash` (or [`PaymentPreimage`]) and exists to
					/// authenticate the sender to the recipient and prevent payment-probing (deanonymization)
					/// attacks.
					/// 
					/// If you do not have one, the [`Route`] you pay over must not contain multiple paths as
					/// multi-path payments require a recipient-provided secret.
					/// 
					/// Some implementations may reject spontaneous payments with payment secrets, so you may only
					/// want to provide a secret for a spontaneous payment if MPP is needed and you know your
					/// recipient will not reject it.
					public func setPaymentSecret(val: [UInt8]?) {
						// native call variable prep
						
						let valOption = Option_ThirtyTwoBytesZ(some: val, instantiationContext: "RecipientOnionFields.swift::\(#function):\(#line)").danglingClone()
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKRecipientOnionFields>) in
				RecipientOnionFields_set_payment_secret(thisPtrPointer, valOption.cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The payment metadata serves a similar purpose as [`Self::payment_secret`] but is of
					/// arbitrary length. This gives recipients substantially more flexibility to receive
					/// additional data.
					/// 
					/// In LDK, while the [`Self::payment_secret`] is fixed based on an internal authentication
					/// scheme to authenticate received payments against expected payments and invoices, this field
					/// is not used in LDK for received payments, and can be used to store arbitrary data in
					/// invoices which will be received with the payment.
					/// 
					/// Note that this field was added to the lightning specification more recently than
					/// [`Self::payment_secret`] and while nearly all lightning senders support secrets, metadata
					/// may not be supported as universally.
					/// 
					/// Returns a copy of the field.
					public func getPaymentMetadata() -> [UInt8]? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKRecipientOnionFields>) in
				RecipientOnionFields_get_payment_metadata(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Option_CVec_u8ZZ(cType: nativeCallResult, instantiationContext: "RecipientOnionFields.swift::\(#function):\(#line)", anchor: self).getValue()
						

						return returnValue
					}
		
					/// The payment metadata serves a similar purpose as [`Self::payment_secret`] but is of
					/// arbitrary length. This gives recipients substantially more flexibility to receive
					/// additional data.
					/// 
					/// In LDK, while the [`Self::payment_secret`] is fixed based on an internal authentication
					/// scheme to authenticate received payments against expected payments and invoices, this field
					/// is not used in LDK for received payments, and can be used to store arbitrary data in
					/// invoices which will be received with the payment.
					/// 
					/// Note that this field was added to the lightning specification more recently than
					/// [`Self::payment_secret`] and while nearly all lightning senders support secrets, metadata
					/// may not be supported as universally.
					public func setPaymentMetadata(val: [UInt8]?) {
						// native call variable prep
						
						let valOption = Option_CVec_u8ZZ(some: val, instantiationContext: "RecipientOnionFields.swift::\(#function):\(#line)").danglingClone()
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKRecipientOnionFields>) in
				RecipientOnionFields_set_payment_metadata(thisPtrPointer, valOption.cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the RecipientOnionFields
					internal func clone() -> RecipientOnionFields {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKRecipientOnionFields>) in
				RecipientOnionFields_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = RecipientOnionFields(cType: nativeCallResult, instantiationContext: "RecipientOnionFields.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Checks if two RecipientOnionFieldss contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public class func eq(a: RecipientOnionFields, b: RecipientOnionFields) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKRecipientOnionFields>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKRecipientOnionFields>) in
				RecipientOnionFields_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Serialize the RecipientOnionFields object into a byte array which can be read by RecipientOnionFields_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKRecipientOnionFields>) in
				RecipientOnionFields_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, instantiationContext: "RecipientOnionFields.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a RecipientOnionFields from a byte array, created by RecipientOnionFields_write
					public class func read(ser: [UInt8]) -> Result_RecipientOnionFieldsDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser, instantiationContext: "RecipientOnionFields.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = RecipientOnionFields_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_RecipientOnionFieldsDecodeErrorZ(cType: nativeCallResult, instantiationContext: "RecipientOnionFields.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Creates a [`RecipientOnionFields`] from only a [`PaymentSecret`]. This is the most common
					/// set of onion fields for today's BOLT11 invoices - most nodes require a [`PaymentSecret`]
					/// but do not require or provide any further data.
					public class func initWithSecretOnly(paymentSecret: [UInt8]) -> RecipientOnionFields {
						// native call variable prep
						
						let paymentSecretPrimitiveWrapper = ThirtyTwoBytes(value: paymentSecret, instantiationContext: "RecipientOnionFields.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = RecipientOnionFields_secret_only(paymentSecretPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						paymentSecretPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = RecipientOnionFields(cType: nativeCallResult, instantiationContext: "RecipientOnionFields.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Creates a new [`RecipientOnionFields`] with no fields. This generally does not create
					/// payable HTLCs except for single-path spontaneous payments, i.e. this should generally
					/// only be used for calls to [`ChannelManager::send_spontaneous_payment`]. If you are sending
					/// a spontaneous MPP this will not work as all MPP require payment secrets; you may
					/// instead want to use [`RecipientOnionFields::secret_only`].
					/// 
					/// [`ChannelManager::send_spontaneous_payment`]: super::channelmanager::ChannelManager::send_spontaneous_payment
					/// [`RecipientOnionFields::secret_only`]: RecipientOnionFields::secret_only
					public class func initWithSpontaneousEmpty() -> RecipientOnionFields {
						// native call variable prep
						

						// native method call
						let nativeCallResult = RecipientOnionFields_spontaneous_empty()

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = RecipientOnionFields(cType: nativeCallResult, instantiationContext: "RecipientOnionFields.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Creates a new [`RecipientOnionFields`] from an existing one, adding custom TLVs. Each
					/// TLV is provided as a `(u64, Vec<u8>)` for the type number and serialized value
					/// respectively. TLV type numbers must be unique and within the range
					/// reserved for custom types, i.e. >= 2^16, otherwise this method will return `Err(())`.
					/// 
					/// This method will also error for types in the experimental range which have been
					/// standardized within the protocol, which only includes 5482373484 (keysend) for now.
					/// 
					/// See [`Self::custom_tlvs`] for more info.
					public func withCustomTlvs(customTlvs: [(UInt64, [UInt8])]) -> Result_RecipientOnionFieldsNoneZ {
						// native call variable prep
						
						let customTlvsVector = Vec_C2Tuple_u64CVec_u8ZZZ(array: customTlvs, instantiationContext: "RecipientOnionFields.swift::\(#function):\(#line)").dangle()
				

						// native method call
						let nativeCallResult = RecipientOnionFields_with_custom_tlvs(self.dynamicallyDangledClone().cType!, customTlvsVector.cType!)

						// cleanup
						
						// customTlvsVector.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_RecipientOnionFieldsNoneZ(cType: nativeCallResult, instantiationContext: "RecipientOnionFields.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Gets the custom TLVs that will be sent or have been received.
					/// 
					/// Custom TLVs allow sending extra application-specific data with a payment. They provide
					/// additional flexibility on top of payment metadata, as while other implementations may
					/// require `payment_metadata` to reflect metadata provided in an invoice, custom TLVs
					/// do not have this restriction.
					/// 
					/// Note that if this field is non-empty, it will contain strictly increasing TLVs, each
					/// represented by a `(u64, Vec<u8>)` for its type number and serialized value respectively.
					/// This is validated when setting this field using [`Self::with_custom_tlvs`].
					public func customTlvs() -> [(UInt64, [UInt8])] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRecipientOnionFields>) in
				RecipientOnionFields_custom_tlvs(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_C2Tuple_u64CVec_u8ZZZ(cType: nativeCallResult, instantiationContext: "RecipientOnionFields.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

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
		

					
					internal func danglingClone() -> RecipientOnionFields {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> RecipientOnionFields {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> RecipientOnionFields {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> RecipientOnionFields {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing RecipientOnionFields \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing RecipientOnionFields \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

				}

				
			}
		
		