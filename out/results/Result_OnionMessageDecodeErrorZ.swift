
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_OnionMessageDecodeErrorZ represents the result of a fallible operation,
			/// containing a crate::lightning::ln::msgs::OnionMessage on success and a crate::lightning::ln::msgs::DecodeError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_OnionMessageDecodeErrorZ = Bindings.Result_OnionMessageDecodeErrorZ

			extension Bindings {

				/// A CResult_OnionMessageDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning::ln::msgs::OnionMessage on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_OnionMessageDecodeErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_OnionMessageDecodeErrorZ?

					internal init(cType: LDKCResult_OnionMessageDecodeErrorZ, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCResult_OnionMessageDecodeErrorZ, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_OnionMessageDecodeErrorZ in the success state.
					public class func initWithOk(o: OnionMessage) -> Result_OnionMessageDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_OnionMessageDecodeErrorZ_ok(o.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_OnionMessageDecodeErrorZ(cType: nativeCallResult, instantiationContext: "Result_OnionMessageDecodeErrorZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Creates a new CResult_OnionMessageDecodeErrorZ in the error state.
					public class func initWithErr(e: DecodeError) -> Result_OnionMessageDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_OnionMessageDecodeErrorZ_err(e.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_OnionMessageDecodeErrorZ(cType: nativeCallResult, instantiationContext: "Result_OnionMessageDecodeErrorZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_OnionMessageDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_OnionMessageDecodeErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_OnionMessageDecodeErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_OnionMessageDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_OnionMessageDecodeErrorZ>) in
				CResult_OnionMessageDecodeErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_OnionMessageDecodeErrorZ(cType: nativeCallResult, instantiationContext: "Result_OnionMessageDecodeErrorZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					
					public func getError() -> DecodeError? {
						if self.cType?.result_ok == false {
							return DecodeError(cType: self.cType!.contents.err.pointee, instantiationContext: "Result_OnionMessageDecodeErrorZ.swift::\(#function):\(#line)", anchor: self)
						}
						return nil
					}
					

					
					public func getValue() -> OnionMessage? {
						if self.cType?.result_ok == true {
							return OnionMessage(cType: self.cType!.contents.result.pointee, instantiationContext: "Result_OnionMessageDecodeErrorZ.swift::\(#function):\(#line)", anchor: self)
						}
						return nil
					}
					

					internal func dangle(_ shouldDangle: Bool = true) -> Result_OnionMessageDecodeErrorZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Result_OnionMessageDecodeErrorZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Result_OnionMessageDecodeErrorZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Result_OnionMessageDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		