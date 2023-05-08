
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			/// 
			public typealias PaymentSendFailure = Bindings.PaymentSendFailure

			extension Bindings {

				/// If a payment fails to send with [`ChannelManager::send_payment_with_route`], it can be in one
				/// of several states. This enum is returned as the Err() type describing which state the payment
				/// is in, see the description of individual enum states for more.
				/// 
				/// [`ChannelManager::send_payment_with_route`]: crate::ln::channelmanager::ChannelManager::send_payment_with_route
				public class PaymentSendFailure: NativeTypeWrapper {

					
					/// Set to false to suppress an individual type's deinit log statements.
					/// Only applicable when log threshold is set to `.Debug`.
					public static var enableDeinitLogging = true

					/// Set to true to suspend the freeing of this type's associated Rust memory.
					/// Should only ever be used for debugging purposes, and will likely be
					/// deprecated soon.
					public static var suspendFreedom = false

					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKPaymentSendFailure?

					internal init(cType: LDKPaymentSendFailure, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKPaymentSendFailure, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKPaymentSendFailure, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					public enum PaymentSendFailureType {
						
						/// A parameter which was passed to send_payment was invalid, preventing us from attempting to
						/// send the payment at all.
						/// 
						/// You can freely resend the payment in full (with the parameter error fixed).
						/// 
						/// Because the payment failed outright, no payment tracking is done and no
						/// [`Event::PaymentPathFailed`] or [`Event::PaymentFailed`] events will be generated.
						/// 
						/// [`Event::PaymentPathFailed`]: crate::events::Event::PaymentPathFailed
						/// [`Event::PaymentFailed`]: crate::events::Event::PaymentFailed
						case ParameterError
			
						/// A parameter in a single path which was passed to send_payment was invalid, preventing us
						/// from attempting to send the payment at all.
						/// 
						/// You can freely resend the payment in full (with the parameter error fixed).
						/// 
						/// Because the payment failed outright, no payment tracking is done and no
						/// [`Event::PaymentPathFailed`] or [`Event::PaymentFailed`] events will be generated.
						/// 
						/// The results here are ordered the same as the paths in the route object which was passed to
						/// send_payment.
						/// 
						/// [`Event::PaymentPathFailed`]: crate::events::Event::PaymentPathFailed
						/// [`Event::PaymentFailed`]: crate::events::Event::PaymentFailed
						case PathParameterError
			
						/// All paths which were attempted failed to send, with no channel state change taking place.
						/// You can freely resend the payment in full (though you probably want to do so over different
						/// paths than the ones selected).
						/// 
						/// Because the payment failed outright, no payment tracking is done and no
						/// [`Event::PaymentPathFailed`] or [`Event::PaymentFailed`] events will be generated.
						/// 
						/// [`Event::PaymentPathFailed`]: crate::events::Event::PaymentPathFailed
						/// [`Event::PaymentFailed`]: crate::events::Event::PaymentFailed
						case AllFailedResendSafe
			
						/// Indicates that a payment for the provided [`PaymentId`] is already in-flight and has not
						/// yet completed (i.e. generated an [`Event::PaymentSent`] or [`Event::PaymentFailed`]).
						/// 
						/// [`PaymentId`]: crate::ln::channelmanager::PaymentId
						/// [`Event::PaymentSent`]: crate::events::Event::PaymentSent
						/// [`Event::PaymentFailed`]: crate::events::Event::PaymentFailed
						case DuplicatePayment
			
						/// Some paths that were attempted failed to send, though some paths may have succeeded. At least
						/// some paths have irrevocably committed to the HTLC.
						/// 
						/// The results here are ordered the same as the paths in the route object that was passed to
						/// send_payment.
						/// 
						/// Any entries that contain `Err(APIError::MonitorUpdateInprogress)` will send once a
						/// [`MonitorEvent::Completed`] is provided for the next-hop channel with the latest update_id.
						/// 
						/// [`MonitorEvent::Completed`]: crate::chain::channelmonitor::MonitorEvent::Completed
						case PartialFailure
			
					}

					public func getValueType() -> PaymentSendFailureType {
						switch self.cType!.tag {
							case LDKPaymentSendFailure_ParameterError:
								return .ParameterError
			
							case LDKPaymentSendFailure_PathParameterError:
								return .PathParameterError
			
							case LDKPaymentSendFailure_AllFailedResendSafe:
								return .AllFailedResendSafe
			
							case LDKPaymentSendFailure_DuplicatePayment:
								return .DuplicatePayment
			
							case LDKPaymentSendFailure_PartialFailure:
								return .PartialFailure
			
							default:
								Bindings.print("Error: Invalid value type for PaymentSendFailure! Aborting.", severity: .ERROR)
								abort()
						}
		
					}

					
					/// Frees any resources used by the PaymentSendFailure
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = PaymentSendFailure_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the PaymentSendFailure
					internal func clone() -> PaymentSendFailure {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKPaymentSendFailure>) in
				PaymentSendFailure_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = PaymentSendFailure(cType: nativeCallResult, instantiationContext: "PaymentSendFailure.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new ParameterError-variant PaymentSendFailure
					public class func initWithParameterError(a: APIError) -> PaymentSendFailure {
						// native call variable prep
						

						// native method call
						let nativeCallResult = PaymentSendFailure_parameter_error(a.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = PaymentSendFailure(cType: nativeCallResult, instantiationContext: "PaymentSendFailure.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new PathParameterError-variant PaymentSendFailure
					public class func initWithPathParameterError(a: [Result_NoneAPIErrorZ]) -> PaymentSendFailure {
						// native call variable prep
						
						let aVector = Vec_CResult_NoneAPIErrorZZ(array: a, instantiationContext: "PaymentSendFailure.swift::\(#function):\(#line)").dangle()
				

						// native method call
						let nativeCallResult = PaymentSendFailure_path_parameter_error(aVector.cType!)

						// cleanup
						
						// aVector.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = PaymentSendFailure(cType: nativeCallResult, instantiationContext: "PaymentSendFailure.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new AllFailedResendSafe-variant PaymentSendFailure
					public class func initWithAllFailedResendSafe(a: [APIError]) -> PaymentSendFailure {
						// native call variable prep
						
						let aVector = Vec_APIErrorZ(array: a, instantiationContext: "PaymentSendFailure.swift::\(#function):\(#line)").dangle()
				

						// native method call
						let nativeCallResult = PaymentSendFailure_all_failed_resend_safe(aVector.cType!)

						// cleanup
						
						// aVector.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = PaymentSendFailure(cType: nativeCallResult, instantiationContext: "PaymentSendFailure.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new DuplicatePayment-variant PaymentSendFailure
					public class func initWithDuplicatePayment() -> PaymentSendFailure {
						// native call variable prep
						

						// native method call
						let nativeCallResult = PaymentSendFailure_duplicate_payment()

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = PaymentSendFailure(cType: nativeCallResult, instantiationContext: "PaymentSendFailure.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new PartialFailure-variant PaymentSendFailure
					public class func initWithPartialFailure(results: [Result_NoneAPIErrorZ], failedPathsRetry: Bindings.RouteParameters, paymentId: [UInt8]) -> PaymentSendFailure {
						// native call variable prep
						
						let resultsVector = Vec_CResult_NoneAPIErrorZZ(array: results, instantiationContext: "PaymentSendFailure.swift::\(#function):\(#line)").dangle()
				
						let paymentIdPrimitiveWrapper = ThirtyTwoBytes(value: paymentId, instantiationContext: "PaymentSendFailure.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = PaymentSendFailure_partial_failure(resultsVector.cType!, failedPathsRetry.dynamicallyDangledClone().cType!, paymentIdPrimitiveWrapper.cType!)

						// cleanup
						
						// resultsVector.noOpRetain()
				
						// for elided types, we need this
						paymentIdPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = PaymentSendFailure(cType: nativeCallResult, instantiationContext: "PaymentSendFailure.swift::\(#function):\(#line)")
						

						return returnValue
					}
		

					
					public func getValueAsParameterError() -> APIError? {
						if self.cType?.tag != LDKPaymentSendFailure_ParameterError {
							return nil
						}

						return APIError(cType: self.cType!.parameter_error, instantiationContext: "PaymentSendFailure.swift::\(#function):\(#line)", anchor: self)
					}
			
					public func getValueAsPathParameterError() -> [Result_NoneAPIErrorZ]? {
						if self.cType?.tag != LDKPaymentSendFailure_PathParameterError {
							return nil
						}

						return Vec_CResult_NoneAPIErrorZZ(cType: self.cType!.path_parameter_error, instantiationContext: "PaymentSendFailure.swift::\(#function):\(#line)", anchor: self).getValue()
					}
			
					public func getValueAsAllFailedResendSafe() -> [APIError]? {
						if self.cType?.tag != LDKPaymentSendFailure_AllFailedResendSafe {
							return nil
						}

						return Vec_APIErrorZ(cType: self.cType!.all_failed_resend_safe, instantiationContext: "PaymentSendFailure.swift::\(#function):\(#line)", anchor: self).getValue()
					}
			
					public func getValueAsPartialFailure() -> PartialFailure? {
						if self.cType?.tag != LDKPaymentSendFailure_PartialFailure {
							return nil
						}

						return PaymentSendFailure_LDKPartialFailure_Body(cType: self.cType!.partial_failure, instantiationContext: "PaymentSendFailure.swift::\(#function):\(#line)", anchor: self)
					}
			

					internal func dangle(_ shouldDangle: Bool = true) -> PaymentSendFailure {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> PaymentSendFailure {
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
								Bindings.print("Freeing PaymentSendFailure \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing PaymentSendFailure \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

					
					
					/// 
					internal typealias PaymentSendFailure_LDKPartialFailure_Body = PartialFailure
			

					/// 
					public class PartialFailure: NativeTypeWrapper {

						

						
						/// Set to false to suppress an individual type's deinit log statements.
						/// Only applicable when log threshold is set to `.Debug`.
						public static var enableDeinitLogging = true

						/// Set to true to suspend the freeing of this type's associated Rust memory.
						/// Should only ever be used for debugging purposes, and will likely be
						/// deprecated soon.
						public static var suspendFreedom = false

						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKPaymentSendFailure_LDKPartialFailure_Body?

						internal init(cType: LDKPaymentSendFailure_LDKPartialFailure_Body, instantiationContext: String) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						}

						internal init(cType: LDKPaymentSendFailure_LDKPartialFailure_Body, instantiationContext: String, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}

						internal init(cType: LDKPaymentSendFailure_LDKPartialFailure_Body, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
							self.dangling = dangle
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The errors themselves, in the same order as the paths from the route.
						public func getResults() -> [Result_NoneAPIErrorZ] {
							// return value (do some wrapping)
							let returnValue = Vec_CResult_NoneAPIErrorZZ(cType: self.cType!.results, instantiationContext: "PaymentSendFailure.swift::\(#function):\(#line)", anchor: self).getValue()

							return returnValue;
						}
		
						/// If some paths failed without irrevocably committing to the new HTLC(s), this will
						/// contain a [`RouteParameters`] object for the failing paths.
						/// 
						/// Note that this (or a relevant inner pointer) may be NULL or all-0s to represent None
						public func getFailedPathsRetry() -> Bindings.RouteParameters {
							// return value (do some wrapping)
							let returnValue = Bindings.RouteParameters(cType: self.cType!.failed_paths_retry, instantiationContext: "PaymentSendFailure.swift::\(#function):\(#line)", anchor: self)

							return returnValue;
						}
		
						/// The payment id for the payment, which is now at least partially pending.
						public func getPaymentId() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = ThirtyTwoBytes(cType: self.cType!.payment_id, instantiationContext: "PaymentSendFailure.swift::\(#function):\(#line)", anchor: self).getValue()

							return returnValue;
						}
		

						internal func dangle(_ shouldDangle: Bool = true) -> PartialFailure {
							self.dangling = shouldDangle
							return self
						}

											

					}

					
		

				}

			}
		