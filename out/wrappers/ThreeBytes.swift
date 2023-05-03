
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation // necessary for Data for Strings

			/// A 3-byte byte array.
			internal typealias ThreeBytes = Bindings.ThreeBytes

			extension Bindings {

				/// A 3-byte byte array.
				internal class ThreeBytes: NativeTypeWrapper {

					

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKThreeBytes?

					internal init(cType: LDKThreeBytes, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKThreeBytes, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					internal init(value: [UInt8], instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						self.cType = LDKThreeBytes(data: Bindings.arrayToUInt8Tuple3(array: value))

						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					

					public func getValue() -> [UInt8] {
						return Bindings.UInt8Tuple3ToArray(tuple: self.cType!.data)
					}

					internal func dangle(_ shouldDangle: Bool = true) -> ThreeBytes {
        				self.dangling = shouldDangle
						return self
					}

										

				}

			}
		