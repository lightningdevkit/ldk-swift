
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation // necessary for Data for Strings

			/// Represents a valid secp256k1 public key serialized in "compressed form" as a 33 byte array.
			internal typealias PublicKey = Bindings.PublicKey

			extension Bindings {

				/// Represents a valid secp256k1 public key serialized in "compressed form" as a 33 byte array.
				internal class PublicKey: NativeTypeWrapper {

					

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKPublicKey?

					internal init(cType: LDKPublicKey) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKPublicKey, anchor: NativeTypeWrapper) {
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

						self.cType = LDKPublicKey(compressed_form: Bindings.arrayToUInt8Tuple33(array: value))

						super.init(conflictAvoidingVariableName: 0)
					}

					

					public func getValue() -> [UInt8] {
						return Bindings.UInt8Tuple33ToArray(tuple: self.cType!.compressed_form)
					}

					internal func dangle(_ shouldDangle: Bool = true) -> PublicKey {
        				self.dangling = shouldDangle
						return self
					}

										

				}

			}
		