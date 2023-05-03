
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A dynamically-allocated array of crate::c_types::derived::CResult_NoneAPIErrorZs of arbitrary size.
			/// This corresponds to std::vector in C++
			internal typealias Vec_CResult_NoneAPIErrorZZ = Bindings.Vec_CResult_NoneAPIErrorZZ

			extension Bindings {

				/// A dynamically-allocated array of crate::c_types::derived::CResult_NoneAPIErrorZs of arbitrary size.
				/// This corresponds to std::vector in C++
				internal class Vec_CResult_NoneAPIErrorZZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCVec_CResult_NoneAPIErrorZZ?

					internal init(cType: LDKCVec_CResult_NoneAPIErrorZZ, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCVec_CResult_NoneAPIErrorZZ, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					internal init(array: [Result_NoneAPIErrorZ]) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						super.init(conflictAvoidingVariableName: 0, instantiationContext: "Vec_CResult_NoneAPIErrorZZ.swift::\(#function):\(#line)")

						
						let rustArray = array.map { (currentValueDepth1: Result_NoneAPIErrorZ) -> LDKCResult_NoneAPIErrorZ in
							
							return currentValueDepth1.danglingClone().cType!
						}
				

						

						let dataContainer = UnsafeMutablePointer<LDKCResult_NoneAPIErrorZ>.allocate(capacity: array.count)
						dataContainer.initialize(from: rustArray, count: array.count)

        				let vector = LDKCVec_CResult_NoneAPIErrorZZ(data: dataContainer, datalen: UInt(array.count))
        				self.cType = vector
					}

					public func getValue() -> [Result_NoneAPIErrorZ] {

						var array = [LDKCResult_NoneAPIErrorZ]()

						
						for index1 in 0..<Int(self.cType!.datalen) {
							let currentEntry1 = self.cType!.data[index1]
							array.append(currentEntry1)
						}
		

						let swiftArray = array.map { (currentCType: LDKCResult_NoneAPIErrorZ) -> Result_NoneAPIErrorZ in
Result_NoneAPIErrorZ(cType: currentCType, instantiationContext: "Vec_CResult_NoneAPIErrorZZ.swift::\(#function):\(#line)", anchor: self).dangle()
						}
						return swiftArray
					}

					
					/// Frees the buffer pointed to by `data` if `datalen` is non-0.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CVec_CResult_NoneAPIErrorZZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					internal func dangle(_ shouldDangle: Bool = true) -> Vec_CResult_NoneAPIErrorZZ {
        				self.dangling = shouldDangle
						return self
					}

					
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Vec_CResult_NoneAPIErrorZZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Vec_CResult_NoneAPIErrorZZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		