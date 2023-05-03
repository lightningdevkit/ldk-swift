
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A dynamically-allocated array of crate::lightning_invoice::PrivateRoutes of arbitrary size.
			/// This corresponds to std::vector in C++
			internal typealias Vec_PrivateRouteZ = Bindings.Vec_PrivateRouteZ

			extension Bindings {

				/// A dynamically-allocated array of crate::lightning_invoice::PrivateRoutes of arbitrary size.
				/// This corresponds to std::vector in C++
				internal class Vec_PrivateRouteZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCVec_PrivateRouteZ?

					internal init(cType: LDKCVec_PrivateRouteZ, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCVec_PrivateRouteZ, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					internal init(array: [PrivateRoute]) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						super.init(conflictAvoidingVariableName: 0, instantiationContext: "Vec_PrivateRouteZ.swift::\(#function):\(#line)")

						
						let rustArray = array.map { (currentValueDepth1: PrivateRoute) -> LDKPrivateRoute in
							
							return currentValueDepth1.dynamicallyDangledClone().cType!
						}
				

						

						let dataContainer = UnsafeMutablePointer<LDKPrivateRoute>.allocate(capacity: array.count)
						dataContainer.initialize(from: rustArray, count: array.count)

        				let vector = LDKCVec_PrivateRouteZ(data: dataContainer, datalen: UInt(array.count))
        				self.cType = vector
					}

					public func getValue() -> [PrivateRoute] {

						var array = [LDKPrivateRoute]()

						
						for index1 in 0..<Int(self.cType!.datalen) {
							let currentEntry1 = self.cType!.data[index1]
							array.append(currentEntry1)
						}
		

						let swiftArray = array.map { (currentCType: LDKPrivateRoute) -> PrivateRoute in
PrivateRoute(cType: currentCType, instantiationContext: "#{swift_class_name}::\(#function):\(#line)", anchor: self).dangle()
						}
						return swiftArray
					}

					
					/// Frees the buffer pointed to by `data` if `datalen` is non-0.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CVec_PrivateRouteZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					internal func dangle(_ shouldDangle: Bool = true) -> Vec_PrivateRouteZ {
        				self.dangling = shouldDangle
						return self
					}

					
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Vec_PrivateRouteZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Vec_PrivateRouteZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		