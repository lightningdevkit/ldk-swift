
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			/// 
			public typealias Bech32Error = Bindings.Bech32Error

			extension Bindings {

				/// Represents an error returned from the bech32 library during validation of some bech32 data
				public class Bech32Error: NativeTypeWrapper {

					
					/// Set to false to suppress an individual type's deinit log statements.
					/// Only applicable when log threshold is set to `.Debug`.
					public static var enableDeinitLogging = true

					/// Set to true to suspend the freeing of this type's associated Rust memory.
					/// Should only ever be used for debugging purposes, and will likely be
					/// deprecated soon.
					public static var suspendFreedom = false

					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKBech32Error?

					internal init(cType: LDKBech32Error, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKBech32Error, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKBech32Error, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					public enum Bech32ErrorType {
						
						/// String does not contain the separator character
						case MissingSeparator
			
						/// The checksum does not match the rest of the data
						case InvalidChecksum
			
						/// The data or human-readable part is too long or too short
						case InvalidLength
			
						/// Some part of the string contains an invalid character
						case InvalidChar
			
						/// Some part of the data has an invalid value
						case InvalidData
			
						/// The bit conversion failed due to a padding issue
						case InvalidPadding
			
						/// The whole string must be of one case
						case MixedCase
			
					}

					public func getValueType() -> Bech32ErrorType {
						switch self.cType!.tag {
							case LDKBech32Error_MissingSeparator:
								return .MissingSeparator
			
							case LDKBech32Error_InvalidChecksum:
								return .InvalidChecksum
			
							case LDKBech32Error_InvalidLength:
								return .InvalidLength
			
							case LDKBech32Error_InvalidChar:
								return .InvalidChar
			
							case LDKBech32Error_InvalidData:
								return .InvalidData
			
							case LDKBech32Error_InvalidPadding:
								return .InvalidPadding
			
							case LDKBech32Error_MixedCase:
								return .MixedCase
			
							default:
								Bindings.print("Error: Invalid value type for Bech32Error! Aborting.", severity: .ERROR)
								abort()
						}
		
					}

					
					/// Creates a new Bech32Error which has the same data as `orig`
					internal func clone() -> Bech32Error {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKBech32Error>) in
				Bech32Error_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Bech32Error(cType: nativeCallResult, instantiationContext: "Bech32Error.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Releases any memory held by the given `Bech32Error` (which is currently none)
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Bech32Error_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					
					public func getValueAsInvalidChar() -> UInt32? {
						if self.cType?.tag != LDKBech32Error_InvalidChar {
							return nil
						}

						return self.cType!.invalid_char
					}
			
					public func getValueAsInvalidData() -> UInt8? {
						if self.cType?.tag != LDKBech32Error_InvalidData {
							return nil
						}

						return self.cType!.invalid_data
					}
			

					
					internal func danglingClone() -> Bech32Error {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing Bech32Error \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing Bech32Error \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

					

				}

			}
		