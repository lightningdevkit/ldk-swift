
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_ShutdownScriptInvalidShutdownScriptZ represents the result of a fallible operation,
			/// containing a crate::lightning::ln::script::ShutdownScript on success and a crate::lightning::ln::script::InvalidShutdownScript on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_ShutdownScriptInvalidShutdownScriptZ = Bindings.Result_ShutdownScriptInvalidShutdownScriptZ

			extension Bindings {

				/// A CResult_ShutdownScriptInvalidShutdownScriptZ represents the result of a fallible operation,
				/// containing a crate::lightning::ln::script::ShutdownScript on success and a crate::lightning::ln::script::InvalidShutdownScript on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_ShutdownScriptInvalidShutdownScriptZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_ShutdownScriptInvalidShutdownScriptZ?

					internal init(cType: LDKCResult_ShutdownScriptInvalidShutdownScriptZ, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCResult_ShutdownScriptInvalidShutdownScriptZ, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_ShutdownScriptInvalidShutdownScriptZ in the success state.
					public class func initWithOk(o: ShutdownScript) -> Result_ShutdownScriptInvalidShutdownScriptZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_ShutdownScriptInvalidShutdownScriptZ_ok(o.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_ShutdownScriptInvalidShutdownScriptZ(cType: nativeCallResult, instantiationContext: "Result_ShutdownScriptInvalidShutdownScriptZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Creates a new CResult_ShutdownScriptInvalidShutdownScriptZ in the error state.
					public class func initWithErr(e: InvalidShutdownScript) -> Result_ShutdownScriptInvalidShutdownScriptZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_ShutdownScriptInvalidShutdownScriptZ_err(e.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_ShutdownScriptInvalidShutdownScriptZ(cType: nativeCallResult, instantiationContext: "Result_ShutdownScriptInvalidShutdownScriptZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_ShutdownScriptInvalidShutdownScriptZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_ShutdownScriptInvalidShutdownScriptZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_ShutdownScriptInvalidShutdownScriptZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_ShutdownScriptInvalidShutdownScriptZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_ShutdownScriptInvalidShutdownScriptZ>) in
				CResult_ShutdownScriptInvalidShutdownScriptZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_ShutdownScriptInvalidShutdownScriptZ(cType: nativeCallResult, instantiationContext: "Result_ShutdownScriptInvalidShutdownScriptZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					
					public func getError() -> InvalidShutdownScript? {
						if self.cType?.result_ok == false {
							return InvalidShutdownScript(cType: self.cType!.contents.err.pointee, instantiationContext: "Result_ShutdownScriptInvalidShutdownScriptZ.swift::\(#function):\(#line)", anchor: self)
						}
						return nil
					}
					

					
					public func getValue() -> ShutdownScript? {
						if self.cType?.result_ok == true {
							return ShutdownScript(cType: self.cType!.contents.result.pointee, instantiationContext: "Result_ShutdownScriptInvalidShutdownScriptZ.swift::\(#function):\(#line)", anchor: self)
						}
						return nil
					}
					

					internal func dangle(_ shouldDangle: Bool = true) -> Result_ShutdownScriptInvalidShutdownScriptZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Result_ShutdownScriptInvalidShutdownScriptZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Result_ShutdownScriptInvalidShutdownScriptZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Result_ShutdownScriptInvalidShutdownScriptZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		