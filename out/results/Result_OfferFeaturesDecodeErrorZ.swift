
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_OfferFeaturesDecodeErrorZ represents the result of a fallible operation,
			/// containing a crate::lightning::ln::features::OfferFeatures on success and a crate::lightning::ln::msgs::DecodeError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_OfferFeaturesDecodeErrorZ = Bindings.Result_OfferFeaturesDecodeErrorZ

			extension Bindings {

				/// A CResult_OfferFeaturesDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning::ln::features::OfferFeatures on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_OfferFeaturesDecodeErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_OfferFeaturesDecodeErrorZ?

					internal init(cType: LDKCResult_OfferFeaturesDecodeErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKCResult_OfferFeaturesDecodeErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_OfferFeaturesDecodeErrorZ in the success state.
					public class func initWithOk(o: OfferFeatures) -> Result_OfferFeaturesDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_OfferFeaturesDecodeErrorZ_ok(o.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_OfferFeaturesDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new CResult_OfferFeaturesDecodeErrorZ in the error state.
					public class func initWithErr(e: DecodeError) -> Result_OfferFeaturesDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_OfferFeaturesDecodeErrorZ_err(e.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_OfferFeaturesDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_OfferFeaturesDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_OfferFeaturesDecodeErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_OfferFeaturesDecodeErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_OfferFeaturesDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_OfferFeaturesDecodeErrorZ>) in
				CResult_OfferFeaturesDecodeErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_OfferFeaturesDecodeErrorZ(cType: nativeCallResult)
						

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
					

					
					public func getValue() -> OfferFeatures? {
						if self.cType?.result_ok == true {
							return OfferFeatures(cType: self.cType!.contents.result.pointee, anchor: self)
						}
						return nil
					}
					

					internal func dangle(_ shouldDangle: Bool = true) -> Result_OfferFeaturesDecodeErrorZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Result_OfferFeaturesDecodeErrorZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Result_OfferFeaturesDecodeErrorZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Result_OfferFeaturesDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		