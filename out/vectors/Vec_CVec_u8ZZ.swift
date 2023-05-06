
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A dynamically-allocated array of crate::c_types::derived::CVec_u8Zs of arbitrary size.
			/// This corresponds to std::vector in C++
			internal typealias Vec_CVec_u8ZZ = Bindings.Vec_CVec_u8ZZ

			extension Bindings {

				/// A dynamically-allocated array of crate::c_types::derived::CVec_u8Zs of arbitrary size.
				/// This corresponds to std::vector in C++
				internal class Vec_CVec_u8ZZ: NativeTypeWrapper {

					
					/// Set to false to suppress an individual type's deinit log statements.
					/// Only applicable when log threshold is set to `.Debug`.
					public static var enableDeinitLogging = true

					/// Set to true to suspend the freeing of this type's associated Rust memory.
					/// Should only ever be used for debugging purposes, and will likely be
					/// deprecated soon.
					public static var suspendFreedom = false

					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCVec_CVec_u8ZZ?

					internal init(cType: LDKCVec_CVec_u8ZZ, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCVec_CVec_u8ZZ, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKCVec_CVec_u8ZZ, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					internal init(array: [[UInt8]], instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)

						

						
						var lowerDimension = [LDKCVec_u8Z]()
						for currentEntry in array {
							
						let currentEntryVector = Vec_u8Z(array: currentEntry, instantiationContext: "Vec_CVec_u8ZZ.swift::\(#function):\(#line)").dangle()
				
							lowerDimension.append(currentEntryVector.cType!)
							try! self.addAnchor(anchor: currentEntryVector)
						}
			

						let dataContainer = UnsafeMutablePointer<LDKCVec_u8Z>.allocate(capacity: array.count)
						dataContainer.initialize(from: lowerDimension, count: array.count)

        				let vector = LDKCVec_CVec_u8ZZ(data: dataContainer, datalen: UInt(array.count))
        				self.cType = vector
					}

					public func getValue() -> [[UInt8]] {

						var array = [[UInt8]]()

						
						for index1 in 0..<Int(self.cType!.datalen) {
							let currentEntry1 = self.cType!.data[index1]
							
							var convertedEntry1 = [UInt8]()

							
							for index2 in 0..<Int(currentEntry1.datalen) {
								let currentEntry2 = currentEntry1.data[index2]
								convertedEntry1.append(currentEntry2)
							}
		

							array.append(convertedEntry1)
			
						}
		

						let swiftArray = array
						return swiftArray
					}

					
					/// Frees the buffer pointed to by `data` if `datalen` is non-0.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CVec_CVec_u8ZZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					internal func dangle(_ shouldDangle: Bool = true) -> Vec_CVec_u8ZZ {
        				self.dangling = shouldDangle
						return self
					}

					
					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing Vec_CVec_u8ZZ \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing Vec_CVec_u8ZZ \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

				}

			}
		