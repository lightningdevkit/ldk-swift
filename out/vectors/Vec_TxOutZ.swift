
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A dynamically-allocated array of crate::c_types::TxOuts of arbitrary size.
			/// This corresponds to std::vector in C++
			internal typealias Vec_TxOutZ = Bindings.Vec_TxOutZ

			extension Bindings {

				/// A dynamically-allocated array of crate::c_types::TxOuts of arbitrary size.
				/// This corresponds to std::vector in C++
				internal class Vec_TxOutZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCVec_TxOutZ?

					internal init(cType: LDKCVec_TxOutZ, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCVec_TxOutZ, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					internal init(array: [TxOut], instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)

						
						let rustArray = array.map { (currentValueDepth1: TxOut) -> LDKTxOut in
							
							return currentValueDepth1.danglingClone().cType!
						}
				

						

						let dataContainer = UnsafeMutablePointer<LDKTxOut>.allocate(capacity: array.count)
						dataContainer.initialize(from: rustArray, count: array.count)

        				let vector = LDKCVec_TxOutZ(data: dataContainer, datalen: UInt(array.count))
        				self.cType = vector
					}

					public func getValue() -> [TxOut] {

						var array = [LDKTxOut]()

						
						for index1 in 0..<Int(self.cType!.datalen) {
							let currentEntry1 = self.cType!.data[index1]
							array.append(currentEntry1)
						}
		

						let swiftArray = array.map { (currentCType: LDKTxOut) -> TxOut in
TxOut(cType: currentCType, instantiationContext: "Vec_TxOutZ.swift::\(#function):\(#line)", anchor: self).dangle()
						}
						return swiftArray
					}

					
					/// Frees the buffer pointed to by `data` if `datalen` is non-0.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CVec_TxOutZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					internal func dangle(_ shouldDangle: Bool = true) -> Vec_TxOutZ {
        				self.dangling = shouldDangle
						return self
					}

					
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Vec_TxOutZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Vec_TxOutZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		