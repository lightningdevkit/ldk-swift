
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A dynamically-allocated array of crate::c_types::PublicKeys of arbitrary size.
			/// This corresponds to std::vector in C++
			internal typealias Vec_PublicKeyZ = Bindings.Vec_PublicKeyZ

			extension Bindings {

				/// A dynamically-allocated array of crate::c_types::PublicKeys of arbitrary size.
				/// This corresponds to std::vector in C++
				internal class Vec_PublicKeyZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCVec_PublicKeyZ?

					internal init(cType: LDKCVec_PublicKeyZ, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCVec_PublicKeyZ, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					internal init(array: [[UInt8]]) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						super.init(conflictAvoidingVariableName: 0, instantiationContext: "Vec_PublicKeyZ.swift::\(#function):\(#line)")

						
						let rustArray = array.map { (currentValueDepth1: [UInt8]) -> LDKPublicKey in
							
						let currentValueDepth1PrimitiveWrapper = PublicKey(value: currentValueDepth1)
				
							return currentValueDepth1PrimitiveWrapper.cType!
						}
				

						

						let dataContainer = UnsafeMutablePointer<LDKPublicKey>.allocate(capacity: array.count)
						dataContainer.initialize(from: rustArray, count: array.count)

        				let vector = LDKCVec_PublicKeyZ(data: dataContainer, datalen: UInt(array.count))
        				self.cType = vector
					}

					public func getValue() -> [[UInt8]] {

						var array = [LDKPublicKey]()

						
						for index1 in 0..<Int(self.cType!.datalen) {
							let currentEntry1 = self.cType!.data[index1]
							array.append(currentEntry1)
						}
		

						let swiftArray = array.map { (currentCType: LDKPublicKey) -> [UInt8] in
PublicKey(cType: currentCType, instantiationContext: "#{swift_class_name}::\(#function):\(#line)").dangle().getValue()
						}
						return swiftArray
					}

					
					/// Frees the buffer pointed to by `data` if `datalen` is non-0.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CVec_PublicKeyZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					internal func dangle(_ shouldDangle: Bool = true) -> Vec_PublicKeyZ {
        				self.dangling = shouldDangle
						return self
					}

					
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Vec_PublicKeyZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Vec_PublicKeyZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		