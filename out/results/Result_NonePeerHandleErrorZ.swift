
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_NonePeerHandleErrorZ represents the result of a fallible operation,
			/// containing a () on success and a crate::lightning::ln::peer_handler::PeerHandleError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_NonePeerHandleErrorZ = Bindings.Result_NonePeerHandleErrorZ

			extension Bindings {

				/// A CResult_NonePeerHandleErrorZ represents the result of a fallible operation,
				/// containing a () on success and a crate::lightning::ln::peer_handler::PeerHandleError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_NonePeerHandleErrorZ: NativeTypeWrapper {

					
					/// Set to false to suppress an individual type's deinit log statements.
					/// Only applicable when log threshold is set to `.Debug`.
					public static var enableDeinitLogging = true

					/// Set to true to suspend the freeing of this type's associated Rust memory.
					/// Should only ever be used for debugging purposes, and will likely be
					/// deprecated soon.
					public static var suspendFreedom = false

					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_NonePeerHandleErrorZ?

					internal init(cType: LDKCResult_NonePeerHandleErrorZ, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCResult_NonePeerHandleErrorZ, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKCResult_NonePeerHandleErrorZ, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_NonePeerHandleErrorZ in the success state.
					public class func initWithOk() -> Result_NonePeerHandleErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_NonePeerHandleErrorZ_ok()

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_NonePeerHandleErrorZ(cType: nativeCallResult, instantiationContext: "Result_NonePeerHandleErrorZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Creates a new CResult_NonePeerHandleErrorZ in the error state.
					public class func initWithErr(e: PeerHandleError) -> Result_NonePeerHandleErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_NonePeerHandleErrorZ_err(e.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_NonePeerHandleErrorZ(cType: nativeCallResult, instantiationContext: "Result_NonePeerHandleErrorZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_NonePeerHandleErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_NonePeerHandleErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_NonePeerHandleErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_NonePeerHandleErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_NonePeerHandleErrorZ>) in
				CResult_NonePeerHandleErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_NonePeerHandleErrorZ(cType: nativeCallResult, instantiationContext: "Result_NonePeerHandleErrorZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					
					public func getError() -> PeerHandleError? {
						if self.cType?.result_ok == false {
							return PeerHandleError(cType: self.cType!.contents.err.pointee, instantiationContext: "Result_NonePeerHandleErrorZ.swift::\(#function):\(#line)", anchor: self)
						}
						return nil
					}
					

					/*
					public func getValue() -> Void? {
						if self.cType?.result_ok == true {
							return self.cType!.contents.result.pointee
						}
						return nil
					}
					*/

					internal func dangle(_ shouldDangle: Bool = true) -> Result_NonePeerHandleErrorZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Result_NonePeerHandleErrorZ {
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
								Bindings.print("Freeing Result_NonePeerHandleErrorZ \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing Result_NonePeerHandleErrorZ \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

				}

			}
		