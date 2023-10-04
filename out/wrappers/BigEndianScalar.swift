
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation // necessary for Data for Strings

			/// Represents a scalar value between zero and the secp256k1 curve order, in big endian.
			internal typealias BigEndianScalar = Bindings.BigEndianScalar

			extension Bindings {

				/// Represents a scalar value between zero and the secp256k1 curve order, in big endian.
				internal class BigEndianScalar: NativeTypeWrapper {

					

					
					/// Set to false to suppress an individual type's deinit log statements.
					/// Only applicable when log threshold is set to `.Debug`.
					public static var enableDeinitLogging = true

					/// Set to true to suspend the freeing of this type's associated Rust memory.
					/// Should only ever be used for debugging purposes, and will likely be
					/// deprecated soon.
					public static var suspendFreedom = false

					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKBigEndianScalar?

					internal init(cType: LDKBigEndianScalar, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKBigEndianScalar, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKBigEndianScalar, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
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

						self.cType = LDKBigEndianScalar(big_endian_bytes: Bindings.arrayToUInt8Tuple32(array: value))

						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					
					/// Convenience function for constructing a new BigEndianScalar
					public init(bigEndianBytes: [UInt8], instantiationContext: String) {
						// native call variable prep
						
						let bigEndianBytesPrimitiveWrapper = ThirtyTwoBytes(value: bigEndianBytes, instantiationContext: "BigEndianScalar.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = BigEndianScalar_new(bigEndianBytesPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						bigEndianBytesPrimitiveWrapper.noOpRetain()
				

						/*
						// return value (do some wrapping)
						let returnValue = BigEndianScalar(cType: nativeCallResult, instantiationContext: "BigEndianScalar.swift::\(#function):\(#line)")
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				
			
					}
		

					public func getValue() -> [UInt8] {
						return Bindings.UInt8Tuple32ToArray(tuple: self.cType!.big_endian_bytes)
					}

										

				}

			}
		