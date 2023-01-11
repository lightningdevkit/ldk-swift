
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A dynamically-allocated array of crate::lightning::ln::msgs::UpdateFailHTLCs of arbitrary size.
			/// This corresponds to std::vector in C++
			internal typealias Vec_UpdateFailHTLCZ = Bindings.Vec_UpdateFailHTLCZ

			extension Bindings {

				/// A dynamically-allocated array of crate::lightning::ln::msgs::UpdateFailHTLCs of arbitrary size.
				/// This corresponds to std::vector in C++
				internal class Vec_UpdateFailHTLCZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCVec_UpdateFailHTLCZ?

					internal init(cType: LDKCVec_UpdateFailHTLCZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKCVec_UpdateFailHTLCZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init(array: [UpdateFailHTLC]) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						super.init(conflictAvoidingVariableName: 0)

						
						let rustArray = array.map { (currentValueDepth1: UpdateFailHTLC) -> LDKUpdateFailHTLC in
							
							return currentValueDepth1.dynamicallyDangledClone().cType!
						}
				

						

						let dataContainer = UnsafeMutablePointer<LDKUpdateFailHTLC>.allocate(capacity: array.count)
						dataContainer.initialize(from: rustArray, count: array.count)

        				let vector = LDKCVec_UpdateFailHTLCZ(data: dataContainer, datalen: UInt(array.count))
        				self.cType = vector
					}

					public func getValue() -> [UpdateFailHTLC] {

						var array = [LDKUpdateFailHTLC]()

						
						for index1 in 0..<Int(self.cType!.datalen) {
							let currentEntry1 = self.cType!.data[index1]
							array.append(currentEntry1)
						}
		

						let swiftArray = array.map { (currentCType: LDKUpdateFailHTLC) -> UpdateFailHTLC in
UpdateFailHTLC(cType: currentCType, anchor: self).dangle()
						}
						return swiftArray
					}

					
					/// Frees the buffer pointed to by `data` if `datalen` is non-0.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CVec_UpdateFailHTLCZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					internal func dangle(_ shouldDangle: Bool = true) -> Vec_UpdateFailHTLCZ {
        				self.dangling = shouldDangle
						return self
					}

					
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Vec_UpdateFailHTLCZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Vec_UpdateFailHTLCZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		