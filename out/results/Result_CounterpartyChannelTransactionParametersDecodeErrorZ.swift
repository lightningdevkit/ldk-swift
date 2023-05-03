
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_CounterpartyChannelTransactionParametersDecodeErrorZ represents the result of a fallible operation,
			/// containing a crate::lightning::ln::chan_utils::CounterpartyChannelTransactionParameters on success and a crate::lightning::ln::msgs::DecodeError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_CounterpartyChannelTransactionParametersDecodeErrorZ = Bindings.Result_CounterpartyChannelTransactionParametersDecodeErrorZ

			extension Bindings {

				/// A CResult_CounterpartyChannelTransactionParametersDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning::ln::chan_utils::CounterpartyChannelTransactionParameters on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_CounterpartyChannelTransactionParametersDecodeErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_CounterpartyChannelTransactionParametersDecodeErrorZ?

					internal init(cType: LDKCResult_CounterpartyChannelTransactionParametersDecodeErrorZ, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCResult_CounterpartyChannelTransactionParametersDecodeErrorZ, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_CounterpartyChannelTransactionParametersDecodeErrorZ in the success state.
					public class func initWithOk(o: CounterpartyChannelTransactionParameters) -> Result_CounterpartyChannelTransactionParametersDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_CounterpartyChannelTransactionParametersDecodeErrorZ_ok(o.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_CounterpartyChannelTransactionParametersDecodeErrorZ(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Creates a new CResult_CounterpartyChannelTransactionParametersDecodeErrorZ in the error state.
					public class func initWithErr(e: DecodeError) -> Result_CounterpartyChannelTransactionParametersDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_CounterpartyChannelTransactionParametersDecodeErrorZ_err(e.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_CounterpartyChannelTransactionParametersDecodeErrorZ(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_CounterpartyChannelTransactionParametersDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_CounterpartyChannelTransactionParametersDecodeErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_CounterpartyChannelTransactionParametersDecodeErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_CounterpartyChannelTransactionParametersDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_CounterpartyChannelTransactionParametersDecodeErrorZ>) in
				CResult_CounterpartyChannelTransactionParametersDecodeErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_CounterpartyChannelTransactionParametersDecodeErrorZ(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)")
						

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					
					public func getError() -> DecodeError? {
						if self.cType?.result_ok == false {
							return DecodeError(cType: self.cType!.contents.err.pointee, instantiationContext: "#{swift_class_name}::\(#function):\(#line)", anchor: self)
						}
						return nil
					}
					

					
					public func getValue() -> CounterpartyChannelTransactionParameters? {
						if self.cType?.result_ok == true {
							return CounterpartyChannelTransactionParameters(cType: self.cType!.contents.result.pointee, instantiationContext: "#{swift_class_name}::\(#function):\(#line)", anchor: self)
						}
						return nil
					}
					

					internal func dangle(_ shouldDangle: Bool = true) -> Result_CounterpartyChannelTransactionParametersDecodeErrorZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Result_CounterpartyChannelTransactionParametersDecodeErrorZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Result_CounterpartyChannelTransactionParametersDecodeErrorZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Result_CounterpartyChannelTransactionParametersDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		