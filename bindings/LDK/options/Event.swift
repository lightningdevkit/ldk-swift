public class Event {

	private static var instanceCounter: UInt = 0
	internal let instanceNumber: UInt
	internal private(set) var dangling = false

    public internal(set) var cOpaqueStruct: LDKEvent?;

	

    public init(pointer: LDKEvent){
    	Self.instanceCounter += 1
		self.instanceNumber = Self.instanceCounter
		self.cOpaqueStruct = pointer
	}

    /* OPTION_METHODS_START */

				public enum EventValueType {
					case FundingGenerationReady, PaymentReceived, PaymentSent, PaymentFailed, PendingHTLCsForwardable, SpendableOutputs, PaymentForwarded
				}
				
				public func getValueType() -> EventValueType? {
					switch self.cOpaqueStruct?.tag {
                    
					case LDKEvent_FundingGenerationReady:
						return .FundingGenerationReady
					case LDKEvent_PaymentReceived:
						return .PaymentReceived
					case LDKEvent_PaymentSent:
						return .PaymentSent
					case LDKEvent_PaymentFailed:
						return .PaymentFailed
					case LDKEvent_PendingHTLCsForwardable:
						return .PendingHTLCsForwardable
					case LDKEvent_SpendableOutputs:
						return .SpendableOutputs
					case LDKEvent_PaymentForwarded:
						return .PaymentForwarded
                    default:
                        return nil
                    }
				}
				
				
					public func getValueAsFundingGenerationReady() -> FundingGenerationReady? {
						if self.cOpaqueStruct?.tag != LDKEvent_FundingGenerationReady {
							return nil
						}
						return FundingGenerationReady(pointer: self.cOpaqueStruct!.funding_generation_ready)
					}
				
					public func getValueAsPaymentReceived() -> PaymentReceived? {
						if self.cOpaqueStruct?.tag != LDKEvent_PaymentReceived {
							return nil
						}
						return PaymentReceived(pointer: self.cOpaqueStruct!.payment_received)
					}
				
					public func getValueAsPaymentSent() -> PaymentSent? {
						if self.cOpaqueStruct?.tag != LDKEvent_PaymentSent {
							return nil
						}
						return PaymentSent(pointer: self.cOpaqueStruct!.payment_sent)
					}
				
					public func getValueAsPaymentFailed() -> PaymentFailed? {
						if self.cOpaqueStruct?.tag != LDKEvent_PaymentFailed {
							return nil
						}
						return PaymentFailed(pointer: self.cOpaqueStruct!.payment_failed)
					}
				
					public func getValueAsPendingHTLCsForwardable() -> PendingHTLCsForwardable? {
						if self.cOpaqueStruct?.tag != LDKEvent_PendingHTLCsForwardable {
							return nil
						}
						return PendingHTLCsForwardable(pointer: self.cOpaqueStruct!.pending_htl_cs_forwardable)
					}
				
					public func getValueAsSpendableOutputs() -> SpendableOutputs? {
						if self.cOpaqueStruct?.tag != LDKEvent_SpendableOutputs {
							return nil
						}
						return SpendableOutputs(pointer: self.cOpaqueStruct!.spendable_outputs)
					}
				
					public func getValueAsPaymentForwarded() -> PaymentForwarded? {
						if self.cOpaqueStruct?.tag != LDKEvent_PaymentForwarded {
							return nil
						}
						return PaymentForwarded(pointer: self.cOpaqueStruct!.payment_forwarded)
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
							print("Freeing Event \(self.instanceNumber).")
							self.free()
						} else {
							print("Not freeing Event \(self.instanceNumber) due to dangle.")
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
					
        return Event(pointer: Event_funding_generation_ready(Bindings.new_LDKThirtyTwoBytes(array: temporary_channel_id), channel_value_satoshis, output_scriptWrapper.cOpaqueStruct!, user_channel_id));
    }

    public class func payment_received(payment_hash: [UInt8], amt: UInt64, purpose: PaymentPurpose) -> Event {
    	
        return Event(pointer: Event_payment_received(Bindings.new_LDKThirtyTwoBytes(array: payment_hash), amt, purpose.danglingClone().cOpaqueStruct!));
    }

    public class func payment_sent(payment_preimage: [UInt8]) -> Event {
    	
        return Event(pointer: Event_payment_sent(Bindings.new_LDKThirtyTwoBytes(array: payment_preimage)));
    }

    public class func payment_failed(payment_hash: [UInt8], rejected_by_dest: Bool) -> Event {
    	
        return Event(pointer: Event_payment_failed(Bindings.new_LDKThirtyTwoBytes(array: payment_hash), rejected_by_dest));
    }

    public class func pending_htlcs_forwardable(time_forwardable: UInt64) -> Event {
    	
        return Event(pointer: Event_pending_htlcs_forwardable(time_forwardable));
    }

    public class func spendable_outputs(outputs: [LDKSpendableOutputDescriptor]) -> Event {
    	
						let outputsWrapper = Bindings.new_LDKCVec_SpendableOutputDescriptorZWrapper(array: outputs)
						defer {
							outputsWrapper.noOpRetain()
						}
					
        return Event(pointer: Event_spendable_outputs(outputsWrapper.cOpaqueStruct!));
    }

    public class func payment_forwarded(fee_earned_msat: Option_u64Z, claim_from_onchain_tx: Bool) -> Event {
    	
        return Event(pointer: Event_payment_forwarded(fee_earned_msat.danglingClone().cOpaqueStruct!, claim_from_onchain_tx));
    }

    public func write() -> [UInt8] {
    	
        return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKEvent>) in
Event_write(objPointer)
});
    }

    /* OPTION_METHODS_END */

	

			public class FundingGenerationReady {
				
				
				var cOpaqueStruct: LDKEvent_LDKFundingGenerationReady_Body?;
				fileprivate init(pointer: LDKEvent_LDKFundingGenerationReady_Body) {
					self.cOpaqueStruct = pointer
				}
			
				
				
					public func getTemporary_channel_id() -> [UInt8] {
						return Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.temporary_channel_id)
					}
				
					public func getChannel_value_satoshis() -> UInt64 {
						return self.cOpaqueStruct!.channel_value_satoshis
					}
				
					public func getOutput_script() -> [UInt8] {
						return Bindings.LDKCVec_u8Z_to_array(nativeType: self.cOpaqueStruct!.output_script)
					}
				
					public func getUser_channel_id() -> UInt64 {
						return self.cOpaqueStruct!.user_channel_id
					}
				
				
			}
		

			public class PaymentReceived {
				
				
				var cOpaqueStruct: LDKEvent_LDKPaymentReceived_Body?;
				fileprivate init(pointer: LDKEvent_LDKPaymentReceived_Body) {
					self.cOpaqueStruct = pointer
				}
			
				
				
					public func getPayment_hash() -> [UInt8] {
						return Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.payment_hash)
					}
				
					public func getAmt() -> UInt64 {
						return self.cOpaqueStruct!.amt
					}
				
					public func getPurpose() -> PaymentPurpose {
						return PaymentPurpose(pointer: self.cOpaqueStruct!.purpose)
					}
				
				
			}
		

			public class PaymentSent {
				
				
				var cOpaqueStruct: LDKEvent_LDKPaymentSent_Body?;
				fileprivate init(pointer: LDKEvent_LDKPaymentSent_Body) {
					self.cOpaqueStruct = pointer
				}
			
				
				
					public func getPayment_preimage() -> [UInt8] {
						return Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.payment_preimage)
					}
				
				
			}
		

			public class PaymentFailed {
				
				
				var cOpaqueStruct: LDKEvent_LDKPaymentFailed_Body?;
				fileprivate init(pointer: LDKEvent_LDKPaymentFailed_Body) {
					self.cOpaqueStruct = pointer
				}
			
				
				
					public func getPayment_hash() -> [UInt8] {
						return Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.payment_hash)
					}
				
					public func getRejected_by_dest() -> Bool {
						return self.cOpaqueStruct!.rejected_by_dest
					}
				
				
			}
		

			public class PendingHTLCsForwardable {
				
				
				var cOpaqueStruct: LDKEvent_LDKPendingHTLCsForwardable_Body?;
				fileprivate init(pointer: LDKEvent_LDKPendingHTLCsForwardable_Body) {
					self.cOpaqueStruct = pointer
				}
			
				
				
					public func getTime_forwardable() -> UInt64 {
						return self.cOpaqueStruct!.time_forwardable
					}
				
				
			}
		

			public class SpendableOutputs {
				
				
				var cOpaqueStruct: LDKEvent_LDKSpendableOutputs_Body?;
				fileprivate init(pointer: LDKEvent_LDKSpendableOutputs_Body) {
					self.cOpaqueStruct = pointer
				}
			
				
				
					public func getOutputs() -> [LDKSpendableOutputDescriptor] {
						return Bindings.LDKCVec_SpendableOutputDescriptorZ_to_array(nativeType: self.cOpaqueStruct!.outputs)
					}
				
				
			}
		

			public class PaymentForwarded {
				
				
				var cOpaqueStruct: LDKEvent_LDKPaymentForwarded_Body?;
				fileprivate init(pointer: LDKEvent_LDKPaymentForwarded_Body) {
					self.cOpaqueStruct = pointer
				}
			
				
				
					public func getFee_earned_msat() -> Option_u64Z {
						return Option_u64Z(pointer: self.cOpaqueStruct!.fee_earned_msat)
					}
				
					public func getClaim_from_onchain_tx() -> Bool {
						return self.cOpaqueStruct!.claim_from_onchain_tx
					}
				
				
			}
		
}
