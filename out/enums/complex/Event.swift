
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			/// 
			public typealias Event = Bindings.Event

			extension Bindings {

				/// An Event which you should probably take some action in response to.
				/// 
				/// Note that while Writeable and Readable are implemented for Event, you probably shouldn't use
				/// them directly as they don't round-trip exactly (for example FundingGenerationReady is never
				/// written as it makes no sense to respond to it after reconnecting to peers).
				public class Event: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKEvent?

					internal init(cType: LDKEvent) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKEvent, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public enum EventType {
						
						/// Used to indicate that the client should generate a funding transaction with the given
						/// parameters and then call [`ChannelManager::funding_transaction_generated`].
						/// Generated in [`ChannelManager`] message handling.
						/// Note that *all inputs* in the funding transaction must spend SegWit outputs or your
						/// counterparty can steal your funds!
						/// 
						/// [`ChannelManager`]: crate::ln::channelmanager::ChannelManager
						/// [`ChannelManager::funding_transaction_generated`]: crate::ln::channelmanager::ChannelManager::funding_transaction_generated
						case FundingGenerationReady
			
						/// Indicates that we've been offered a payment and it needs to be claimed via calling
						/// [`ChannelManager::claim_funds`] with the preimage given in [`PaymentPurpose`].
						/// 
						/// Note that if the preimage is not known, you should call
						/// [`ChannelManager::fail_htlc_backwards`] to free up resources for this HTLC and avoid
						/// network congestion.
						/// If you fail to call either [`ChannelManager::claim_funds`] or
						/// [`ChannelManager::fail_htlc_backwards`] within the HTLC's timeout, the HTLC will be
						/// automatically failed.
						/// 
						/// # Note
						/// LDK will not stop an inbound payment from being paid multiple times, so multiple
						/// `PaymentClaimable` events may be generated for the same payment.
						/// 
						/// # Note
						/// This event used to be called `PaymentReceived` in LDK versions 0.0.112 and earlier.
						/// 
						/// [`ChannelManager::claim_funds`]: crate::ln::channelmanager::ChannelManager::claim_funds
						/// [`ChannelManager::fail_htlc_backwards`]: crate::ln::channelmanager::ChannelManager::fail_htlc_backwards
						case PaymentClaimable
			
						/// Indicates a payment has been claimed and we've received money!
						/// 
						/// This most likely occurs when [`ChannelManager::claim_funds`] has been called in response
						/// to an [`Event::PaymentClaimable`]. However, if we previously crashed during a
						/// [`ChannelManager::claim_funds`] call you may see this event without a corresponding
						/// [`Event::PaymentClaimable`] event.
						/// 
						/// # Note
						/// LDK will not stop an inbound payment from being paid multiple times, so multiple
						/// `PaymentClaimable` events may be generated for the same payment. If you then call
						/// [`ChannelManager::claim_funds`] twice for the same [`Event::PaymentClaimable`] you may get
						/// multiple `PaymentClaimed` events.
						/// 
						/// [`ChannelManager::claim_funds`]: crate::ln::channelmanager::ChannelManager::claim_funds
						case PaymentClaimed
			
						/// Indicates an outbound payment we made succeeded (i.e. it made it all the way to its target
						/// and we got back the payment preimage for it).
						/// 
						/// Note for MPP payments: in rare cases, this event may be preceded by a `PaymentPathFailed`
						/// event. In this situation, you SHOULD treat this payment as having succeeded.
						case PaymentSent
			
						/// Indicates an outbound payment failed. Individual [`Event::PaymentPathFailed`] events
						/// provide failure information for each MPP part in the payment.
						/// 
						/// This event is provided once there are no further pending HTLCs for the payment and the
						/// payment is no longer retryable due to [`ChannelManager::abandon_payment`] having been
						/// called for the corresponding payment.
						/// 
						/// [`ChannelManager::abandon_payment`]: crate::ln::channelmanager::ChannelManager::abandon_payment
						case PaymentFailed
			
						/// Indicates that a path for an outbound payment was successful.
						/// 
						/// Always generated after [`Event::PaymentSent`] and thus useful for scoring channels. See
						/// [`Event::PaymentSent`] for obtaining the payment preimage.
						case PaymentPathSuccessful
			
						/// Indicates an outbound HTLC we sent failed. Probably some intermediary node dropped
						/// something. You may wish to retry with a different route.
						/// 
						/// If you have given up retrying this payment and wish to fail it, you MUST call
						/// [`ChannelManager::abandon_payment`] at least once for a given [`PaymentId`] or memory
						/// related to payment tracking will leak.
						/// 
						/// Note that this does *not* indicate that all paths for an MPP payment have failed, see
						/// [`Event::PaymentFailed`] and [`all_paths_failed`].
						/// 
						/// [`ChannelManager::abandon_payment`]: crate::ln::channelmanager::ChannelManager::abandon_payment
						/// [`all_paths_failed`]: Self::PaymentPathFailed::all_paths_failed
						case PaymentPathFailed
			
						/// Indicates that a probe payment we sent returned successful, i.e., only failed at the destination.
						case ProbeSuccessful
			
						/// Indicates that a probe payment we sent failed at an intermediary node on the path.
						case ProbeFailed
			
						/// Used to indicate that [`ChannelManager::process_pending_htlc_forwards`] should be called at
						/// a time in the future.
						/// 
						/// [`ChannelManager::process_pending_htlc_forwards`]: crate::ln::channelmanager::ChannelManager::process_pending_htlc_forwards
						case PendingHTLCsForwardable
			
						/// Used to indicate that we've intercepted an HTLC forward. This event will only be generated if
						/// you've encoded an intercept scid in the receiver's invoice route hints using
						/// [`ChannelManager::get_intercept_scid`] and have set [`UserConfig::accept_intercept_htlcs`].
						/// 
						/// [`ChannelManager::forward_intercepted_htlc`] or
						/// [`ChannelManager::fail_intercepted_htlc`] MUST be called in response to this event. See
						/// their docs for more information.
						/// 
						/// [`ChannelManager::get_intercept_scid`]: crate::ln::channelmanager::ChannelManager::get_intercept_scid
						/// [`UserConfig::accept_intercept_htlcs`]: crate::util::config::UserConfig::accept_intercept_htlcs
						/// [`ChannelManager::forward_intercepted_htlc`]: crate::ln::channelmanager::ChannelManager::forward_intercepted_htlc
						/// [`ChannelManager::fail_intercepted_htlc`]: crate::ln::channelmanager::ChannelManager::fail_intercepted_htlc
						case HTLCIntercepted
			
						/// Used to indicate that an output which you should know how to spend was confirmed on chain
						/// and is now spendable.
						/// Such an output will *not* ever be spent by rust-lightning, and are not at risk of your
						/// counterparty spending them due to some kind of timeout. Thus, you need to store them
						/// somewhere and spend them when you create on-chain transactions.
						case SpendableOutputs
			
						/// This event is generated when a payment has been successfully forwarded through us and a
						/// forwarding fee earned.
						case PaymentForwarded
			
						/// Used to indicate that a channel with the given `channel_id` is ready to
						/// be used. This event is emitted either when the funding transaction has been confirmed
						/// on-chain, or, in case of a 0conf channel, when both parties have confirmed the channel
						/// establishment.
						case ChannelReady
			
						/// Used to indicate that a previously opened channel with the given `channel_id` is in the
						/// process of closure.
						case ChannelClosed
			
						/// Used to indicate to the user that they can abandon the funding transaction and recycle the
						/// inputs for another purpose.
						case DiscardFunding
			
						/// Indicates a request to open a new channel by a peer.
						/// 
						/// To accept the request, call [`ChannelManager::accept_inbound_channel`]. To reject the
						/// request, call [`ChannelManager::force_close_without_broadcasting_txn`].
						/// 
						/// The event is only triggered when a new open channel request is received and the
						/// [`UserConfig::manually_accept_inbound_channels`] config flag is set to true.
						/// 
						/// [`ChannelManager::accept_inbound_channel`]: crate::ln::channelmanager::ChannelManager::accept_inbound_channel
						/// [`ChannelManager::force_close_without_broadcasting_txn`]: crate::ln::channelmanager::ChannelManager::force_close_without_broadcasting_txn
						/// [`UserConfig::manually_accept_inbound_channels`]: crate::util::config::UserConfig::manually_accept_inbound_channels
						case OpenChannelRequest
			
						/// Indicates that the HTLC was accepted, but could not be processed when or after attempting to
						/// forward it.
						/// 
						/// Some scenarios where this event may be sent include:
						/// * Insufficient capacity in the outbound channel
						/// * While waiting to forward the HTLC, the channel it is meant to be forwarded through closes
						/// * When an unknown SCID is requested for forwarding a payment.
						/// * Claiming an amount for an MPP payment that exceeds the HTLC total
						/// * The HTLC has timed out
						/// 
						/// This event, however, does not get generated if an HTLC fails to meet the forwarding
						/// requirements (i.e. insufficient fees paid, or a CLTV that is too soon).
						case HTLCHandlingFailed
			
					}

					public func getValueType() -> EventType {
						switch self.cType!.tag {
							case LDKEvent_FundingGenerationReady:
								return .FundingGenerationReady
			
							case LDKEvent_PaymentClaimable:
								return .PaymentClaimable
			
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
			
							case LDKEvent_HTLCIntercepted:
								return .HTLCIntercepted
			
							case LDKEvent_SpendableOutputs:
								return .SpendableOutputs
			
							case LDKEvent_PaymentForwarded:
								return .PaymentForwarded
			
							case LDKEvent_ChannelReady:
								return .ChannelReady
			
							case LDKEvent_ChannelClosed:
								return .ChannelClosed
			
							case LDKEvent_DiscardFunding:
								return .DiscardFunding
			
							case LDKEvent_OpenChannelRequest:
								return .OpenChannelRequest
			
							case LDKEvent_HTLCHandlingFailed:
								return .HTLCHandlingFailed
			
							default:
								Bindings.print("Error: Invalid value type for Event! Aborting.", severity: .ERROR)
								abort()
						}
		
					}

					
					/// Frees any resources used by the Event
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Event_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the Event
					internal func clone() -> Event {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKEvent>) in
				Event_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Event(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new FundingGenerationReady-variant Event
					public class func initWithFundingGenerationReady(temporaryChannelId: [UInt8], counterpartyNodeId: [UInt8], channelValueSatoshis: UInt64, outputScript: [UInt8], userChannelId: [UInt8]) -> Event {
						// native call variable prep
						
						let temporaryChannelIdPrimitiveWrapper = ThirtyTwoBytes(value: temporaryChannelId)
				
						let counterpartyNodeIdPrimitiveWrapper = PublicKey(value: counterpartyNodeId)
				
						let outputScriptVector = Vec_u8Z(array: outputScript).dangle()
				
						let userChannelIdPrimitiveWrapper = U128(value: userChannelId)
				

						// native method call
						let nativeCallResult = Event_funding_generation_ready(temporaryChannelIdPrimitiveWrapper.cType!, counterpartyNodeIdPrimitiveWrapper.cType!, channelValueSatoshis, outputScriptVector.cType!, userChannelIdPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						temporaryChannelIdPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						counterpartyNodeIdPrimitiveWrapper.noOpRetain()
				
						// outputScriptVector.noOpRetain()
				
						// for elided types, we need this
						userChannelIdPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Event(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new PaymentClaimable-variant Event
					public class func initWithPaymentClaimable(receiverNodeId: [UInt8], paymentHash: [UInt8], amountMsat: UInt64, purpose: PaymentPurpose, viaChannelId: [UInt8], viaUserChannelId: [UInt8]?) -> Event {
						// native call variable prep
						
						let receiverNodeIdPrimitiveWrapper = PublicKey(value: receiverNodeId)
				
						let paymentHashPrimitiveWrapper = ThirtyTwoBytes(value: paymentHash)
				
						let viaChannelIdPrimitiveWrapper = ThirtyTwoBytes(value: viaChannelId)
				
						let viaUserChannelIdOption = Option_u128Z(some: viaUserChannelId).danglingClone()
				

						// native method call
						let nativeCallResult = Event_payment_claimable(receiverNodeIdPrimitiveWrapper.cType!, paymentHashPrimitiveWrapper.cType!, amountMsat, purpose.danglingClone().cType!, viaChannelIdPrimitiveWrapper.cType!, viaUserChannelIdOption.cType!)

						// cleanup
						
						// for elided types, we need this
						receiverNodeIdPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						paymentHashPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						viaChannelIdPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Event(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new PaymentClaimed-variant Event
					public class func initWithPaymentClaimed(receiverNodeId: [UInt8], paymentHash: [UInt8], amountMsat: UInt64, purpose: PaymentPurpose) -> Event {
						// native call variable prep
						
						let receiverNodeIdPrimitiveWrapper = PublicKey(value: receiverNodeId)
				
						let paymentHashPrimitiveWrapper = ThirtyTwoBytes(value: paymentHash)
				

						// native method call
						let nativeCallResult = Event_payment_claimed(receiverNodeIdPrimitiveWrapper.cType!, paymentHashPrimitiveWrapper.cType!, amountMsat, purpose.danglingClone().cType!)

						// cleanup
						
						// for elided types, we need this
						receiverNodeIdPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						paymentHashPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Event(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new PaymentSent-variant Event
					public class func initWithPaymentSent(paymentId: [UInt8], paymentPreimage: [UInt8], paymentHash: [UInt8], feePaidMsat: UInt64?) -> Event {
						// native call variable prep
						
						let paymentIdPrimitiveWrapper = ThirtyTwoBytes(value: paymentId)
				
						let paymentPreimagePrimitiveWrapper = ThirtyTwoBytes(value: paymentPreimage)
				
						let paymentHashPrimitiveWrapper = ThirtyTwoBytes(value: paymentHash)
				
						let feePaidMsatOption = Option_u64Z(some: feePaidMsat).danglingClone()
				

						// native method call
						let nativeCallResult = Event_payment_sent(paymentIdPrimitiveWrapper.cType!, paymentPreimagePrimitiveWrapper.cType!, paymentHashPrimitiveWrapper.cType!, feePaidMsatOption.cType!)

						// cleanup
						
						// for elided types, we need this
						paymentIdPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						paymentPreimagePrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						paymentHashPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Event(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new PaymentFailed-variant Event
					public class func initWithPaymentFailed(paymentId: [UInt8], paymentHash: [UInt8]) -> Event {
						// native call variable prep
						
						let paymentIdPrimitiveWrapper = ThirtyTwoBytes(value: paymentId)
				
						let paymentHashPrimitiveWrapper = ThirtyTwoBytes(value: paymentHash)
				

						// native method call
						let nativeCallResult = Event_payment_failed(paymentIdPrimitiveWrapper.cType!, paymentHashPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						paymentIdPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						paymentHashPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Event(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new PaymentPathSuccessful-variant Event
					public class func initWithPaymentPathSuccessful(paymentId: [UInt8], paymentHash: [UInt8], path: [RouteHop]) -> Event {
						// native call variable prep
						
						let paymentIdPrimitiveWrapper = ThirtyTwoBytes(value: paymentId)
				
						let paymentHashPrimitiveWrapper = ThirtyTwoBytes(value: paymentHash)
				
						let pathVector = Vec_RouteHopZ(array: path).dangle()
				

						// native method call
						let nativeCallResult = Event_payment_path_successful(paymentIdPrimitiveWrapper.cType!, paymentHashPrimitiveWrapper.cType!, pathVector.cType!)

						// cleanup
						
						// for elided types, we need this
						paymentIdPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						paymentHashPrimitiveWrapper.noOpRetain()
				
						// pathVector.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Event(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new PaymentPathFailed-variant Event
					public class func initWithPaymentPathFailed(paymentId: [UInt8], paymentHash: [UInt8], paymentFailedPermanently: Bool, networkUpdate: NetworkUpdate?, allPathsFailed: Bool, path: [RouteHop], shortChannelId: UInt64?, retry: Bindings.RouteParameters) -> Event {
						// native call variable prep
						
						let paymentIdPrimitiveWrapper = ThirtyTwoBytes(value: paymentId)
				
						let paymentHashPrimitiveWrapper = ThirtyTwoBytes(value: paymentHash)
				
						let networkUpdateOption = Option_NetworkUpdateZ(some: networkUpdate).danglingClone()
				
						let pathVector = Vec_RouteHopZ(array: path).dangle()
				
						let shortChannelIdOption = Option_u64Z(some: shortChannelId).danglingClone()
				

						// native method call
						let nativeCallResult = Event_payment_path_failed(paymentIdPrimitiveWrapper.cType!, paymentHashPrimitiveWrapper.cType!, paymentFailedPermanently, networkUpdateOption.cType!, allPathsFailed, pathVector.cType!, shortChannelIdOption.cType!, retry.dynamicallyDangledClone().cType!)

						// cleanup
						
						// for elided types, we need this
						paymentIdPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						paymentHashPrimitiveWrapper.noOpRetain()
				
						// pathVector.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Event(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new ProbeSuccessful-variant Event
					public class func initWithProbeSuccessful(paymentId: [UInt8], paymentHash: [UInt8], path: [RouteHop]) -> Event {
						// native call variable prep
						
						let paymentIdPrimitiveWrapper = ThirtyTwoBytes(value: paymentId)
				
						let paymentHashPrimitiveWrapper = ThirtyTwoBytes(value: paymentHash)
				
						let pathVector = Vec_RouteHopZ(array: path).dangle()
				

						// native method call
						let nativeCallResult = Event_probe_successful(paymentIdPrimitiveWrapper.cType!, paymentHashPrimitiveWrapper.cType!, pathVector.cType!)

						// cleanup
						
						// for elided types, we need this
						paymentIdPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						paymentHashPrimitiveWrapper.noOpRetain()
				
						// pathVector.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Event(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new ProbeFailed-variant Event
					public class func initWithProbeFailed(paymentId: [UInt8], paymentHash: [UInt8], path: [RouteHop], shortChannelId: UInt64?) -> Event {
						// native call variable prep
						
						let paymentIdPrimitiveWrapper = ThirtyTwoBytes(value: paymentId)
				
						let paymentHashPrimitiveWrapper = ThirtyTwoBytes(value: paymentHash)
				
						let pathVector = Vec_RouteHopZ(array: path).dangle()
				
						let shortChannelIdOption = Option_u64Z(some: shortChannelId).danglingClone()
				

						// native method call
						let nativeCallResult = Event_probe_failed(paymentIdPrimitiveWrapper.cType!, paymentHashPrimitiveWrapper.cType!, pathVector.cType!, shortChannelIdOption.cType!)

						// cleanup
						
						// for elided types, we need this
						paymentIdPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						paymentHashPrimitiveWrapper.noOpRetain()
				
						// pathVector.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Event(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new PendingHTLCsForwardable-variant Event
					public class func initWithPendingHtlcsForwardable(timeForwardable: UInt64) -> Event {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Event_pending_htlcs_forwardable(timeForwardable)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Event(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new HTLCIntercepted-variant Event
					public class func initWithHtlcintercepted(interceptId: [UInt8], requestedNextHopScid: UInt64, paymentHash: [UInt8], inboundAmountMsat: UInt64, expectedOutboundAmountMsat: UInt64) -> Event {
						// native call variable prep
						
						let interceptIdPrimitiveWrapper = ThirtyTwoBytes(value: interceptId)
				
						let paymentHashPrimitiveWrapper = ThirtyTwoBytes(value: paymentHash)
				

						// native method call
						let nativeCallResult = Event_htlcintercepted(interceptIdPrimitiveWrapper.cType!, requestedNextHopScid, paymentHashPrimitiveWrapper.cType!, inboundAmountMsat, expectedOutboundAmountMsat)

						// cleanup
						
						// for elided types, we need this
						interceptIdPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						paymentHashPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Event(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new SpendableOutputs-variant Event
					public class func initWithSpendableOutputs(outputs: [SpendableOutputDescriptor]) -> Event {
						// native call variable prep
						
						let outputsVector = Vec_SpendableOutputDescriptorZ(array: outputs).dangle()
				

						// native method call
						let nativeCallResult = Event_spendable_outputs(outputsVector.cType!)

						// cleanup
						
						// outputsVector.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Event(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new PaymentForwarded-variant Event
					public class func initWithPaymentForwarded(prevChannelId: [UInt8], nextChannelId: [UInt8], feeEarnedMsat: UInt64?, claimFromOnchainTx: Bool) -> Event {
						// native call variable prep
						
						let prevChannelIdPrimitiveWrapper = ThirtyTwoBytes(value: prevChannelId)
				
						let nextChannelIdPrimitiveWrapper = ThirtyTwoBytes(value: nextChannelId)
				
						let feeEarnedMsatOption = Option_u64Z(some: feeEarnedMsat).danglingClone()
				

						// native method call
						let nativeCallResult = Event_payment_forwarded(prevChannelIdPrimitiveWrapper.cType!, nextChannelIdPrimitiveWrapper.cType!, feeEarnedMsatOption.cType!, claimFromOnchainTx)

						// cleanup
						
						// for elided types, we need this
						prevChannelIdPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						nextChannelIdPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Event(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new ChannelReady-variant Event
					public class func initWithChannelReady(channelId: [UInt8], userChannelId: [UInt8], counterpartyNodeId: [UInt8], channelType: Bindings.ChannelTypeFeatures) -> Event {
						// native call variable prep
						
						let channelIdPrimitiveWrapper = ThirtyTwoBytes(value: channelId)
				
						let userChannelIdPrimitiveWrapper = U128(value: userChannelId)
				
						let counterpartyNodeIdPrimitiveWrapper = PublicKey(value: counterpartyNodeId)
				

						// native method call
						let nativeCallResult = Event_channel_ready(channelIdPrimitiveWrapper.cType!, userChannelIdPrimitiveWrapper.cType!, counterpartyNodeIdPrimitiveWrapper.cType!, channelType.dynamicallyDangledClone().cType!)

						// cleanup
						
						// for elided types, we need this
						channelIdPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						userChannelIdPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						counterpartyNodeIdPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Event(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new ChannelClosed-variant Event
					public class func initWithChannelClosed(channelId: [UInt8], userChannelId: [UInt8], reason: ClosureReason) -> Event {
						// native call variable prep
						
						let channelIdPrimitiveWrapper = ThirtyTwoBytes(value: channelId)
				
						let userChannelIdPrimitiveWrapper = U128(value: userChannelId)
				

						// native method call
						let nativeCallResult = Event_channel_closed(channelIdPrimitiveWrapper.cType!, userChannelIdPrimitiveWrapper.cType!, reason.danglingClone().cType!)

						// cleanup
						
						// for elided types, we need this
						channelIdPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						userChannelIdPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Event(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new DiscardFunding-variant Event
					public class func initWithDiscardFunding(channelId: [UInt8], transaction: [UInt8]) -> Event {
						// native call variable prep
						
						let channelIdPrimitiveWrapper = ThirtyTwoBytes(value: channelId)
				
						let transactionPrimitiveWrapper = Transaction(value: transaction).dangle()
				

						// native method call
						let nativeCallResult = Event_discard_funding(channelIdPrimitiveWrapper.cType!, transactionPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						channelIdPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						transactionPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Event(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new OpenChannelRequest-variant Event
					public class func initWithOpenChannelRequest(temporaryChannelId: [UInt8], counterpartyNodeId: [UInt8], fundingSatoshis: UInt64, pushMsat: UInt64, channelType: Bindings.ChannelTypeFeatures) -> Event {
						// native call variable prep
						
						let temporaryChannelIdPrimitiveWrapper = ThirtyTwoBytes(value: temporaryChannelId)
				
						let counterpartyNodeIdPrimitiveWrapper = PublicKey(value: counterpartyNodeId)
				

						// native method call
						let nativeCallResult = Event_open_channel_request(temporaryChannelIdPrimitiveWrapper.cType!, counterpartyNodeIdPrimitiveWrapper.cType!, fundingSatoshis, pushMsat, channelType.dynamicallyDangledClone().cType!)

						// cleanup
						
						// for elided types, we need this
						temporaryChannelIdPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						counterpartyNodeIdPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Event(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new HTLCHandlingFailed-variant Event
					public class func initWithHtlchandlingFailed(prevChannelId: [UInt8], failedNextDestination: HTLCDestination) -> Event {
						// native call variable prep
						
						let prevChannelIdPrimitiveWrapper = ThirtyTwoBytes(value: prevChannelId)
				

						// native method call
						let nativeCallResult = Event_htlchandling_failed(prevChannelIdPrimitiveWrapper.cType!, failedNextDestination.danglingClone().cType!)

						// cleanup
						
						// for elided types, we need this
						prevChannelIdPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Event(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Serialize the Event object into a byte array which can be read by Event_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKEvent>) in
				Event_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a Event from a byte array, created by Event_write
					public class func read(ser: [UInt8]) -> Result_COption_EventZDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = Event_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_COption_EventZDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		

					
					public func getValueAsFundingGenerationReady() -> FundingGenerationReady? {
						if self.cType?.tag != LDKEvent_FundingGenerationReady {
							return nil
						}

						return Event_LDKFundingGenerationReady_Body(cType: self.cType!.funding_generation_ready, anchor: self)
					}
			
					public func getValueAsPaymentClaimable() -> PaymentClaimable? {
						if self.cType?.tag != LDKEvent_PaymentClaimable {
							return nil
						}

						return Event_LDKPaymentClaimable_Body(cType: self.cType!.payment_claimable, anchor: self)
					}
			
					public func getValueAsPaymentClaimed() -> PaymentClaimed? {
						if self.cType?.tag != LDKEvent_PaymentClaimed {
							return nil
						}

						return Event_LDKPaymentClaimed_Body(cType: self.cType!.payment_claimed, anchor: self)
					}
			
					public func getValueAsPaymentSent() -> PaymentSent? {
						if self.cType?.tag != LDKEvent_PaymentSent {
							return nil
						}

						return Event_LDKPaymentSent_Body(cType: self.cType!.payment_sent, anchor: self)
					}
			
					public func getValueAsPaymentFailed() -> PaymentFailed? {
						if self.cType?.tag != LDKEvent_PaymentFailed {
							return nil
						}

						return Event_LDKPaymentFailed_Body(cType: self.cType!.payment_failed, anchor: self)
					}
			
					public func getValueAsPaymentPathSuccessful() -> PaymentPathSuccessful? {
						if self.cType?.tag != LDKEvent_PaymentPathSuccessful {
							return nil
						}

						return Event_LDKPaymentPathSuccessful_Body(cType: self.cType!.payment_path_successful, anchor: self)
					}
			
					public func getValueAsPaymentPathFailed() -> PaymentPathFailed? {
						if self.cType?.tag != LDKEvent_PaymentPathFailed {
							return nil
						}

						return Event_LDKPaymentPathFailed_Body(cType: self.cType!.payment_path_failed, anchor: self)
					}
			
					public func getValueAsProbeSuccessful() -> ProbeSuccessful? {
						if self.cType?.tag != LDKEvent_ProbeSuccessful {
							return nil
						}

						return Event_LDKProbeSuccessful_Body(cType: self.cType!.probe_successful, anchor: self)
					}
			
					public func getValueAsProbeFailed() -> ProbeFailed? {
						if self.cType?.tag != LDKEvent_ProbeFailed {
							return nil
						}

						return Event_LDKProbeFailed_Body(cType: self.cType!.probe_failed, anchor: self)
					}
			
					public func getValueAsPendingHtlcsForwardable() -> PendingHTLCsForwardable? {
						if self.cType?.tag != LDKEvent_PendingHTLCsForwardable {
							return nil
						}

						return Event_LDKPendingHTLCsForwardable_Body(cType: self.cType!.pending_htl_cs_forwardable, anchor: self)
					}
			
					public func getValueAsHtlcIntercepted() -> HTLCIntercepted? {
						if self.cType?.tag != LDKEvent_HTLCIntercepted {
							return nil
						}

						return Event_LDKHTLCIntercepted_Body(cType: self.cType!.htlc_intercepted, anchor: self)
					}
			
					public func getValueAsSpendableOutputs() -> SpendableOutputs? {
						if self.cType?.tag != LDKEvent_SpendableOutputs {
							return nil
						}

						return Event_LDKSpendableOutputs_Body(cType: self.cType!.spendable_outputs, anchor: self)
					}
			
					public func getValueAsPaymentForwarded() -> PaymentForwarded? {
						if self.cType?.tag != LDKEvent_PaymentForwarded {
							return nil
						}

						return Event_LDKPaymentForwarded_Body(cType: self.cType!.payment_forwarded, anchor: self)
					}
			
					public func getValueAsChannelReady() -> ChannelReady? {
						if self.cType?.tag != LDKEvent_ChannelReady {
							return nil
						}

						return Event_LDKChannelReady_Body(cType: self.cType!.channel_ready, anchor: self)
					}
			
					public func getValueAsChannelClosed() -> ChannelClosed? {
						if self.cType?.tag != LDKEvent_ChannelClosed {
							return nil
						}

						return Event_LDKChannelClosed_Body(cType: self.cType!.channel_closed, anchor: self)
					}
			
					public func getValueAsDiscardFunding() -> DiscardFunding? {
						if self.cType?.tag != LDKEvent_DiscardFunding {
							return nil
						}

						return Event_LDKDiscardFunding_Body(cType: self.cType!.discard_funding, anchor: self)
					}
			
					public func getValueAsOpenChannelRequest() -> OpenChannelRequest? {
						if self.cType?.tag != LDKEvent_OpenChannelRequest {
							return nil
						}

						return Event_LDKOpenChannelRequest_Body(cType: self.cType!.open_channel_request, anchor: self)
					}
			
					public func getValueAsHtlcHandlingFailed() -> HTLCHandlingFailed? {
						if self.cType?.tag != LDKEvent_HTLCHandlingFailed {
							return nil
						}

						return Event_LDKHTLCHandlingFailed_Body(cType: self.cType!.htlc_handling_failed, anchor: self)
					}
			

					internal func dangle(_ shouldDangle: Bool = true) -> Event {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Event {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Event \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Event \(self.instanceNumber) due to dangle.")
						}
					}
			

					
					
					/// 
					internal typealias Event_LDKFundingGenerationReady_Body = FundingGenerationReady
			

					/// 
					public class FundingGenerationReady: NativeTypeWrapper {

						

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKEvent_LDKFundingGenerationReady_Body?

						internal init(cType: LDKEvent_LDKFundingGenerationReady_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
						}

						internal init(cType: LDKEvent_LDKFundingGenerationReady_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The random channel_id we picked which you'll need to pass into
						/// [`ChannelManager::funding_transaction_generated`].
						/// 
						/// [`ChannelManager::funding_transaction_generated`]: crate::ln::channelmanager::ChannelManager::funding_transaction_generated
						public func getTemporaryChannelId() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = ThirtyTwoBytes(cType: self.cType!.temporary_channel_id, anchor: self).getValue()

							return returnValue;
						}
		
						/// The counterparty's node_id, which you'll need to pass back into
						/// [`ChannelManager::funding_transaction_generated`].
						/// 
						/// [`ChannelManager::funding_transaction_generated`]: crate::ln::channelmanager::ChannelManager::funding_transaction_generated
						public func getCounterpartyNodeId() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = PublicKey(cType: self.cType!.counterparty_node_id, anchor: self).getValue()

							return returnValue;
						}
		
						/// The value, in satoshis, that the output should have.
						public func getChannelValueSatoshis() -> UInt64 {
							// return value (do some wrapping)
							let returnValue = self.cType!.channel_value_satoshis

							return returnValue;
						}
		
						/// The script which should be used in the transaction output.
						public func getOutputScript() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = Vec_u8Z(cType: self.cType!.output_script, anchor: self).getValue()

							return returnValue;
						}
		
						/// The `user_channel_id` value passed in to [`ChannelManager::create_channel`], or a
						/// random value for an inbound channel. This may be zero for objects serialized with LDK
						/// versions prior to 0.0.113.
						/// 
						/// [`ChannelManager::create_channel`]: crate::ln::channelmanager::ChannelManager::create_channel
						public func getUserChannelId() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = U128(cType: self.cType!.user_channel_id, anchor: self).getValue()

							return returnValue;
						}
		

						internal func dangle(_ shouldDangle: Bool = true) -> FundingGenerationReady {
							self.dangling = shouldDangle
							return self
						}

											

					}

					
		
					
					/// 
					internal typealias Event_LDKPaymentClaimable_Body = PaymentClaimable
			

					/// 
					public class PaymentClaimable: NativeTypeWrapper {

						

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKEvent_LDKPaymentClaimable_Body?

						internal init(cType: LDKEvent_LDKPaymentClaimable_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
						}

						internal init(cType: LDKEvent_LDKPaymentClaimable_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The node that will receive the payment after it has been claimed.
						/// This is useful to identify payments received via [phantom nodes].
						/// This field will always be filled in when the event was generated by LDK versions
						/// 0.0.113 and above.
						/// 
						/// [phantom nodes]: crate::chain::keysinterface::PhantomKeysManager
						/// 
						/// Note that this (or a relevant inner pointer) may be NULL or all-0s to represent None
						public func getReceiverNodeId() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = PublicKey(cType: self.cType!.receiver_node_id, anchor: self).getValue()

							return returnValue;
						}
		
						/// The hash for which the preimage should be handed to the ChannelManager. Note that LDK will
						/// not stop you from registering duplicate payment hashes for inbound payments.
						public func getPaymentHash() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = ThirtyTwoBytes(cType: self.cType!.payment_hash, anchor: self).getValue()

							return returnValue;
						}
		
						/// The value, in thousandths of a satoshi, that this payment is for.
						public func getAmountMsat() -> UInt64 {
							// return value (do some wrapping)
							let returnValue = self.cType!.amount_msat

							return returnValue;
						}
		
						/// Information for claiming this received payment, based on whether the purpose of the
						/// payment is to pay an invoice or to send a spontaneous payment.
						public func getPurpose() -> PaymentPurpose {
							// return value (do some wrapping)
							let returnValue = PaymentPurpose(cType: self.cType!.purpose, anchor: self)

							return returnValue;
						}
		
						/// The `channel_id` indicating over which channel we received the payment.
						/// 
						/// Note that this (or a relevant inner pointer) may be NULL or all-0s to represent None
						public func getViaChannelId() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = ThirtyTwoBytes(cType: self.cType!.via_channel_id, anchor: self).getValue()

							return returnValue;
						}
		
						/// The `user_channel_id` indicating over which channel we received the payment.
						public func getViaUserChannelId() -> [UInt8]? {
							// return value (do some wrapping)
							let returnValue = Option_u128Z(cType: self.cType!.via_user_channel_id, anchor: self).getValue()

							return returnValue;
						}
		

						internal func dangle(_ shouldDangle: Bool = true) -> PaymentClaimable {
							self.dangling = shouldDangle
							return self
						}

											

					}

					
		
					
					/// 
					internal typealias Event_LDKPaymentClaimed_Body = PaymentClaimed
			

					/// 
					public class PaymentClaimed: NativeTypeWrapper {

						

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKEvent_LDKPaymentClaimed_Body?

						internal init(cType: LDKEvent_LDKPaymentClaimed_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
						}

						internal init(cType: LDKEvent_LDKPaymentClaimed_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The node that received the payment.
						/// This is useful to identify payments which were received via [phantom nodes].
						/// This field will always be filled in when the event was generated by LDK versions
						/// 0.0.113 and above.
						/// 
						/// [phantom nodes]: crate::chain::keysinterface::PhantomKeysManager
						/// 
						/// Note that this (or a relevant inner pointer) may be NULL or all-0s to represent None
						public func getReceiverNodeId() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = PublicKey(cType: self.cType!.receiver_node_id, anchor: self).getValue()

							return returnValue;
						}
		
						/// The payment hash of the claimed payment. Note that LDK will not stop you from
						/// registering duplicate payment hashes for inbound payments.
						public func getPaymentHash() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = ThirtyTwoBytes(cType: self.cType!.payment_hash, anchor: self).getValue()

							return returnValue;
						}
		
						/// The value, in thousandths of a satoshi, that this payment is for.
						public func getAmountMsat() -> UInt64 {
							// return value (do some wrapping)
							let returnValue = self.cType!.amount_msat

							return returnValue;
						}
		
						/// The purpose of the claimed payment, i.e. whether the payment was for an invoice or a
						/// spontaneous payment.
						public func getPurpose() -> PaymentPurpose {
							// return value (do some wrapping)
							let returnValue = PaymentPurpose(cType: self.cType!.purpose, anchor: self)

							return returnValue;
						}
		

						internal func dangle(_ shouldDangle: Bool = true) -> PaymentClaimed {
							self.dangling = shouldDangle
							return self
						}

											

					}

					
		
					
					/// 
					internal typealias Event_LDKPaymentSent_Body = PaymentSent
			

					/// 
					public class PaymentSent: NativeTypeWrapper {

						

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKEvent_LDKPaymentSent_Body?

						internal init(cType: LDKEvent_LDKPaymentSent_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
						}

						internal init(cType: LDKEvent_LDKPaymentSent_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The id returned by [`ChannelManager::send_payment`] and used with
						/// [`ChannelManager::retry_payment`].
						/// 
						/// [`ChannelManager::send_payment`]: crate::ln::channelmanager::ChannelManager::send_payment
						/// [`ChannelManager::retry_payment`]: crate::ln::channelmanager::ChannelManager::retry_payment
						/// 
						/// Note that this (or a relevant inner pointer) may be NULL or all-0s to represent None
						public func getPaymentId() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = ThirtyTwoBytes(cType: self.cType!.payment_id, anchor: self).getValue()

							return returnValue;
						}
		
						/// The preimage to the hash given to ChannelManager::send_payment.
						/// Note that this serves as a payment receipt, if you wish to have such a thing, you must
						/// store it somehow!
						public func getPaymentPreimage() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = ThirtyTwoBytes(cType: self.cType!.payment_preimage, anchor: self).getValue()

							return returnValue;
						}
		
						/// The hash that was given to [`ChannelManager::send_payment`].
						/// 
						/// [`ChannelManager::send_payment`]: crate::ln::channelmanager::ChannelManager::send_payment
						public func getPaymentHash() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = ThirtyTwoBytes(cType: self.cType!.payment_hash, anchor: self).getValue()

							return returnValue;
						}
		
						/// The total fee which was spent at intermediate hops in this payment, across all paths.
						/// 
						/// Note that, like [`Route::get_total_fees`] this does *not* include any potential
						/// overpayment to the recipient node.
						/// 
						/// If the recipient or an intermediate node misbehaves and gives us free money, this may
						/// overstate the amount paid, though this is unlikely.
						/// 
						/// [`Route::get_total_fees`]: crate::routing::router::Route::get_total_fees
						public func getFeePaidMsat() -> UInt64? {
							// return value (do some wrapping)
							let returnValue = Option_u64Z(cType: self.cType!.fee_paid_msat, anchor: self).getValue()

							return returnValue;
						}
		

						internal func dangle(_ shouldDangle: Bool = true) -> PaymentSent {
							self.dangling = shouldDangle
							return self
						}

											

					}

					
		
					
					/// 
					internal typealias Event_LDKPaymentFailed_Body = PaymentFailed
			

					/// 
					public class PaymentFailed: NativeTypeWrapper {

						

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKEvent_LDKPaymentFailed_Body?

						internal init(cType: LDKEvent_LDKPaymentFailed_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
						}

						internal init(cType: LDKEvent_LDKPaymentFailed_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The id returned by [`ChannelManager::send_payment`] and used with
						/// [`ChannelManager::retry_payment`] and [`ChannelManager::abandon_payment`].
						/// 
						/// [`ChannelManager::send_payment`]: crate::ln::channelmanager::ChannelManager::send_payment
						/// [`ChannelManager::retry_payment`]: crate::ln::channelmanager::ChannelManager::retry_payment
						/// [`ChannelManager::abandon_payment`]: crate::ln::channelmanager::ChannelManager::abandon_payment
						public func getPaymentId() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = ThirtyTwoBytes(cType: self.cType!.payment_id, anchor: self).getValue()

							return returnValue;
						}
		
						/// The hash that was given to [`ChannelManager::send_payment`].
						/// 
						/// [`ChannelManager::send_payment`]: crate::ln::channelmanager::ChannelManager::send_payment
						public func getPaymentHash() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = ThirtyTwoBytes(cType: self.cType!.payment_hash, anchor: self).getValue()

							return returnValue;
						}
		

						internal func dangle(_ shouldDangle: Bool = true) -> PaymentFailed {
							self.dangling = shouldDangle
							return self
						}

											

					}

					
		
					
					/// 
					internal typealias Event_LDKPaymentPathSuccessful_Body = PaymentPathSuccessful
			

					/// 
					public class PaymentPathSuccessful: NativeTypeWrapper {

						

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKEvent_LDKPaymentPathSuccessful_Body?

						internal init(cType: LDKEvent_LDKPaymentPathSuccessful_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
						}

						internal init(cType: LDKEvent_LDKPaymentPathSuccessful_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The id returned by [`ChannelManager::send_payment`] and used with
						/// [`ChannelManager::retry_payment`].
						/// 
						/// [`ChannelManager::send_payment`]: crate::ln::channelmanager::ChannelManager::send_payment
						/// [`ChannelManager::retry_payment`]: crate::ln::channelmanager::ChannelManager::retry_payment
						public func getPaymentId() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = ThirtyTwoBytes(cType: self.cType!.payment_id, anchor: self).getValue()

							return returnValue;
						}
		
						/// The hash that was given to [`ChannelManager::send_payment`].
						/// 
						/// [`ChannelManager::send_payment`]: crate::ln::channelmanager::ChannelManager::send_payment
						/// 
						/// Note that this (or a relevant inner pointer) may be NULL or all-0s to represent None
						public func getPaymentHash() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = ThirtyTwoBytes(cType: self.cType!.payment_hash, anchor: self).getValue()

							return returnValue;
						}
		
						/// The payment path that was successful.
						/// 
						/// May contain a closed channel if the HTLC sent along the path was fulfilled on chain.
						public func getPath() -> [RouteHop] {
							// return value (do some wrapping)
							let returnValue = Vec_RouteHopZ(cType: self.cType!.path, anchor: self).getValue()

							return returnValue;
						}
		

						internal func dangle(_ shouldDangle: Bool = true) -> PaymentPathSuccessful {
							self.dangling = shouldDangle
							return self
						}

											

					}

					
		
					
					/// 
					internal typealias Event_LDKPaymentPathFailed_Body = PaymentPathFailed
			

					/// 
					public class PaymentPathFailed: NativeTypeWrapper {

						

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKEvent_LDKPaymentPathFailed_Body?

						internal init(cType: LDKEvent_LDKPaymentPathFailed_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
						}

						internal init(cType: LDKEvent_LDKPaymentPathFailed_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The id returned by [`ChannelManager::send_payment`] and used with
						/// [`ChannelManager::retry_payment`] and [`ChannelManager::abandon_payment`].
						/// 
						/// [`ChannelManager::send_payment`]: crate::ln::channelmanager::ChannelManager::send_payment
						/// [`ChannelManager::retry_payment`]: crate::ln::channelmanager::ChannelManager::retry_payment
						/// [`ChannelManager::abandon_payment`]: crate::ln::channelmanager::ChannelManager::abandon_payment
						/// 
						/// Note that this (or a relevant inner pointer) may be NULL or all-0s to represent None
						public func getPaymentId() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = ThirtyTwoBytes(cType: self.cType!.payment_id, anchor: self).getValue()

							return returnValue;
						}
		
						/// The hash that was given to [`ChannelManager::send_payment`].
						/// 
						/// [`ChannelManager::send_payment`]: crate::ln::channelmanager::ChannelManager::send_payment
						public func getPaymentHash() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = ThirtyTwoBytes(cType: self.cType!.payment_hash, anchor: self).getValue()

							return returnValue;
						}
		
						/// Indicates the payment was rejected for some reason by the recipient. This implies that
						/// the payment has failed, not just the route in question. If this is not set, you may
						/// retry the payment via a different route.
						public func getPaymentFailedPermanently() -> Bool {
							// return value (do some wrapping)
							let returnValue = self.cType!.payment_failed_permanently

							return returnValue;
						}
		
						/// Any failure information conveyed via the Onion return packet by a node along the failed
						/// payment route.
						/// 
						/// Should be applied to the [`NetworkGraph`] so that routing decisions can take into
						/// account the update.
						/// 
						/// [`NetworkGraph`]: crate::routing::gossip::NetworkGraph
						public func getNetworkUpdate() -> NetworkUpdate? {
							// return value (do some wrapping)
							let returnValue = Option_NetworkUpdateZ(cType: self.cType!.network_update, anchor: self).getValue()

							return returnValue;
						}
		
						/// For both single-path and multi-path payments, this is set if all paths of the payment have
						/// failed. This will be set to false if (1) this is an MPP payment and (2) other parts of the
						/// larger MPP payment were still in flight when this event was generated.
						/// 
						/// Note that if you are retrying individual MPP parts, using this value to determine if a
						/// payment has fully failed is race-y. Because multiple failures can happen prior to events
						/// being processed, you may retry in response to a first failure, with a second failure
						/// (with `all_paths_failed` set) still pending. Then, when the second failure is processed
						/// you will see `all_paths_failed` set even though the retry of the first failure still
						/// has an associated in-flight HTLC. See (1) for an example of such a failure.
						/// 
						/// If you wish to retry individual MPP parts and learn when a payment has failed, you must
						/// call [`ChannelManager::abandon_payment`] and wait for a [`Event::PaymentFailed`] event.
						/// 
						/// (1) <https://github.com/lightningdevkit/rust-lightning/issues/1164>
						/// 
						/// [`ChannelManager::abandon_payment`]: crate::ln::channelmanager::ChannelManager::abandon_payment
						public func getAllPathsFailed() -> Bool {
							// return value (do some wrapping)
							let returnValue = self.cType!.all_paths_failed

							return returnValue;
						}
		
						/// The payment path that failed.
						public func getPath() -> [RouteHop] {
							// return value (do some wrapping)
							let returnValue = Vec_RouteHopZ(cType: self.cType!.path, anchor: self).getValue()

							return returnValue;
						}
		
						/// The channel responsible for the failed payment path.
						/// 
						/// Note that for route hints or for the first hop in a path this may be an SCID alias and
						/// may not refer to a channel in the public network graph. These aliases may also collide
						/// with channels in the public network graph.
						/// 
						/// If this is `Some`, then the corresponding channel should be avoided when the payment is
						/// retried. May be `None` for older [`Event`] serializations.
						public func getShortChannelId() -> UInt64? {
							// return value (do some wrapping)
							let returnValue = Option_u64Z(cType: self.cType!.short_channel_id, anchor: self).getValue()

							return returnValue;
						}
		
						/// Parameters needed to compute a new [`Route`] when retrying the failed payment path.
						/// 
						/// See [`find_route`] for details.
						/// 
						/// [`Route`]: crate::routing::router::Route
						/// [`find_route`]: crate::routing::router::find_route
						/// 
						/// Note that this (or a relevant inner pointer) may be NULL or all-0s to represent None
						public func getRetry() -> Bindings.RouteParameters {
							// return value (do some wrapping)
							let returnValue = Bindings.RouteParameters(cType: self.cType!.retry, anchor: self)

							return returnValue;
						}
		

						internal func dangle(_ shouldDangle: Bool = true) -> PaymentPathFailed {
							self.dangling = shouldDangle
							return self
						}

											

					}

					
		
					
					/// 
					internal typealias Event_LDKProbeSuccessful_Body = ProbeSuccessful
			

					/// 
					public class ProbeSuccessful: NativeTypeWrapper {

						

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKEvent_LDKProbeSuccessful_Body?

						internal init(cType: LDKEvent_LDKProbeSuccessful_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
						}

						internal init(cType: LDKEvent_LDKProbeSuccessful_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The id returned by [`ChannelManager::send_probe`].
						/// 
						/// [`ChannelManager::send_probe`]: crate::ln::channelmanager::ChannelManager::send_probe
						public func getPaymentId() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = ThirtyTwoBytes(cType: self.cType!.payment_id, anchor: self).getValue()

							return returnValue;
						}
		
						/// The hash generated by [`ChannelManager::send_probe`].
						/// 
						/// [`ChannelManager::send_probe`]: crate::ln::channelmanager::ChannelManager::send_probe
						public func getPaymentHash() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = ThirtyTwoBytes(cType: self.cType!.payment_hash, anchor: self).getValue()

							return returnValue;
						}
		
						/// The payment path that was successful.
						public func getPath() -> [RouteHop] {
							// return value (do some wrapping)
							let returnValue = Vec_RouteHopZ(cType: self.cType!.path, anchor: self).getValue()

							return returnValue;
						}
		

						internal func dangle(_ shouldDangle: Bool = true) -> ProbeSuccessful {
							self.dangling = shouldDangle
							return self
						}

											

					}

					
		
					
					/// 
					internal typealias Event_LDKProbeFailed_Body = ProbeFailed
			

					/// 
					public class ProbeFailed: NativeTypeWrapper {

						

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKEvent_LDKProbeFailed_Body?

						internal init(cType: LDKEvent_LDKProbeFailed_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
						}

						internal init(cType: LDKEvent_LDKProbeFailed_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The id returned by [`ChannelManager::send_probe`].
						/// 
						/// [`ChannelManager::send_probe`]: crate::ln::channelmanager::ChannelManager::send_probe
						public func getPaymentId() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = ThirtyTwoBytes(cType: self.cType!.payment_id, anchor: self).getValue()

							return returnValue;
						}
		
						/// The hash generated by [`ChannelManager::send_probe`].
						/// 
						/// [`ChannelManager::send_probe`]: crate::ln::channelmanager::ChannelManager::send_probe
						public func getPaymentHash() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = ThirtyTwoBytes(cType: self.cType!.payment_hash, anchor: self).getValue()

							return returnValue;
						}
		
						/// The payment path that failed.
						public func getPath() -> [RouteHop] {
							// return value (do some wrapping)
							let returnValue = Vec_RouteHopZ(cType: self.cType!.path, anchor: self).getValue()

							return returnValue;
						}
		
						/// The channel responsible for the failed probe.
						/// 
						/// Note that for route hints or for the first hop in a path this may be an SCID alias and
						/// may not refer to a channel in the public network graph. These aliases may also collide
						/// with channels in the public network graph.
						public func getShortChannelId() -> UInt64? {
							// return value (do some wrapping)
							let returnValue = Option_u64Z(cType: self.cType!.short_channel_id, anchor: self).getValue()

							return returnValue;
						}
		

						internal func dangle(_ shouldDangle: Bool = true) -> ProbeFailed {
							self.dangling = shouldDangle
							return self
						}

											

					}

					
		
					
					/// 
					internal typealias Event_LDKPendingHTLCsForwardable_Body = PendingHTLCsForwardable
			

					/// 
					public class PendingHTLCsForwardable: NativeTypeWrapper {

						

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKEvent_LDKPendingHTLCsForwardable_Body?

						internal init(cType: LDKEvent_LDKPendingHTLCsForwardable_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
						}

						internal init(cType: LDKEvent_LDKPendingHTLCsForwardable_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The minimum amount of time that should be waited prior to calling
						/// process_pending_htlc_forwards. To increase the effort required to correlate payments,
						/// you should wait a random amount of time in roughly the range (now + time_forwardable,
						/// now + 5*time_forwardable).
						public func getTimeForwardable() -> UInt64 {
							// return value (do some wrapping)
							let returnValue = self.cType!.time_forwardable

							return returnValue;
						}
		

						internal func dangle(_ shouldDangle: Bool = true) -> PendingHTLCsForwardable {
							self.dangling = shouldDangle
							return self
						}

											

					}

					
		
					
					/// 
					internal typealias Event_LDKHTLCIntercepted_Body = HTLCIntercepted
			

					/// 
					public class HTLCIntercepted: NativeTypeWrapper {

						

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKEvent_LDKHTLCIntercepted_Body?

						internal init(cType: LDKEvent_LDKHTLCIntercepted_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
						}

						internal init(cType: LDKEvent_LDKHTLCIntercepted_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// An id to help LDK identify which HTLC is being forwarded or failed.
						public func getInterceptId() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = ThirtyTwoBytes(cType: self.cType!.intercept_id, anchor: self).getValue()

							return returnValue;
						}
		
						/// The fake scid that was programmed as the next hop's scid, generated using
						/// [`ChannelManager::get_intercept_scid`].
						/// 
						/// [`ChannelManager::get_intercept_scid`]: crate::ln::channelmanager::ChannelManager::get_intercept_scid
						public func getRequestedNextHopScid() -> UInt64 {
							// return value (do some wrapping)
							let returnValue = self.cType!.requested_next_hop_scid

							return returnValue;
						}
		
						/// The payment hash used for this HTLC.
						public func getPaymentHash() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = ThirtyTwoBytes(cType: self.cType!.payment_hash, anchor: self).getValue()

							return returnValue;
						}
		
						/// How many msats were received on the inbound edge of this HTLC.
						public func getInboundAmountMsat() -> UInt64 {
							// return value (do some wrapping)
							let returnValue = self.cType!.inbound_amount_msat

							return returnValue;
						}
		
						/// How many msats the payer intended to route to the next node. Depending on the reason you are
						/// intercepting this payment, you might take a fee by forwarding less than this amount.
						/// 
						/// Note that LDK will NOT check that expected fees were factored into this value. You MUST
						/// check that whatever fee you want has been included here or subtract it as required. Further,
						/// LDK will not stop you from forwarding more than you received.
						public func getExpectedOutboundAmountMsat() -> UInt64 {
							// return value (do some wrapping)
							let returnValue = self.cType!.expected_outbound_amount_msat

							return returnValue;
						}
		

						internal func dangle(_ shouldDangle: Bool = true) -> HTLCIntercepted {
							self.dangling = shouldDangle
							return self
						}

											

					}

					
		
					
					/// 
					internal typealias Event_LDKSpendableOutputs_Body = SpendableOutputs
			

					/// 
					public class SpendableOutputs: NativeTypeWrapper {

						

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKEvent_LDKSpendableOutputs_Body?

						internal init(cType: LDKEvent_LDKSpendableOutputs_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
						}

						internal init(cType: LDKEvent_LDKSpendableOutputs_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The outputs which you should store as spendable by you.
						public func getOutputs() -> [SpendableOutputDescriptor] {
							// return value (do some wrapping)
							let returnValue = Vec_SpendableOutputDescriptorZ(cType: self.cType!.outputs, anchor: self).getValue()

							return returnValue;
						}
		

						internal func dangle(_ shouldDangle: Bool = true) -> SpendableOutputs {
							self.dangling = shouldDangle
							return self
						}

											

					}

					
		
					
					/// 
					internal typealias Event_LDKPaymentForwarded_Body = PaymentForwarded
			

					/// 
					public class PaymentForwarded: NativeTypeWrapper {

						

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKEvent_LDKPaymentForwarded_Body?

						internal init(cType: LDKEvent_LDKPaymentForwarded_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
						}

						internal init(cType: LDKEvent_LDKPaymentForwarded_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The incoming channel between the previous node and us. This is only `None` for events
						/// generated or serialized by versions prior to 0.0.107.
						/// 
						/// Note that this (or a relevant inner pointer) may be NULL or all-0s to represent None
						public func getPrevChannelId() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = ThirtyTwoBytes(cType: self.cType!.prev_channel_id, anchor: self).getValue()

							return returnValue;
						}
		
						/// The outgoing channel between the next node and us. This is only `None` for events
						/// generated or serialized by versions prior to 0.0.107.
						/// 
						/// Note that this (or a relevant inner pointer) may be NULL or all-0s to represent None
						public func getNextChannelId() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = ThirtyTwoBytes(cType: self.cType!.next_channel_id, anchor: self).getValue()

							return returnValue;
						}
		
						/// The fee, in milli-satoshis, which was earned as a result of the payment.
						/// 
						/// Note that if we force-closed the channel over which we forwarded an HTLC while the HTLC
						/// was pending, the amount the next hop claimed will have been rounded down to the nearest
						/// whole satoshi. Thus, the fee calculated here may be higher than expected as we still
						/// claimed the full value in millisatoshis from the source. In this case,
						/// `claim_from_onchain_tx` will be set.
						/// 
						/// If the channel which sent us the payment has been force-closed, we will claim the funds
						/// via an on-chain transaction. In that case we do not yet know the on-chain transaction
						/// fees which we will spend and will instead set this to `None`. It is possible duplicate
						/// `PaymentForwarded` events are generated for the same payment iff `fee_earned_msat` is
						/// `None`.
						public func getFeeEarnedMsat() -> UInt64? {
							// return value (do some wrapping)
							let returnValue = Option_u64Z(cType: self.cType!.fee_earned_msat, anchor: self).getValue()

							return returnValue;
						}
		
						/// If this is `true`, the forwarded HTLC was claimed by our counterparty via an on-chain
						/// transaction.
						public func getClaimFromOnchainTx() -> Bool {
							// return value (do some wrapping)
							let returnValue = self.cType!.claim_from_onchain_tx

							return returnValue;
						}
		

						internal func dangle(_ shouldDangle: Bool = true) -> PaymentForwarded {
							self.dangling = shouldDangle
							return self
						}

											

					}

					
		
					
					/// 
					internal typealias Event_LDKChannelReady_Body = ChannelReady
			

					/// 
					public class ChannelReady: NativeTypeWrapper {

						

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKEvent_LDKChannelReady_Body?

						internal init(cType: LDKEvent_LDKChannelReady_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
						}

						internal init(cType: LDKEvent_LDKChannelReady_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The channel_id of the channel that is ready.
						public func getChannelId() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = ThirtyTwoBytes(cType: self.cType!.channel_id, anchor: self).getValue()

							return returnValue;
						}
		
						/// The `user_channel_id` value passed in to [`ChannelManager::create_channel`] for outbound
						/// channels, or to [`ChannelManager::accept_inbound_channel`] for inbound channels if
						/// [`UserConfig::manually_accept_inbound_channels`] config flag is set to true. Otherwise
						/// `user_channel_id` will be randomized for an inbound channel.
						/// 
						/// [`ChannelManager::create_channel`]: crate::ln::channelmanager::ChannelManager::create_channel
						/// [`ChannelManager::accept_inbound_channel`]: crate::ln::channelmanager::ChannelManager::accept_inbound_channel
						/// [`UserConfig::manually_accept_inbound_channels`]: crate::util::config::UserConfig::manually_accept_inbound_channels
						public func getUserChannelId() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = U128(cType: self.cType!.user_channel_id, anchor: self).getValue()

							return returnValue;
						}
		
						/// The node_id of the channel counterparty.
						public func getCounterpartyNodeId() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = PublicKey(cType: self.cType!.counterparty_node_id, anchor: self).getValue()

							return returnValue;
						}
		
						/// The features that this channel will operate with.
						public func getChannelType() -> Bindings.ChannelTypeFeatures {
							// return value (do some wrapping)
							let returnValue = Bindings.ChannelTypeFeatures(cType: self.cType!.channel_type, anchor: self)

							return returnValue;
						}
		

						internal func dangle(_ shouldDangle: Bool = true) -> ChannelReady {
							self.dangling = shouldDangle
							return self
						}

											

					}

					
		
					
					/// 
					internal typealias Event_LDKChannelClosed_Body = ChannelClosed
			

					/// 
					public class ChannelClosed: NativeTypeWrapper {

						

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKEvent_LDKChannelClosed_Body?

						internal init(cType: LDKEvent_LDKChannelClosed_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
						}

						internal init(cType: LDKEvent_LDKChannelClosed_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The channel_id of the channel which has been closed. Note that on-chain transactions
						/// resolving the channel are likely still awaiting confirmation.
						public func getChannelId() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = ThirtyTwoBytes(cType: self.cType!.channel_id, anchor: self).getValue()

							return returnValue;
						}
		
						/// The `user_channel_id` value passed in to [`ChannelManager::create_channel`] for outbound
						/// channels, or to [`ChannelManager::accept_inbound_channel`] for inbound channels if
						/// [`UserConfig::manually_accept_inbound_channels`] config flag is set to true. Otherwise
						/// `user_channel_id` will be randomized for inbound channels.
						/// This may be zero for inbound channels serialized prior to 0.0.113 and will always be
						/// zero for objects serialized with LDK versions prior to 0.0.102.
						/// 
						/// [`ChannelManager::create_channel`]: crate::ln::channelmanager::ChannelManager::create_channel
						/// [`ChannelManager::accept_inbound_channel`]: crate::ln::channelmanager::ChannelManager::accept_inbound_channel
						/// [`UserConfig::manually_accept_inbound_channels`]: crate::util::config::UserConfig::manually_accept_inbound_channels
						public func getUserChannelId() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = U128(cType: self.cType!.user_channel_id, anchor: self).getValue()

							return returnValue;
						}
		
						/// The reason the channel was closed.
						public func getReason() -> ClosureReason {
							// return value (do some wrapping)
							let returnValue = ClosureReason(cType: self.cType!.reason, anchor: self)

							return returnValue;
						}
		

						internal func dangle(_ shouldDangle: Bool = true) -> ChannelClosed {
							self.dangling = shouldDangle
							return self
						}

											

					}

					
		
					
					/// 
					internal typealias Event_LDKDiscardFunding_Body = DiscardFunding
			

					/// 
					public class DiscardFunding: NativeTypeWrapper {

						

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKEvent_LDKDiscardFunding_Body?

						internal init(cType: LDKEvent_LDKDiscardFunding_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
						}

						internal init(cType: LDKEvent_LDKDiscardFunding_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The channel_id of the channel which has been closed.
						public func getChannelId() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = ThirtyTwoBytes(cType: self.cType!.channel_id, anchor: self).getValue()

							return returnValue;
						}
		
						/// The full transaction received from the user
						public func getTransaction() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = Transaction(cType: self.cType!.transaction, anchor: self).getValue()

							return returnValue;
						}
		

						internal func dangle(_ shouldDangle: Bool = true) -> DiscardFunding {
							self.dangling = shouldDangle
							return self
						}

											

					}

					
		
					
					/// 
					internal typealias Event_LDKOpenChannelRequest_Body = OpenChannelRequest
			

					/// 
					public class OpenChannelRequest: NativeTypeWrapper {

						

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKEvent_LDKOpenChannelRequest_Body?

						internal init(cType: LDKEvent_LDKOpenChannelRequest_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
						}

						internal init(cType: LDKEvent_LDKOpenChannelRequest_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The temporary channel ID of the channel requested to be opened.
						/// 
						/// When responding to the request, the `temporary_channel_id` should be passed
						/// back to the ChannelManager through [`ChannelManager::accept_inbound_channel`] to accept,
						/// or through [`ChannelManager::force_close_without_broadcasting_txn`] to reject.
						/// 
						/// [`ChannelManager::accept_inbound_channel`]: crate::ln::channelmanager::ChannelManager::accept_inbound_channel
						/// [`ChannelManager::force_close_without_broadcasting_txn`]: crate::ln::channelmanager::ChannelManager::force_close_without_broadcasting_txn
						public func getTemporaryChannelId() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = ThirtyTwoBytes(cType: self.cType!.temporary_channel_id, anchor: self).getValue()

							return returnValue;
						}
		
						/// The node_id of the counterparty requesting to open the channel.
						/// 
						/// When responding to the request, the `counterparty_node_id` should be passed
						/// back to the `ChannelManager` through [`ChannelManager::accept_inbound_channel`] to
						/// accept the request, or through [`ChannelManager::force_close_without_broadcasting_txn`] to reject the
						/// request.
						/// 
						/// [`ChannelManager::accept_inbound_channel`]: crate::ln::channelmanager::ChannelManager::accept_inbound_channel
						/// [`ChannelManager::force_close_without_broadcasting_txn`]: crate::ln::channelmanager::ChannelManager::force_close_without_broadcasting_txn
						public func getCounterpartyNodeId() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = PublicKey(cType: self.cType!.counterparty_node_id, anchor: self).getValue()

							return returnValue;
						}
		
						/// The channel value of the requested channel.
						public func getFundingSatoshis() -> UInt64 {
							// return value (do some wrapping)
							let returnValue = self.cType!.funding_satoshis

							return returnValue;
						}
		
						/// Our starting balance in the channel if the request is accepted, in milli-satoshi.
						public func getPushMsat() -> UInt64 {
							// return value (do some wrapping)
							let returnValue = self.cType!.push_msat

							return returnValue;
						}
		
						/// The features that this channel will operate with. If you reject the channel, a
						/// well-behaved counterparty may automatically re-attempt the channel with a new set of
						/// feature flags.
						/// 
						/// Note that if [`ChannelTypeFeatures::supports_scid_privacy`] returns true on this type,
						/// the resulting [`ChannelManager`] will not be readable by versions of LDK prior to
						/// 0.0.106.
						/// 
						/// Furthermore, note that if [`ChannelTypeFeatures::supports_zero_conf`] returns true on this type,
						/// the resulting [`ChannelManager`] will not be readable by versions of LDK prior to
						/// 0.0.107. Channels setting this type also need to get manually accepted via
						/// [`crate::ln::channelmanager::ChannelManager::accept_inbound_channel_from_trusted_peer_0conf`],
						/// or will be rejected otherwise.
						/// 
						/// [`ChannelManager`]: crate::ln::channelmanager::ChannelManager
						public func getChannelType() -> Bindings.ChannelTypeFeatures {
							// return value (do some wrapping)
							let returnValue = Bindings.ChannelTypeFeatures(cType: self.cType!.channel_type, anchor: self)

							return returnValue;
						}
		

						internal func dangle(_ shouldDangle: Bool = true) -> OpenChannelRequest {
							self.dangling = shouldDangle
							return self
						}

											

					}

					
		
					
					/// 
					internal typealias Event_LDKHTLCHandlingFailed_Body = HTLCHandlingFailed
			

					/// 
					public class HTLCHandlingFailed: NativeTypeWrapper {

						

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKEvent_LDKHTLCHandlingFailed_Body?

						internal init(cType: LDKEvent_LDKHTLCHandlingFailed_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
						}

						internal init(cType: LDKEvent_LDKHTLCHandlingFailed_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The channel over which the HTLC was received.
						public func getPrevChannelId() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = ThirtyTwoBytes(cType: self.cType!.prev_channel_id, anchor: self).getValue()

							return returnValue;
						}
		
						/// Destination of the HTLC that failed to be processed.
						public func getFailedNextDestination() -> HTLCDestination {
							// return value (do some wrapping)
							let returnValue = HTLCDestination(cType: self.cType!.failed_next_destination, anchor: self)

							return returnValue;
						}
		

						internal func dangle(_ shouldDangle: Bool = true) -> HTLCHandlingFailed {
							self.dangling = shouldDangle
							return self
						}

											

					}

					
		

				}

			}
		