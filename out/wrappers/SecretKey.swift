
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation // necessary for Data for Strings

			/// Represents a valid secp256k1 secret key serialized as a 32 byte array.
			internal typealias SecretKey = Bindings.SecretKey

			extension Bindings {

				/// Represents a valid secp256k1 secret key serialized as a 32 byte array.
				internal class SecretKey: NativeTypeWrapper {

					

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKSecretKey?

					internal init(cType: LDKSecretKey) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKSecretKey, anchor: NativeTypeWrapper) {
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

						self.cType = LDKSecretKey(bytes: Bindings.arrayToUInt8Tuple32(array: value))

						super.init(conflictAvoidingVariableName: 0)
					}

					

					public func getValue() -> [UInt8] {
						return Bindings.UInt8Tuple32ToArray(tuple: self.cType!.bytes)
					}

					internal func dangle(_ shouldDangle: Bool = true) -> SecretKey {
        				self.dangling = shouldDangle
						return self
					}

										

				}

			}
		