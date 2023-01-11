
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_TxOutAccessErrorZ represents the result of a fallible operation,
			/// containing a crate::c_types::TxOut on success and a crate::lightning::chain::AccessError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_TxOutAccessErrorZ = Bindings.Result_TxOutAccessErrorZ

			extension Bindings {

				/// A CResult_TxOutAccessErrorZ represents the result of a fallible operation,
				/// containing a crate::c_types::TxOut on success and a crate::lightning::chain::AccessError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_TxOutAccessErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_TxOutAccessErrorZ?

					internal init(cType: LDKCResult_TxOutAccessErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKCResult_TxOutAccessErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_TxOutAccessErrorZ in the success state.
					public class func initWithOk(o: TxOut) -> Result_TxOutAccessErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_TxOutAccessErrorZ_ok(o.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_TxOutAccessErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new CResult_TxOutAccessErrorZ in the error state.
					public class func initWithErr(e: AccessError) -> Result_TxOutAccessErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_TxOutAccessErrorZ_err(e.getCValue())

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_TxOutAccessErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_TxOutAccessErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_TxOutAccessErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_TxOutAccessErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_TxOutAccessErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_TxOutAccessErrorZ>) in
				CResult_TxOutAccessErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_TxOutAccessErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					
					public func getError() -> AccessError? {
						if self.cType?.result_ok == false {
							return AccessError(value: self.cType!.contents.err.pointee)
						}
						return nil
					}
					

					
					public func getValue() -> TxOut? {
						if self.cType?.result_ok == true {
							return TxOut(cType: self.cType!.contents.result.pointee, anchor: self)
						}
						return nil
					}
					

					internal func dangle(_ shouldDangle: Bool = true) -> Result_TxOutAccessErrorZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Result_TxOutAccessErrorZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Result_TxOutAccessErrorZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Result_TxOutAccessErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		