
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation // necessary for Data for Strings

			/// Represents a scalar value between zero and the secp256k1 curve order, in big endian.
			internal typealias BigEndianScalar = Bindings.BigEndianScalar

			extension Bindings {

				/// Represents a scalar value between zero and the secp256k1 curve order, in big endian.
				internal class BigEndianScalar: NativeTypeWrapper {

					

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKBigEndianScalar?

					internal init(cType: LDKBigEndianScalar) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKBigEndianScalar, anchor: NativeTypeWrapper) {
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

						self.cType = LDKBigEndianScalar(big_endian_bytes: Bindings.arrayToUInt8Tuple32(array: value))

						super.init(conflictAvoidingVariableName: 0)
					}

					
					/// Convenience function for constructing a new BigEndianScalar
					public init(bigEndianBytes: [UInt8]) {
						// native call variable prep
						
						let bigEndianBytesPrimitiveWrapper = ThirtyTwoBytes(value: bigEndianBytes)
				

						// native method call
						let nativeCallResult = BigEndianScalar_new(bigEndianBytesPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						bigEndianBytesPrimitiveWrapper.noOpRetain()
				

						/*
						// return value (do some wrapping)
						let returnValue = BigEndianScalar(cType: nativeCallResult)
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
				
			
					}
		

					public func getValue() -> [UInt8] {
						return Bindings.UInt8Tuple32ToArray(tuple: self.cType!.big_endian_bytes)
					}

					internal func dangle(_ shouldDangle: Bool = true) -> BigEndianScalar {
        				self.dangling = shouldDangle
						return self
					}

										

				}

			}
		