
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_C2Tuple_SignatureSignatureZNoneZ represents the result of a fallible operation,
			/// containing a crate::c_types::derived::C2Tuple_SignatureSignatureZ on success and a () on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_C2Tuple_SignatureSignatureZNoneZ = Bindings.Result_C2Tuple_SignatureSignatureZNoneZ

			extension Bindings {

				/// A CResult_C2Tuple_SignatureSignatureZNoneZ represents the result of a fallible operation,
				/// containing a crate::c_types::derived::C2Tuple_SignatureSignatureZ on success and a () on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_C2Tuple_SignatureSignatureZNoneZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_C2Tuple_SignatureSignatureZNoneZ?

					internal init(cType: LDKCResult_C2Tuple_SignatureSignatureZNoneZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKCResult_C2Tuple_SignatureSignatureZNoneZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_C2Tuple_SignatureSignatureZNoneZ in the success state.
					public class func initWithOk(o: ([UInt8], [UInt8])) -> Result_C2Tuple_SignatureSignatureZNoneZ {
						// native call variable prep
						
						let oTuple = Tuple_SignatureSignatureZ(tuple: o).danglingClone()
				

						// native method call
						let nativeCallResult = CResult_C2Tuple_SignatureSignatureZNoneZ_ok(oTuple.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_C2Tuple_SignatureSignatureZNoneZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new CResult_C2Tuple_SignatureSignatureZNoneZ in the error state.
					public class func initWithErr() -> Result_C2Tuple_SignatureSignatureZNoneZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_C2Tuple_SignatureSignatureZNoneZ_err()

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_C2Tuple_SignatureSignatureZNoneZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_C2Tuple_SignatureSignatureZNoneZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_C2Tuple_SignatureSignatureZNoneZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_C2Tuple_SignatureSignatureZNoneZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_C2Tuple_SignatureSignatureZNoneZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_C2Tuple_SignatureSignatureZNoneZ>) in
				CResult_C2Tuple_SignatureSignatureZNoneZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_C2Tuple_SignatureSignatureZNoneZ(cType: nativeCallResult)
						

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					/*
					public func getError() -> Void? {
						if self.cType?.result_ok == false {
							return self.cType!.contents.err.pointee
						}
						return nil
					}
					*/

					
					public func getValue() -> ([UInt8], [UInt8])? {
						if self.cType?.result_ok == true {
							return Tuple_SignatureSignatureZ(cType: self.cType!.contents.result.pointee, anchor: self).getValue()
						}
						return nil
					}
					

					internal func dangle(_ shouldDangle: Bool = true) -> Result_C2Tuple_SignatureSignatureZNoneZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Result_C2Tuple_SignatureSignatureZNoneZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Result_C2Tuple_SignatureSignatureZNoneZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Result_C2Tuple_SignatureSignatureZNoneZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		