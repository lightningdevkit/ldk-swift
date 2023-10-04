
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			/// 
			public typealias ProbingError = Bindings.ProbingError

			extension Bindings {

				/// An error that may occur when sending a payment probe.
				public class ProbingError: NativeTypeWrapper {

					
					/// Set to false to suppress an individual type's deinit log statements.
					/// Only applicable when log threshold is set to `.Debug`.
					public static var enableDeinitLogging = true

					/// Set to true to suspend the freeing of this type's associated Rust memory.
					/// Should only ever be used for debugging purposes, and will likely be
					/// deprecated soon.
					public static var suspendFreedom = false

					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKProbingError?

					internal init(cType: LDKProbingError, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKProbingError, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKProbingError, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					public enum ProbingErrorType {
						
						/// An error resulting from the provided [`Bolt11Invoice`].
						case Invoice
			
						/// An error occurring when sending a payment probe.
						case Sending
			
					}

					public func getValueType() -> ProbingErrorType {
						switch self.cType!.tag {
							case LDKProbingError_Invoice:
								return .Invoice
			
							case LDKProbingError_Sending:
								return .Sending
			
							default:
								Bindings.print("Error: Invalid value type for ProbingError! Aborting.", severity: .ERROR)
								abort()
						}
		
					}

					
					/// Frees any resources used by the ProbingError
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ProbingError_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the ProbingError
					internal func clone() -> ProbingError {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKProbingError>) in
				ProbingError_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ProbingError(cType: nativeCallResult, instantiationContext: "ProbingError.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new Invoice-variant ProbingError
					public class func initWithInvoice(a: String) -> ProbingError {
						// native call variable prep
						
						let aPrimitiveWrapper = Str(value: a, instantiationContext: "ProbingError.swift::\(#function):\(#line)").dangle()
				

						// native method call
						let nativeCallResult = ProbingError_invoice(aPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						aPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = ProbingError(cType: nativeCallResult, instantiationContext: "ProbingError.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new Sending-variant ProbingError
					public class func initWithSending(a: ProbeSendFailure) -> ProbingError {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ProbingError_sending(a.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ProbingError(cType: nativeCallResult, instantiationContext: "ProbingError.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Checks if two ProbingErrors contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					public class func eq(a: ProbingError, b: ProbingError) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKProbingError>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKProbingError>) in
				ProbingError_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					
					public func getValueAsInvoice() -> String? {
						if self.cType?.tag != LDKProbingError_Invoice {
							return nil
						}

						return Str(cType: self.cType!.invoice, instantiationContext: "ProbingError.swift::\(#function):\(#line)", anchor: self).getValue()
					}
			
					public func getValueAsSending() -> ProbeSendFailure? {
						if self.cType?.tag != LDKProbingError_Sending {
							return nil
						}

						return ProbeSendFailure(cType: self.cType!.sending, instantiationContext: "ProbingError.swift::\(#function):\(#line)", anchor: self)
					}
			

					
					internal func danglingClone() -> ProbingError {
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
								Bindings.print("Freeing ProbingError \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing ProbingError \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

					

				}

			}
		