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
					case FundingGenerationReady, PaymentReceived, PaymentSent, PaymentFailed, PendingHTLCsForwardable, SpendableOutputs
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
				
			
    public func free() -> Void {
    	
        return Event_free(self.clone().cOpaqueStruct!);
    }

    public func clone() -> Event {
    	
        return Event(pointer: withUnsafePointer(to: self.cOpaqueStruct!) { (origPointer: UnsafePointer<LDKEvent>) in
Event_clone(origPointer)
});
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
				
					public func getPayment_preimage() -> [UInt8] {
						return Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.payment_preimage)
					}
				
					public func getPayment_secret() -> [UInt8] {
						return Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.payment_secret)
					}
				
					public func getAmt() -> UInt64 {
						return self.cOpaqueStruct!.amt
					}
				
					public func getUser_payment_id() -> UInt64 {
						return self.cOpaqueStruct!.user_payment_id
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
		
}
