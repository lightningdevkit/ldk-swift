
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_u32GraphSyncErrorZ represents the result of a fallible operation,
			/// containing a u32 on success and a crate::lightning_rapid_gossip_sync::error::GraphSyncError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_u32GraphSyncErrorZ = Bindings.Result_u32GraphSyncErrorZ

			extension Bindings {

				/// A CResult_u32GraphSyncErrorZ represents the result of a fallible operation,
				/// containing a u32 on success and a crate::lightning_rapid_gossip_sync::error::GraphSyncError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_u32GraphSyncErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_u32GraphSyncErrorZ?

					internal init(cType: LDKCResult_u32GraphSyncErrorZ, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCResult_u32GraphSyncErrorZ, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_u32GraphSyncErrorZ in the success state.
					public class func initWithOk(o: UInt32) -> Result_u32GraphSyncErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_u32GraphSyncErrorZ_ok(o)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_u32GraphSyncErrorZ(cType: nativeCallResult, instantiationContext: "Result_u32GraphSyncErrorZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Creates a new CResult_u32GraphSyncErrorZ in the error state.
					public class func initWithErr(e: GraphSyncError) -> Result_u32GraphSyncErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_u32GraphSyncErrorZ_err(e.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_u32GraphSyncErrorZ(cType: nativeCallResult, instantiationContext: "Result_u32GraphSyncErrorZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_u32GraphSyncErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_u32GraphSyncErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					
					public func getError() -> GraphSyncError? {
						if self.cType?.result_ok == false {
							return GraphSyncError(cType: self.cType!.contents.err.pointee, instantiationContext: "Result_u32GraphSyncErrorZ.swift::\(#function):\(#line)", anchor: self)
						}
						return nil
					}
					

					
					public func getValue() -> UInt32? {
						if self.cType?.result_ok == true {
							return self.cType!.contents.result.pointee
						}
						return nil
					}
					

					internal func dangle(_ shouldDangle: Bool = true) -> Result_u32GraphSyncErrorZ {
        				self.dangling = shouldDangle
						return self
					}

					
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Result_u32GraphSyncErrorZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Result_u32GraphSyncErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		