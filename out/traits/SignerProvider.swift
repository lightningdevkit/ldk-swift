
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			// necessary for abort() calls
			import Foundation

			/// A trait that can return signer instances for individual channels.
			public typealias SignerProvider = Bindings.SignerProvider

			extension Bindings {

				/// A trait that can return signer instances for individual channels.
				open class SignerProvider: NativeTraitWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKSignerProvider?

					internal init(cType: LDKSignerProvider, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKSignerProvider, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init() {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						super.init(conflictAvoidingVariableName: 0, instantiationContext: "SignerProvider.swift::\(#function):\(#line)")

						let thisArg = Bindings.instanceToPointer(instance: self)

						

						
						func generateChannelKeysIdLambda(this_arg: UnsafeRawPointer?, inbound: Bool, channel_value_satoshis: UInt64, user_channel_id: LDKU128) -> LDKThirtyTwoBytes {
							let instance: SignerProvider = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "SignerProvider::generateChannelKeysIdLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.generateChannelKeysId(inbound: inbound, channelValueSatoshis: channel_value_satoshis, userChannelId: U128(cType: user_channel_id, instantiationContext: "#{swift_class_name}::init()::\(#function):\(#line)").getValue())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = ThirtyTwoBytes(value: swiftCallbackResult).dangle().cType!

							return returnValue
						}
		
						func deriveChannelSignerLambda(this_arg: UnsafeRawPointer?, channel_value_satoshis: UInt64, channel_keys_id: LDKThirtyTwoBytes) -> LDKWriteableEcdsaChannelSigner {
							let instance: SignerProvider = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "SignerProvider::deriveChannelSignerLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.deriveChannelSigner(channelValueSatoshis: channel_value_satoshis, channelKeysId: ThirtyTwoBytes(cType: channel_keys_id, instantiationContext: "#{swift_class_name}::init()::\(#function):\(#line)").getValue())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.activate().cType!

							return returnValue
						}
		
						func readChanSignerLambda(this_arg: UnsafeRawPointer?, reader: LDKu8slice) -> LDKCResult_WriteableEcdsaChannelSignerDecodeErrorZ {
							let instance: SignerProvider = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "SignerProvider::readChanSignerLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.readChanSigner(reader: u8slice(cType: reader, instantiationContext: "#{swift_class_name}::init()::\(#function):\(#line)").dangle().getValue())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func getDestinationScriptLambda(this_arg: UnsafeRawPointer?) -> LDKCVec_u8Z {
							let instance: SignerProvider = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "SignerProvider::getDestinationScriptLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.getDestinationScript()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = Vec_u8Z(array: swiftCallbackResult).dangle().cType!

							return returnValue
						}
		
						func getShutdownScriptpubkeyLambda(this_arg: UnsafeRawPointer?) -> LDKShutdownScript {
							let instance: SignerProvider = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "SignerProvider::getShutdownScriptpubkeyLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.getShutdownScriptpubkey()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func freeLambda(this_arg: UnsafeMutableRawPointer?) -> Void {
							let instance: SignerProvider = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "SignerProvider::freeLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.free()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		

						self.cType = LDKSignerProvider(							
							this_arg: thisArg,
							generate_channel_keys_id: generateChannelKeysIdLambda,
							derive_channel_signer: deriveChannelSignerLambda,
							read_chan_signer: readChanSignerLambda,
							get_destination_script: getDestinationScriptLambda,
							get_shutdown_scriptpubkey: getShutdownScriptpubkeyLambda,
							free: freeLambda
						)
					}

					
					/// Generates a unique `channel_keys_id` that can be used to obtain a [`Self::Signer`] through
					/// [`SignerProvider::derive_channel_signer`]. The `user_channel_id` is provided to allow
					/// implementations of [`SignerProvider`] to maintain a mapping between itself and the generated
					/// `channel_keys_id`.
					/// 
					/// This method must return a different value each time it is called.
					open func generateChannelKeysId(inbound: Bool, channelValueSatoshis: UInt64, userChannelId: [UInt8]) -> [UInt8] {
						
						Bindings.print("Error: SignerProvider::generateChannelKeysId MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Derives the private key material backing a `Signer`.
					/// 
					/// To derive a new `Signer`, a fresh `channel_keys_id` should be obtained through
					/// [`SignerProvider::generate_channel_keys_id`]. Otherwise, an existing `Signer` can be
					/// re-derived from its `channel_keys_id`, which can be obtained through its trait method
					/// [`ChannelSigner::channel_keys_id`].
					open func deriveChannelSigner(channelValueSatoshis: UInt64, channelKeysId: [UInt8]) -> WriteableEcdsaChannelSigner {
						
						Bindings.print("Error: SignerProvider::deriveChannelSigner MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Reads a [`Signer`] for this [`SignerProvider`] from the given input stream.
					/// This is only called during deserialization of other objects which contain
					/// [`WriteableEcdsaChannelSigner`]-implementing objects (i.e., [`ChannelMonitor`]s and [`ChannelManager`]s).
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
					open func readChanSigner(reader: [UInt8]) -> Result_WriteableEcdsaChannelSignerDecodeErrorZ {
						
						Bindings.print("Error: SignerProvider::readChanSigner MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Get a script pubkey which we send funds to when claiming on-chain contestable outputs.
					/// 
					/// This method should return a different value each time it is called, to avoid linking
					/// on-chain funds across channels as controlled to the same user.
					open func getDestinationScript() -> [UInt8] {
						
						Bindings.print("Error: SignerProvider::getDestinationScript MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Get a script pubkey which we will send funds to when closing a channel.
					/// 
					/// This method should return a different value each time it is called, to avoid linking
					/// on-chain funds across channels as controlled to the same user.
					open func getShutdownScriptpubkey() -> ShutdownScript {
						
						Bindings.print("Error: SignerProvider::getShutdownScriptpubkey MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
					internal func free() -> Void {
						
				// TODO: figure out something smarter
				return; // the semicolon is necessary because Swift is whitespace-agnostic
			
						Bindings.print("Error: SignerProvider::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		

					

					

					internal func dangle(_ shouldDangle: Bool = true) -> SignerProvider {
        				self.dangling = shouldDangle
						return self
					}

					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing SignerProvider \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing SignerProvider \(self.instanceNumber) due to dangle.")
						}
					}
				}

				internal class NativelyImplementedSignerProvider: SignerProvider {
					
					/// Generates a unique `channel_keys_id` that can be used to obtain a [`Self::Signer`] through
					/// [`SignerProvider::derive_channel_signer`]. The `user_channel_id` is provided to allow
					/// implementations of [`SignerProvider`] to maintain a mapping between itself and the generated
					/// `channel_keys_id`.
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
						let returnValue = ThirtyTwoBytes(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)").getValue()

						return returnValue
					}
		
					/// Derives the private key material backing a `Signer`.
					/// 
					/// To derive a new `Signer`, a fresh `channel_keys_id` should be obtained through
					/// [`SignerProvider::generate_channel_keys_id`]. Otherwise, an existing `Signer` can be
					/// re-derived from its `channel_keys_id`, which can be obtained through its trait method
					/// [`ChannelSigner::channel_keys_id`].
					public override func deriveChannelSigner(channelValueSatoshis: UInt64, channelKeysId: [UInt8]) -> WriteableEcdsaChannelSigner {
						// native call variable prep
						
						let channelKeysIdPrimitiveWrapper = ThirtyTwoBytes(value: channelKeysId)
				

						

						// native method call
						let nativeCallResult = self.cType!.derive_channel_signer(self.cType!.this_arg, channelValueSatoshis, channelKeysIdPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						channelKeysIdPrimitiveWrapper.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = NativelyImplementedWriteableEcdsaChannelSigner(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)", anchor: self)

						return returnValue
					}
		
					/// Reads a [`Signer`] for this [`SignerProvider`] from the given input stream.
					/// This is only called during deserialization of other objects which contain
					/// [`WriteableEcdsaChannelSigner`]-implementing objects (i.e., [`ChannelMonitor`]s and [`ChannelManager`]s).
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
					public override func readChanSigner(reader: [UInt8]) -> Result_WriteableEcdsaChannelSignerDecodeErrorZ {
						// native call variable prep
						
						let readerPrimitiveWrapper = u8slice(value: reader)
				

						

						// native method call
						let nativeCallResult = self.cType!.read_chan_signer(self.cType!.this_arg, readerPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						readerPrimitiveWrapper.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = Result_WriteableEcdsaChannelSignerDecodeErrorZ(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)")

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
						let returnValue = Vec_u8Z(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)").getValue()

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
						let returnValue = ShutdownScript(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)")

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
		