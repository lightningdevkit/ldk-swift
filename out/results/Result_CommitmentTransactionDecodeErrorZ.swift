
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_CommitmentTransactionDecodeErrorZ represents the result of a fallible operation,
			/// containing a crate::lightning::ln::chan_utils::CommitmentTransaction on success and a crate::lightning::ln::msgs::DecodeError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_CommitmentTransactionDecodeErrorZ = Bindings.Result_CommitmentTransactionDecodeErrorZ

			extension Bindings {

				/// A CResult_CommitmentTransactionDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning::ln::chan_utils::CommitmentTransaction on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_CommitmentTransactionDecodeErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_CommitmentTransactionDecodeErrorZ?

					internal init(cType: LDKCResult_CommitmentTransactionDecodeErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKCResult_CommitmentTransactionDecodeErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_CommitmentTransactionDecodeErrorZ in the success state.
					public class func initWithOk(o: CommitmentTransaction) -> Result_CommitmentTransactionDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_CommitmentTransactionDecodeErrorZ_ok(o.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_CommitmentTransactionDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new CResult_CommitmentTransactionDecodeErrorZ in the error state.
					public class func initWithErr(e: DecodeError) -> Result_CommitmentTransactionDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_CommitmentTransactionDecodeErrorZ_err(e.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_CommitmentTransactionDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_CommitmentTransactionDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_CommitmentTransactionDecodeErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_CommitmentTransactionDecodeErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_CommitmentTransactionDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_CommitmentTransactionDecodeErrorZ>) in
				CResult_CommitmentTransactionDecodeErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_CommitmentTransactionDecodeErrorZ(cType: nativeCallResult)
						

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
					

					
					public func getValue() -> CommitmentTransaction? {
						if self.cType?.result_ok == true {
							return CommitmentTransaction(cType: self.cType!.contents.result.pointee, anchor: self)
						}
						return nil
					}
					

					internal func dangle(_ shouldDangle: Bool = true) -> Result_CommitmentTransactionDecodeErrorZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Result_CommitmentTransactionDecodeErrorZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Result_CommitmentTransactionDecodeErrorZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Result_CommitmentTransactionDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		