
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			// necessary for abort() calls
			import Foundation

			/// An abstraction over a bitcoin wallet that can perform coin selection over a set of UTXOs and can
			/// sign for them. The coin selection method aims to mimic Bitcoin Core's `fundrawtransaction` RPC,
			/// which most wallets should be able to satisfy. Otherwise, consider implementing [`WalletSource`],
			/// which can provide a default implementation of this trait when used with [`Wallet`].
			public typealias CoinSelectionSource = Bindings.CoinSelectionSource

			extension Bindings {

				/// An abstraction over a bitcoin wallet that can perform coin selection over a set of UTXOs and can
				/// sign for them. The coin selection method aims to mimic Bitcoin Core's `fundrawtransaction` RPC,
				/// which most wallets should be able to satisfy. Otherwise, consider implementing [`WalletSource`],
				/// which can provide a default implementation of this trait when used with [`Wallet`].
				open class CoinSelectionSource: NativeTraitWrapper {

					
					/// Set to false to suppress an individual type's deinit log statements.
					/// Only applicable when log threshold is set to `.Debug`.
					public static var enableDeinitLogging = true

					/// Set to true to suspend the freeing of this type's associated Rust memory.
					/// Should only ever be used for debugging purposes, and will likely be
					/// deprecated soon.
					public static var suspendFreedom = false

					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCoinSelectionSource?

					internal init(cType: LDKCoinSelectionSource, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCoinSelectionSource, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKCoinSelectionSource, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					public init() {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						super.init(conflictAvoidingVariableName: 0, instantiationContext: "CoinSelectionSource.swift::\(#function):\(#line)")

						let thisArg = Bindings.instanceToPointer(instance: self)

						

						
						func selectConfirmedUtxosLambda(this_arg: UnsafeRawPointer?, claim_id: LDKThirtyTwoBytes, must_spend: LDKCVec_InputZ, must_pay_to: LDKCVec_TxOutZ, target_feerate_sat_per_1000_weight: UInt32) -> LDKCResult_CoinSelectionNoneZ {
							let instance: CoinSelectionSource = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "CoinSelectionSource::selectConfirmedUtxosLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.selectConfirmedUtxos(claimId: ThirtyTwoBytes(cType: claim_id, instantiationContext: "CoinSelectionSource.swift::init()::\(#function):\(#line)").getValue(), mustSpend: Vec_InputZ(cType: must_spend, instantiationContext: "CoinSelectionSource.swift::init()::\(#function):\(#line)").getValue(), mustPayTo: Vec_TxOutZ(cType: must_pay_to, instantiationContext: "CoinSelectionSource.swift::init()::\(#function):\(#line)").getValue(), targetFeerateSatPer1000Weight: target_feerate_sat_per_1000_weight)

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.danglingClone().cType!

							return returnValue
						}
		
						func signTxLambda(this_arg: UnsafeRawPointer?, tx: LDKTransaction) -> LDKCResult_TransactionNoneZ {
							let instance: CoinSelectionSource = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "CoinSelectionSource::signTxLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.signTx(tx: Transaction(cType: tx, instantiationContext: "CoinSelectionSource.swift::init()::\(#function):\(#line)").getValue())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.danglingClone().cType!

							return returnValue
						}
		
						func freeLambda(this_arg: UnsafeMutableRawPointer?) -> Void {
							let instance: CoinSelectionSource = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "CoinSelectionSource::freeLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.free()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		

						self.cType = LDKCoinSelectionSource(							
							this_arg: thisArg,
							select_confirmed_utxos: selectConfirmedUtxosLambda,
							sign_tx: signTxLambda,
							free: freeLambda
						)
					}

					
			/// Performs coin selection of a set of UTXOs, with at least 1 confirmation each, that are
					/// available to spend. Implementations are free to pick their coin selection algorithm of
					/// choice, as long as the following requirements are met:
					/// 
					/// 1. `must_spend` contains a set of [`Input`]s that must be included in the transaction
					/// throughout coin selection, but must not be returned as part of the result.
					/// 2. `must_pay_to` contains a set of [`TxOut`]s that must be included in the transaction
					/// throughout coin selection. In some cases, like when funding an anchor transaction, this
					/// set is empty. Implementations should ensure they handle this correctly on their end,
					/// e.g., Bitcoin Core's `fundrawtransaction` RPC requires at least one output to be
					/// provided, in which case a zero-value empty OP_RETURN output can be used instead.
					/// 3. Enough inputs must be selected/contributed for the resulting transaction (including the
					/// inputs and outputs noted above) to meet `target_feerate_sat_per_1000_weight`.
					/// 
					/// Implementations must take note that [`Input::satisfaction_weight`] only tracks the weight of
					/// the input's `script_sig` and `witness`. Some wallets, like Bitcoin Core's, may require
					/// providing the full input weight. Failing to do so may lead to underestimating fee bumps and
					/// delaying block inclusion.
					/// 
					/// The `claim_id` must map to the set of external UTXOs assigned to the claim, such that they
					/// can be re-used within new fee-bumped iterations of the original claiming transaction,
					/// ensuring that claims don't double spend each other. If a specific `claim_id` has never had a
					/// transaction associated with it, and all of the available UTXOs have already been assigned to
					/// other claims, implementations must be willing to double spend their UTXOs. The choice of
					/// which UTXOs to double spend is left to the implementation, but it must strive to keep the
					/// set of other claims being double spent to a minimum.
			open func selectConfirmedUtxos(claimId: [UInt8], mustSpend: [Input], mustPayTo: [TxOut], targetFeerateSatPer1000Weight: UInt32) -> Result_CoinSelectionNoneZ {
				
				Bindings.print("Error: CoinSelectionSource::selectConfirmedUtxos MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
				abort()
			}
		
			/// Signs and provides the full witness for all inputs within the transaction known to the
					/// trait (i.e., any provided via [`CoinSelectionSource::select_confirmed_utxos`]).
			open func signTx(tx: [UInt8]) -> Result_TransactionNoneZ {
				
				Bindings.print("Error: CoinSelectionSource::signTx MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
				abort()
			}
		
			/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
			internal func free() -> Void {
				
				// TODO: figure out something smarter
				return () // the empty tuple (aka Void) is necessary because Swift is whitespace-agnostic
			
				Bindings.print("Error: CoinSelectionSource::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
				abort()
			}
		

					

					

					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing CoinSelectionSource \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing CoinSelectionSource \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
				}

				internal class NativelyImplementedCoinSelectionSource: CoinSelectionSource {
					
			/// Performs coin selection of a set of UTXOs, with at least 1 confirmation each, that are
					/// available to spend. Implementations are free to pick their coin selection algorithm of
					/// choice, as long as the following requirements are met:
					/// 
					/// 1. `must_spend` contains a set of [`Input`]s that must be included in the transaction
					/// throughout coin selection, but must not be returned as part of the result.
					/// 2. `must_pay_to` contains a set of [`TxOut`]s that must be included in the transaction
					/// throughout coin selection. In some cases, like when funding an anchor transaction, this
					/// set is empty. Implementations should ensure they handle this correctly on their end,
					/// e.g., Bitcoin Core's `fundrawtransaction` RPC requires at least one output to be
					/// provided, in which case a zero-value empty OP_RETURN output can be used instead.
					/// 3. Enough inputs must be selected/contributed for the resulting transaction (including the
					/// inputs and outputs noted above) to meet `target_feerate_sat_per_1000_weight`.
					/// 
					/// Implementations must take note that [`Input::satisfaction_weight`] only tracks the weight of
					/// the input's `script_sig` and `witness`. Some wallets, like Bitcoin Core's, may require
					/// providing the full input weight. Failing to do so may lead to underestimating fee bumps and
					/// delaying block inclusion.
					/// 
					/// The `claim_id` must map to the set of external UTXOs assigned to the claim, such that they
					/// can be re-used within new fee-bumped iterations of the original claiming transaction,
					/// ensuring that claims don't double spend each other. If a specific `claim_id` has never had a
					/// transaction associated with it, and all of the available UTXOs have already been assigned to
					/// other claims, implementations must be willing to double spend their UTXOs. The choice of
					/// which UTXOs to double spend is left to the implementation, but it must strive to keep the
					/// set of other claims being double spent to a minimum.
			public override func selectConfirmedUtxos(claimId: [UInt8], mustSpend: [Input], mustPayTo: [TxOut], targetFeerateSatPer1000Weight: UInt32) -> Result_CoinSelectionNoneZ {
				// native call variable prep
				
						let claimIdPrimitiveWrapper = ThirtyTwoBytes(value: claimId, instantiationContext: "CoinSelectionSource.swift::\(#function):\(#line)")
				
						let mustSpendVector = Vec_InputZ(array: mustSpend, instantiationContext: "CoinSelectionSource.swift::\(#function):\(#line)").dangle()
				
						let mustPayToVector = Vec_TxOutZ(array: mustPayTo, instantiationContext: "CoinSelectionSource.swift::\(#function):\(#line)").dangle()
				

				

				// native method call
				let nativeCallResult = self.cType!.select_confirmed_utxos(self.cType!.this_arg, claimIdPrimitiveWrapper.cType!, mustSpendVector.cType!, mustPayToVector.cType!, targetFeerateSatPer1000Weight)

				// cleanup
				
						// for elided types, we need this
						claimIdPrimitiveWrapper.noOpRetain()
				
						// mustSpendVector.noOpRetain()
				
						// mustPayToVector.noOpRetain()
				

				// return value (do some wrapping)
				let returnValue = Result_CoinSelectionNoneZ(cType: nativeCallResult, instantiationContext: "CoinSelectionSource.swift::\(#function):\(#line)")

				return returnValue
			}
		
			/// Signs and provides the full witness for all inputs within the transaction known to the
					/// trait (i.e., any provided via [`CoinSelectionSource::select_confirmed_utxos`]).
			public override func signTx(tx: [UInt8]) -> Result_TransactionNoneZ {
				// native call variable prep
				
						let txPrimitiveWrapper = Transaction(value: tx, instantiationContext: "CoinSelectionSource.swift::\(#function):\(#line)").dangle()
				

				

				// native method call
				let nativeCallResult = self.cType!.sign_tx(self.cType!.this_arg, txPrimitiveWrapper.cType!)

				// cleanup
				
						// for elided types, we need this
						txPrimitiveWrapper.noOpRetain()
				

				// return value (do some wrapping)
				let returnValue = Result_TransactionNoneZ(cType: nativeCallResult, instantiationContext: "CoinSelectionSource.swift::\(#function):\(#line)")

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
		