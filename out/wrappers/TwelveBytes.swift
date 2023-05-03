
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation // necessary for Data for Strings

			/// A 12-byte byte array.
			internal typealias TwelveBytes = Bindings.TwelveBytes

			extension Bindings {

				/// A 12-byte byte array.
				internal class TwelveBytes: NativeTypeWrapper {

					

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKTwelveBytes?

					internal init(cType: LDKTwelveBytes, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKTwelveBytes, instantiationContext: String, anchor: NativeTypeWrapper) {
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

						self.cType = LDKTwelveBytes(data: Bindings.arrayToUInt8Tuple12(array: value))

						super.init(conflictAvoidingVariableName: 0, instantiationContext: "TwelveBytes.swift::\(#function):\(#line)")
					}

					

					public func getValue() -> [UInt8] {
						return Bindings.UInt8Tuple12ToArray(tuple: self.cType!.data)
					}

					internal func dangle(_ shouldDangle: Bool = true) -> TwelveBytes {
        				self.dangling = shouldDangle
						return self
					}

										

				}

			}
		