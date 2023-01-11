
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// 
			internal typealias Option_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ = Bindings.Option_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ

			extension Bindings {

				/// An enum which can either contain a crate::c_types::derived::C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ or not
				internal class Option_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCOption_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ?

					internal init(cType: LDKCOption_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKCOption_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init(some: (ChannelAnnouncement, ChannelUpdate, ChannelUpdate)?) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						if let some = some {
							
							let someTuple = Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ(tuple: some).danglingClone()
				
							self.cType = COption_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ_some(someTuple.cType!)
						} else {
							self.cType = COption_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ_none()
						}

						super.init(conflictAvoidingVariableName: 0)
					}

					
					/// Frees any resources associated with the crate::c_types::derived::C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ, if we are in the Some state
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = COption_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new COption_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Option_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCOption_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ>) in
				COption_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Option_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ(cType: nativeCallResult)
						

						return returnValue
					}
		

					public func getValue() -> (ChannelAnnouncement, ChannelUpdate, ChannelUpdate)? {
						if self.cType!.tag == LDKCOption_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ_None {
							return nil
						}
						if self.cType!.tag == LDKCOption_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ_Some {
							return Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZ(cType: self.cType!.some, anchor: self).dangle().getValue()
						}
						assert(false, "invalid option enum value")
						return nil
					}

					internal func dangle(_ shouldDangle: Bool = true) -> Option_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Option_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Option_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Option_C3Tuple_ChannelAnnouncementChannelUpdateChannelUpdateZZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		