
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A dynamically-allocated array of crate::lightning::routing::router::RouteHints of arbitrary size.
			/// This corresponds to std::vector in C++
			internal typealias Vec_RouteHintZ = Bindings.Vec_RouteHintZ

			extension Bindings {

				/// A dynamically-allocated array of crate::lightning::routing::router::RouteHints of arbitrary size.
				/// This corresponds to std::vector in C++
				internal class Vec_RouteHintZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCVec_RouteHintZ?

					internal init(cType: LDKCVec_RouteHintZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKCVec_RouteHintZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init(array: [RouteHint]) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						super.init(conflictAvoidingVariableName: 0)

						
						let rustArray = array.map { (currentValueDepth1: RouteHint) -> LDKRouteHint in
							
							return currentValueDepth1.dynamicallyDangledClone().cType!
						}
				

						

						let dataContainer = UnsafeMutablePointer<LDKRouteHint>.allocate(capacity: array.count)
						dataContainer.initialize(from: rustArray, count: array.count)

        				let vector = LDKCVec_RouteHintZ(data: dataContainer, datalen: UInt(array.count))
        				self.cType = vector
					}

					public func getValue() -> [RouteHint] {

						var array = [LDKRouteHint]()

						
						for index1 in 0..<Int(self.cType!.datalen) {
							let currentEntry1 = self.cType!.data[index1]
							array.append(currentEntry1)
						}
		

						let swiftArray = array.map { (currentCType: LDKRouteHint) -> RouteHint in
RouteHint(cType: currentCType, anchor: self).dangle()
						}
						return swiftArray
					}

					
					/// Frees the buffer pointed to by `data` if `datalen` is non-0.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CVec_RouteHintZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					internal func dangle(_ shouldDangle: Bool = true) -> Vec_RouteHintZ {
        				self.dangling = shouldDangle
						return self
					}

					
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Vec_RouteHintZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Vec_RouteHintZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		