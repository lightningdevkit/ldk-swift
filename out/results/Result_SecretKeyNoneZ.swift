
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_SecretKeyNoneZ represents the result of a fallible operation,
			/// containing a crate::c_types::SecretKey on success and a () on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_SecretKeyNoneZ = Bindings.Result_SecretKeyNoneZ

			extension Bindings {

				/// A CResult_SecretKeyNoneZ represents the result of a fallible operation,
				/// containing a crate::c_types::SecretKey on success and a () on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_SecretKeyNoneZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_SecretKeyNoneZ?

					internal init(cType: LDKCResult_SecretKeyNoneZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKCResult_SecretKeyNoneZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_SecretKeyNoneZ in the success state.
					public class func initWithOk(o: [UInt8]) -> Result_SecretKeyNoneZ {
						// native call variable prep
						
						let oPrimitiveWrapper = SecretKey(value: o)
				

						// native method call
						let nativeCallResult = CResult_SecretKeyNoneZ_ok(oPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						oPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_SecretKeyNoneZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new CResult_SecretKeyNoneZ in the error state.
					public class func initWithErr() -> Result_SecretKeyNoneZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_SecretKeyNoneZ_err()

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_SecretKeyNoneZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_SecretKeyNoneZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_SecretKeyNoneZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_SecretKeyNoneZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_SecretKeyNoneZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_SecretKeyNoneZ>) in
				CResult_SecretKeyNoneZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_SecretKeyNoneZ(cType: nativeCallResult)
						

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

					
					public func getValue() -> [UInt8]? {
						if self.cType?.result_ok == true {
							return SecretKey(cType: self.cType!.contents.result.pointee, anchor: self).getValue()
						}
						return nil
					}
					

					internal func dangle(_ shouldDangle: Bool = true) -> Result_SecretKeyNoneZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Result_SecretKeyNoneZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Result_SecretKeyNoneZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Result_SecretKeyNoneZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		