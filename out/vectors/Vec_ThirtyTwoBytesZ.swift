
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A dynamically-allocated array of crate::c_types::ThirtyTwoBytess of arbitrary size.
			/// This corresponds to std::vector in C++
			internal typealias Vec_ThirtyTwoBytesZ = Bindings.Vec_ThirtyTwoBytesZ

			extension Bindings {

				/// A dynamically-allocated array of crate::c_types::ThirtyTwoBytess of arbitrary size.
				/// This corresponds to std::vector in C++
				internal class Vec_ThirtyTwoBytesZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCVec_ThirtyTwoBytesZ?

					internal init(cType: LDKCVec_ThirtyTwoBytesZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKCVec_ThirtyTwoBytesZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init(array: [[UInt8]]) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						super.init(conflictAvoidingVariableName: 0)

						
						let rustArray = array.map { (currentValueDepth1: [UInt8]) -> LDKThirtyTwoBytes in
							
						let currentValueDepth1PrimitiveWrapper = ThirtyTwoBytes(value: currentValueDepth1)
				
							return currentValueDepth1PrimitiveWrapper.cType!
						}
				

						

						let dataContainer = UnsafeMutablePointer<LDKThirtyTwoBytes>.allocate(capacity: array.count)
						dataContainer.initialize(from: rustArray, count: array.count)

        				let vector = LDKCVec_ThirtyTwoBytesZ(data: dataContainer, datalen: UInt(array.count))
        				self.cType = vector
					}

					public func getValue() -> [[UInt8]] {

						var array = [LDKThirtyTwoBytes]()

						
						for index1 in 0..<Int(self.cType!.datalen) {
							let currentEntry1 = self.cType!.data[index1]
							array.append(currentEntry1)
						}
		

						let swiftArray = array.map { (currentCType: LDKThirtyTwoBytes) -> [UInt8] in
ThirtyTwoBytes(cType: currentCType).dangle().getValue()
						}
						return swiftArray
					}

					
					/// Frees the buffer pointed to by `data` if `datalen` is non-0.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CVec_ThirtyTwoBytesZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					internal func dangle(_ shouldDangle: Bool = true) -> Vec_ThirtyTwoBytesZ {
        				self.dangling = shouldDangle
						return self
					}

					
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Vec_ThirtyTwoBytesZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Vec_ThirtyTwoBytesZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		