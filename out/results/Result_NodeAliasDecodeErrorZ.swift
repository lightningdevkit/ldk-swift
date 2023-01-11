
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_NodeAliasDecodeErrorZ represents the result of a fallible operation,
			/// containing a crate::lightning::routing::gossip::NodeAlias on success and a crate::lightning::ln::msgs::DecodeError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_NodeAliasDecodeErrorZ = Bindings.Result_NodeAliasDecodeErrorZ

			extension Bindings {

				/// A CResult_NodeAliasDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning::routing::gossip::NodeAlias on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_NodeAliasDecodeErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_NodeAliasDecodeErrorZ?

					internal init(cType: LDKCResult_NodeAliasDecodeErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKCResult_NodeAliasDecodeErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_NodeAliasDecodeErrorZ in the success state.
					public class func initWithOk(o: NodeAlias) -> Result_NodeAliasDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_NodeAliasDecodeErrorZ_ok(o.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_NodeAliasDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new CResult_NodeAliasDecodeErrorZ in the error state.
					public class func initWithErr(e: DecodeError) -> Result_NodeAliasDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_NodeAliasDecodeErrorZ_err(e.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_NodeAliasDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_NodeAliasDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_NodeAliasDecodeErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_NodeAliasDecodeErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_NodeAliasDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_NodeAliasDecodeErrorZ>) in
				CResult_NodeAliasDecodeErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_NodeAliasDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					
					public func getError() -> DecodeError? {
						if self.cType?.result_ok == false {
							return DecodeError(cType: self.cType!.contents.err.pointee, anchor: self)
						}
						return nil
					}
					

					
					public func getValue() -> NodeAlias? {
						if self.cType?.result_ok == true {
							return NodeAlias(cType: self.cType!.contents.result.pointee, anchor: self)
						}
						return nil
					}
					

					internal func dangle(_ shouldDangle: Bool = true) -> Result_NodeAliasDecodeErrorZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Result_NodeAliasDecodeErrorZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Result_NodeAliasDecodeErrorZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Result_NodeAliasDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		