
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A dynamically-allocated array of crate::c_types::derived::C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZs of arbitrary size.
			/// This corresponds to std::vector in C++
			internal typealias Vec_TransactionOutputsZ = Bindings.Vec_TransactionOutputsZ

			extension Bindings {

				/// A dynamically-allocated array of crate::c_types::derived::C2Tuple_TxidCVec_C2Tuple_u32TxOutZZZs of arbitrary size.
				/// This corresponds to std::vector in C++
				internal class Vec_TransactionOutputsZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCVec_TransactionOutputsZ?

					internal init(cType: LDKCVec_TransactionOutputsZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKCVec_TransactionOutputsZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init(array: [([UInt8], [(UInt32, TxOut)])]) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						super.init(conflictAvoidingVariableName: 0)

						
						let rustArray = array.map { (currentValueDepth1: ([UInt8], [(UInt32, TxOut)])) -> LDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ in
							
						let currentValueDepth1Tuple = Tuple_TxidCVec_C2Tuple_u32TxOutZZZ(tuple: currentValueDepth1).danglingClone()
				
							return currentValueDepth1Tuple.cType!
						}
				

						

						let dataContainer = UnsafeMutablePointer<LDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ>.allocate(capacity: array.count)
						dataContainer.initialize(from: rustArray, count: array.count)

        				let vector = LDKCVec_TransactionOutputsZ(data: dataContainer, datalen: UInt(array.count))
        				self.cType = vector
					}

					public func getValue() -> [([UInt8], [(UInt32, TxOut)])] {

						var array = [LDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ]()

						
						for index1 in 0..<Int(self.cType!.datalen) {
							let currentEntry1 = self.cType!.data[index1]
							array.append(currentEntry1)
						}
		

						let swiftArray = array.map { (currentCType: LDKC2Tuple_TxidCVec_C2Tuple_u32TxOutZZZ) -> ([UInt8], [(UInt32, TxOut)]) in
Tuple_TxidCVec_C2Tuple_u32TxOutZZZ(cType: currentCType).dangle().getValue()
						}
						return swiftArray
					}

					
					/// Frees the buffer pointed to by `data` if `datalen` is non-0.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CVec_TransactionOutputsZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					internal func dangle(_ shouldDangle: Bool = true) -> Vec_TransactionOutputsZ {
        				self.dangling = shouldDangle
						return self
					}

					
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Vec_TransactionOutputsZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Vec_TransactionOutputsZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		