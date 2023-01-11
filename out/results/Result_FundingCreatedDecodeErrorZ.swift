
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_FundingCreatedDecodeErrorZ represents the result of a fallible operation,
			/// containing a crate::lightning::ln::msgs::FundingCreated on success and a crate::lightning::ln::msgs::DecodeError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_FundingCreatedDecodeErrorZ = Bindings.Result_FundingCreatedDecodeErrorZ

			extension Bindings {

				/// A CResult_FundingCreatedDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning::ln::msgs::FundingCreated on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_FundingCreatedDecodeErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_FundingCreatedDecodeErrorZ?

					internal init(cType: LDKCResult_FundingCreatedDecodeErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKCResult_FundingCreatedDecodeErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_FundingCreatedDecodeErrorZ in the success state.
					public class func initWithOk(o: FundingCreated) -> Result_FundingCreatedDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_FundingCreatedDecodeErrorZ_ok(o.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_FundingCreatedDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new CResult_FundingCreatedDecodeErrorZ in the error state.
					public class func initWithErr(e: DecodeError) -> Result_FundingCreatedDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_FundingCreatedDecodeErrorZ_err(e.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_FundingCreatedDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_FundingCreatedDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_FundingCreatedDecodeErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_FundingCreatedDecodeErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_FundingCreatedDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_FundingCreatedDecodeErrorZ>) in
				CResult_FundingCreatedDecodeErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_FundingCreatedDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					
					public func getError() -> DecodeError? {
						if self.cType?.result_ok == false {
							return DecodeError(cType: self.cType!.contents.err.pointee, anchor: self)
						}
						return nil
					}
					

					
					public func getValue() -> FundingCreated? {
						if self.cType?.result_ok == true {
							return FundingCreated(cType: self.cType!.contents.result.pointee, anchor: self)
						}
						return nil
					}
					

					internal func dangle(_ shouldDangle: Bool = true) -> Result_FundingCreatedDecodeErrorZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Result_FundingCreatedDecodeErrorZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Result_FundingCreatedDecodeErrorZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Result_FundingCreatedDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		