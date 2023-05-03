
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_PaymentHashPaymentSendFailureZ represents the result of a fallible operation,
			/// containing a crate::c_types::ThirtyTwoBytes on success and a crate::lightning::ln::outbound_payment::PaymentSendFailure on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_PaymentHashPaymentSendFailureZ = Bindings.Result_PaymentHashPaymentSendFailureZ

			extension Bindings {

				/// A CResult_PaymentHashPaymentSendFailureZ represents the result of a fallible operation,
				/// containing a crate::c_types::ThirtyTwoBytes on success and a crate::lightning::ln::outbound_payment::PaymentSendFailure on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_PaymentHashPaymentSendFailureZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_PaymentHashPaymentSendFailureZ?

					internal init(cType: LDKCResult_PaymentHashPaymentSendFailureZ, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCResult_PaymentHashPaymentSendFailureZ, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_PaymentHashPaymentSendFailureZ in the success state.
					public class func initWithOk(o: [UInt8]) -> Result_PaymentHashPaymentSendFailureZ {
						// native call variable prep
						
						let oPrimitiveWrapper = ThirtyTwoBytes(value: o, instantiationContext: "Result_PaymentHashPaymentSendFailureZ.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = CResult_PaymentHashPaymentSendFailureZ_ok(oPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						oPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_PaymentHashPaymentSendFailureZ(cType: nativeCallResult, instantiationContext: "Result_PaymentHashPaymentSendFailureZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Creates a new CResult_PaymentHashPaymentSendFailureZ in the error state.
					public class func initWithErr(e: PaymentSendFailure) -> Result_PaymentHashPaymentSendFailureZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_PaymentHashPaymentSendFailureZ_err(e.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_PaymentHashPaymentSendFailureZ(cType: nativeCallResult, instantiationContext: "Result_PaymentHashPaymentSendFailureZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_PaymentHashPaymentSendFailureZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_PaymentHashPaymentSendFailureZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_PaymentHashPaymentSendFailureZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_PaymentHashPaymentSendFailureZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_PaymentHashPaymentSendFailureZ>) in
				CResult_PaymentHashPaymentSendFailureZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_PaymentHashPaymentSendFailureZ(cType: nativeCallResult, instantiationContext: "Result_PaymentHashPaymentSendFailureZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					
					public func getError() -> PaymentSendFailure? {
						if self.cType?.result_ok == false {
							return PaymentSendFailure(cType: self.cType!.contents.err.pointee, instantiationContext: "Result_PaymentHashPaymentSendFailureZ.swift::\(#function):\(#line)", anchor: self)
						}
						return nil
					}
					

					
					public func getValue() -> [UInt8]? {
						if self.cType?.result_ok == true {
							return ThirtyTwoBytes(cType: self.cType!.contents.result.pointee, instantiationContext: "Result_PaymentHashPaymentSendFailureZ.swift::\(#function):\(#line)", anchor: self).getValue()
						}
						return nil
					}
					

					internal func dangle(_ shouldDangle: Bool = true) -> Result_PaymentHashPaymentSendFailureZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Result_PaymentHashPaymentSendFailureZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Result_PaymentHashPaymentSendFailureZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Result_PaymentHashPaymentSendFailureZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		