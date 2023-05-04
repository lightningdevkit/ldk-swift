
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_QueryChannelRangeDecodeErrorZ represents the result of a fallible operation,
			/// containing a crate::lightning::ln::msgs::QueryChannelRange on success and a crate::lightning::ln::msgs::DecodeError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_QueryChannelRangeDecodeErrorZ = Bindings.Result_QueryChannelRangeDecodeErrorZ

			extension Bindings {

				/// A CResult_QueryChannelRangeDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning::ln::msgs::QueryChannelRange on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_QueryChannelRangeDecodeErrorZ: NativeTypeWrapper {

					
					public static var enableDeinitLogging = true
					public static var suspendFreedom = false
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_QueryChannelRangeDecodeErrorZ?

					internal init(cType: LDKCResult_QueryChannelRangeDecodeErrorZ, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCResult_QueryChannelRangeDecodeErrorZ, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_QueryChannelRangeDecodeErrorZ in the success state.
					public class func initWithOk(o: QueryChannelRange) -> Result_QueryChannelRangeDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_QueryChannelRangeDecodeErrorZ_ok(o.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_QueryChannelRangeDecodeErrorZ(cType: nativeCallResult, instantiationContext: "Result_QueryChannelRangeDecodeErrorZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Creates a new CResult_QueryChannelRangeDecodeErrorZ in the error state.
					public class func initWithErr(e: DecodeError) -> Result_QueryChannelRangeDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_QueryChannelRangeDecodeErrorZ_err(e.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_QueryChannelRangeDecodeErrorZ(cType: nativeCallResult, instantiationContext: "Result_QueryChannelRangeDecodeErrorZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_QueryChannelRangeDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_QueryChannelRangeDecodeErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_QueryChannelRangeDecodeErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_QueryChannelRangeDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_QueryChannelRangeDecodeErrorZ>) in
				CResult_QueryChannelRangeDecodeErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_QueryChannelRangeDecodeErrorZ(cType: nativeCallResult, instantiationContext: "Result_QueryChannelRangeDecodeErrorZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					
					public func getError() -> DecodeError? {
						if self.cType?.result_ok == false {
							return DecodeError(cType: self.cType!.contents.err.pointee, instantiationContext: "Result_QueryChannelRangeDecodeErrorZ.swift::\(#function):\(#line)", anchor: self)
						}
						return nil
					}
					

					
					public func getValue() -> QueryChannelRange? {
						if self.cType?.result_ok == true {
							return QueryChannelRange(cType: self.cType!.contents.result.pointee, instantiationContext: "Result_QueryChannelRangeDecodeErrorZ.swift::\(#function):\(#line)", anchor: self)
						}
						return nil
					}
					

					internal func dangle(_ shouldDangle: Bool = true) -> Result_QueryChannelRangeDecodeErrorZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Result_QueryChannelRangeDecodeErrorZ {
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
								Bindings.print("Freeing Result_QueryChannelRangeDecodeErrorZ \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing Result_QueryChannelRangeDecodeErrorZ \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

				}

			}
		