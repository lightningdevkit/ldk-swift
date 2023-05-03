
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A dynamically-allocated array of crate::c_types::derived::C2Tuple_BlindedPayInfoBlindedPathZs of arbitrary size.
			/// This corresponds to std::vector in C++
			internal typealias Vec_C2Tuple_BlindedPayInfoBlindedPathZZ = Bindings.Vec_C2Tuple_BlindedPayInfoBlindedPathZZ

			extension Bindings {

				/// A dynamically-allocated array of crate::c_types::derived::C2Tuple_BlindedPayInfoBlindedPathZs of arbitrary size.
				/// This corresponds to std::vector in C++
				internal class Vec_C2Tuple_BlindedPayInfoBlindedPathZZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCVec_C2Tuple_BlindedPayInfoBlindedPathZZ?

					internal init(cType: LDKCVec_C2Tuple_BlindedPayInfoBlindedPathZZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKCVec_C2Tuple_BlindedPayInfoBlindedPathZZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init(array: [(BlindedPayInfo, BlindedPath)]) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						super.init(conflictAvoidingVariableName: 0)

						
						let rustArray = array.map { (currentValueDepth1: (BlindedPayInfo, BlindedPath)) -> LDKC2Tuple_BlindedPayInfoBlindedPathZ in
							
						let currentValueDepth1Tuple = Tuple_BlindedPayInfoBlindedPathZ(tuple: currentValueDepth1).danglingClone()
				
							return currentValueDepth1Tuple.cType!
						}
				

						

						let dataContainer = UnsafeMutablePointer<LDKC2Tuple_BlindedPayInfoBlindedPathZ>.allocate(capacity: array.count)
						dataContainer.initialize(from: rustArray, count: array.count)

        				let vector = LDKCVec_C2Tuple_BlindedPayInfoBlindedPathZZ(data: dataContainer, datalen: UInt(array.count))
        				self.cType = vector
					}

					public func getValue() -> [(BlindedPayInfo, BlindedPath)] {

						var array = [LDKC2Tuple_BlindedPayInfoBlindedPathZ]()

						
						for index1 in 0..<Int(self.cType!.datalen) {
							let currentEntry1 = self.cType!.data[index1]
							array.append(currentEntry1)
						}
		

						let swiftArray = array.map { (currentCType: LDKC2Tuple_BlindedPayInfoBlindedPathZ) -> (BlindedPayInfo, BlindedPath) in
Tuple_BlindedPayInfoBlindedPathZ(cType: currentCType).dangle().getValue()
						}
						return swiftArray
					}

					
					/// Frees the buffer pointed to by `data` if `datalen` is non-0.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CVec_C2Tuple_BlindedPayInfoBlindedPathZZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					internal func dangle(_ shouldDangle: Bool = true) -> Vec_C2Tuple_BlindedPayInfoBlindedPathZZ {
        				self.dangling = shouldDangle
						return self
					}

					
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Vec_C2Tuple_BlindedPayInfoBlindedPathZZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Vec_C2Tuple_BlindedPayInfoBlindedPathZZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		