
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			/// 
			public typealias BumpTransactionEvent = Bindings.BumpTransactionEvent

			extension Bindings {

				/// Represents the different types of transactions, originating from LDK, to be bumped.
				public class BumpTransactionEvent: NativeTypeWrapper {

					
					/// Set to false to suppress an individual type's deinit log statements.
					/// Only applicable when log threshold is set to `.Debug`.
					public static var enableDeinitLogging = true

					/// Set to true to suspend the freeing of this type's associated Rust memory.
					/// Should only ever be used for debugging purposes, and will likely be
					/// deprecated soon.
					public static var suspendFreedom = false

					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKBumpTransactionEvent?

					internal init(cType: LDKBumpTransactionEvent, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKBumpTransactionEvent, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKBumpTransactionEvent, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					public enum BumpTransactionEventType {
						
						/// Indicates that a channel featuring anchor outputs is to be closed by broadcasting the local
						/// commitment transaction. Since commitment transactions have a static feerate pre-agreed upon,
						/// they may need additional fees to be attached through a child transaction using the popular
						/// [Child-Pays-For-Parent](https://bitcoinops.org/en/topics/cpfp) fee bumping technique. This
						/// child transaction must include the anchor input described within `anchor_descriptor` along
						/// with additional inputs to meet the target feerate. Failure to meet the target feerate
						/// decreases the confirmation odds of the transaction package (which includes the commitment
						/// and child anchor transactions), possibly resulting in a loss of funds. Once the transaction
						/// is constructed, it must be fully signed for and broadcast by the consumer of the event
						/// along with the `commitment_tx` enclosed. Note that the `commitment_tx` must always be
						/// broadcast first, as the child anchor transaction depends on it.
						/// 
						/// The consumer should be able to sign for any of the additional inputs included within the
						/// child anchor transaction. To sign its anchor input, an [`EcdsaChannelSigner`] should be
						/// re-derived through [`AnchorDescriptor::derive_channel_signer`]. The anchor input signature
						/// can be computed with [`EcdsaChannelSigner::sign_holder_anchor_input`], which can then be
						/// provided to [`build_anchor_input_witness`] along with the `funding_pubkey` to obtain the
						/// full witness required to spend.
						/// 
						/// It is possible to receive more than one instance of this event if a valid child anchor
						/// transaction is never broadcast or is but not with a sufficient fee to be mined. Care should
						/// be taken by the consumer of the event to ensure any future iterations of the child anchor
						/// transaction adhere to the [Replace-By-Fee
						/// rules](https://github.com/bitcoin/bitcoin/blob/master/doc/policy/mempool-replacements.md)
						/// for fee bumps to be accepted into the mempool, and eventually the chain. As the frequency of
						/// these events is not user-controlled, users may ignore/drop the event if they are no longer
						/// able to commit external confirmed funds to the child anchor transaction.
						/// 
						/// The set of `pending_htlcs` on the commitment transaction to be broadcast can be inspected to
						/// determine whether a significant portion of the channel's funds are allocated to HTLCs,
						/// enabling users to make their own decisions regarding the importance of the commitment
						/// transaction's confirmation. Note that this is not required, but simply exists as an option
						/// for users to override LDK's behavior. On commitments with no HTLCs (indicated by those with
						/// an empty `pending_htlcs`), confirmation of the commitment transaction can be considered to
						/// be not urgent.
						/// 
						/// [`EcdsaChannelSigner`]: crate::sign::EcdsaChannelSigner
						/// [`EcdsaChannelSigner::sign_holder_anchor_input`]: crate::sign::EcdsaChannelSigner::sign_holder_anchor_input
						/// [`build_anchor_input_witness`]: crate::ln::chan_utils::build_anchor_input_witness
						case ChannelClose
			
						/// Indicates that a channel featuring anchor outputs has unilaterally closed on-chain by a
						/// holder commitment transaction and its HTLC(s) need to be resolved on-chain. With the
						/// zero-HTLC-transaction-fee variant of anchor outputs, the pre-signed HTLC
						/// transactions have a zero fee, thus requiring additional inputs and/or outputs to be attached
						/// for a timely confirmation within the chain. These additional inputs and/or outputs must be
						/// appended to the resulting HTLC transaction to meet the target feerate. Failure to meet the
						/// target feerate decreases the confirmation odds of the transaction, possibly resulting in a
						/// loss of funds. Once the transaction meets the target feerate, it must be signed for and
						/// broadcast by the consumer of the event.
						/// 
						/// The consumer should be able to sign for any of the non-HTLC inputs added to the resulting
						/// HTLC transaction. To sign HTLC inputs, an [`EcdsaChannelSigner`] should be re-derived
						/// through [`HTLCDescriptor::derive_channel_signer`]. Each HTLC input's signature can be
						/// computed with [`EcdsaChannelSigner::sign_holder_htlc_transaction`], which can then be
						/// provided to [`HTLCDescriptor::tx_input_witness`] to obtain the fully signed witness required
						/// to spend.
						/// 
						/// It is possible to receive more than one instance of this event if a valid HTLC transaction
						/// is never broadcast or is but not with a sufficient fee to be mined. Care should be taken by
						/// the consumer of the event to ensure any future iterations of the HTLC transaction adhere to
						/// the [Replace-By-Fee
						/// rules](https://github.com/bitcoin/bitcoin/blob/master/doc/policy/mempool-replacements.md)
						/// for fee bumps to be accepted into the mempool, and eventually the chain. As the frequency of
						/// these events is not user-controlled, users may ignore/drop the event if either they are no
						/// longer able to commit external confirmed funds to the HTLC transaction or the fee committed
						/// to the HTLC transaction is greater in value than the HTLCs being claimed.
						/// 
						/// [`EcdsaChannelSigner`]: crate::sign::EcdsaChannelSigner
						/// [`EcdsaChannelSigner::sign_holder_htlc_transaction`]: crate::sign::EcdsaChannelSigner::sign_holder_htlc_transaction
						/// [`HTLCDescriptor::tx_input_witness`]: HTLCDescriptor::tx_input_witness
						case HTLCResolution
			
					}

					public func getValueType() -> BumpTransactionEventType {
						switch self.cType!.tag {
							case LDKBumpTransactionEvent_ChannelClose:
								return .ChannelClose
			
							case LDKBumpTransactionEvent_HTLCResolution:
								return .HTLCResolution
			
							default:
								Bindings.print("Error: Invalid value type for BumpTransactionEvent! Aborting.", severity: .ERROR)
								abort()
						}
		
					}

					
					/// Frees any resources used by the BumpTransactionEvent
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = BumpTransactionEvent_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the BumpTransactionEvent
					internal func clone() -> BumpTransactionEvent {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKBumpTransactionEvent>) in
				BumpTransactionEvent_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = BumpTransactionEvent(cType: nativeCallResult, instantiationContext: "BumpTransactionEvent.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new ChannelClose-variant BumpTransactionEvent
					public class func initWithChannelClose(claimId: [UInt8], packageTargetFeerateSatPer1000Weight: UInt32, commitmentTx: [UInt8], commitmentTxFeeSatoshis: UInt64, anchorDescriptor: Bindings.AnchorDescriptor, pendingHtlcs: [HTLCOutputInCommitment]) -> BumpTransactionEvent {
						// native call variable prep
						
						let claimIdPrimitiveWrapper = ThirtyTwoBytes(value: claimId, instantiationContext: "BumpTransactionEvent.swift::\(#function):\(#line)")
				
						let commitmentTxPrimitiveWrapper = Transaction(value: commitmentTx, instantiationContext: "BumpTransactionEvent.swift::\(#function):\(#line)").dangle()
				
						let pendingHtlcsVector = Vec_HTLCOutputInCommitmentZ(array: pendingHtlcs, instantiationContext: "BumpTransactionEvent.swift::\(#function):\(#line)").dangle()
				

						// native method call
						let nativeCallResult = BumpTransactionEvent_channel_close(claimIdPrimitiveWrapper.cType!, packageTargetFeerateSatPer1000Weight, commitmentTxPrimitiveWrapper.cType!, commitmentTxFeeSatoshis, anchorDescriptor.dynamicallyDangledClone().cType!, pendingHtlcsVector.cType!)

						// cleanup
						
						// for elided types, we need this
						claimIdPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						commitmentTxPrimitiveWrapper.noOpRetain()
				
						// pendingHtlcsVector.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = BumpTransactionEvent(cType: nativeCallResult, instantiationContext: "BumpTransactionEvent.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new HTLCResolution-variant BumpTransactionEvent
					public class func initWithHtlcresolution(claimId: [UInt8], targetFeerateSatPer1000Weight: UInt32, htlcDescriptors: [HTLCDescriptor], txLockTime: UInt32) -> BumpTransactionEvent {
						// native call variable prep
						
						let claimIdPrimitiveWrapper = ThirtyTwoBytes(value: claimId, instantiationContext: "BumpTransactionEvent.swift::\(#function):\(#line)")
				
						let htlcDescriptorsVector = Vec_HTLCDescriptorZ(array: htlcDescriptors, instantiationContext: "BumpTransactionEvent.swift::\(#function):\(#line)").dangle()
				

						// native method call
						let nativeCallResult = BumpTransactionEvent_htlcresolution(claimIdPrimitiveWrapper.cType!, targetFeerateSatPer1000Weight, htlcDescriptorsVector.cType!, txLockTime)

						// cleanup
						
						// for elided types, we need this
						claimIdPrimitiveWrapper.noOpRetain()
				
						// htlcDescriptorsVector.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = BumpTransactionEvent(cType: nativeCallResult, instantiationContext: "BumpTransactionEvent.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Checks if two BumpTransactionEvents contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					public class func eq(a: BumpTransactionEvent, b: BumpTransactionEvent) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKBumpTransactionEvent>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKBumpTransactionEvent>) in
				BumpTransactionEvent_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					
					public func getValueAsChannelClose() -> ChannelClose? {
						if self.cType?.tag != LDKBumpTransactionEvent_ChannelClose {
							return nil
						}

						return BumpTransactionEvent_LDKChannelClose_Body(cType: self.cType!.channel_close, instantiationContext: "BumpTransactionEvent.swift::\(#function):\(#line)", anchor: self)
					}
			
					public func getValueAsHtlcResolution() -> HTLCResolution? {
						if self.cType?.tag != LDKBumpTransactionEvent_HTLCResolution {
							return nil
						}

						return BumpTransactionEvent_LDKHTLCResolution_Body(cType: self.cType!.htlc_resolution, instantiationContext: "BumpTransactionEvent.swift::\(#function):\(#line)", anchor: self)
					}
			

					
					internal func danglingClone() -> BumpTransactionEvent {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing BumpTransactionEvent \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing BumpTransactionEvent \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

					
					
					/// 
					internal typealias BumpTransactionEvent_LDKChannelClose_Body = ChannelClose
			

					/// 
					public class ChannelClose: NativeTypeWrapper {

						

						
						/// Set to false to suppress an individual type's deinit log statements.
						/// Only applicable when log threshold is set to `.Debug`.
						public static var enableDeinitLogging = true

						/// Set to true to suspend the freeing of this type's associated Rust memory.
						/// Should only ever be used for debugging purposes, and will likely be
						/// deprecated soon.
						public static var suspendFreedom = false

						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKBumpTransactionEvent_LDKChannelClose_Body?

						internal init(cType: LDKBumpTransactionEvent_LDKChannelClose_Body, instantiationContext: String) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						}

						internal init(cType: LDKBumpTransactionEvent_LDKChannelClose_Body, instantiationContext: String, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}

						internal init(cType: LDKBumpTransactionEvent_LDKChannelClose_Body, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
							self.dangling = dangle
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The unique identifier for the claim of the anchor output in the commitment transaction.
						/// 
						/// The identifier must map to the set of external UTXOs assigned to the claim, such that
						/// they can be reused when a new claim with the same identifier needs to be made, resulting
						/// in a fee-bumping attempt.
						public func getClaimId() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = ThirtyTwoBytes(cType: self.cType!.claim_id, instantiationContext: "BumpTransactionEvent.swift::\(#function):\(#line)", anchor: self).getValue()

							return returnValue;
						}
		
						/// The target feerate that the transaction package, which consists of the commitment
						/// transaction and the to-be-crafted child anchor transaction, must meet.
						public func getPackageTargetFeerateSatPer1000Weight() -> UInt32 {
							// return value (do some wrapping)
							let returnValue = self.cType!.package_target_feerate_sat_per_1000_weight

							return returnValue;
						}
		
						/// The channel's commitment transaction to bump the fee of. This transaction should be
						/// broadcast along with the anchor transaction constructed as a result of consuming this
						/// event.
						public func getCommitmentTx() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = Transaction(cType: self.cType!.commitment_tx, instantiationContext: "BumpTransactionEvent.swift::\(#function):\(#line)", anchor: self).getValue()

							return returnValue;
						}
		
						/// The absolute fee in satoshis of the commitment transaction. This can be used along the
						/// with weight of the commitment transaction to determine its feerate.
						public func getCommitmentTxFeeSatoshis() -> UInt64 {
							// return value (do some wrapping)
							let returnValue = self.cType!.commitment_tx_fee_satoshis

							return returnValue;
						}
		
						/// The descriptor to sign the anchor input of the anchor transaction constructed as a
						/// result of consuming this event.
						public func getAnchorDescriptor() -> Bindings.AnchorDescriptor {
							// return value (do some wrapping)
							let returnValue = Bindings.AnchorDescriptor(cType: self.cType!.anchor_descriptor, instantiationContext: "BumpTransactionEvent.swift::\(#function):\(#line)", anchor: self)

							return returnValue;
						}
		
						/// The set of pending HTLCs on the commitment transaction that need to be resolved once the
						/// commitment transaction confirms.
						public func getPendingHtlcs() -> [HTLCOutputInCommitment] {
							// return value (do some wrapping)
							let returnValue = Vec_HTLCOutputInCommitmentZ(cType: self.cType!.pending_htlcs, instantiationContext: "BumpTransactionEvent.swift::\(#function):\(#line)", anchor: self).getValue()

							return returnValue;
						}
		

											

					}

					
		
					
					/// 
					internal typealias BumpTransactionEvent_LDKHTLCResolution_Body = HTLCResolution
			

					/// 
					public class HTLCResolution: NativeTypeWrapper {

						

						
						/// Set to false to suppress an individual type's deinit log statements.
						/// Only applicable when log threshold is set to `.Debug`.
						public static var enableDeinitLogging = true

						/// Set to true to suspend the freeing of this type's associated Rust memory.
						/// Should only ever be used for debugging purposes, and will likely be
						/// deprecated soon.
						public static var suspendFreedom = false

						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKBumpTransactionEvent_LDKHTLCResolution_Body?

						internal init(cType: LDKBumpTransactionEvent_LDKHTLCResolution_Body, instantiationContext: String) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						}

						internal init(cType: LDKBumpTransactionEvent_LDKHTLCResolution_Body, instantiationContext: String, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}

						internal init(cType: LDKBumpTransactionEvent_LDKHTLCResolution_Body, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
							self.dangling = dangle
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The unique identifier for the claim of the HTLCs in the confirmed commitment
						/// transaction.
						/// 
						/// The identifier must map to the set of external UTXOs assigned to the claim, such that
						/// they can be reused when a new claim with the same identifier needs to be made, resulting
						/// in a fee-bumping attempt.
						public func getClaimId() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = ThirtyTwoBytes(cType: self.cType!.claim_id, instantiationContext: "BumpTransactionEvent.swift::\(#function):\(#line)", anchor: self).getValue()

							return returnValue;
						}
		
						/// The target feerate that the resulting HTLC transaction must meet.
						public func getTargetFeerateSatPer1000Weight() -> UInt32 {
							// return value (do some wrapping)
							let returnValue = self.cType!.target_feerate_sat_per_1000_weight

							return returnValue;
						}
		
						/// The set of pending HTLCs on the confirmed commitment that need to be claimed, preferably
						/// by the same transaction.
						public func getHtlcDescriptors() -> [HTLCDescriptor] {
							// return value (do some wrapping)
							let returnValue = Vec_HTLCDescriptorZ(cType: self.cType!.htlc_descriptors, instantiationContext: "BumpTransactionEvent.swift::\(#function):\(#line)", anchor: self).getValue()

							return returnValue;
						}
		
						/// The locktime required for the resulting HTLC transaction.
						public func getTxLockTime() -> UInt32 {
							// return value (do some wrapping)
							let returnValue = self.cType!.tx_lock_time

							return returnValue;
						}
		

											

					}

					
		

				}

			}
		