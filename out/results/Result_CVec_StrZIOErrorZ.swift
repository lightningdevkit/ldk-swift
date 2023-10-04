
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_CVec_StrZIOErrorZ represents the result of a fallible operation,
			/// containing a crate::c_types::derived::CVec_StrZ on success and a crate::c_types::IOError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_CVec_StrZIOErrorZ = Bindings.Result_CVec_StrZIOErrorZ

			extension Bindings {

				/// A CResult_CVec_StrZIOErrorZ represents the result of a fallible operation,
				/// containing a crate::c_types::derived::CVec_StrZ on success and a crate::c_types::IOError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_CVec_StrZIOErrorZ: NativeTypeWrapper {

					
					/// Set to false to suppress an individual type's deinit log statements.
					/// Only applicable when log threshold is set to `.Debug`.
					public static var enableDeinitLogging = true

					/// Set to true to suspend the freeing of this type's associated Rust memory.
					/// Should only ever be used for debugging purposes, and will likely be
					/// deprecated soon.
					public static var suspendFreedom = false

					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_CVec_StrZIOErrorZ?

					internal init(cType: LDKCResult_CVec_StrZIOErrorZ, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCResult_CVec_StrZIOErrorZ, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKCResult_CVec_StrZIOErrorZ, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_CVec_StrZIOErrorZ in the success state.
					public class func initWithOk(o: [String]) -> Result_CVec_StrZIOErrorZ {
						// native call variable prep
						
						let oVector = Vec_StrZ(array: o, instantiationContext: "Result_CVec_StrZIOErrorZ.swift::\(#function):\(#line)").dangle()
				

						// native method call
						let nativeCallResult = CResult_CVec_StrZIOErrorZ_ok(oVector.cType!)

						// cleanup
						
						// oVector.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_CVec_StrZIOErrorZ(cType: nativeCallResult, instantiationContext: "Result_CVec_StrZIOErrorZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Creates a new CResult_CVec_StrZIOErrorZ in the error state.
					public class func initWithErr(e: IOError) -> Result_CVec_StrZIOErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_CVec_StrZIOErrorZ_err(e.getCValue())

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_CVec_StrZIOErrorZ(cType: nativeCallResult, instantiationContext: "Result_CVec_StrZIOErrorZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_CVec_StrZIOErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_CVec_StrZIOErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_CVec_StrZIOErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_CVec_StrZIOErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_CVec_StrZIOErrorZ>) in
				CResult_CVec_StrZIOErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_CVec_StrZIOErrorZ(cType: nativeCallResult, instantiationContext: "Result_CVec_StrZIOErrorZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					
					public func getError() -> IOError? {
						if self.cType?.result_ok == false {
							return IOError(value: self.cType!.contents.err.pointee)
						}
						return nil
					}
					

					
					public func getValue() -> [String]? {
						if self.cType?.result_ok == true {
							return Vec_StrZ(cType: self.cType!.contents.result.pointee, instantiationContext: "Result_CVec_StrZIOErrorZ.swift::\(#function):\(#line)", anchor: self).getValue()
						}
						return nil
					}
					

					
					internal func danglingClone() -> Result_CVec_StrZIOErrorZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing Result_CVec_StrZIOErrorZ \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing Result_CVec_StrZIOErrorZ \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

				}

			}
		