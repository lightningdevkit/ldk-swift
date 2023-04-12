
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Simple implementation of [`EntropySource`], [`NodeSigner`], and [`SignerProvider`] that takes a
			/// 32-byte seed for use as a BIP 32 extended key and derives keys from that.
			/// 
			/// Your `node_id` is seed/0'.
			/// Unilateral closes may use seed/1'.
			/// Cooperative closes may use seed/2'.
			/// The two close keys may be needed to claim on-chain funds!
			/// 
			/// This struct cannot be used for nodes that wish to support receiving phantom payments;
			/// [`PhantomKeysManager`] must be used instead.
			/// 
			/// Note that switching between this struct and [`PhantomKeysManager`] will invalidate any
			/// previously issued invoices and attempts to pay previous invoices will fail.
			public typealias KeysManager = Bindings.KeysManager

			extension Bindings {
		

				/// Simple implementation of [`EntropySource`], [`NodeSigner`], and [`SignerProvider`] that takes a
				/// 32-byte seed for use as a BIP 32 extended key and derives keys from that.
				/// 
				/// Your `node_id` is seed/0'.
				/// Unilateral closes may use seed/1'.
				/// Cooperative closes may use seed/2'.
				/// The two close keys may be needed to claim on-chain funds!
				/// 
				/// This struct cannot be used for nodes that wish to support receiving phantom payments;
				/// [`PhantomKeysManager`] must be used instead.
				/// 
				/// Note that switching between this struct and [`PhantomKeysManager`] will invalidate any
				/// previously issued invoices and attempts to pay previous invoices will fail.
				public class KeysManager: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKKeysManager?

					internal init(cType: LDKKeysManager) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKKeysManager, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the KeysManager, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = KeysManager_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a [`KeysManager`] from a 32-byte seed. If the seed is in some way biased (e.g.,
					/// your CSRNG is busted) this may panic (but more importantly, you will possibly lose funds).
					/// `starting_time` isn't strictly required to actually be a time, but it must absolutely,
					/// without a doubt, be unique to this instance. ie if you start multiple times with the same
					/// `seed`, `starting_time` must be unique to each run. Thus, the easiest way to achieve this
					/// is to simply use the current time (with very high precision).
					/// 
					/// The `seed` MUST be backed up safely prior to use so that the keys can be re-created, however,
					/// obviously, `starting_time` should be unique every time you reload the library - it is only
					/// used to generate new ephemeral key data (which will be stored by the individual channel if
					/// necessary).
					/// 
					/// Note that the seed is required to recover certain on-chain funds independent of
					/// [`ChannelMonitor`] data, though a current copy of [`ChannelMonitor`] data is also required
					/// for any channel, and some on-chain during-closing funds.
					/// 
					/// [`ChannelMonitor`]: crate::chain::channelmonitor::ChannelMonitor
					public init(seed: [UInt8], startingTimeSecs: UInt64, startingTimeNanos: UInt32) {
						// native call variable prep
						
						let tupledSeed = Bindings.arrayToUInt8Tuple32(array: seed)
					

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: tupledSeed) { (tupledSeedPointer: UnsafePointer<UInt8Tuple32>) in
				KeysManager_new(tupledSeedPointer, startingTimeSecs, startingTimeNanos)
						}
				

						// cleanup
						
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = KeysManager(cType: nativeCallResult)
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
				
			
					}
		
					/// Gets the \"node_id\" secret key used to sign gossip announcements, decode onion data, etc.
					public func getNodeSecretKey() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKKeysManager>) in
				KeysManager_get_node_secret_key(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = SecretKey(cType: nativeCallResult, anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Derive an old [`WriteableEcdsaChannelSigner`] containing per-channel secrets based on a key derivation parameters.
					public func deriveChannelKeys(channelValueSatoshis: UInt64, params: [UInt8]) -> InMemorySigner {
						// native call variable prep
						
						let tupledParams = Bindings.arrayToUInt8Tuple32(array: params)
					

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKKeysManager>) in
				
						withUnsafePointer(to: tupledParams) { (tupledParamsPointer: UnsafePointer<UInt8Tuple32>) in
				KeysManager_derive_channel_keys(thisArgPointer, channelValueSatoshis, tupledParamsPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = InMemorySigner(cType: nativeCallResult, anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// Creates a [`Transaction`] which spends the given descriptors to the given outputs, plus an
					/// output to the given change destination (if sufficient change value remains). The
					/// transaction will have a feerate, at least, of the given value.
					/// 
					/// Returns `Err(())` if the output value is greater than the input value minus required fee,
					/// if a descriptor was duplicated, or if an output descriptor `script_pubkey`
					/// does not match the one we can spend.
					/// 
					/// We do not enforce that outputs meet the dust limit or that any output scripts are standard.
					/// 
					/// May panic if the [`SpendableOutputDescriptor`]s were not generated by channels which used
					/// this [`KeysManager`] or one of the [`InMemorySigner`] created by this [`KeysManager`].
					public func spendSpendableOutputs(descriptors: [SpendableOutputDescriptor], outputs: [TxOut], changeDestinationScript: [UInt8], feerateSatPer1000Weight: UInt32) -> Result_TransactionNoneZ {
						// native call variable prep
						
						let descriptorsVector = Vec_SpendableOutputDescriptorZ(array: descriptors).dangle()
				
						let outputsVector = Vec_TxOutZ(array: outputs).dangle()
				
						let changeDestinationScriptVector = Vec_u8Z(array: changeDestinationScript).dangle()
				

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKKeysManager>) in
				KeysManager_spend_spendable_outputs(thisArgPointer, descriptorsVector.cType!, outputsVector.cType!, changeDestinationScriptVector.cType!, feerateSatPer1000Weight)
						}
				

						// cleanup
						
						// descriptorsVector.noOpRetain()
				
						// outputsVector.noOpRetain()
				
						// changeDestinationScriptVector.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_TransactionNoneZ(cType: nativeCallResult, anchor: self)
						

						return returnValue
					}
		
					/// Constructs a new EntropySource which calls the relevant methods on this_arg.
					/// This copies the `inner` pointer in this_arg and thus the returned EntropySource must be freed before this_arg is
					public func asEntropySource() -> EntropySource {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKKeysManager>) in
				KeysManager_as_EntropySource(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = NativelyImplementedEntropySource(cType: nativeCallResult, anchor: self)
						

						return returnValue
					}
		
					/// Constructs a new NodeSigner which calls the relevant methods on this_arg.
					/// This copies the `inner` pointer in this_arg and thus the returned NodeSigner must be freed before this_arg is
					public func asNodeSigner() -> NodeSigner {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKKeysManager>) in
				KeysManager_as_NodeSigner(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = NativelyImplementedNodeSigner(cType: nativeCallResult, anchor: self)
						

						return returnValue
					}
		
					/// Constructs a new SignerProvider which calls the relevant methods on this_arg.
					/// This copies the `inner` pointer in this_arg and thus the returned SignerProvider must be freed before this_arg is
					public func asSignerProvider() -> SignerProvider {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKKeysManager>) in
				KeysManager_as_SignerProvider(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = NativelyImplementedSignerProvider(cType: nativeCallResult, anchor: self)
						

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> KeysManager {
						self.dangling = shouldDangle
						return self
					}

					
					internal func setCFreeability(freeable: Bool) -> KeysManager {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> KeysManager {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing KeysManager \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing KeysManager \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		