
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_ChannelTransactionParametersDecodeErrorZ represents the result of a fallible operation,
			/// containing a crate::lightning::ln::chan_utils::ChannelTransactionParameters on success and a crate::lightning::ln::msgs::DecodeError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_ChannelTransactionParametersDecodeErrorZ = Bindings.Result_ChannelTransactionParametersDecodeErrorZ

			extension Bindings {

				/// A CResult_ChannelTransactionParametersDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning::ln::chan_utils::ChannelTransactionParameters on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_ChannelTransactionParametersDecodeErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_ChannelTransactionParametersDecodeErrorZ?

					internal init(cType: LDKCResult_ChannelTransactionParametersDecodeErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKCResult_ChannelTransactionParametersDecodeErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_ChannelTransactionParametersDecodeErrorZ in the success state.
					public class func initWithOk(o: ChannelTransactionParameters) -> Result_ChannelTransactionParametersDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_ChannelTransactionParametersDecodeErrorZ_ok(o.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_ChannelTransactionParametersDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new CResult_ChannelTransactionParametersDecodeErrorZ in the error state.
					public class func initWithErr(e: DecodeError) -> Result_ChannelTransactionParametersDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_ChannelTransactionParametersDecodeErrorZ_err(e.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_ChannelTransactionParametersDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_ChannelTransactionParametersDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_ChannelTransactionParametersDecodeErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_ChannelTransactionParametersDecodeErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_ChannelTransactionParametersDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_ChannelTransactionParametersDecodeErrorZ>) in
				CResult_ChannelTransactionParametersDecodeErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_ChannelTransactionParametersDecodeErrorZ(cType: nativeCallResult)
						

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
					

					
					public func getValue() -> ChannelTransactionParameters? {
						if self.cType?.result_ok == true {
							return ChannelTransactionParameters(cType: self.cType!.contents.result.pointee, anchor: self)
						}
						return nil
					}
					

					internal func dangle(_ shouldDangle: Bool = true) -> Result_ChannelTransactionParametersDecodeErrorZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Result_ChannelTransactionParametersDecodeErrorZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Result_ChannelTransactionParametersDecodeErrorZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Result_ChannelTransactionParametersDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		