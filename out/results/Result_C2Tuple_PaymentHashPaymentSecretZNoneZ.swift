
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_C2Tuple_PaymentHashPaymentSecretZNoneZ represents the result of a fallible operation,
			/// containing a crate::c_types::derived::C2Tuple_PaymentHashPaymentSecretZ on success and a () on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_C2Tuple_PaymentHashPaymentSecretZNoneZ = Bindings.Result_C2Tuple_PaymentHashPaymentSecretZNoneZ

			extension Bindings {

				/// A CResult_C2Tuple_PaymentHashPaymentSecretZNoneZ represents the result of a fallible operation,
				/// containing a crate::c_types::derived::C2Tuple_PaymentHashPaymentSecretZ on success and a () on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_C2Tuple_PaymentHashPaymentSecretZNoneZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_C2Tuple_PaymentHashPaymentSecretZNoneZ?

					internal init(cType: LDKCResult_C2Tuple_PaymentHashPaymentSecretZNoneZ, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCResult_C2Tuple_PaymentHashPaymentSecretZNoneZ, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_C2Tuple_PaymentHashPaymentSecretZNoneZ in the success state.
					public class func initWithOk(o: ([UInt8], [UInt8])) -> Result_C2Tuple_PaymentHashPaymentSecretZNoneZ {
						// native call variable prep
						
						let oTuple = Tuple_PaymentHashPaymentSecretZ(tuple: o).danglingClone()
				

						// native method call
						let nativeCallResult = CResult_C2Tuple_PaymentHashPaymentSecretZNoneZ_ok(oTuple.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_C2Tuple_PaymentHashPaymentSecretZNoneZ(cType: nativeCallResult, instantiationContext: "Result_C2Tuple_PaymentHashPaymentSecretZNoneZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Creates a new CResult_C2Tuple_PaymentHashPaymentSecretZNoneZ in the error state.
					public class func initWithErr() -> Result_C2Tuple_PaymentHashPaymentSecretZNoneZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_C2Tuple_PaymentHashPaymentSecretZNoneZ_err()

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_C2Tuple_PaymentHashPaymentSecretZNoneZ(cType: nativeCallResult, instantiationContext: "Result_C2Tuple_PaymentHashPaymentSecretZNoneZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_C2Tuple_PaymentHashPaymentSecretZNoneZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_C2Tuple_PaymentHashPaymentSecretZNoneZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_C2Tuple_PaymentHashPaymentSecretZNoneZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_C2Tuple_PaymentHashPaymentSecretZNoneZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_C2Tuple_PaymentHashPaymentSecretZNoneZ>) in
				CResult_C2Tuple_PaymentHashPaymentSecretZNoneZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_C2Tuple_PaymentHashPaymentSecretZNoneZ(cType: nativeCallResult, instantiationContext: "Result_C2Tuple_PaymentHashPaymentSecretZNoneZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					/*
					public func getError() -> Void? {
						if self.cType?.result_ok == false {
							return self.cType!.contents.err.pointee
						}
						return nil
					}
					*/

					
					public func getValue() -> ([UInt8], [UInt8])? {
						if self.cType?.result_ok == true {
							return Tuple_PaymentHashPaymentSecretZ(cType: self.cType!.contents.result.pointee, instantiationContext: "Result_C2Tuple_PaymentHashPaymentSecretZNoneZ.swift::\(#function):\(#line)", anchor: self).getValue()
						}
						return nil
					}
					

					internal func dangle(_ shouldDangle: Bool = true) -> Result_C2Tuple_PaymentHashPaymentSecretZNoneZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Result_C2Tuple_PaymentHashPaymentSecretZNoneZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Result_C2Tuple_PaymentHashPaymentSecretZNoneZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Result_C2Tuple_PaymentHashPaymentSecretZNoneZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		