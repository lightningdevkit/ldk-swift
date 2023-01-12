
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation // necessary for Data for Strings

			/// Represents a secp256k1 signature serialized as two 32-byte numbers as well as a tag which
			/// allows recovering the exact public key which created the signature given the message.
			internal typealias RecoverableSignature = Bindings.RecoverableSignature

			extension Bindings {

				/// Represents a secp256k1 signature serialized as two 32-byte numbers as well as a tag which
				/// allows recovering the exact public key which created the signature given the message.
				internal class RecoverableSignature: NativeTypeWrapper {

					

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKRecoverableSignature?

					internal init(cType: LDKRecoverableSignature) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKRecoverableSignature, anchor: NativeTypeWrapper) {
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

						self.cType = LDKRecoverableSignature(serialized_form: Bindings.arrayToUInt8Tuple68(array: value))

						super.init(conflictAvoidingVariableName: 0)
					}

					

					public func getValue() -> [UInt8] {
						return Bindings.UInt8Tuple68ToArray(tuple: self.cType!.serialized_form)
					}

					internal func dangle(_ shouldDangle: Bool = true) -> RecoverableSignature {
        				self.dangling = shouldDangle
						return self
					}

										

				}

			}
		