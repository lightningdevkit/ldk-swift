
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Similar to [`KeysManager`], but allows the node using this struct to receive phantom node
			/// payments.
			/// 
			/// A phantom node payment is a payment made to a phantom invoice, which is an invoice that can be
			/// paid to one of multiple nodes. This works because we encode the invoice route hints such that
			/// LDK will recognize an incoming payment as destined for a phantom node, and collect the payment
			/// itself without ever needing to forward to this fake node.
			/// 
			/// Phantom node payments are useful for load balancing between multiple LDK nodes. They also
			/// provide some fault tolerance, because payers will automatically retry paying other provided
			/// nodes in the case that one node goes down.
			/// 
			/// Note that multi-path payments are not supported in phantom invoices for security reasons.
			/// Switching between this struct and [`KeysManager`] will invalidate any previously issued
			/// invoices and attempts to pay previous invoices will fail.
			public typealias PhantomKeysManager = Bindings.PhantomKeysManager

			extension Bindings {
		

				/// Similar to [`KeysManager`], but allows the node using this struct to receive phantom node
				/// payments.
				/// 
				/// A phantom node payment is a payment made to a phantom invoice, which is an invoice that can be
				/// paid to one of multiple nodes. This works because we encode the invoice route hints such that
				/// LDK will recognize an incoming payment as destined for a phantom node, and collect the payment
				/// itself without ever needing to forward to this fake node.
				/// 
				/// Phantom node payments are useful for load balancing between multiple LDK nodes. They also
				/// provide some fault tolerance, because payers will automatically retry paying other provided
				/// nodes in the case that one node goes down.
				/// 
				/// Note that multi-path payments are not supported in phantom invoices for security reasons.
				/// Switching between this struct and [`KeysManager`] will invalidate any previously issued
				/// invoices and attempts to pay previous invoices will fail.
				public class PhantomKeysManager: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKPhantomKeysManager?

					internal init(cType: LDKPhantomKeysManager, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKPhantomKeysManager, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the PhantomKeysManager, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = PhantomKeysManager_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new EntropySource which calls the relevant methods on this_arg.
					/// This copies the `inner` pointer in this_arg and thus the returned EntropySource must be freed before this_arg is
					public func asEntropySource() -> EntropySource {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKPhantomKeysManager>) in
				PhantomKeysManager_as_EntropySource(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = NativelyImplementedEntropySource(cType: nativeCallResult, instantiationContext: "PhantomKeysManager.swift::\(#function):\(#line)", anchor: self)
						

						return returnValue
					}
		
					/// Constructs a new NodeSigner which calls the relevant methods on this_arg.
					/// This copies the `inner` pointer in this_arg and thus the returned NodeSigner must be freed before this_arg is
					public func asNodeSigner() -> NodeSigner {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKPhantomKeysManager>) in
				PhantomKeysManager_as_NodeSigner(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = NativelyImplementedNodeSigner(cType: nativeCallResult, instantiationContext: "PhantomKeysManager.swift::\(#function):\(#line)", anchor: self)
						

						return returnValue
					}
		
					/// Constructs a new SignerProvider which calls the relevant methods on this_arg.
					/// This copies the `inner` pointer in this_arg and thus the returned SignerProvider must be freed before this_arg is
					public func asSignerProvider() -> SignerProvider {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKPhantomKeysManager>) in
				PhantomKeysManager_as_SignerProvider(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = NativelyImplementedSignerProvider(cType: nativeCallResult, instantiationContext: "PhantomKeysManager.swift::\(#function):\(#line)", anchor: self)
						

						return returnValue
					}
		
					/// Constructs a [`PhantomKeysManager`] given a 32-byte seed and an additional `cross_node_seed`
					/// that is shared across all nodes that intend to participate in [phantom node payments]
					/// together.
					/// 
					/// See [`KeysManager::new`] for more information on `seed`, `starting_time_secs`, and
					/// `starting_time_nanos`.
					/// 
					/// `cross_node_seed` must be the same across all phantom payment-receiving nodes and also the
					/// same across restarts, or else inbound payments may fail.
					/// 
					/// [phantom node payments]: PhantomKeysManager
					public init(seed: [UInt8], startingTimeSecs: UInt64, startingTimeNanos: UInt32, crossNodeSeed: [UInt8]) {
						// native call variable prep
						
						let tupledSeed = Bindings.arrayToUInt8Tuple32(array: seed)
					
						let tupledCrossNodeSeed = Bindings.arrayToUInt8Tuple32(array: crossNodeSeed)
					

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: tupledSeed) { (tupledSeedPointer: UnsafePointer<UInt8Tuple32>) in
				
						withUnsafePointer(to: tupledCrossNodeSeed) { (tupledCrossNodeSeedPointer: UnsafePointer<UInt8Tuple32>) in
				PhantomKeysManager_new(tupledSeedPointer, startingTimeSecs, startingTimeNanos, tupledCrossNodeSeedPointer)
						}
				
						}
				

						// cleanup
						
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = PhantomKeysManager(cType: nativeCallResult, instantiationContext: "PhantomKeysManager.swift::\(#function):\(#line)")
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0, instantiationContext: "PhantomKeysManager.swift::\(#function):\(#line)")
				
			
					}
		
					/// See [`KeysManager::spend_spendable_outputs`] for documentation on this method.
					public func spendSpendableOutputs(descriptors: [SpendableOutputDescriptor], outputs: [TxOut], changeDestinationScript: [UInt8], feerateSatPer1000Weight: UInt32) -> Result_TransactionNoneZ {
						// native call variable prep
						
						let descriptorsVector = Vec_SpendableOutputDescriptorZ(array: descriptors, instantiationContext: "PhantomKeysManager.swift::\(#function):\(#line)").dangle()
				
						let outputsVector = Vec_TxOutZ(array: outputs, instantiationContext: "PhantomKeysManager.swift::\(#function):\(#line)").dangle()
				
						let changeDestinationScriptVector = Vec_u8Z(array: changeDestinationScript, instantiationContext: "PhantomKeysManager.swift::\(#function):\(#line)").dangle()
				

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKPhantomKeysManager>) in
				PhantomKeysManager_spend_spendable_outputs(thisArgPointer, descriptorsVector.cType!, outputsVector.cType!, changeDestinationScriptVector.cType!, feerateSatPer1000Weight)
						}
				

						// cleanup
						
						// descriptorsVector.noOpRetain()
				
						// outputsVector.noOpRetain()
				
						// changeDestinationScriptVector.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_TransactionNoneZ(cType: nativeCallResult, instantiationContext: "PhantomKeysManager.swift::\(#function):\(#line)", anchor: self)
						

						return returnValue
					}
		
					/// See [`KeysManager::derive_channel_keys`] for documentation on this method.
					public func deriveChannelKeys(channelValueSatoshis: UInt64, params: [UInt8]) -> InMemorySigner {
						// native call variable prep
						
						let tupledParams = Bindings.arrayToUInt8Tuple32(array: params)
					

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKPhantomKeysManager>) in
				
						withUnsafePointer(to: tupledParams) { (tupledParamsPointer: UnsafePointer<UInt8Tuple32>) in
				PhantomKeysManager_derive_channel_keys(thisArgPointer, channelValueSatoshis, tupledParamsPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = InMemorySigner(cType: nativeCallResult, instantiationContext: "PhantomKeysManager.swift::\(#function):\(#line)", anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// Gets the \"node_id\" secret key used to sign gossip announcements, decode onion data, etc.
					public func getNodeSecretKey() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKPhantomKeysManager>) in
				PhantomKeysManager_get_node_secret_key(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = SecretKey(cType: nativeCallResult, instantiationContext: "PhantomKeysManager.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Gets the \"node_id\" secret key of the phantom node used to sign invoices, decode the
					/// last-hop onion data, etc.
					public func getPhantomNodeSecretKey() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKPhantomKeysManager>) in
				PhantomKeysManager_get_phantom_node_secret_key(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = SecretKey(cType: nativeCallResult, instantiationContext: "PhantomKeysManager.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> PhantomKeysManager {
						self.dangling = shouldDangle
						return self
					}

					
					internal func setCFreeability(freeable: Bool) -> PhantomKeysManager {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> PhantomKeysManager {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing PhantomKeysManager \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing PhantomKeysManager \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		