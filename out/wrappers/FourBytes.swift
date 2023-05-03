
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation // necessary for Data for Strings

			/// A 4-byte byte array.
			internal typealias FourBytes = Bindings.FourBytes

			extension Bindings {

				/// A 4-byte byte array.
				internal class FourBytes: NativeTypeWrapper {

					

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKFourBytes?

					internal init(cType: LDKFourBytes, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKFourBytes, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					internal init(value: [UInt8]) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						self.cType = LDKFourBytes(data: Bindings.arrayToUInt8Tuple4(array: value))

						super.init(conflictAvoidingVariableName: 0, instantiationContext: "FourBytes.swift::\(#function):\(#line)")
					}

					

					public func getValue() -> [UInt8] {
						return Bindings.UInt8Tuple4ToArray(tuple: self.cType!.data)
					}

					internal func dangle(_ shouldDangle: Bool = true) -> FourBytes {
        				self.dangling = shouldDangle
						return self
					}

										

				}

			}
		