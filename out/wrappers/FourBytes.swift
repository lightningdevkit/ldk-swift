
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation // necessary for Data for Strings

			/// A 4-byte byte array.
			internal typealias FourBytes = Bindings.FourBytes

			extension Bindings {

				/// A 4-byte byte array.
				internal class FourBytes: NativeTypeWrapper {

					

					
					/// Set to false to suppress an individual type's deinit log statements.
					/// Only applicable when log threshold is set to `.Debug`.
					public static var enableDeinitLogging = true

					/// Set to true to suspend the freeing of this type's associated Rust memory.
					/// Should only ever be used for debugging purposes, and will likely be
					/// deprecated soon.
					public static var suspendFreedom = false

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

					internal init(cType: LDKFourBytes, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					internal init(value: [UInt8], instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter

						self.cType = LDKFourBytes(data: Bindings.arrayToUInt8Tuple4(array: value))

						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
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
		