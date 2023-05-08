
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			/// 
			public typealias SignOrCreationError = Bindings.SignOrCreationError

			extension Bindings {

				/// When signing using a fallible method either an user-supplied `SignError` or a [`CreationError`]
				/// may occur.
				public class SignOrCreationError: NativeTypeWrapper {

					
					/// Set to false to suppress an individual type's deinit log statements.
					/// Only applicable when log threshold is set to `.Debug`.
					public static var enableDeinitLogging = true

					/// Set to true to suspend the freeing of this type's associated Rust memory.
					/// Should only ever be used for debugging purposes, and will likely be
					/// deprecated soon.
					public static var suspendFreedom = false

					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKSignOrCreationError?

					internal init(cType: LDKSignOrCreationError, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKSignOrCreationError, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKSignOrCreationError, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					public enum SignOrCreationErrorType {
						
						/// An error occurred during signing
						case SignError
			
						/// An error occurred while building the transaction
						case CreationError
			
					}

					public func getValueType() -> SignOrCreationErrorType {
						switch self.cType!.tag {
							case LDKSignOrCreationError_SignError:
								return .SignError
			
							case LDKSignOrCreationError_CreationError:
								return .CreationError
			
							default:
								Bindings.print("Error: Invalid value type for SignOrCreationError! Aborting.", severity: .ERROR)
								abort()
						}
		
					}

					
					/// Frees any resources used by the SignOrCreationError
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = SignOrCreationError_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the SignOrCreationError
					internal func clone() -> SignOrCreationError {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKSignOrCreationError>) in
				SignOrCreationError_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = SignOrCreationError(cType: nativeCallResult, instantiationContext: "SignOrCreationError.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new SignError-variant SignOrCreationError
					public class func initWithSignError() -> SignOrCreationError {
						// native call variable prep
						

						// native method call
						let nativeCallResult = SignOrCreationError_sign_error()

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = SignOrCreationError(cType: nativeCallResult, instantiationContext: "SignOrCreationError.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new CreationError-variant SignOrCreationError
					public class func initWithCreationError(a: CreationError) -> SignOrCreationError {
						// native call variable prep
						

						// native method call
						let nativeCallResult = SignOrCreationError_creation_error(a.getCValue())

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = SignOrCreationError(cType: nativeCallResult, instantiationContext: "SignOrCreationError.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Checks if two SignOrCreationErrors contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					public class func eq(a: SignOrCreationError, b: SignOrCreationError) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKSignOrCreationError>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKSignOrCreationError>) in
				SignOrCreationError_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Get the string representation of a SignOrCreationError object
					public func toStr() -> String {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKSignOrCreationError>) in
				SignOrCreationError_to_str(oPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Str(cType: nativeCallResult, instantiationContext: "SignOrCreationError.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		

					
					public func getValueAsCreationError() -> CreationError? {
						if self.cType?.tag != LDKSignOrCreationError_CreationError {
							return nil
						}

						return CreationError(value: self.cType!.creation_error)
					}
			

					internal func dangle(_ shouldDangle: Bool = true) -> SignOrCreationError {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> SignOrCreationError {
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
								Bindings.print("Freeing SignOrCreationError \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing SignOrCreationError \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

					

				}

			}
		