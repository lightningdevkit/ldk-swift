
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			/// 
			public typealias PaymentError = Bindings.PaymentError

			extension Bindings {

				/// An error that may occur when making a payment.
				public class PaymentError: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKPaymentError?

					internal init(cType: LDKPaymentError, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKPaymentError, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public enum PaymentErrorType {
						
						/// An error resulting from the provided [`Invoice`] or payment hash.
						case Invoice
			
						/// An error occurring when sending a payment.
						case Sending
			
					}

					public func getValueType() -> PaymentErrorType {
						switch self.cType!.tag {
							case LDKPaymentError_Invoice:
								return .Invoice
			
							case LDKPaymentError_Sending:
								return .Sending
			
							default:
								Bindings.print("Error: Invalid value type for PaymentError! Aborting.", severity: .ERROR)
								abort()
						}
		
					}

					
					/// Frees any resources used by the PaymentError
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = PaymentError_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the PaymentError
					internal func clone() -> PaymentError {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKPaymentError>) in
				PaymentError_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = PaymentError(cType: nativeCallResult, instantiationContext: "PaymentError.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new Invoice-variant PaymentError
					public class func initWithInvoice(a: String) -> PaymentError {
						// native call variable prep
						
						let aPrimitiveWrapper = Str(value: a, instantiationContext: "PaymentError.swift::\(#function):\(#line)").dangle()
				

						// native method call
						let nativeCallResult = PaymentError_invoice(aPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						aPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = PaymentError(cType: nativeCallResult, instantiationContext: "PaymentError.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new Sending-variant PaymentError
					public class func initWithSending(a: RetryableSendFailure) -> PaymentError {
						// native call variable prep
						

						// native method call
						let nativeCallResult = PaymentError_sending(a.getCValue())

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = PaymentError(cType: nativeCallResult, instantiationContext: "PaymentError.swift::\(#function):\(#line)")
						

						return returnValue
					}
		

					
					public func getValueAsInvoice() -> String? {
						if self.cType?.tag != LDKPaymentError_Invoice {
							return nil
						}

						return Str(cType: self.cType!.invoice, instantiationContext: "PaymentError.swift::\(#function):\(#line)", anchor: self).getValue()
					}
			
					public func getValueAsSending() -> RetryableSendFailure? {
						if self.cType?.tag != LDKPaymentError_Sending {
							return nil
						}

						return RetryableSendFailure(value: self.cType!.sending)
					}
			

					internal func dangle(_ shouldDangle: Bool = true) -> PaymentError {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> PaymentError {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing PaymentError \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing PaymentError \(self.instanceNumber) due to dangle.")
						}
					}
			

					

				}

			}
		