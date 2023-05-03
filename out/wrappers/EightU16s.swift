
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation // necessary for Data for Strings

			/// 8 u16s
			internal typealias EightU16s = Bindings.EightU16s

			extension Bindings {

				/// 8 u16s
				internal class EightU16s: NativeTypeWrapper {

					

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKEightU16s?

					internal init(cType: LDKEightU16s, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKEightU16s, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					internal init(value: [UInt16]) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						self.cType = LDKEightU16s(data: Bindings.arrayToUInt16Tuple8(array: value))

						super.init(conflictAvoidingVariableName: 0, instantiationContext: "EightU16s.swift::\(#function):\(#line)")
					}

					

					public func getValue() -> [UInt16] {
						return Bindings.UInt16Tuple8ToArray(tuple: self.cType!.data)
					}

					internal func dangle(_ shouldDangle: Bool = true) -> EightU16s {
        				self.dangling = shouldDangle
						return self
					}

										

				}

			}
		