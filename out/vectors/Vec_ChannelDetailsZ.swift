
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A dynamically-allocated array of crate::lightning::ln::channelmanager::ChannelDetailss of arbitrary size.
			/// This corresponds to std::vector in C++
			internal typealias Vec_ChannelDetailsZ = Bindings.Vec_ChannelDetailsZ

			extension Bindings {

				/// A dynamically-allocated array of crate::lightning::ln::channelmanager::ChannelDetailss of arbitrary size.
				/// This corresponds to std::vector in C++
				internal class Vec_ChannelDetailsZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCVec_ChannelDetailsZ?

					internal init(cType: LDKCVec_ChannelDetailsZ, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCVec_ChannelDetailsZ, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					internal init(array: [ChannelDetails]) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						super.init(conflictAvoidingVariableName: 0, instantiationContext: "Vec_ChannelDetailsZ.swift::\(#function):\(#line)")

						
						let rustArray = array.map { (currentValueDepth1: ChannelDetails) -> LDKChannelDetails in
							
							return currentValueDepth1.dynamicallyDangledClone().cType!
						}
				

						

						let dataContainer = UnsafeMutablePointer<LDKChannelDetails>.allocate(capacity: array.count)
						dataContainer.initialize(from: rustArray, count: array.count)

        				let vector = LDKCVec_ChannelDetailsZ(data: dataContainer, datalen: UInt(array.count))
        				self.cType = vector
					}

					public func getValue() -> [ChannelDetails] {

						var array = [LDKChannelDetails]()

						
						for index1 in 0..<Int(self.cType!.datalen) {
							let currentEntry1 = self.cType!.data[index1]
							array.append(currentEntry1)
						}
		

						let swiftArray = array.map { (currentCType: LDKChannelDetails) -> ChannelDetails in
ChannelDetails(cType: currentCType, instantiationContext: "#{swift_class_name}::\(#function):\(#line)", anchor: self).dangle()
						}
						return swiftArray
					}

					
					/// Frees the buffer pointed to by `data` if `datalen` is non-0.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CVec_ChannelDetailsZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					internal func dangle(_ shouldDangle: Bool = true) -> Vec_ChannelDetailsZ {
        				self.dangling = shouldDangle
						return self
					}

					
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Vec_ChannelDetailsZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Vec_ChannelDetailsZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		