
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_PaymentHashRetryableSendFailureZ represents the result of a fallible operation,
			/// containing a crate::c_types::ThirtyTwoBytes on success and a crate::lightning::ln::outbound_payment::RetryableSendFailure on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_PaymentHashRetryableSendFailureZ = Bindings.Result_PaymentHashRetryableSendFailureZ

			extension Bindings {

				/// A CResult_PaymentHashRetryableSendFailureZ represents the result of a fallible operation,
				/// containing a crate::c_types::ThirtyTwoBytes on success and a crate::lightning::ln::outbound_payment::RetryableSendFailure on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_PaymentHashRetryableSendFailureZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_PaymentHashRetryableSendFailureZ?

					internal init(cType: LDKCResult_PaymentHashRetryableSendFailureZ, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCResult_PaymentHashRetryableSendFailureZ, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_PaymentHashRetryableSendFailureZ in the success state.
					public class func initWithOk(o: [UInt8]) -> Result_PaymentHashRetryableSendFailureZ {
						// native call variable prep
						
						let oPrimitiveWrapper = ThirtyTwoBytes(value: o, instantiationContext: "Result_PaymentHashRetryableSendFailureZ.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = CResult_PaymentHashRetryableSendFailureZ_ok(oPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						oPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_PaymentHashRetryableSendFailureZ(cType: nativeCallResult, instantiationContext: "Result_PaymentHashRetryableSendFailureZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Creates a new CResult_PaymentHashRetryableSendFailureZ in the error state.
					public class func initWithErr(e: RetryableSendFailure) -> Result_PaymentHashRetryableSendFailureZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_PaymentHashRetryableSendFailureZ_err(e.getCValue())

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_PaymentHashRetryableSendFailureZ(cType: nativeCallResult, instantiationContext: "Result_PaymentHashRetryableSendFailureZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_PaymentHashRetryableSendFailureZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_PaymentHashRetryableSendFailureZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_PaymentHashRetryableSendFailureZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_PaymentHashRetryableSendFailureZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_PaymentHashRetryableSendFailureZ>) in
				CResult_PaymentHashRetryableSendFailureZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_PaymentHashRetryableSendFailureZ(cType: nativeCallResult, instantiationContext: "Result_PaymentHashRetryableSendFailureZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					
					public func getError() -> RetryableSendFailure? {
						if self.cType?.result_ok == false {
							return RetryableSendFailure(value: self.cType!.contents.err.pointee)
						}
						return nil
					}
					

					
					public func getValue() -> [UInt8]? {
						if self.cType?.result_ok == true {
							return ThirtyTwoBytes(cType: self.cType!.contents.result.pointee, instantiationContext: "Result_PaymentHashRetryableSendFailureZ.swift::\(#function):\(#line)", anchor: self).getValue()
						}
						return nil
					}
					

					internal func dangle(_ shouldDangle: Bool = true) -> Result_PaymentHashRetryableSendFailureZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Result_PaymentHashRetryableSendFailureZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Result_PaymentHashRetryableSendFailureZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Result_PaymentHashRetryableSendFailureZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		