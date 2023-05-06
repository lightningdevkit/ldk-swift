
				
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
					/// Note that for spontaneous payments most lightning nodes do not currently support MPP
					/// receives, thus you should generally never be providing a secret here for spontaneous
					/// payments.
					/// 
					/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func getPaymentSecret() -> [UInt8]? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKRecipientOnionFields>) in
				RecipientOnionFields_get_payment_secret(thisPtrPointer)
						}
				

						// cleanup
						
				// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
				// Type group: RustPrimitiveWrapper
				// Type: LDKThirtyTwoBytes
			
						if nativeCallResult.data == Bindings.arrayToUInt8Tuple32(array: [UInt8](repeating: 0, count: 32)) {
							return nil
            			}
					

						
						// return value (do some wrapping)
						let returnValue = ThirtyTwoBytes(cType: nativeCallResult, instantiationContext: "RecipientOnionFields.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

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
					/// Note that for spontaneous payments most lightning nodes do not currently support MPP
					/// receives, thus you should generally never be providing a secret here for spontaneous
					/// payments.
					/// 
					/// Note that val (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func setPaymentSecret(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = ThirtyTwoBytes(value: val, instantiationContext: "RecipientOnionFields.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKRecipientOnionFields>) in
				RecipientOnionFields_set_payment_secret(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
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
		
					/// Constructs a new RecipientOnionFields given each field
					public init(paymentSecretArg: [UInt8], paymentMetadataArg: [UInt8]?) {
						// native call variable prep
						
						let paymentSecretArgPrimitiveWrapper = ThirtyTwoBytes(value: paymentSecretArg, instantiationContext: "RecipientOnionFields.swift::\(#function):\(#line)")
				
						let paymentMetadataArgOption = Option_CVec_u8ZZ(some: paymentMetadataArg, instantiationContext: "RecipientOnionFields.swift::\(#function):\(#line)").danglingClone()
				

						// native method call
						let nativeCallResult = RecipientOnionFields_new(paymentSecretArgPrimitiveWrapper.cType!, paymentMetadataArgOption.cType!)

						// cleanup
						
						// for elided types, we need this
						paymentSecretArgPrimitiveWrapper.noOpRetain()
				
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = RecipientOnionFields(cType: nativeCallResult, instantiationContext: "RecipientOnionFields.swift::\(#function):\(#line)")
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0, instantiationContext: "RecipientOnionFields.swift::\(#function):\(#line)")
				
			
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
					/// payable HTLCs except for spontaneous payments, i.e. this should generally only be used for
					/// calls to [`ChannelManager::send_spontaneous_payment`].
					/// 
					/// [`ChannelManager::send_spontaneous_payment`]: super::channelmanager::ChannelManager::send_spontaneous_payment
					public class func initWithSpontaneousEmpty() -> RecipientOnionFields {
						// native call variable prep
						

						// native method call
						let nativeCallResult = RecipientOnionFields_spontaneous_empty()

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = RecipientOnionFields(cType: nativeCallResult, instantiationContext: "RecipientOnionFields.swift::\(#function):\(#line)")
						

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> RecipientOnionFields {
						self.dangling = shouldDangle
						return self
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
		
		