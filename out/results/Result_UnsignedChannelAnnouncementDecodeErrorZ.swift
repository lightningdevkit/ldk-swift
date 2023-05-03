
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_UnsignedChannelAnnouncementDecodeErrorZ represents the result of a fallible operation,
			/// containing a crate::lightning::ln::msgs::UnsignedChannelAnnouncement on success and a crate::lightning::ln::msgs::DecodeError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_UnsignedChannelAnnouncementDecodeErrorZ = Bindings.Result_UnsignedChannelAnnouncementDecodeErrorZ

			extension Bindings {

				/// A CResult_UnsignedChannelAnnouncementDecodeErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning::ln::msgs::UnsignedChannelAnnouncement on success and a crate::lightning::ln::msgs::DecodeError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_UnsignedChannelAnnouncementDecodeErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_UnsignedChannelAnnouncementDecodeErrorZ?

					internal init(cType: LDKCResult_UnsignedChannelAnnouncementDecodeErrorZ, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCResult_UnsignedChannelAnnouncementDecodeErrorZ, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_UnsignedChannelAnnouncementDecodeErrorZ in the success state.
					public class func initWithOk(o: UnsignedChannelAnnouncement) -> Result_UnsignedChannelAnnouncementDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_UnsignedChannelAnnouncementDecodeErrorZ_ok(o.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_UnsignedChannelAnnouncementDecodeErrorZ(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Creates a new CResult_UnsignedChannelAnnouncementDecodeErrorZ in the error state.
					public class func initWithErr(e: DecodeError) -> Result_UnsignedChannelAnnouncementDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_UnsignedChannelAnnouncementDecodeErrorZ_err(e.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_UnsignedChannelAnnouncementDecodeErrorZ(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_UnsignedChannelAnnouncementDecodeErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_UnsignedChannelAnnouncementDecodeErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_UnsignedChannelAnnouncementDecodeErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_UnsignedChannelAnnouncementDecodeErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_UnsignedChannelAnnouncementDecodeErrorZ>) in
				CResult_UnsignedChannelAnnouncementDecodeErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_UnsignedChannelAnnouncementDecodeErrorZ(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)")
						

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
					

					
					public func getValue() -> UnsignedChannelAnnouncement? {
						if self.cType?.result_ok == true {
							return UnsignedChannelAnnouncement(cType: self.cType!.contents.result.pointee, instantiationContext: "#{swift_class_name}::\(#function):\(#line)", anchor: self)
						}
						return nil
					}
					

					internal func dangle(_ shouldDangle: Bool = true) -> Result_UnsignedChannelAnnouncementDecodeErrorZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Result_UnsignedChannelAnnouncementDecodeErrorZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Result_UnsignedChannelAnnouncementDecodeErrorZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Result_UnsignedChannelAnnouncementDecodeErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		