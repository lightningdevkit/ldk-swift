
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			// necessary for abort() calls
			import Foundation

			/// The `Access` trait defines behavior for accessing chain data and state, such as blocks and
			/// UTXOs.
			public typealias Access = Bindings.Access

			extension Bindings {

				/// The `Access` trait defines behavior for accessing chain data and state, such as blocks and
				/// UTXOs.
				open class Access: NativeTraitWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKAccess?

					internal init(cType: LDKAccess) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKAccess, anchor: NativeTypeWrapper) {
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

						

						
						func getUtxoLambda(this_arg: UnsafeRawPointer?, genesis_hash: UnsafePointer<UInt8Tuple32>?, short_channel_id: UInt64) -> LDKCResult_TxOutAccessErrorZ {
							let instance: Access = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Access::getUtxoLambda")

							// Swift callback variable prep
							
							var genesis_hashPointee: [UInt8]? = nil
							if let genesis_hashUnwrapped = genesis_hash {
								genesis_hashPointee = Bindings.UInt8Tuple32ToArray(tuple: genesis_hashUnwrapped.pointee)
							}
						

							// Swift callback call
							let swiftCallbackResult = instance.getUtxo(genesisHash: genesis_hashPointee, shortChannelId: short_channel_id)

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func freeLambda(this_arg: UnsafeMutableRawPointer?) -> Void {
							let instance: Access = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Access::freeLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.free()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		

						self.cType = LDKAccess(							
							this_arg: thisArg,
							get_utxo: getUtxoLambda,
							free: freeLambda
						)
					}

					
					/// Returns the transaction output of a funding transaction encoded by [`short_channel_id`].
					/// Returns an error if `genesis_hash` is for a different chain or if such a transaction output
					/// is unknown.
					/// 
					/// [`short_channel_id`]: https://github.com/lightning/bolts/blob/master/07-routing-gossip.md#definition-of-short_channel_id
					open func getUtxo(genesisHash: [UInt8]?, shortChannelId: UInt64) -> Result_TxOutAccessErrorZ {
						
						Bindings.print("Error: Access::getUtxo MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
					internal func free() -> Void {
						
				// TODO: figure out something smarter
				return; // the semicolon is necessary because Swift is whitespace-agnostic
			
						Bindings.print("Error: Access::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		

					

					

					internal func dangle(_ shouldDangle: Bool = true) -> Access {
        				self.dangling = shouldDangle
						return self
					}

					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Access \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Access \(self.instanceNumber) due to dangle.")
						}
					}
				}

				internal class NativelyImplementedAccess: Access {
					
					/// Returns the transaction output of a funding transaction encoded by [`short_channel_id`].
					/// Returns an error if `genesis_hash` is for a different chain or if such a transaction output
					/// is unknown.
					/// 
					/// [`short_channel_id`]: https://github.com/lightning/bolts/blob/master/07-routing-gossip.md#definition-of-short_channel_id
					public override func getUtxo(genesisHash: [UInt8]?, shortChannelId: UInt64) -> Result_TxOutAccessErrorZ {
						// native call variable prep
						
					var tupledGenesisHashPointer: UnsafeMutablePointer<UInt8Tuple32>? = nil
					if let genesisHash = genesisHash {
						
						let tupledGenesisHash = Bindings.arrayToUInt8Tuple32(array: genesisHash)
					
						tupledGenesisHashPointer = UnsafeMutablePointer<UInt8Tuple32>.allocate(capacity: 1)
						tupledGenesisHashPointer!.initialize(to: tupledGenesisHash)
					}
				

						

						// native method call
						let nativeCallResult = self.cType!.get_utxo(self.cType!.this_arg, tupledGenesisHashPointer, shortChannelId)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Result_TxOutAccessErrorZ(cType: nativeCallResult)

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
		