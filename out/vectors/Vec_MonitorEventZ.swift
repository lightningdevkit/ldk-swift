
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A dynamically-allocated array of crate::lightning::chain::channelmonitor::MonitorEvents of arbitrary size.
			/// This corresponds to std::vector in C++
			internal typealias Vec_MonitorEventZ = Bindings.Vec_MonitorEventZ

			extension Bindings {

				/// A dynamically-allocated array of crate::lightning::chain::channelmonitor::MonitorEvents of arbitrary size.
				/// This corresponds to std::vector in C++
				internal class Vec_MonitorEventZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCVec_MonitorEventZ?

					internal init(cType: LDKCVec_MonitorEventZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKCVec_MonitorEventZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init(array: [MonitorEvent]) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						super.init(conflictAvoidingVariableName: 0)

						
						let rustArray = array.map { (currentValueDepth1: MonitorEvent) -> LDKMonitorEvent in
							
							return currentValueDepth1.danglingClone().cType!
						}
				

						

						let dataContainer = UnsafeMutablePointer<LDKMonitorEvent>.allocate(capacity: array.count)
						dataContainer.initialize(from: rustArray, count: array.count)

        				let vector = LDKCVec_MonitorEventZ(data: dataContainer, datalen: UInt(array.count))
        				self.cType = vector
					}

					public func getValue() -> [MonitorEvent] {

						var array = [LDKMonitorEvent]()

						
						for index1 in 0..<Int(self.cType!.datalen) {
							let currentEntry1 = self.cType!.data[index1]
							array.append(currentEntry1)
						}
		

						let swiftArray = array.map { (currentCType: LDKMonitorEvent) -> MonitorEvent in
MonitorEvent(cType: currentCType, anchor: self).dangle()
						}
						return swiftArray
					}

					
					/// Frees the buffer pointed to by `data` if `datalen` is non-0.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CVec_MonitorEventZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					internal func dangle(_ shouldDangle: Bool = true) -> Vec_MonitorEventZ {
        				self.dangling = shouldDangle
						return self
					}

					
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Vec_MonitorEventZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Vec_MonitorEventZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		