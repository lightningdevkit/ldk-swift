
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation // necessary for Data for Strings

			/// Arbitrary 32 bytes, which could represent one of a few different things. You probably want to
			/// look up the corresponding function in rust-lightning's docs.
			internal typealias ThirtyTwoBytes = Bindings.ThirtyTwoBytes

			extension Bindings {

				/// Arbitrary 32 bytes, which could represent one of a few different things. You probably want to
				/// look up the corresponding function in rust-lightning's docs.
				internal class ThirtyTwoBytes: NativeTypeWrapper {

					

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKThirtyTwoBytes?

					internal init(cType: LDKThirtyTwoBytes) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKThirtyTwoBytes, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init(value: [UInt8]) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						self.cType = LDKThirtyTwoBytes(data: Bindings.arrayToUInt8Tuple32(array: value))

						super.init(conflictAvoidingVariableName: 0)
					}

					

					public func getValue() -> [UInt8] {
						return Bindings.UInt8Tuple32ToArray(tuple: self.cType!.data)
					}

					internal func dangle(_ shouldDangle: Bool = true) -> ThirtyTwoBytes {
        				self.dangling = shouldDangle
						return self
					}

										

				}

			}
		