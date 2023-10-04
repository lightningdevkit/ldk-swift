
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			/// 
			public typealias FailureCode = Bindings.FailureCode

			extension Bindings {

				/// This enum is used to specify which error data to send to peers when failing back an HTLC
				/// using [`ChannelManager::fail_htlc_backwards_with_reason`].
				/// 
				/// For more info on failure codes, see <https://github.com/lightning/bolts/blob/master/04-onion-routing.md#failure-messages>.
				public class FailureCode: NativeTypeWrapper {

					
					/// Set to false to suppress an individual type's deinit log statements.
					/// Only applicable when log threshold is set to `.Debug`.
					public static var enableDeinitLogging = true

					/// Set to true to suspend the freeing of this type's associated Rust memory.
					/// Should only ever be used for debugging purposes, and will likely be
					/// deprecated soon.
					public static var suspendFreedom = false

					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKFailureCode?

					internal init(cType: LDKFailureCode, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKFailureCode, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKFailureCode, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					public enum FailureCodeType {
						
						/// We had a temporary error processing the payment. Useful if no other error codes fit
						/// and you want to indicate that the payer may want to retry.
						case TemporaryNodeFailure
			
						/// We have a required feature which was not in this onion. For example, you may require
						/// some additional metadata that was not provided with this payment.
						case RequiredNodeFeatureMissing
			
						/// You may wish to use this when a `payment_preimage` is unknown, or the CLTV expiry of
						/// the HTLC is too close to the current block height for safe handling.
						/// Using this failure code in [`ChannelManager::fail_htlc_backwards_with_reason`] is
						/// equivalent to calling [`ChannelManager::fail_htlc_backwards`].
						case IncorrectOrUnknownPaymentDetails
			
						/// We failed to process the payload after the onion was decrypted. You may wish to
						/// use this when receiving custom HTLC TLVs with even type numbers that you don't recognize.
						/// 
						/// If available, the tuple data may include the type number and byte offset in the
						/// decrypted byte stream where the failure occurred.
						case InvalidOnionPayload
			
					}

					public func getValueType() -> FailureCodeType {
						switch self.cType!.tag {
							case LDKFailureCode_TemporaryNodeFailure:
								return .TemporaryNodeFailure
			
							case LDKFailureCode_RequiredNodeFeatureMissing:
								return .RequiredNodeFeatureMissing
			
							case LDKFailureCode_IncorrectOrUnknownPaymentDetails:
								return .IncorrectOrUnknownPaymentDetails
			
							case LDKFailureCode_InvalidOnionPayload:
								return .InvalidOnionPayload
			
							default:
								Bindings.print("Error: Invalid value type for FailureCode! Aborting.", severity: .ERROR)
								abort()
						}
		
					}

					
					/// Frees any resources used by the FailureCode
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = FailureCode_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the FailureCode
					internal func clone() -> FailureCode {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKFailureCode>) in
				FailureCode_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = FailureCode(cType: nativeCallResult, instantiationContext: "FailureCode.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new TemporaryNodeFailure-variant FailureCode
					public class func initWithTemporaryNodeFailure() -> FailureCode {
						// native call variable prep
						

						// native method call
						let nativeCallResult = FailureCode_temporary_node_failure()

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = FailureCode(cType: nativeCallResult, instantiationContext: "FailureCode.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new RequiredNodeFeatureMissing-variant FailureCode
					public class func initWithRequiredNodeFeatureMissing() -> FailureCode {
						// native call variable prep
						

						// native method call
						let nativeCallResult = FailureCode_required_node_feature_missing()

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = FailureCode(cType: nativeCallResult, instantiationContext: "FailureCode.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new IncorrectOrUnknownPaymentDetails-variant FailureCode
					public class func initWithIncorrectOrUnknownPaymentDetails() -> FailureCode {
						// native call variable prep
						

						// native method call
						let nativeCallResult = FailureCode_incorrect_or_unknown_payment_details()

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = FailureCode(cType: nativeCallResult, instantiationContext: "FailureCode.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new InvalidOnionPayload-variant FailureCode
					public class func initWithInvalidOnionPayload(a: (UInt64, UInt16)?) -> FailureCode {
						// native call variable prep
						
						let aOption = Option_C2Tuple_u64u16ZZ(some: a, instantiationContext: "FailureCode.swift::\(#function):\(#line)").danglingClone()
				

						// native method call
						let nativeCallResult = FailureCode_invalid_onion_payload(aOption.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = FailureCode(cType: nativeCallResult, instantiationContext: "FailureCode.swift::\(#function):\(#line)")
						

						return returnValue
					}
		

					
					public func getValueAsInvalidOnionPayload() -> (UInt64, UInt16)?? {
						if self.cType?.tag != LDKFailureCode_InvalidOnionPayload {
							return nil
						}

						return Option_C2Tuple_u64u16ZZ(cType: self.cType!.invalid_onion_payload, instantiationContext: "FailureCode.swift::\(#function):\(#line)", anchor: self).getValue()
					}
			

					
					internal func danglingClone() -> FailureCode {
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
								Bindings.print("Freeing FailureCode \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing FailureCode \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

					

				}

			}
		