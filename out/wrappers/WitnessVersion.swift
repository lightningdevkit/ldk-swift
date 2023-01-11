
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation // necessary for Data for Strings

			/// Integer in the range `0..=16`
			internal typealias WitnessVersion = Bindings.WitnessVersion

			extension Bindings {

				/// Integer in the range `0..=16`
				internal class WitnessVersion: NativeTypeWrapper {

					

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKWitnessVersion?

					internal init(cType: LDKWitnessVersion) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKWitnessVersion, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init(value: UInt8) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						self.cType = LDKWitnessVersion(_0: value)

						super.init(conflictAvoidingVariableName: 0)
					}

					

					public func getValue() -> UInt8 {
						return self.cType!._0
					}

					internal func dangle(_ shouldDangle: Bool = true) -> WitnessVersion {
        				self.dangling = shouldDangle
						return self
					}

										

				}

			}
		