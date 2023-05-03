
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_BlindedPathNoneZ represents the result of a fallible operation,
			/// containing a crate::lightning::blinded_path::BlindedPath on success and a () on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_BlindedPathNoneZ = Bindings.Result_BlindedPathNoneZ

			extension Bindings {

				/// A CResult_BlindedPathNoneZ represents the result of a fallible operation,
				/// containing a crate::lightning::blinded_path::BlindedPath on success and a () on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_BlindedPathNoneZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_BlindedPathNoneZ?

					internal init(cType: LDKCResult_BlindedPathNoneZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKCResult_BlindedPathNoneZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_BlindedPathNoneZ in the success state.
					public class func initWithOk(o: BlindedPath) -> Result_BlindedPathNoneZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_BlindedPathNoneZ_ok(o.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_BlindedPathNoneZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new CResult_BlindedPathNoneZ in the error state.
					public class func initWithErr() -> Result_BlindedPathNoneZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_BlindedPathNoneZ_err()

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_BlindedPathNoneZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_BlindedPathNoneZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_BlindedPathNoneZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_BlindedPathNoneZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_BlindedPathNoneZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_BlindedPathNoneZ>) in
				CResult_BlindedPathNoneZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_BlindedPathNoneZ(cType: nativeCallResult)
						

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

					
					public func getValue() -> BlindedPath? {
						if self.cType?.result_ok == true {
							return BlindedPath(cType: self.cType!.contents.result.pointee, anchor: self)
						}
						return nil
					}
					

					internal func dangle(_ shouldDangle: Bool = true) -> Result_BlindedPathNoneZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Result_BlindedPathNoneZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Result_BlindedPathNoneZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Result_BlindedPathNoneZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		