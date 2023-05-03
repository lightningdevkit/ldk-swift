
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A dynamically-allocated array of crate::c_types::derived::C2Tuple_BlockHashChannelMonitorZs of arbitrary size.
			/// This corresponds to std::vector in C++
			internal typealias Vec_C2Tuple_BlockHashChannelMonitorZZ = Bindings.Vec_C2Tuple_BlockHashChannelMonitorZZ

			extension Bindings {

				/// A dynamically-allocated array of crate::c_types::derived::C2Tuple_BlockHashChannelMonitorZs of arbitrary size.
				/// This corresponds to std::vector in C++
				internal class Vec_C2Tuple_BlockHashChannelMonitorZZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCVec_C2Tuple_BlockHashChannelMonitorZZ?

					internal init(cType: LDKCVec_C2Tuple_BlockHashChannelMonitorZZ, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCVec_C2Tuple_BlockHashChannelMonitorZZ, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					internal init(array: [([UInt8], ChannelMonitor)]) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						super.init(conflictAvoidingVariableName: 0, instantiationContext: "Vec_C2Tuple_BlockHashChannelMonitorZZ.swift::\(#function):\(#line)")

						
						let rustArray = array.map { (currentValueDepth1: ([UInt8], ChannelMonitor)) -> LDKC2Tuple_BlockHashChannelMonitorZ in
							
						let currentValueDepth1Tuple = Tuple_BlockHashChannelMonitorZ(tuple: currentValueDepth1).danglingClone()
				
							return currentValueDepth1Tuple.cType!
						}
				

						

						let dataContainer = UnsafeMutablePointer<LDKC2Tuple_BlockHashChannelMonitorZ>.allocate(capacity: array.count)
						dataContainer.initialize(from: rustArray, count: array.count)

        				let vector = LDKCVec_C2Tuple_BlockHashChannelMonitorZZ(data: dataContainer, datalen: UInt(array.count))
        				self.cType = vector
					}

					public func getValue() -> [([UInt8], ChannelMonitor)] {

						var array = [LDKC2Tuple_BlockHashChannelMonitorZ]()

						
						for index1 in 0..<Int(self.cType!.datalen) {
							let currentEntry1 = self.cType!.data[index1]
							array.append(currentEntry1)
						}
		

						let swiftArray = array.map { (currentCType: LDKC2Tuple_BlockHashChannelMonitorZ) -> ([UInt8], ChannelMonitor) in
Tuple_BlockHashChannelMonitorZ(cType: currentCType, instantiationContext: "#{swift_class_name}::\(#function):\(#line)").dangle().getValue()
						}
						return swiftArray
					}

					
					/// Frees the buffer pointed to by `data` if `datalen` is non-0.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CVec_C2Tuple_BlockHashChannelMonitorZZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					internal func dangle(_ shouldDangle: Bool = true) -> Vec_C2Tuple_BlockHashChannelMonitorZZ {
        				self.dangling = shouldDangle
						return self
					}

					
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Vec_C2Tuple_BlockHashChannelMonitorZZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Vec_C2Tuple_BlockHashChannelMonitorZZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		