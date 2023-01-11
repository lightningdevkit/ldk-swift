
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			// necessary for abort() calls
			import Foundation

			/// A trait to describe an object which can get user secrets and key material.
			public typealias KeysInterface = Bindings.KeysInterface

			extension Bindings {

				/// A trait to describe an object which can get user secrets and key material.
				open class KeysInterface: NativeTraitWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKKeysInterface?

					internal init(cType: LDKKeysInterface) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKKeysInterface, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init() {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						super.init(conflictAvoidingVariableName: 0)

						let thisArg = Bindings.instanceToPointer(instance: self)

						

						
						func getNodeSecretLambda(this_arg: UnsafeRawPointer?, recipient: LDKRecipient) -> LDKCResult_SecretKeyNoneZ {
							let instance: KeysInterface = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "KeysInterface::getNodeSecretLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.getNodeSecret(recipient: Recipient(value: recipient))

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func getNodeIdLambda(this_arg: UnsafeRawPointer?, recipient: LDKRecipient) -> LDKCResult_PublicKeyNoneZ {
							let instance: KeysInterface = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "KeysInterface::getNodeIdLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.getNodeId(recipient: Recipient(value: recipient))

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func ecdhLambda(this_arg: UnsafeRawPointer?, recipient: LDKRecipient, other_key: LDKPublicKey, tweak: LDKCOption_ScalarZ) -> LDKCResult_SharedSecretNoneZ {
							let instance: KeysInterface = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "KeysInterface::ecdhLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.ecdh(recipient: Recipient(value: recipient), otherKey: PublicKey(cType: other_key).getValue(), tweak: Option_ScalarZ(cType: tweak).getValue())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func getDestinationScriptLambda(this_arg: UnsafeRawPointer?) -> LDKCVec_u8Z {
							let instance: KeysInterface = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "KeysInterface::getDestinationScriptLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.getDestinationScript()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = Vec_u8Z(array: swiftCallbackResult).dangle().cType!

							return returnValue
						}
		
						func getShutdownScriptpubkeyLambda(this_arg: UnsafeRawPointer?) -> LDKShutdownScript {
							let instance: KeysInterface = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "KeysInterface::getShutdownScriptpubkeyLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.getShutdownScriptpubkey()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func generateChannelKeysIdLambda(this_arg: UnsafeRawPointer?, inbound: Bool, channel_value_satoshis: UInt64, user_channel_id: LDKU128) -> LDKThirtyTwoBytes {
							let instance: KeysInterface = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "KeysInterface::generateChannelKeysIdLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.generateChannelKeysId(inbound: inbound, channelValueSatoshis: channel_value_satoshis, userChannelId: U128(cType: user_channel_id).getValue())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = ThirtyTwoBytes(value: swiftCallbackResult).dangle().cType!

							return returnValue
						}
		
						func deriveChannelSignerLambda(this_arg: UnsafeRawPointer?, channel_value_satoshis: UInt64, channel_keys_id: LDKThirtyTwoBytes) -> LDKSign {
							let instance: KeysInterface = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "KeysInterface::deriveChannelSignerLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.deriveChannelSigner(channelValueSatoshis: channel_value_satoshis, channelKeysId: ThirtyTwoBytes(cType: channel_keys_id).getValue())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.activate().cType!

							return returnValue
						}
		
						func getSecureRandomBytesLambda(this_arg: UnsafeRawPointer?) -> LDKThirtyTwoBytes {
							let instance: KeysInterface = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "KeysInterface::getSecureRandomBytesLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.getSecureRandomBytes()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = ThirtyTwoBytes(value: swiftCallbackResult).dangle().cType!

							return returnValue
						}
		
						func readChanSignerLambda(this_arg: UnsafeRawPointer?, reader: LDKu8slice) -> LDKCResult_SignDecodeErrorZ {
							let instance: KeysInterface = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "KeysInterface::readChanSignerLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.readChanSigner(reader: u8slice(cType: reader).dangle().getValue())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func signInvoiceLambda(this_arg: UnsafeRawPointer?, hrp_bytes: LDKu8slice, invoice_data: LDKCVec_U5Z, receipient: LDKRecipient) -> LDKCResult_RecoverableSignatureNoneZ {
							let instance: KeysInterface = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "KeysInterface::signInvoiceLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.signInvoice(hrpBytes: u8slice(cType: hrp_bytes).dangle().getValue(), invoiceData: Vec_U5Z(cType: invoice_data).getValue(), receipient: Recipient(value: receipient))

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func getInboundPaymentKeyMaterialLambda(this_arg: UnsafeRawPointer?) -> LDKThirtyTwoBytes {
							let instance: KeysInterface = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "KeysInterface::getInboundPaymentKeyMaterialLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.getInboundPaymentKeyMaterial()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = ThirtyTwoBytes(value: swiftCallbackResult).dangle().cType!

							return returnValue
						}
		
						func freeLambda(this_arg: UnsafeMutableRawPointer?) -> Void {
							let instance: KeysInterface = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "KeysInterface::freeLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.free()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		

						self.cType = LDKKeysInterface(							
							this_arg: thisArg,
							get_node_secret: getNodeSecretLambda,
							get_node_id: getNodeIdLambda,
							ecdh: ecdhLambda,
							get_destination_script: getDestinationScriptLambda,
							get_shutdown_scriptpubkey: getShutdownScriptpubkeyLambda,
							generate_channel_keys_id: generateChannelKeysIdLambda,
							derive_channel_signer: deriveChannelSignerLambda,
							get_secure_random_bytes: getSecureRandomBytesLambda,
							read_chan_signer: readChanSignerLambda,
							sign_invoice: signInvoiceLambda,
							get_inbound_payment_key_material: getInboundPaymentKeyMaterialLambda,
							free: freeLambda
						)
					}

					
					/// Get node secret key based on the provided [`Recipient`].
					/// 
					/// The `node_id`/`network_key` is the public key that corresponds to this secret key.
					/// 
					/// This method must return the same value each time it is called with a given [`Recipient`]
					/// parameter.
					/// 
					/// Errors if the [`Recipient`] variant is not supported by the implementation.
					open func getNodeSecret(recipient: Recipient) -> Result_SecretKeyNoneZ {
						
						Bindings.print("Error: KeysInterface::getNodeSecret MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Get node id based on the provided [`Recipient`]. This public key corresponds to the secret in
					/// [`get_node_secret`].
					/// 
					/// This method must return the same value each time it is called with a given [`Recipient`]
					/// parameter.
					/// 
					/// Errors if the [`Recipient`] variant is not supported by the implementation.
					/// 
					/// [`get_node_secret`]: Self::get_node_secret
					open func getNodeId(recipient: Recipient) -> Result_PublicKeyNoneZ {
						
						Bindings.print("Error: KeysInterface::getNodeId MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Gets the ECDH shared secret of our [`node secret`] and `other_key`, multiplying by `tweak` if
					/// one is provided. Note that this tweak can be applied to `other_key` instead of our node
					/// secret, though this is less efficient.
					/// 
					/// Errors if the [`Recipient`] variant is not supported by the implementation.
					/// 
					/// [`node secret`]: Self::get_node_secret
					open func ecdh(recipient: Recipient, otherKey: [UInt8], tweak: [UInt8]?) -> Result_SharedSecretNoneZ {
						
						Bindings.print("Error: KeysInterface::ecdh MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Get a script pubkey which we send funds to when claiming on-chain contestable outputs.
					/// 
					/// This method should return a different value each time it is called, to avoid linking
					/// on-chain funds across channels as controlled to the same user.
					open func getDestinationScript() -> [UInt8] {
						
						Bindings.print("Error: KeysInterface::getDestinationScript MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Get a script pubkey which we will send funds to when closing a channel.
					/// 
					/// This method should return a different value each time it is called, to avoid linking
					/// on-chain funds across channels as controlled to the same user.
					open func getShutdownScriptpubkey() -> ShutdownScript {
						
						Bindings.print("Error: KeysInterface::getShutdownScriptpubkey MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Get a new set of [`Sign`] for per-channel secrets. These MUST be unique even if you
					/// restarted with some stale data!
					/// 
					/// This method must return a different value each time it is called.
					open func generateChannelKeysId(inbound: Bool, channelValueSatoshis: UInt64, userChannelId: [UInt8]) -> [UInt8] {
						
						Bindings.print("Error: KeysInterface::generateChannelKeysId MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Derives the private key material backing a `Signer`.
					/// 
					/// To derive a new `Signer`, a fresh `channel_keys_id` should be obtained through
					/// [`KeysInterface::generate_channel_keys_id`]. Otherwise, an existing `Signer` can be
					/// re-derived from its `channel_keys_id`, which can be obtained through its trait method
					/// [`BaseSign::channel_keys_id`].
					open func deriveChannelSigner(channelValueSatoshis: UInt64, channelKeysId: [UInt8]) -> Sign {
						
						Bindings.print("Error: KeysInterface::deriveChannelSigner MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Gets a unique, cryptographically-secure, random 32 byte value. This is used for encrypting
					/// onion packets and for temporary channel IDs. There is no requirement that these be
					/// persisted anywhere, though they must be unique across restarts.
					/// 
					/// This method must return a different value each time it is called.
					open func getSecureRandomBytes() -> [UInt8] {
						
						Bindings.print("Error: KeysInterface::getSecureRandomBytes MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Reads a [`Signer`] for this [`KeysInterface`] from the given input stream.
					/// This is only called during deserialization of other objects which contain
					/// [`Sign`]-implementing objects (i.e., [`ChannelMonitor`]s and [`ChannelManager`]s).
					/// The bytes are exactly those which `<Self::Signer as Writeable>::write()` writes, and
					/// contain no versioning scheme. You may wish to include your own version prefix and ensure
					/// you've read all of the provided bytes to ensure no corruption occurred.
					/// 
					/// This method is slowly being phased out -- it will only be called when reading objects
					/// written by LDK versions prior to 0.0.113.
					/// 
					/// [`Signer`]: Self::Signer
					/// [`ChannelMonitor`]: crate::chain::channelmonitor::ChannelMonitor
					/// [`ChannelManager`]: crate::ln::channelmanager::ChannelManager
					open func readChanSigner(reader: [UInt8]) -> Result_SignDecodeErrorZ {
						
						Bindings.print("Error: KeysInterface::readChanSigner MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Sign an invoice.
					/// By parameterizing by the raw invoice bytes instead of the hash, we allow implementors of
					/// this trait to parse the invoice and make sure they're signing what they expect, rather than
					/// blindly signing the hash.
					/// The `hrp` is ASCII bytes, while the invoice data is base32-encoded.
					/// 
					/// The secret key used to sign the invoice is dependent on the [`Recipient`].
					/// 
					/// Errors if the [`Recipient`] variant is not supported by the implementation.
					open func signInvoice(hrpBytes: [UInt8], invoiceData: [UInt8], receipient: Recipient) -> Result_RecoverableSignatureNoneZ {
						
						Bindings.print("Error: KeysInterface::signInvoice MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Get secret key material as bytes for use in encrypting and decrypting inbound payment data.
					/// 
					/// If the implementor of this trait supports [phantom node payments], then every node that is
					/// intended to be included in the phantom invoice route hints must return the same value from
					/// this method.
					/// 
					/// This method must return the same value each time it is called.
					/// 
					/// [phantom node payments]: PhantomKeysManager
					open func getInboundPaymentKeyMaterial() -> [UInt8] {
						
						Bindings.print("Error: KeysInterface::getInboundPaymentKeyMaterial MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
					internal func free() -> Void {
						
				// TODO: figure out something smarter
				return; // the semicolon is necessary because Swift is whitespace-agnostic
			
						Bindings.print("Error: KeysInterface::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		

					

					

					internal func dangle(_ shouldDangle: Bool = true) -> KeysInterface {
        				self.dangling = shouldDangle
						return self
					}

					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing KeysInterface \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing KeysInterface \(self.instanceNumber) due to dangle.")
						}
					}
				}

				internal class NativelyImplementedKeysInterface: KeysInterface {
					
					/// Get node secret key based on the provided [`Recipient`].
					/// 
					/// The `node_id`/`network_key` is the public key that corresponds to this secret key.
					/// 
					/// This method must return the same value each time it is called with a given [`Recipient`]
					/// parameter.
					/// 
					/// Errors if the [`Recipient`] variant is not supported by the implementation.
					public override func getNodeSecret(recipient: Recipient) -> Result_SecretKeyNoneZ {
						// native call variable prep
						

						

						// native method call
						let nativeCallResult = self.cType!.get_node_secret(self.cType!.this_arg, recipient.getCValue())

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_SecretKeyNoneZ(cType: nativeCallResult)

						return returnValue
					}
		
					/// Get node id based on the provided [`Recipient`]. This public key corresponds to the secret in
					/// [`get_node_secret`].
					/// 
					/// This method must return the same value each time it is called with a given [`Recipient`]
					/// parameter.
					/// 
					/// Errors if the [`Recipient`] variant is not supported by the implementation.
					/// 
					/// [`get_node_secret`]: Self::get_node_secret
					public override func getNodeId(recipient: Recipient) -> Result_PublicKeyNoneZ {
						// native call variable prep
						

						

						// native method call
						let nativeCallResult = self.cType!.get_node_id(self.cType!.this_arg, recipient.getCValue())

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_PublicKeyNoneZ(cType: nativeCallResult)

						return returnValue
					}
		
					/// Gets the ECDH shared secret of our [`node secret`] and `other_key`, multiplying by `tweak` if
					/// one is provided. Note that this tweak can be applied to `other_key` instead of our node
					/// secret, though this is less efficient.
					/// 
					/// Errors if the [`Recipient`] variant is not supported by the implementation.
					/// 
					/// [`node secret`]: Self::get_node_secret
					public override func ecdh(recipient: Recipient, otherKey: [UInt8], tweak: [UInt8]?) -> Result_SharedSecretNoneZ {
						// native call variable prep
						
						let otherKeyPrimitiveWrapper = PublicKey(value: otherKey)
				
						let tweakOption = Option_ScalarZ(some: tweak).dangle()
				

						

						// native method call
						let nativeCallResult = self.cType!.ecdh(self.cType!.this_arg, recipient.getCValue(), otherKeyPrimitiveWrapper.cType!, tweakOption.cType!)

						// cleanup
						
						// for elided types, we need this
						otherKeyPrimitiveWrapper.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = Result_SharedSecretNoneZ(cType: nativeCallResult)

						return returnValue
					}
		
					/// Get a script pubkey which we send funds to when claiming on-chain contestable outputs.
					/// 
					/// This method should return a different value each time it is called, to avoid linking
					/// on-chain funds across channels as controlled to the same user.
					public override func getDestinationScript() -> [UInt8] {
						// native call variable prep
						

						

						// native method call
						let nativeCallResult = self.cType!.get_destination_script(self.cType!.this_arg)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// Get a script pubkey which we will send funds to when closing a channel.
					/// 
					/// This method should return a different value each time it is called, to avoid linking
					/// on-chain funds across channels as controlled to the same user.
					public override func getShutdownScriptpubkey() -> ShutdownScript {
						// native call variable prep
						

						

						// native method call
						let nativeCallResult = self.cType!.get_shutdown_scriptpubkey(self.cType!.this_arg)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = ShutdownScript(cType: nativeCallResult)

						return returnValue
					}
		
					/// Get a new set of [`Sign`] for per-channel secrets. These MUST be unique even if you
					/// restarted with some stale data!
					/// 
					/// This method must return a different value each time it is called.
					public override func generateChannelKeysId(inbound: Bool, channelValueSatoshis: UInt64, userChannelId: [UInt8]) -> [UInt8] {
						// native call variable prep
						
						let userChannelIdPrimitiveWrapper = U128(value: userChannelId)
				

						

						// native method call
						let nativeCallResult = self.cType!.generate_channel_keys_id(self.cType!.this_arg, inbound, channelValueSatoshis, userChannelIdPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						userChannelIdPrimitiveWrapper.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = ThirtyTwoBytes(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// Derives the private key material backing a `Signer`.
					/// 
					/// To derive a new `Signer`, a fresh `channel_keys_id` should be obtained through
					/// [`KeysInterface::generate_channel_keys_id`]. Otherwise, an existing `Signer` can be
					/// re-derived from its `channel_keys_id`, which can be obtained through its trait method
					/// [`BaseSign::channel_keys_id`].
					public override func deriveChannelSigner(channelValueSatoshis: UInt64, channelKeysId: [UInt8]) -> Sign {
						// native call variable prep
						
						let channelKeysIdPrimitiveWrapper = ThirtyTwoBytes(value: channelKeysId)
				

						

						// native method call
						let nativeCallResult = self.cType!.derive_channel_signer(self.cType!.this_arg, channelValueSatoshis, channelKeysIdPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						channelKeysIdPrimitiveWrapper.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = NativelyImplementedSign(cType: nativeCallResult, anchor: self)

						return returnValue
					}
		
					/// Gets a unique, cryptographically-secure, random 32 byte value. This is used for encrypting
					/// onion packets and for temporary channel IDs. There is no requirement that these be
					/// persisted anywhere, though they must be unique across restarts.
					/// 
					/// This method must return a different value each time it is called.
					public override func getSecureRandomBytes() -> [UInt8] {
						// native call variable prep
						

						

						// native method call
						let nativeCallResult = self.cType!.get_secure_random_bytes(self.cType!.this_arg)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = ThirtyTwoBytes(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// Reads a [`Signer`] for this [`KeysInterface`] from the given input stream.
					/// This is only called during deserialization of other objects which contain
					/// [`Sign`]-implementing objects (i.e., [`ChannelMonitor`]s and [`ChannelManager`]s).
					/// The bytes are exactly those which `<Self::Signer as Writeable>::write()` writes, and
					/// contain no versioning scheme. You may wish to include your own version prefix and ensure
					/// you've read all of the provided bytes to ensure no corruption occurred.
					/// 
					/// This method is slowly being phased out -- it will only be called when reading objects
					/// written by LDK versions prior to 0.0.113.
					/// 
					/// [`Signer`]: Self::Signer
					/// [`ChannelMonitor`]: crate::chain::channelmonitor::ChannelMonitor
					/// [`ChannelManager`]: crate::ln::channelmanager::ChannelManager
					public override func readChanSigner(reader: [UInt8]) -> Result_SignDecodeErrorZ {
						// native call variable prep
						
						let readerPrimitiveWrapper = u8slice(value: reader)
				

						

						// native method call
						let nativeCallResult = self.cType!.read_chan_signer(self.cType!.this_arg, readerPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						readerPrimitiveWrapper.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = Result_SignDecodeErrorZ(cType: nativeCallResult)

						return returnValue
					}
		
					/// Sign an invoice.
					/// By parameterizing by the raw invoice bytes instead of the hash, we allow implementors of
					/// this trait to parse the invoice and make sure they're signing what they expect, rather than
					/// blindly signing the hash.
					/// The `hrp` is ASCII bytes, while the invoice data is base32-encoded.
					/// 
					/// The secret key used to sign the invoice is dependent on the [`Recipient`].
					/// 
					/// Errors if the [`Recipient`] variant is not supported by the implementation.
					public override func signInvoice(hrpBytes: [UInt8], invoiceData: [UInt8], receipient: Recipient) -> Result_RecoverableSignatureNoneZ {
						// native call variable prep
						
						let hrpBytesPrimitiveWrapper = u8slice(value: hrpBytes)
				
						let invoiceDataVector = Vec_U5Z(array: invoiceData).dangle()
				

						

						// native method call
						let nativeCallResult = self.cType!.sign_invoice(self.cType!.this_arg, hrpBytesPrimitiveWrapper.cType!, invoiceDataVector.cType!, receipient.getCValue())

						// cleanup
						
						// for elided types, we need this
						hrpBytesPrimitiveWrapper.noOpRetain()
				
						// invoiceDataVector.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = Result_RecoverableSignatureNoneZ(cType: nativeCallResult)

						return returnValue
					}
		
					/// Get secret key material as bytes for use in encrypting and decrypting inbound payment data.
					/// 
					/// If the implementor of this trait supports [phantom node payments], then every node that is
					/// intended to be included in the phantom invoice route hints must return the same value from
					/// this method.
					/// 
					/// This method must return the same value each time it is called.
					/// 
					/// [phantom node payments]: PhantomKeysManager
					public override func getInboundPaymentKeyMaterial() -> [UInt8] {
						// native call variable prep
						

						

						// native method call
						let nativeCallResult = self.cType!.get_inbound_payment_key_material(self.cType!.this_arg)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = ThirtyTwoBytes(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
					public override func free() {
						// native call variable prep
						

						
				// natively wrapped traits may not necessarily be properly initialized
				// for now just don't free these things
				// self.cType?.free(self.cType?.this_arg)
				return;
			

						// native method call
						let nativeCallResult = self.cType!.free(self.cType!.this_arg)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
				}

			}
		