
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_SharedSecretNoneZ represents the result of a fallible operation,
			/// containing a crate::c_types::ThirtyTwoBytes on success and a () on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_SharedSecretNoneZ = Bindings.Result_SharedSecretNoneZ

			extension Bindings {

				/// A CResult_SharedSecretNoneZ represents the result of a fallible operation,
				/// containing a crate::c_types::ThirtyTwoBytes on success and a () on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_SharedSecretNoneZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_SharedSecretNoneZ?

					internal init(cType: LDKCResult_SharedSecretNoneZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKCResult_SharedSecretNoneZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_SharedSecretNoneZ in the success state.
					public class func initWithOk(o: [UInt8]) -> Result_SharedSecretNoneZ {
						// native call variable prep
						
						let oPrimitiveWrapper = ThirtyTwoBytes(value: o)
				

						// native method call
						let nativeCallResult = CResult_SharedSecretNoneZ_ok(oPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						oPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_SharedSecretNoneZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new CResult_SharedSecretNoneZ in the error state.
					public class func initWithErr() -> Result_SharedSecretNoneZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_SharedSecretNoneZ_err()

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_SharedSecretNoneZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_SharedSecretNoneZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_SharedSecretNoneZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_SharedSecretNoneZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_SharedSecretNoneZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_SharedSecretNoneZ>) in
				CResult_SharedSecretNoneZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_SharedSecretNoneZ(cType: nativeCallResult)
						

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
							return ThirtyTwoBytes(cType: self.cType!.contents.result.pointee, anchor: self).getValue()
						}
						return nil
					}
					

					internal func dangle(_ shouldDangle: Bool = true) -> Result_SharedSecretNoneZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Result_SharedSecretNoneZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Result_SharedSecretNoneZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Result_SharedSecretNoneZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		