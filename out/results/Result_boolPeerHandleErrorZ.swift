
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_boolPeerHandleErrorZ represents the result of a fallible operation,
			/// containing a bool on success and a crate::lightning::ln::peer_handler::PeerHandleError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_boolPeerHandleErrorZ = Bindings.Result_boolPeerHandleErrorZ

			extension Bindings {

				/// A CResult_boolPeerHandleErrorZ represents the result of a fallible operation,
				/// containing a bool on success and a crate::lightning::ln::peer_handler::PeerHandleError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_boolPeerHandleErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_boolPeerHandleErrorZ?

					internal init(cType: LDKCResult_boolPeerHandleErrorZ, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCResult_boolPeerHandleErrorZ, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_boolPeerHandleErrorZ in the success state.
					public class func initWithOk(o: Bool) -> Result_boolPeerHandleErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_boolPeerHandleErrorZ_ok(o)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_boolPeerHandleErrorZ(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Creates a new CResult_boolPeerHandleErrorZ in the error state.
					public class func initWithErr(e: PeerHandleError) -> Result_boolPeerHandleErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_boolPeerHandleErrorZ_err(e.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_boolPeerHandleErrorZ(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_boolPeerHandleErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_boolPeerHandleErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_boolPeerHandleErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_boolPeerHandleErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_boolPeerHandleErrorZ>) in
				CResult_boolPeerHandleErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_boolPeerHandleErrorZ(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)")
						

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					
					public func getError() -> PeerHandleError? {
						if self.cType?.result_ok == false {
							return PeerHandleError(cType: self.cType!.contents.err.pointee, instantiationContext: "#{swift_class_name}::\(#function):\(#line)", anchor: self)
						}
						return nil
					}
					

					
					public func getValue() -> Bool? {
						if self.cType?.result_ok == true {
							return self.cType!.contents.result.pointee
						}
						return nil
					}
					

					internal func dangle(_ shouldDangle: Bool = true) -> Result_boolPeerHandleErrorZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Result_boolPeerHandleErrorZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Result_boolPeerHandleErrorZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Result_boolPeerHandleErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		