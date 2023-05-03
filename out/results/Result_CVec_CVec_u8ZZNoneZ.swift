
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_CVec_CVec_u8ZZNoneZ represents the result of a fallible operation,
			/// containing a crate::c_types::derived::CVec_CVec_u8ZZ on success and a () on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_CVec_CVec_u8ZZNoneZ = Bindings.Result_CVec_CVec_u8ZZNoneZ

			extension Bindings {

				/// A CResult_CVec_CVec_u8ZZNoneZ represents the result of a fallible operation,
				/// containing a crate::c_types::derived::CVec_CVec_u8ZZ on success and a () on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_CVec_CVec_u8ZZNoneZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_CVec_CVec_u8ZZNoneZ?

					internal init(cType: LDKCResult_CVec_CVec_u8ZZNoneZ, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCResult_CVec_CVec_u8ZZNoneZ, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_CVec_CVec_u8ZZNoneZ in the success state.
					public class func initWithOk(o: [[UInt8]]) -> Result_CVec_CVec_u8ZZNoneZ {
						// native call variable prep
						
						let oVector = Vec_CVec_u8ZZ(array: o).dangle()
				

						// native method call
						let nativeCallResult = CResult_CVec_CVec_u8ZZNoneZ_ok(oVector.cType!)

						// cleanup
						
						// oVector.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_CVec_CVec_u8ZZNoneZ(cType: nativeCallResult, instantiationContext: "Result_CVec_CVec_u8ZZNoneZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Creates a new CResult_CVec_CVec_u8ZZNoneZ in the error state.
					public class func initWithErr() -> Result_CVec_CVec_u8ZZNoneZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_CVec_CVec_u8ZZNoneZ_err()

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_CVec_CVec_u8ZZNoneZ(cType: nativeCallResult, instantiationContext: "Result_CVec_CVec_u8ZZNoneZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_CVec_CVec_u8ZZNoneZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_CVec_CVec_u8ZZNoneZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_CVec_CVec_u8ZZNoneZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_CVec_CVec_u8ZZNoneZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_CVec_CVec_u8ZZNoneZ>) in
				CResult_CVec_CVec_u8ZZNoneZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_CVec_CVec_u8ZZNoneZ(cType: nativeCallResult, instantiationContext: "Result_CVec_CVec_u8ZZNoneZ.swift::\(#function):\(#line)")
						

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

					
					public func getValue() -> [[UInt8]]? {
						if self.cType?.result_ok == true {
							return Vec_CVec_u8ZZ(cType: self.cType!.contents.result.pointee, instantiationContext: "Result_CVec_CVec_u8ZZNoneZ.swift::\(#function):\(#line)", anchor: self).getValue()
						}
						return nil
					}
					

					internal func dangle(_ shouldDangle: Bool = true) -> Result_CVec_CVec_u8ZZNoneZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Result_CVec_CVec_u8ZZNoneZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Result_CVec_CVec_u8ZZNoneZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Result_CVec_CVec_u8ZZNoneZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		