
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_SpendableOutputDescriptorDecodeErrorZ represents the result of a fallible operation,
			/// containing a crate::lightning::chain::keysinterface::SpendableOutputDescriptor on success and a crate::lightning::ln::msgs::DecodeError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_SpendableOutputDescriptorDecodeErrorZ = Bindings.Result_SpendableOutputDescriptorDecodeErrorZ

			extension Bindings {

				/// A CResult_SpendableOutputDescriptorDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning::chain::keysinterface::SpendableOutputDescriptor on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_SpendableOutputDescriptorDecodeErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_SpendableOutputDescriptorDecodeErrorZ?

					internal init(cType: LDKCResult_SpendableOutputDescriptorDecodeErrorZ, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCResult_SpendableOutputDescriptorDecodeErrorZ, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_SpendableOutputDescriptorDecodeErrorZ in the success state.
					public class func initWithOk(o: SpendableOutputDescriptor) -> Result_SpendableOutputDescriptorDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_SpendableOutputDescriptorDecodeErrorZ_ok(o.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_SpendableOutputDescriptorDecodeErrorZ(cType: nativeCallResult, instantiationContext: "Result_SpendableOutputDescriptorDecodeErrorZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Creates a new CResult_SpendableOutputDescriptorDecodeErrorZ in the error state.
					public class func initWithErr(e: DecodeError) -> Result_SpendableOutputDescriptorDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_SpendableOutputDescriptorDecodeErrorZ_err(e.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_SpendableOutputDescriptorDecodeErrorZ(cType: nativeCallResult, instantiationContext: "Result_SpendableOutputDescriptorDecodeErrorZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_SpendableOutputDescriptorDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_SpendableOutputDescriptorDecodeErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_SpendableOutputDescriptorDecodeErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_SpendableOutputDescriptorDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_SpendableOutputDescriptorDecodeErrorZ>) in
				CResult_SpendableOutputDescriptorDecodeErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_SpendableOutputDescriptorDecodeErrorZ(cType: nativeCallResult, instantiationContext: "Result_SpendableOutputDescriptorDecodeErrorZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					
					public func getError() -> DecodeError? {
						if self.cType?.result_ok == false {
							return DecodeError(cType: self.cType!.contents.err.pointee, instantiationContext: "Result_SpendableOutputDescriptorDecodeErrorZ.swift::\(#function):\(#line)", anchor: self)
						}
						return nil
					}
					

					
					public func getValue() -> SpendableOutputDescriptor? {
						if self.cType?.result_ok == true {
							return SpendableOutputDescriptor(cType: self.cType!.contents.result.pointee, instantiationContext: "Result_SpendableOutputDescriptorDecodeErrorZ.swift::\(#function):\(#line)", anchor: self)
						}
						return nil
					}
					

					internal func dangle(_ shouldDangle: Bool = true) -> Result_SpendableOutputDescriptorDecodeErrorZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Result_SpendableOutputDescriptorDecodeErrorZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Result_SpendableOutputDescriptorDecodeErrorZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Result_SpendableOutputDescriptorDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		