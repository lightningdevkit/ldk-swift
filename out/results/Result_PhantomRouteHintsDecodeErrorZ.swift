
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_PhantomRouteHintsDecodeErrorZ represents the result of a fallible operation,
			/// containing a crate::lightning::ln::channelmanager::PhantomRouteHints on success and a crate::lightning::ln::msgs::DecodeError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_PhantomRouteHintsDecodeErrorZ = Bindings.Result_PhantomRouteHintsDecodeErrorZ

			extension Bindings {

				/// A CResult_PhantomRouteHintsDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning::ln::channelmanager::PhantomRouteHints on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_PhantomRouteHintsDecodeErrorZ: NativeTypeWrapper {

					
					public static var enableDeinitLogging = true
					public static var suspendFreedom = false
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_PhantomRouteHintsDecodeErrorZ?

					internal init(cType: LDKCResult_PhantomRouteHintsDecodeErrorZ, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCResult_PhantomRouteHintsDecodeErrorZ, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_PhantomRouteHintsDecodeErrorZ in the success state.
					public class func initWithOk(o: PhantomRouteHints) -> Result_PhantomRouteHintsDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_PhantomRouteHintsDecodeErrorZ_ok(o.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_PhantomRouteHintsDecodeErrorZ(cType: nativeCallResult, instantiationContext: "Result_PhantomRouteHintsDecodeErrorZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Creates a new CResult_PhantomRouteHintsDecodeErrorZ in the error state.
					public class func initWithErr(e: DecodeError) -> Result_PhantomRouteHintsDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_PhantomRouteHintsDecodeErrorZ_err(e.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_PhantomRouteHintsDecodeErrorZ(cType: nativeCallResult, instantiationContext: "Result_PhantomRouteHintsDecodeErrorZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_PhantomRouteHintsDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_PhantomRouteHintsDecodeErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_PhantomRouteHintsDecodeErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_PhantomRouteHintsDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_PhantomRouteHintsDecodeErrorZ>) in
				CResult_PhantomRouteHintsDecodeErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_PhantomRouteHintsDecodeErrorZ(cType: nativeCallResult, instantiationContext: "Result_PhantomRouteHintsDecodeErrorZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					
					public func getError() -> DecodeError? {
						if self.cType?.result_ok == false {
							return DecodeError(cType: self.cType!.contents.err.pointee, instantiationContext: "Result_PhantomRouteHintsDecodeErrorZ.swift::\(#function):\(#line)", anchor: self)
						}
						return nil
					}
					

					
					public func getValue() -> PhantomRouteHints? {
						if self.cType?.result_ok == true {
							return PhantomRouteHints(cType: self.cType!.contents.result.pointee, instantiationContext: "Result_PhantomRouteHintsDecodeErrorZ.swift::\(#function):\(#line)", anchor: self)
						}
						return nil
					}
					

					internal func dangle(_ shouldDangle: Bool = true) -> Result_PhantomRouteHintsDecodeErrorZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Result_PhantomRouteHintsDecodeErrorZ {
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
								Bindings.print("Freeing Result_PhantomRouteHintsDecodeErrorZ \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing Result_PhantomRouteHintsDecodeErrorZ \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

				}

			}
		