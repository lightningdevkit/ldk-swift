public class Event: NativeTypeWrapper {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt

    internal var cOpaqueStruct: LDKEvent?

	

    public init(pointer: LDKEvent){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
	}

	public init(pointer: LDKEvent, anchor: NativeTypeWrapper){
		Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
		super.init(conflictAvoidingVariableName: 0)
		self.dangling = true
		try! self.addAnchor(anchor: anchor)
	}

    /* OPTION_METHODS_START */

				public enum EventValueType {
					case FundingGenerationReady, PaymentReceived, PaymentSent, PaymentPathFailed, PaymentFailed, PendingHTLCsForwardable, SpendableOutputs, PaymentForwarded, ChannelClosed, DiscardFunding, PaymentPathSuccessful, OpenChannelRequest
				}
				
				public func getValueType() -> EventValueType? {
					switch self.cOpaqueStruct?.tag {
                    
					case LDKEvent_FundingGenerationReady:
						return .FundingGenerationReady
					case LDKEvent_PaymentReceived:
						return .PaymentReceived
					case LDKEvent_PaymentSent:
						return .PaymentSent
					case LDKEvent_PaymentPathFailed:
						return .PaymentPathFailed
					case LDKEvent_PaymentFailed:
						return .PaymentFailed
					case LDKEvent_PendingHTLCsForwardable:
						return .PendingHTLCsForwardable
					case LDKEvent_SpendableOutputs:
						return .SpendableOutputs
					case LDKEvent_PaymentForwarded:
						return .PaymentForwarded
					case LDKEvent_ChannelClosed:
						return .ChannelClosed
					case LDKEvent_DiscardFunding:
						return .DiscardFunding
					case LDKEvent_PaymentPathSuccessful:
						return .PaymentPathSuccessful
					case LDKEvent_OpenChannelRequest:
						return .OpenChannelRequest
                    default:
                        return nil
                    }
				}
				
				
					public func getValueAsFundingGenerationReady() -> FundingGenerationReady? {
						if self.cOpaqueStruct?.tag != LDKEvent_FundingGenerationReady {
							return nil
						}
						return FundingGenerationReady(pointer: self.cOpaqueStruct!.funding_generation_ready, anchor: self)
					}
				
					public func getValueAsPaymentReceived() -> PaymentReceived? {
						if self.cOpaqueStruct?.tag != LDKEvent_PaymentReceived {
							return nil
						}
						return PaymentReceived(pointer: self.cOpaqueStruct!.payment_received, anchor: self)
					}
				
					public func getValueAsPaymentSent() -> PaymentSent? {
						if self.cOpaqueStruct?.tag != LDKEvent_PaymentSent {
							return nil
						}
						return PaymentSent(pointer: self.cOpaqueStruct!.payment_sent, anchor: self)
					}
				
					public func getValueAsPaymentPathFailed() -> PaymentPathFailed? {
						if self.cOpaqueStruct?.tag != LDKEvent_PaymentPathFailed {
							return nil
						}
						return PaymentPathFailed(pointer: self.cOpaqueStruct!.payment_path_failed, anchor: self)
					}
				
					public func getValueAsPaymentFailed() -> PaymentFailed? {
						if self.cOpaqueStruct?.tag != LDKEvent_PaymentFailed {
							return nil
						}
						return PaymentFailed(pointer: self.cOpaqueStruct!.payment_failed, anchor: self)
					}
				
					public func getValueAsPendingHTLCsForwardable() -> PendingHTLCsForwardable? {
						if self.cOpaqueStruct?.tag != LDKEvent_PendingHTLCsForwardable {
							return nil
						}
						return PendingHTLCsForwardable(pointer: self.cOpaqueStruct!.pending_htl_cs_forwardable, anchor: self)
					}
				
					public func getValueAsSpendableOutputs() -> SpendableOutputs? {
						if self.cOpaqueStruct?.tag != LDKEvent_SpendableOutputs {
							return nil
						}
						return SpendableOutputs(pointer: self.cOpaqueStruct!.spendable_outputs, anchor: self)
					}
				
					public func getValueAsPaymentForwarded() -> PaymentForwarded? {
						if self.cOpaqueStruct?.tag != LDKEvent_PaymentForwarded {
							return nil
						}
						return PaymentForwarded(pointer: self.cOpaqueStruct!.payment_forwarded, anchor: self)
					}
				
					public func getValueAsChannelClosed() -> ChannelClosed? {
						if self.cOpaqueStruct?.tag != LDKEvent_ChannelClosed {
							return nil
						}
						return ChannelClosed(pointer: self.cOpaqueStruct!.channel_closed, anchor: self)
					}
				
					public func getValueAsDiscardFunding() -> DiscardFunding? {
						if self.cOpaqueStruct?.tag != LDKEvent_DiscardFunding {
							return nil
						}
						return DiscardFunding(pointer: self.cOpaqueStruct!.discard_funding, anchor: self)
					}
				
					public func getValueAsPaymentPathSuccessful() -> PaymentPathSuccessful? {
						if self.cOpaqueStruct?.tag != LDKEvent_PaymentPathSuccessful {
							return nil
						}
						return PaymentPathSuccessful(pointer: self.cOpaqueStruct!.payment_path_successful, anchor: self)
					}
				
					public func getValueAsOpenChannelRequest() -> OpenChannelRequest? {
						if self.cOpaqueStruct?.tag != LDKEvent_OpenChannelRequest {
							return nil
						}
						return OpenChannelRequest(pointer: self.cOpaqueStruct!.open_channel_request, anchor: self)
					}
				
			
    internal func free() -> Void {
    	
        return Event_free(self.cOpaqueStruct!);
    }

					internal func dangle() -> Event {
        				self.dangling = true
						return self
					}
					
					deinit {
						if !self.dangling {
							Bindings.print("Freeing Event \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Event \(self.instanceNumber) due to dangle.")
						}
					}
				

    public func clone() -> Event {
    	
        return Event(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKEvent>) in
Event_clone(origPointer)
});
    }

					internal func danglingClone() -> Event {
        				let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
				

    public class func funding_generation_ready(temporary_channel_id: [UInt8], channel_value_satoshis: UInt64, output_script: [UInt8], user_channel_id: UInt64) -> Event {
    	
						let output_scriptWrapper = Bindings.new_LDKCVec_u8ZWrapper(array: output_script)
						defer {
							output_scriptWrapper.noOpRetain()
						}
					
        return Event(pointer: Event_funding_generation_ready(Bindings.new_LDKThirtyTwoBytes(array: temporary_channel_id), channel_value_satoshis, output_scriptWrapper.dangle().cOpaqueStruct!, user_channel_id));
    }

    public class func payment_received(payment_hash: [UInt8], amt: UInt64, purpose: PaymentPurpose) -> Event {
    	
        return Event(pointer: Event_payment_received(Bindings.new_LDKThirtyTwoBytes(array: payment_hash), amt, purpose.danglingClone().cOpaqueStruct!));
    }

    public class func payment_sent(payment_id: [UInt8], payment_preimage: [UInt8], payment_hash: [UInt8], fee_paid_msat: Option_u64Z) -> Event {
    	
        return Event(pointer: Event_payment_sent(Bindings.new_LDKThirtyTwoBytes(array: payment_id), Bindings.new_LDKThirtyTwoBytes(array: payment_preimage), Bindings.new_LDKThirtyTwoBytes(array: payment_hash), fee_paid_msat.danglingClone().cOpaqueStruct!));
    }

    public class func payment_path_failed(payment_id: [UInt8], payment_hash: [UInt8], rejected_by_dest: Bool, network_update: Option_NetworkUpdateZ, all_paths_failed: Bool, path: [RouteHop], short_channel_id: Option_u64Z, retry: RouteParameters) -> Event {
    	
							let pathUnwrapped = path.map { (pathCurrentValue) in
							pathCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
						let pathWrapper = Bindings.new_LDKCVec_RouteHopZWrapper(array: pathUnwrapped)
						defer {
							pathWrapper.noOpRetain()
						}
					
        return Event(pointer: Event_payment_path_failed(Bindings.new_LDKThirtyTwoBytes(array: payment_id), Bindings.new_LDKThirtyTwoBytes(array: payment_hash), rejected_by_dest, network_update.danglingClone().cOpaqueStruct!, all_paths_failed, pathWrapper.dangle().cOpaqueStruct!, short_channel_id.danglingClone().cOpaqueStruct!, retry.danglingClone().cOpaqueStruct!));
    }

    public class func payment_failed(payment_id: [UInt8], payment_hash: [UInt8]) -> Event {
    	
        return Event(pointer: Event_payment_failed(Bindings.new_LDKThirtyTwoBytes(array: payment_id), Bindings.new_LDKThirtyTwoBytes(array: payment_hash)));
    }

    public class func pending_htlcs_forwardable(time_forwardable: UInt64) -> Event {
    	
        return Event(pointer: Event_pending_htlcs_forwardable(time_forwardable));
    }

    public class func spendable_outputs(outputs: [SpendableOutputDescriptor]) -> Event {
    	
							let outputsUnwrapped = outputs.map { (outputsCurrentValue) in
							outputsCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
						let outputsWrapper = Bindings.new_LDKCVec_SpendableOutputDescriptorZWrapper(array: outputsUnwrapped)
						defer {
							outputsWrapper.noOpRetain()
						}
					
        return Event(pointer: Event_spendable_outputs(outputsWrapper.dangle().cOpaqueStruct!));
    }

    public class func payment_forwarded(fee_earned_msat: Option_u64Z, claim_from_onchain_tx: Bool) -> Event {
    	
        return Event(pointer: Event_payment_forwarded(fee_earned_msat.danglingClone().cOpaqueStruct!, claim_from_onchain_tx));
    }

    public class func channel_closed(channel_id: [UInt8], user_channel_id: UInt64, reason: ClosureReason) -> Event {
    	
        return Event(pointer: Event_channel_closed(Bindings.new_LDKThirtyTwoBytes(array: channel_id), user_channel_id, reason.danglingClone().cOpaqueStruct!));
    }

    public class func discard_funding(channel_id: [UInt8], transaction: [UInt8]) -> Event {
    	
						let transactionWrapper = Bindings.new_LDKTransactionWrapper(array: transaction)
						defer {
							transactionWrapper.noOpRetain()
						}
					
        return Event(pointer: Event_discard_funding(Bindings.new_LDKThirtyTwoBytes(array: channel_id), transactionWrapper.dangle().cOpaqueStruct!));
    }

    public class func payment_path_successful(payment_id: [UInt8], payment_hash: [UInt8], path: [RouteHop]) -> Event {
    	
							let pathUnwrapped = path.map { (pathCurrentValue) in
							pathCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
						let pathWrapper = Bindings.new_LDKCVec_RouteHopZWrapper(array: pathUnwrapped)
						defer {
							pathWrapper.noOpRetain()
						}
					
        return Event(pointer: Event_payment_path_successful(Bindings.new_LDKThirtyTwoBytes(array: payment_id), Bindings.new_LDKThirtyTwoBytes(array: payment_hash), pathWrapper.dangle().cOpaqueStruct!));
    }

    public class func open_channel_request(temporary_channel_id: [UInt8], counterparty_node_id: [UInt8], funding_satoshis: UInt64, push_msat: UInt64, channel_type: ChannelTypeFeatures) -> Event {
    	
        return Event(pointer: Event_open_channel_request(Bindings.new_LDKThirtyTwoBytes(array: temporary_channel_id), Bindings.new_LDKPublicKey(array: counterparty_node_id), funding_satoshis, push_msat, channel_type.danglingClone().cOpaqueStruct!));
    }

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKEvent>) in
Event_write(objPointer)
});
    }

    public class func read(ser: [UInt8]) -> Result_COption_EventZDecodeErrorZ {
    	
						let serWrapper = Bindings.new_LDKu8sliceWrapper(array: ser)
						defer {
							serWrapper.noOpRetain()
						}
					
        return Result_COption_EventZDecodeErrorZ(pointer: Event_read(serWrapper.cOpaqueStruct!));
    }

    /* OPTION_METHODS_END */

	

			public class FundingGenerationReady: NativeTypeWrapper {
				
				
				var cOpaqueStruct: LDKEvent_LDKFundingGenerationReady_Body?;
				fileprivate init(pointer: LDKEvent_LDKFundingGenerationReady_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKEvent_LDKFundingGenerationReady_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			
				
				
					public func getTemporary_channel_id() -> [UInt8] {
						return Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.temporary_channel_id)
					}
				
					public func getChannel_value_satoshis() -> UInt64 {
						return self.cOpaqueStruct!.channel_value_satoshis
					}
				
					public func getOutput_script() -> [UInt8] {
						return Bindings.LDKCVec_u8Z_to_array(nativeType: self.cOpaqueStruct!.output_script, deallocate: false)
					}
				
					public func getUser_channel_id() -> UInt64 {
						return self.cOpaqueStruct!.user_channel_id
					}
				
				
			}
		

			public class PaymentReceived: NativeTypeWrapper {
				
				
				var cOpaqueStruct: LDKEvent_LDKPaymentReceived_Body?;
				fileprivate init(pointer: LDKEvent_LDKPaymentReceived_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKEvent_LDKPaymentReceived_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			
				
				
					public func getPayment_hash() -> [UInt8] {
						return Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.payment_hash)
					}
				
					public func getAmt() -> UInt64 {
						return self.cOpaqueStruct!.amt
					}
				
					public func getPurpose() -> PaymentPurpose {
						return PaymentPurpose(pointer: self.cOpaqueStruct!.purpose, anchor: self)
					}
				
				
			}
		

			public class PaymentSent: NativeTypeWrapper {
				
				
				var cOpaqueStruct: LDKEvent_LDKPaymentSent_Body?;
				fileprivate init(pointer: LDKEvent_LDKPaymentSent_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKEvent_LDKPaymentSent_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			
				
				
					public func getPayment_id() -> [UInt8] {
						return Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.payment_id)
					}
				
					public func getPayment_preimage() -> [UInt8] {
						return Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.payment_preimage)
					}
				
					public func getPayment_hash() -> [UInt8] {
						return Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.payment_hash)
					}
				
					public func getFee_paid_msat() -> Option_u64Z {
						return Option_u64Z(pointer: self.cOpaqueStruct!.fee_paid_msat, anchor: self)
					}
				
				
			}
		

			public class PaymentPathFailed: NativeTypeWrapper {
				
				
				var cOpaqueStruct: LDKEvent_LDKPaymentPathFailed_Body?;
				fileprivate init(pointer: LDKEvent_LDKPaymentPathFailed_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKEvent_LDKPaymentPathFailed_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			
				
				
					public func getPayment_id() -> [UInt8] {
						return Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.payment_id)
					}
				
					public func getPayment_hash() -> [UInt8] {
						return Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.payment_hash)
					}
				
					public func getRejected_by_dest() -> Bool {
						return self.cOpaqueStruct!.rejected_by_dest
					}
				
					public func getNetwork_update() -> Option_NetworkUpdateZ {
						return Option_NetworkUpdateZ(pointer: self.cOpaqueStruct!.network_update, anchor: self)
					}
				
					public func getAll_paths_failed() -> Bool {
						return self.cOpaqueStruct!.all_paths_failed
					}
				
					public func getPath() -> [RouteHop] {
						return Bindings.LDKCVec_RouteHopZ_to_array(nativeType: self.cOpaqueStruct!.path, deallocate: false)
						
						.map { (cOpaqueStruct) in
							RouteHop(pointer: cOpaqueStruct).dangle()
						}
					
					}
				
					public func getShort_channel_id() -> Option_u64Z {
						return Option_u64Z(pointer: self.cOpaqueStruct!.short_channel_id, anchor: self)
					}
				
					public func getRetry() -> RouteParameters {
						return RouteParameters(pointer: self.cOpaqueStruct!.retry, anchor: self)
					}
				
				
			}
		

			public class PaymentFailed: NativeTypeWrapper {
				
				
				var cOpaqueStruct: LDKEvent_LDKPaymentFailed_Body?;
				fileprivate init(pointer: LDKEvent_LDKPaymentFailed_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKEvent_LDKPaymentFailed_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			
				
				
					public func getPayment_id() -> [UInt8] {
						return Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.payment_id)
					}
				
					public func getPayment_hash() -> [UInt8] {
						return Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.payment_hash)
					}
				
				
			}
		

			public class PendingHTLCsForwardable: NativeTypeWrapper {
				
				
				var cOpaqueStruct: LDKEvent_LDKPendingHTLCsForwardable_Body?;
				fileprivate init(pointer: LDKEvent_LDKPendingHTLCsForwardable_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKEvent_LDKPendingHTLCsForwardable_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			
				
				
					public func getTime_forwardable() -> UInt64 {
						return self.cOpaqueStruct!.time_forwardable
					}
				
				
			}
		

			public class SpendableOutputs: NativeTypeWrapper {
				
				
				var cOpaqueStruct: LDKEvent_LDKSpendableOutputs_Body?;
				fileprivate init(pointer: LDKEvent_LDKSpendableOutputs_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKEvent_LDKSpendableOutputs_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			
				
				
					public func getOutputs() -> [SpendableOutputDescriptor] {
						return Bindings.LDKCVec_SpendableOutputDescriptorZ_to_array(nativeType: self.cOpaqueStruct!.outputs, deallocate: false)
						
						.map { (cOpaqueStruct) in
							SpendableOutputDescriptor(pointer: cOpaqueStruct).dangle()
						}
					
					}
				
				
			}
		

			public class PaymentForwarded: NativeTypeWrapper {
				
				
				var cOpaqueStruct: LDKEvent_LDKPaymentForwarded_Body?;
				fileprivate init(pointer: LDKEvent_LDKPaymentForwarded_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKEvent_LDKPaymentForwarded_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			
				
				
					public func getFee_earned_msat() -> Option_u64Z {
						return Option_u64Z(pointer: self.cOpaqueStruct!.fee_earned_msat, anchor: self)
					}
				
					public func getClaim_from_onchain_tx() -> Bool {
						return self.cOpaqueStruct!.claim_from_onchain_tx
					}
				
				
			}
		

			public class ChannelClosed: NativeTypeWrapper {
				
				
				var cOpaqueStruct: LDKEvent_LDKChannelClosed_Body?;
				fileprivate init(pointer: LDKEvent_LDKChannelClosed_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKEvent_LDKChannelClosed_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			
				
				
					public func getChannel_id() -> [UInt8] {
						return Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.channel_id)
					}
				
					public func getUser_channel_id() -> UInt64 {
						return self.cOpaqueStruct!.user_channel_id
					}
				
					public func getReason() -> ClosureReason {
						return ClosureReason(pointer: self.cOpaqueStruct!.reason, anchor: self)
					}
				
				
			}
		

			public class DiscardFunding: NativeTypeWrapper {
				
				
				var cOpaqueStruct: LDKEvent_LDKDiscardFunding_Body?;
				fileprivate init(pointer: LDKEvent_LDKDiscardFunding_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKEvent_LDKDiscardFunding_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			
				
				
					public func getChannel_id() -> [UInt8] {
						return Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.channel_id)
					}
				
					public func getTransaction() -> [UInt8] {
						return Bindings.LDKTransaction_to_array(nativeType: self.cOpaqueStruct!.transaction, deallocate: false)
					}
				
				
			}
		

			public class PaymentPathSuccessful: NativeTypeWrapper {
				
				
				var cOpaqueStruct: LDKEvent_LDKPaymentPathSuccessful_Body?;
				fileprivate init(pointer: LDKEvent_LDKPaymentPathSuccessful_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKEvent_LDKPaymentPathSuccessful_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			
				
				
					public func getPayment_id() -> [UInt8] {
						return Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.payment_id)
					}
				
					public func getPayment_hash() -> [UInt8] {
						return Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.payment_hash)
					}
				
					public func getPath() -> [RouteHop] {
						return Bindings.LDKCVec_RouteHopZ_to_array(nativeType: self.cOpaqueStruct!.path, deallocate: false)
						
						.map { (cOpaqueStruct) in
							RouteHop(pointer: cOpaqueStruct).dangle()
						}
					
					}
				
				
			}
		

			public class OpenChannelRequest: NativeTypeWrapper {
				
				
				var cOpaqueStruct: LDKEvent_LDKOpenChannelRequest_Body?;
				fileprivate init(pointer: LDKEvent_LDKOpenChannelRequest_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKEvent_LDKOpenChannelRequest_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			
				
				
					public func getTemporary_channel_id() -> [UInt8] {
						return Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.temporary_channel_id)
					}
				
					public func getCounterparty_node_id() -> [UInt8] {
						return Bindings.LDKPublicKey_to_array(nativeType: self.cOpaqueStruct!.counterparty_node_id)
					}
				
					public func getFunding_satoshis() -> UInt64 {
						return self.cOpaqueStruct!.funding_satoshis
					}
				
					public func getPush_msat() -> UInt64 {
						return self.cOpaqueStruct!.push_msat
					}
				
					public func getChannel_type() -> ChannelTypeFeatures {
						return ChannelTypeFeatures(pointer: self.cOpaqueStruct!.channel_type, anchor: self)
					}
				
				
			}
		
}
