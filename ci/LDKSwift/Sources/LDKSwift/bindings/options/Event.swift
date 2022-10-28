#if SWIFT_PACKAGE
import LDKHeaders
#endif

public typealias Event = Bindings.Event

extension Bindings {

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
					case FundingGenerationReady, PaymentReceived, PaymentClaimed, PaymentSent, PaymentFailed, PaymentPathSuccessful, PaymentPathFailed, ProbeSuccessful, ProbeFailed, PendingHTLCsForwardable, SpendableOutputs, PaymentForwarded, ChannelClosed, DiscardFunding, OpenChannelRequest, HTLCHandlingFailed
				}

				public func getValueType() -> EventValueType? {
					switch self.cOpaqueStruct?.tag {
                    
					case LDKEvent_FundingGenerationReady:
						return .FundingGenerationReady
					case LDKEvent_PaymentReceived:
						return .PaymentReceived
					case LDKEvent_PaymentClaimed:
						return .PaymentClaimed
					case LDKEvent_PaymentSent:
						return .PaymentSent
					case LDKEvent_PaymentFailed:
						return .PaymentFailed
					case LDKEvent_PaymentPathSuccessful:
						return .PaymentPathSuccessful
					case LDKEvent_PaymentPathFailed:
						return .PaymentPathFailed
					case LDKEvent_ProbeSuccessful:
						return .ProbeSuccessful
					case LDKEvent_ProbeFailed:
						return .ProbeFailed
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
					case LDKEvent_OpenChannelRequest:
						return .OpenChannelRequest
					case LDKEvent_HTLCHandlingFailed:
						return .HTLCHandlingFailed
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
				
					public func getValueAsPaymentClaimed() -> PaymentClaimed? {
						if self.cOpaqueStruct?.tag != LDKEvent_PaymentClaimed {
							return nil
						}
						return PaymentClaimed(pointer: self.cOpaqueStruct!.payment_claimed, anchor: self)
					}
				
					public func getValueAsPaymentSent() -> PaymentSent? {
						if self.cOpaqueStruct?.tag != LDKEvent_PaymentSent {
							return nil
						}
						return PaymentSent(pointer: self.cOpaqueStruct!.payment_sent, anchor: self)
					}
				
					public func getValueAsPaymentFailed() -> PaymentFailed? {
						if self.cOpaqueStruct?.tag != LDKEvent_PaymentFailed {
							return nil
						}
						return PaymentFailed(pointer: self.cOpaqueStruct!.payment_failed, anchor: self)
					}
				
					public func getValueAsPaymentPathSuccessful() -> PaymentPathSuccessful? {
						if self.cOpaqueStruct?.tag != LDKEvent_PaymentPathSuccessful {
							return nil
						}
						return PaymentPathSuccessful(pointer: self.cOpaqueStruct!.payment_path_successful, anchor: self)
					}
				
					public func getValueAsPaymentPathFailed() -> PaymentPathFailed? {
						if self.cOpaqueStruct?.tag != LDKEvent_PaymentPathFailed {
							return nil
						}
						return PaymentPathFailed(pointer: self.cOpaqueStruct!.payment_path_failed, anchor: self)
					}
				
					public func getValueAsProbeSuccessful() -> ProbeSuccessful? {
						if self.cOpaqueStruct?.tag != LDKEvent_ProbeSuccessful {
							return nil
						}
						return ProbeSuccessful(pointer: self.cOpaqueStruct!.probe_successful, anchor: self)
					}
				
					public func getValueAsProbeFailed() -> ProbeFailed? {
						if self.cOpaqueStruct?.tag != LDKEvent_ProbeFailed {
							return nil
						}
						return ProbeFailed(pointer: self.cOpaqueStruct!.probe_failed, anchor: self)
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
				
					public func getValueAsOpenChannelRequest() -> OpenChannelRequest? {
						if self.cOpaqueStruct?.tag != LDKEvent_OpenChannelRequest {
							return nil
						}
						return OpenChannelRequest(pointer: self.cOpaqueStruct!.open_channel_request, anchor: self)
					}
				
					public func getValueAsHTLCHandlingFailed() -> HTLCHandlingFailed? {
						if self.cOpaqueStruct?.tag != LDKEvent_HTLCHandlingFailed {
							return nil
						}
						return HTLCHandlingFailed(pointer: self.cOpaqueStruct!.htlc_handling_failed, anchor: self)
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
				

		public class func funding_generation_ready(temporary_channel_id: [UInt8], counterparty_node_id: [UInt8], channel_value_satoshis: UInt64, output_script: [UInt8], user_channel_id: UInt64) -> Event {
			
						let output_scriptWrapper = Bindings.new_LDKCVec_u8ZWrapper(array: output_script)
						defer {
							output_scriptWrapper.noOpRetain()
						}
					
			return Event(pointer: Event_funding_generation_ready(Bindings.new_LDKThirtyTwoBytes(array: temporary_channel_id), Bindings.new_LDKPublicKey(array: counterparty_node_id), channel_value_satoshis, output_scriptWrapper.dangle().cOpaqueStruct!, user_channel_id));
		}

		public class func payment_received(payment_hash: [UInt8], amount_msat: UInt64, purpose: Bindings.PaymentPurpose) -> Event {
			
			return Event(pointer: Event_payment_received(Bindings.new_LDKThirtyTwoBytes(array: payment_hash), amount_msat, purpose.danglingClone().cOpaqueStruct!));
		}

		public class func payment_claimed(payment_hash: [UInt8], amount_msat: UInt64, purpose: Bindings.PaymentPurpose) -> Event {
			
			return Event(pointer: Event_payment_claimed(Bindings.new_LDKThirtyTwoBytes(array: payment_hash), amount_msat, purpose.danglingClone().cOpaqueStruct!));
		}

		public class func payment_sent(payment_id: [UInt8], payment_preimage: [UInt8], payment_hash: [UInt8], fee_paid_msat: Bindings.Option_u64Z) -> Event {
			
			return Event(pointer: Event_payment_sent(Bindings.new_LDKThirtyTwoBytes(array: payment_id), Bindings.new_LDKThirtyTwoBytes(array: payment_preimage), Bindings.new_LDKThirtyTwoBytes(array: payment_hash), fee_paid_msat.danglingClone().cOpaqueStruct!));
		}

		public class func payment_failed(payment_id: [UInt8], payment_hash: [UInt8]) -> Event {
			
			return Event(pointer: Event_payment_failed(Bindings.new_LDKThirtyTwoBytes(array: payment_id), Bindings.new_LDKThirtyTwoBytes(array: payment_hash)));
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

		public class func payment_path_failed(payment_id: [UInt8], payment_hash: [UInt8], payment_failed_permanently: Bool, network_update: Bindings.Option_NetworkUpdateZ, all_paths_failed: Bool, path: [RouteHop], short_channel_id: Bindings.Option_u64Z, retry: Bindings.RouteParameters) -> Event {
			
							let pathUnwrapped = path.map { (pathCurrentValue) in
							pathCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
						let pathWrapper = Bindings.new_LDKCVec_RouteHopZWrapper(array: pathUnwrapped)
						defer {
							pathWrapper.noOpRetain()
						}
					
			return Event(pointer: Event_payment_path_failed(Bindings.new_LDKThirtyTwoBytes(array: payment_id), Bindings.new_LDKThirtyTwoBytes(array: payment_hash), payment_failed_permanently, network_update.danglingClone().cOpaqueStruct!, all_paths_failed, pathWrapper.dangle().cOpaqueStruct!, short_channel_id.danglingClone().cOpaqueStruct!, retry.danglingClone().cOpaqueStruct!));
		}

		public class func probe_successful(payment_id: [UInt8], payment_hash: [UInt8], path: [RouteHop]) -> Event {
			
							let pathUnwrapped = path.map { (pathCurrentValue) in
							pathCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
						let pathWrapper = Bindings.new_LDKCVec_RouteHopZWrapper(array: pathUnwrapped)
						defer {
							pathWrapper.noOpRetain()
						}
					
			return Event(pointer: Event_probe_successful(Bindings.new_LDKThirtyTwoBytes(array: payment_id), Bindings.new_LDKThirtyTwoBytes(array: payment_hash), pathWrapper.dangle().cOpaqueStruct!));
		}

		public class func probe_failed(payment_id: [UInt8], payment_hash: [UInt8], path: [RouteHop], short_channel_id: Bindings.Option_u64Z) -> Event {
			
							let pathUnwrapped = path.map { (pathCurrentValue) in
							pathCurrentValue
								.danglingClone().cOpaqueStruct!
							}
						
						let pathWrapper = Bindings.new_LDKCVec_RouteHopZWrapper(array: pathUnwrapped)
						defer {
							pathWrapper.noOpRetain()
						}
					
			return Event(pointer: Event_probe_failed(Bindings.new_LDKThirtyTwoBytes(array: payment_id), Bindings.new_LDKThirtyTwoBytes(array: payment_hash), pathWrapper.dangle().cOpaqueStruct!, short_channel_id.danglingClone().cOpaqueStruct!));
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

		public class func payment_forwarded(prev_channel_id: [UInt8], next_channel_id: [UInt8], fee_earned_msat: Bindings.Option_u64Z, claim_from_onchain_tx: Bool) -> Event {
			
			return Event(pointer: Event_payment_forwarded(Bindings.new_LDKThirtyTwoBytes(array: prev_channel_id), Bindings.new_LDKThirtyTwoBytes(array: next_channel_id), fee_earned_msat.danglingClone().cOpaqueStruct!, claim_from_onchain_tx));
		}

		public class func channel_closed(channel_id: [UInt8], user_channel_id: UInt64, reason: Bindings.ClosureReason) -> Event {
			
			return Event(pointer: Event_channel_closed(Bindings.new_LDKThirtyTwoBytes(array: channel_id), user_channel_id, reason.danglingClone().cOpaqueStruct!));
		}

		public class func discard_funding(channel_id: [UInt8], transaction: [UInt8]) -> Event {
			
						let transactionWrapper = Bindings.new_LDKTransactionWrapper(array: transaction)
						defer {
							transactionWrapper.noOpRetain()
						}
					
			return Event(pointer: Event_discard_funding(Bindings.new_LDKThirtyTwoBytes(array: channel_id), transactionWrapper.dangle().cOpaqueStruct!));
		}

		public class func open_channel_request(temporary_channel_id: [UInt8], counterparty_node_id: [UInt8], funding_satoshis: UInt64, push_msat: UInt64, channel_type: Bindings.ChannelTypeFeatures) -> Event {
			
			return Event(pointer: Event_open_channel_request(Bindings.new_LDKThirtyTwoBytes(array: temporary_channel_id), Bindings.new_LDKPublicKey(array: counterparty_node_id), funding_satoshis, push_msat, channel_type.danglingClone().cOpaqueStruct!));
		}

		public class func htlchandling_failed(prev_channel_id: [UInt8], failed_next_destination: Bindings.HTLCDestination) -> Event {
			
			return Event(pointer: Event_htlchandling_failed(Bindings.new_LDKThirtyTwoBytes(array: prev_channel_id), failed_next_destination.danglingClone().cOpaqueStruct!));
		}

		public func write() -> [UInt8] {
			
			return Bindings.LDKCVec_u8Z_to_array(nativeType: withUnsafePointer(to: self.cOpaqueStruct!) { (objPointer: UnsafePointer<LDKEvent>) in
Event_write(objPointer)
}, callerContext: "Event::write");
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
				
					public func getCounterparty_node_id() -> [UInt8] {
						return Bindings.LDKPublicKey_to_array(nativeType: self.cOpaqueStruct!.counterparty_node_id)
					}
				
					public func getChannel_value_satoshis() -> UInt64 {
						return self.cOpaqueStruct!.channel_value_satoshis
					}
				
					public func getOutput_script() -> [UInt8] {
						return Bindings.LDKCVec_u8Z_to_array(nativeType: self.cOpaqueStruct!.output_script, callerContext: "Event::FundingGenerationReady::getOutput_script", deallocate: false)
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
				
					public func getAmount_msat() -> UInt64 {
						return self.cOpaqueStruct!.amount_msat
					}
				
					public func getPurpose() -> Bindings.PaymentPurpose {
						return Bindings.PaymentPurpose(pointer: self.cOpaqueStruct!.purpose, anchor: self)
					}
				

			}
		

			public class PaymentClaimed: NativeTypeWrapper {

				
				var cOpaqueStruct: LDKEvent_LDKPaymentClaimed_Body?;
				fileprivate init(pointer: LDKEvent_LDKPaymentClaimed_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKEvent_LDKPaymentClaimed_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			

				
					public func getPayment_hash() -> [UInt8] {
						return Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.payment_hash)
					}
				
					public func getAmount_msat() -> UInt64 {
						return self.cOpaqueStruct!.amount_msat
					}
				
					public func getPurpose() -> Bindings.PaymentPurpose {
						return Bindings.PaymentPurpose(pointer: self.cOpaqueStruct!.purpose, anchor: self)
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
				
					public func getFee_paid_msat() -> Bindings.Option_u64Z {
						return Bindings.Option_u64Z(pointer: self.cOpaqueStruct!.fee_paid_msat, anchor: self)
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
						return Bindings.LDKCVec_RouteHopZ_to_array(nativeType: self.cOpaqueStruct!.path, callerContext: "Event::PaymentPathSuccessful::getPath", deallocate: false)
						
						.map { (cOpaqueStruct) in
							RouteHop(pointer: cOpaqueStruct).dangle()
						}
					
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
				
					public func getPayment_failed_permanently() -> Bool {
						return self.cOpaqueStruct!.payment_failed_permanently
					}
				
					public func getNetwork_update() -> Bindings.Option_NetworkUpdateZ {
						return Bindings.Option_NetworkUpdateZ(pointer: self.cOpaqueStruct!.network_update, anchor: self)
					}
				
					public func getAll_paths_failed() -> Bool {
						return self.cOpaqueStruct!.all_paths_failed
					}
				
					public func getPath() -> [RouteHop] {
						return Bindings.LDKCVec_RouteHopZ_to_array(nativeType: self.cOpaqueStruct!.path, callerContext: "Event::PaymentPathFailed::getPath", deallocate: false)
						
						.map { (cOpaqueStruct) in
							RouteHop(pointer: cOpaqueStruct).dangle()
						}
					
					}
				
					public func getShort_channel_id() -> Bindings.Option_u64Z {
						return Bindings.Option_u64Z(pointer: self.cOpaqueStruct!.short_channel_id, anchor: self)
					}
				
					public func getRetry() -> Bindings.RouteParameters {
						return Bindings.RouteParameters(pointer: self.cOpaqueStruct!.retry, anchor: self)
					}
				

			}
		

			public class ProbeSuccessful: NativeTypeWrapper {

				
				var cOpaqueStruct: LDKEvent_LDKProbeSuccessful_Body?;
				fileprivate init(pointer: LDKEvent_LDKProbeSuccessful_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKEvent_LDKProbeSuccessful_Body, anchor: NativeTypeWrapper) {
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
						return Bindings.LDKCVec_RouteHopZ_to_array(nativeType: self.cOpaqueStruct!.path, callerContext: "Event::ProbeSuccessful::getPath", deallocate: false)
						
						.map { (cOpaqueStruct) in
							RouteHop(pointer: cOpaqueStruct).dangle()
						}
					
					}
				

			}
		

			public class ProbeFailed: NativeTypeWrapper {

				
				var cOpaqueStruct: LDKEvent_LDKProbeFailed_Body?;
				fileprivate init(pointer: LDKEvent_LDKProbeFailed_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKEvent_LDKProbeFailed_Body, anchor: NativeTypeWrapper) {
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
						return Bindings.LDKCVec_RouteHopZ_to_array(nativeType: self.cOpaqueStruct!.path, callerContext: "Event::ProbeFailed::getPath", deallocate: false)
						
						.map { (cOpaqueStruct) in
							RouteHop(pointer: cOpaqueStruct).dangle()
						}
					
					}
				
					public func getShort_channel_id() -> Bindings.Option_u64Z {
						return Bindings.Option_u64Z(pointer: self.cOpaqueStruct!.short_channel_id, anchor: self)
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
						return Bindings.LDKCVec_SpendableOutputDescriptorZ_to_array(nativeType: self.cOpaqueStruct!.outputs, callerContext: "Event::SpendableOutputs::getOutputs", deallocate: false)
						
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
			

				
					public func getPrev_channel_id() -> [UInt8] {
						return Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.prev_channel_id)
					}
				
					public func getNext_channel_id() -> [UInt8] {
						return Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.next_channel_id)
					}
				
					public func getFee_earned_msat() -> Bindings.Option_u64Z {
						return Bindings.Option_u64Z(pointer: self.cOpaqueStruct!.fee_earned_msat, anchor: self)
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
				
					public func getReason() -> Bindings.ClosureReason {
						return Bindings.ClosureReason(pointer: self.cOpaqueStruct!.reason, anchor: self)
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
						return Bindings.LDKTransaction_to_array(nativeType: self.cOpaqueStruct!.transaction, callerContext: "Event::DiscardFunding::getTransaction", deallocate: false)
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
				
					public func getChannel_type() -> Bindings.ChannelTypeFeatures {
						return Bindings.ChannelTypeFeatures(pointer: self.cOpaqueStruct!.channel_type, anchor: self)
					}
				

			}
		

			public class HTLCHandlingFailed: NativeTypeWrapper {

				
				var cOpaqueStruct: LDKEvent_LDKHTLCHandlingFailed_Body?;
				fileprivate init(pointer: LDKEvent_LDKHTLCHandlingFailed_Body) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
				}
				fileprivate init(pointer: LDKEvent_LDKHTLCHandlingFailed_Body, anchor: NativeTypeWrapper) {
					self.cOpaqueStruct = pointer
					super.init(conflictAvoidingVariableName: 0)
					self.dangling = true
					try! self.addAnchor(anchor: anchor)
				}
			

				
					public func getPrev_channel_id() -> [UInt8] {
						return Bindings.LDKThirtyTwoBytes_to_array(nativeType: self.cOpaqueStruct!.prev_channel_id)
					}
				
					public func getFailed_next_destination() -> Bindings.HTLCDestination {
						return Bindings.HTLCDestination(pointer: self.cOpaqueStruct!.failed_next_destination, anchor: self)
					}
				

			}
		
	}

}
