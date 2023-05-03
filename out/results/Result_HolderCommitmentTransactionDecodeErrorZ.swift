
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_HolderCommitmentTransactionDecodeErrorZ represents the result of a fallible operation,
			/// containing a crate::lightning::ln::chan_utils::HolderCommitmentTransaction on success and a crate::lightning::ln::msgs::DecodeError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_HolderCommitmentTransactionDecodeErrorZ = Bindings.Result_HolderCommitmentTransactionDecodeErrorZ

			extension Bindings {

				/// A CResult_HolderCommitmentTransactionDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning::ln::chan_utils::HolderCommitmentTransaction on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_HolderCommitmentTransactionDecodeErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_HolderCommitmentTransactionDecodeErrorZ?

					internal init(cType: LDKCResult_HolderCommitmentTransactionDecodeErrorZ, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCResult_HolderCommitmentTransactionDecodeErrorZ, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_HolderCommitmentTransactionDecodeErrorZ in the success state.
					public class func initWithOk(o: HolderCommitmentTransaction) -> Result_HolderCommitmentTransactionDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_HolderCommitmentTransactionDecodeErrorZ_ok(o.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_HolderCommitmentTransactionDecodeErrorZ(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Creates a new CResult_HolderCommitmentTransactionDecodeErrorZ in the error state.
					public class func initWithErr(e: DecodeError) -> Result_HolderCommitmentTransactionDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_HolderCommitmentTransactionDecodeErrorZ_err(e.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_HolderCommitmentTransactionDecodeErrorZ(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_HolderCommitmentTransactionDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_HolderCommitmentTransactionDecodeErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_HolderCommitmentTransactionDecodeErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_HolderCommitmentTransactionDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_HolderCommitmentTransactionDecodeErrorZ>) in
				CResult_HolderCommitmentTransactionDecodeErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_HolderCommitmentTransactionDecodeErrorZ(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)")
						

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
					

					
					public func getValue() -> HolderCommitmentTransaction? {
						if self.cType?.result_ok == true {
							return HolderCommitmentTransaction(cType: self.cType!.contents.result.pointee, instantiationContext: "#{swift_class_name}::\(#function):\(#line)", anchor: self)
						}
						return nil
					}
					

					internal func dangle(_ shouldDangle: Bool = true) -> Result_HolderCommitmentTransactionDecodeErrorZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Result_HolderCommitmentTransactionDecodeErrorZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Result_HolderCommitmentTransactionDecodeErrorZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Result_HolderCommitmentTransactionDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		