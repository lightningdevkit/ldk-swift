
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A dynamically-allocated array of crate::lightning::util::events::MessageSendEvents of arbitrary size.
			/// This corresponds to std::vector in C++
			internal typealias Vec_MessageSendEventZ = Bindings.Vec_MessageSendEventZ

			extension Bindings {

				/// A dynamically-allocated array of crate::lightning::util::events::MessageSendEvents of arbitrary size.
				/// This corresponds to std::vector in C++
				internal class Vec_MessageSendEventZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCVec_MessageSendEventZ?

					internal init(cType: LDKCVec_MessageSendEventZ, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCVec_MessageSendEventZ, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					internal init(array: [MessageSendEvent]) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						super.init(conflictAvoidingVariableName: 0, instantiationContext: "Vec_MessageSendEventZ.swift::\(#function):\(#line)")

						
						let rustArray = array.map { (currentValueDepth1: MessageSendEvent) -> LDKMessageSendEvent in
							
							return currentValueDepth1.danglingClone().cType!
						}
				

						

						let dataContainer = UnsafeMutablePointer<LDKMessageSendEvent>.allocate(capacity: array.count)
						dataContainer.initialize(from: rustArray, count: array.count)

        				let vector = LDKCVec_MessageSendEventZ(data: dataContainer, datalen: UInt(array.count))
        				self.cType = vector
					}

					public func getValue() -> [MessageSendEvent] {

						var array = [LDKMessageSendEvent]()

						
						for index1 in 0..<Int(self.cType!.datalen) {
							let currentEntry1 = self.cType!.data[index1]
							array.append(currentEntry1)
						}
		

						let swiftArray = array.map { (currentCType: LDKMessageSendEvent) -> MessageSendEvent in
MessageSendEvent(cType: currentCType, instantiationContext: "#{swift_class_name}::\(#function):\(#line)", anchor: self).dangle()
						}
						return swiftArray
					}

					
					/// Frees the buffer pointed to by `data` if `datalen` is non-0.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CVec_MessageSendEventZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					internal func dangle(_ shouldDangle: Bool = true) -> Vec_MessageSendEventZ {
        				self.dangling = shouldDangle
						return self
					}

					
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Vec_MessageSendEventZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Vec_MessageSendEventZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		