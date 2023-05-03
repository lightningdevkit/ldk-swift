
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_COption_MonitorEventZDecodeErrorZ represents the result of a fallible operation,
			/// containing a crate::c_types::derived::COption_MonitorEventZ on success and a crate::lightning::ln::msgs::DecodeError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_COption_MonitorEventZDecodeErrorZ = Bindings.Result_COption_MonitorEventZDecodeErrorZ

			extension Bindings {

				/// A CResult_COption_MonitorEventZDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::c_types::derived::COption_MonitorEventZ on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_COption_MonitorEventZDecodeErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_COption_MonitorEventZDecodeErrorZ?

					internal init(cType: LDKCResult_COption_MonitorEventZDecodeErrorZ, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCResult_COption_MonitorEventZDecodeErrorZ, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_COption_MonitorEventZDecodeErrorZ in the success state.
					public class func initWithOk(o: MonitorEvent?) -> Result_COption_MonitorEventZDecodeErrorZ {
						// native call variable prep
						
						let oOption = Option_MonitorEventZ(some: o).danglingClone()
				

						// native method call
						let nativeCallResult = CResult_COption_MonitorEventZDecodeErrorZ_ok(oOption.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_COption_MonitorEventZDecodeErrorZ(cType: nativeCallResult, instantiationContext: "Result_COption_MonitorEventZDecodeErrorZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Creates a new CResult_COption_MonitorEventZDecodeErrorZ in the error state.
					public class func initWithErr(e: DecodeError) -> Result_COption_MonitorEventZDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_COption_MonitorEventZDecodeErrorZ_err(e.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_COption_MonitorEventZDecodeErrorZ(cType: nativeCallResult, instantiationContext: "Result_COption_MonitorEventZDecodeErrorZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_COption_MonitorEventZDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_COption_MonitorEventZDecodeErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_COption_MonitorEventZDecodeErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_COption_MonitorEventZDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_COption_MonitorEventZDecodeErrorZ>) in
				CResult_COption_MonitorEventZDecodeErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_COption_MonitorEventZDecodeErrorZ(cType: nativeCallResult, instantiationContext: "Result_COption_MonitorEventZDecodeErrorZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					
					public func getError() -> DecodeError? {
						if self.cType?.result_ok == false {
							return DecodeError(cType: self.cType!.contents.err.pointee, instantiationContext: "Result_COption_MonitorEventZDecodeErrorZ.swift::\(#function):\(#line)", anchor: self)
						}
						return nil
					}
					

					
					public func getValue() -> MonitorEvent? {
						if self.cType?.result_ok == true {
							return Option_MonitorEventZ(cType: self.cType!.contents.result.pointee, instantiationContext: "Result_COption_MonitorEventZDecodeErrorZ.swift::\(#function):\(#line)", anchor: self).getValue()
						}
						return nil
					}
					

					internal func dangle(_ shouldDangle: Bool = true) -> Result_COption_MonitorEventZDecodeErrorZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Result_COption_MonitorEventZDecodeErrorZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Result_COption_MonitorEventZDecodeErrorZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Result_COption_MonitorEventZDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		