
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ represents the result of a fallible operation,
			/// containing a crate::c_types::derived::C2Tuple_PaymentHashPaymentIdZ on success and a crate::lightning::ln::channelmanager::PaymentSendFailure on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ = Bindings.Result_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ

			extension Bindings {

				/// A CResult_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ represents the result of a fallible operation,
				/// containing a crate::c_types::derived::C2Tuple_PaymentHashPaymentIdZ on success and a crate::lightning::ln::channelmanager::PaymentSendFailure on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ?

					internal init(cType: LDKCResult_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKCResult_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ in the success state.
					public class func initWithOk(o: ([UInt8], [UInt8])) -> Result_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ {
						// native call variable prep
						
						let oTuple = Tuple_PaymentHashPaymentIdZ(tuple: o).danglingClone()
				

						// native method call
						let nativeCallResult = CResult_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ_ok(oTuple.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new CResult_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ in the error state.
					public class func initWithErr(e: PaymentSendFailure) -> Result_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ_err(e.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ>) in
				CResult_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ(cType: nativeCallResult)
						

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					
					public func getError() -> PaymentSendFailure? {
						if self.cType?.result_ok == false {
							return PaymentSendFailure(cType: self.cType!.contents.err.pointee, anchor: self)
						}
						return nil
					}
					

					
					public func getValue() -> ([UInt8], [UInt8])? {
						if self.cType?.result_ok == true {
							return Tuple_PaymentHashPaymentIdZ(cType: self.cType!.contents.result.pointee, anchor: self).getValue()
						}
						return nil
					}
					

					internal func dangle(_ shouldDangle: Bool = true) -> Result_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Result_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Result_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Result_C2Tuple_PaymentHashPaymentIdZPaymentSendFailureZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		