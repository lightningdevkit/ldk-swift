
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_PaymentSecretNoneZ represents the result of a fallible operation,
			/// containing a crate::c_types::ThirtyTwoBytes on success and a () on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_PaymentSecretNoneZ = Bindings.Result_PaymentSecretNoneZ

			extension Bindings {

				/// A CResult_PaymentSecretNoneZ represents the result of a fallible operation,
				/// containing a crate::c_types::ThirtyTwoBytes on success and a () on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_PaymentSecretNoneZ: NativeTypeWrapper {

					
					public static var enableDeinitLogging = true
					public static var suspendFreedom = false
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_PaymentSecretNoneZ?

					internal init(cType: LDKCResult_PaymentSecretNoneZ, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCResult_PaymentSecretNoneZ, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_PaymentSecretNoneZ in the success state.
					public class func initWithOk(o: [UInt8]) -> Result_PaymentSecretNoneZ {
						// native call variable prep
						
						let oPrimitiveWrapper = ThirtyTwoBytes(value: o, instantiationContext: "Result_PaymentSecretNoneZ.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = CResult_PaymentSecretNoneZ_ok(oPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						oPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_PaymentSecretNoneZ(cType: nativeCallResult, instantiationContext: "Result_PaymentSecretNoneZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Creates a new CResult_PaymentSecretNoneZ in the error state.
					public class func initWithErr() -> Result_PaymentSecretNoneZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_PaymentSecretNoneZ_err()

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_PaymentSecretNoneZ(cType: nativeCallResult, instantiationContext: "Result_PaymentSecretNoneZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_PaymentSecretNoneZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_PaymentSecretNoneZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_PaymentSecretNoneZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_PaymentSecretNoneZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_PaymentSecretNoneZ>) in
				CResult_PaymentSecretNoneZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_PaymentSecretNoneZ(cType: nativeCallResult, instantiationContext: "Result_PaymentSecretNoneZ.swift::\(#function):\(#line)")
						

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

					
					public func getValue() -> [UInt8]? {
						if self.cType?.result_ok == true {
							return ThirtyTwoBytes(cType: self.cType!.contents.result.pointee, instantiationContext: "Result_PaymentSecretNoneZ.swift::\(#function):\(#line)", anchor: self).getValue()
						}
						return nil
					}
					

					internal func dangle(_ shouldDangle: Bool = true) -> Result_PaymentSecretNoneZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Result_PaymentSecretNoneZ {
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
								Bindings.print("Freeing Result_PaymentSecretNoneZ \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing Result_PaymentSecretNoneZ \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

				}

			}
		