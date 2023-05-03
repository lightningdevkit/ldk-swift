
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_RevokeAndACKDecodeErrorZ represents the result of a fallible operation,
			/// containing a crate::lightning::ln::msgs::RevokeAndACK on success and a crate::lightning::ln::msgs::DecodeError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_RevokeAndACKDecodeErrorZ = Bindings.Result_RevokeAndACKDecodeErrorZ

			extension Bindings {

				/// A CResult_RevokeAndACKDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning::ln::msgs::RevokeAndACK on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_RevokeAndACKDecodeErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_RevokeAndACKDecodeErrorZ?

					internal init(cType: LDKCResult_RevokeAndACKDecodeErrorZ, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCResult_RevokeAndACKDecodeErrorZ, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_RevokeAndACKDecodeErrorZ in the success state.
					public class func initWithOk(o: RevokeAndACK) -> Result_RevokeAndACKDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_RevokeAndACKDecodeErrorZ_ok(o.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_RevokeAndACKDecodeErrorZ(cType: nativeCallResult, instantiationContext: "Result_RevokeAndACKDecodeErrorZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Creates a new CResult_RevokeAndACKDecodeErrorZ in the error state.
					public class func initWithErr(e: DecodeError) -> Result_RevokeAndACKDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_RevokeAndACKDecodeErrorZ_err(e.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_RevokeAndACKDecodeErrorZ(cType: nativeCallResult, instantiationContext: "Result_RevokeAndACKDecodeErrorZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_RevokeAndACKDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_RevokeAndACKDecodeErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_RevokeAndACKDecodeErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_RevokeAndACKDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_RevokeAndACKDecodeErrorZ>) in
				CResult_RevokeAndACKDecodeErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_RevokeAndACKDecodeErrorZ(cType: nativeCallResult, instantiationContext: "Result_RevokeAndACKDecodeErrorZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					
					public func getError() -> DecodeError? {
						if self.cType?.result_ok == false {
							return DecodeError(cType: self.cType!.contents.err.pointee, instantiationContext: "Result_RevokeAndACKDecodeErrorZ.swift::\(#function):\(#line)", anchor: self)
						}
						return nil
					}
					

					
					public func getValue() -> RevokeAndACK? {
						if self.cType?.result_ok == true {
							return RevokeAndACK(cType: self.cType!.contents.result.pointee, instantiationContext: "Result_RevokeAndACKDecodeErrorZ.swift::\(#function):\(#line)", anchor: self)
						}
						return nil
					}
					

					internal func dangle(_ shouldDangle: Bool = true) -> Result_RevokeAndACKDecodeErrorZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Result_RevokeAndACKDecodeErrorZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Result_RevokeAndACKDecodeErrorZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Result_RevokeAndACKDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		