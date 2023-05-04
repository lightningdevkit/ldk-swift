
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_BlindedPathDecodeErrorZ represents the result of a fallible operation,
			/// containing a crate::lightning::onion_message::blinded_path::BlindedPath on success and a crate::lightning::ln::msgs::DecodeError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_BlindedPathDecodeErrorZ = Bindings.Result_BlindedPathDecodeErrorZ

			extension Bindings {

				/// A CResult_BlindedPathDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning::onion_message::blinded_path::BlindedPath on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_BlindedPathDecodeErrorZ: NativeTypeWrapper {

					
					public static var enableDeinitLogging = true
					public static var suspendFreedom = false
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_BlindedPathDecodeErrorZ?

					internal init(cType: LDKCResult_BlindedPathDecodeErrorZ, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCResult_BlindedPathDecodeErrorZ, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_BlindedPathDecodeErrorZ in the success state.
					public class func initWithOk(o: BlindedPath) -> Result_BlindedPathDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_BlindedPathDecodeErrorZ_ok(o.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_BlindedPathDecodeErrorZ(cType: nativeCallResult, instantiationContext: "Result_BlindedPathDecodeErrorZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Creates a new CResult_BlindedPathDecodeErrorZ in the error state.
					public class func initWithErr(e: DecodeError) -> Result_BlindedPathDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_BlindedPathDecodeErrorZ_err(e.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_BlindedPathDecodeErrorZ(cType: nativeCallResult, instantiationContext: "Result_BlindedPathDecodeErrorZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_BlindedPathDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_BlindedPathDecodeErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_BlindedPathDecodeErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_BlindedPathDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_BlindedPathDecodeErrorZ>) in
				CResult_BlindedPathDecodeErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_BlindedPathDecodeErrorZ(cType: nativeCallResult, instantiationContext: "Result_BlindedPathDecodeErrorZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					
					public func getError() -> DecodeError? {
						if self.cType?.result_ok == false {
							return DecodeError(cType: self.cType!.contents.err.pointee, instantiationContext: "Result_BlindedPathDecodeErrorZ.swift::\(#function):\(#line)", anchor: self)
						}
						return nil
					}
					

					
					public func getValue() -> BlindedPath? {
						if self.cType?.result_ok == true {
							return BlindedPath(cType: self.cType!.contents.result.pointee, instantiationContext: "Result_BlindedPathDecodeErrorZ.swift::\(#function):\(#line)", anchor: self)
						}
						return nil
					}
					

					internal func dangle(_ shouldDangle: Bool = true) -> Result_BlindedPathDecodeErrorZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Result_BlindedPathDecodeErrorZ {
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
								Bindings.print("Freeing Result_BlindedPathDecodeErrorZ \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing Result_BlindedPathDecodeErrorZ \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

				}

			}
		