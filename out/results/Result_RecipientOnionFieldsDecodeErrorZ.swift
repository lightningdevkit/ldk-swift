
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_RecipientOnionFieldsDecodeErrorZ represents the result of a fallible operation,
			/// containing a crate::lightning::ln::outbound_payment::RecipientOnionFields on success and a crate::lightning::ln::msgs::DecodeError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_RecipientOnionFieldsDecodeErrorZ = Bindings.Result_RecipientOnionFieldsDecodeErrorZ

			extension Bindings {

				/// A CResult_RecipientOnionFieldsDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning::ln::outbound_payment::RecipientOnionFields on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_RecipientOnionFieldsDecodeErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_RecipientOnionFieldsDecodeErrorZ?

					internal init(cType: LDKCResult_RecipientOnionFieldsDecodeErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKCResult_RecipientOnionFieldsDecodeErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_RecipientOnionFieldsDecodeErrorZ in the success state.
					public class func initWithOk(o: RecipientOnionFields) -> Result_RecipientOnionFieldsDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_RecipientOnionFieldsDecodeErrorZ_ok(o.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_RecipientOnionFieldsDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new CResult_RecipientOnionFieldsDecodeErrorZ in the error state.
					public class func initWithErr(e: DecodeError) -> Result_RecipientOnionFieldsDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_RecipientOnionFieldsDecodeErrorZ_err(e.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_RecipientOnionFieldsDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_RecipientOnionFieldsDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_RecipientOnionFieldsDecodeErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_RecipientOnionFieldsDecodeErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_RecipientOnionFieldsDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_RecipientOnionFieldsDecodeErrorZ>) in
				CResult_RecipientOnionFieldsDecodeErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_RecipientOnionFieldsDecodeErrorZ(cType: nativeCallResult)
						

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
					

					
					public func getValue() -> RecipientOnionFields? {
						if self.cType?.result_ok == true {
							return RecipientOnionFields(cType: self.cType!.contents.result.pointee, anchor: self)
						}
						return nil
					}
					

					internal func dangle(_ shouldDangle: Bool = true) -> Result_RecipientOnionFieldsDecodeErrorZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Result_RecipientOnionFieldsDecodeErrorZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Result_RecipientOnionFieldsDecodeErrorZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Result_RecipientOnionFieldsDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		