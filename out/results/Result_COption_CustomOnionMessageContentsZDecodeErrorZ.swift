
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_COption_CustomOnionMessageContentsZDecodeErrorZ represents the result of a fallible operation,
			/// containing a crate::c_types::derived::COption_CustomOnionMessageContentsZ on success and a crate::lightning::ln::msgs::DecodeError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_COption_CustomOnionMessageContentsZDecodeErrorZ = Bindings.Result_COption_CustomOnionMessageContentsZDecodeErrorZ

			extension Bindings {

				/// A CResult_COption_CustomOnionMessageContentsZDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::c_types::derived::COption_CustomOnionMessageContentsZ on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_COption_CustomOnionMessageContentsZDecodeErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_COption_CustomOnionMessageContentsZDecodeErrorZ?

					internal init(cType: LDKCResult_COption_CustomOnionMessageContentsZDecodeErrorZ, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCResult_COption_CustomOnionMessageContentsZDecodeErrorZ, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_COption_CustomOnionMessageContentsZDecodeErrorZ in the success state.
					public class func initWithOk(o: CustomOnionMessageContents?) -> Result_COption_CustomOnionMessageContentsZDecodeErrorZ {
						// native call variable prep
						
						let oOption = Option_CustomOnionMessageContentsZ(some: o).danglingClone()
				

						// native method call
						let nativeCallResult = CResult_COption_CustomOnionMessageContentsZDecodeErrorZ_ok(oOption.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_COption_CustomOnionMessageContentsZDecodeErrorZ(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Creates a new CResult_COption_CustomOnionMessageContentsZDecodeErrorZ in the error state.
					public class func initWithErr(e: DecodeError) -> Result_COption_CustomOnionMessageContentsZDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_COption_CustomOnionMessageContentsZDecodeErrorZ_err(e.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_COption_CustomOnionMessageContentsZDecodeErrorZ(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_COption_CustomOnionMessageContentsZDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_COption_CustomOnionMessageContentsZDecodeErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_COption_CustomOnionMessageContentsZDecodeErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_COption_CustomOnionMessageContentsZDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_COption_CustomOnionMessageContentsZDecodeErrorZ>) in
				CResult_COption_CustomOnionMessageContentsZDecodeErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_COption_CustomOnionMessageContentsZDecodeErrorZ(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)")
						

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
					

					
					public func getValue() -> CustomOnionMessageContents? {
						if self.cType?.result_ok == true {
							return Option_CustomOnionMessageContentsZ(cType: self.cType!.contents.result.pointee, instantiationContext: "#{swift_class_name}::\(#function):\(#line)", anchor: self).getValue()
						}
						return nil
					}
					

					internal func dangle(_ shouldDangle: Bool = true) -> Result_COption_CustomOnionMessageContentsZDecodeErrorZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Result_COption_CustomOnionMessageContentsZDecodeErrorZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Result_COption_CustomOnionMessageContentsZDecodeErrorZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Result_COption_CustomOnionMessageContentsZDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		