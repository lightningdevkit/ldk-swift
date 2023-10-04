
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// An error in response to an [`InvoiceRequest`] or an [`Bolt12Invoice`].
			/// 
			/// [`InvoiceRequest`]: crate::offers::invoice_request::InvoiceRequest
			/// [`Bolt12Invoice`]: crate::offers::invoice::Bolt12Invoice
			public typealias InvoiceError = Bindings.InvoiceError

			extension Bindings {
		

				/// An error in response to an [`InvoiceRequest`] or an [`Bolt12Invoice`].
				/// 
				/// [`InvoiceRequest`]: crate::offers::invoice_request::InvoiceRequest
				/// [`Bolt12Invoice`]: crate::offers::invoice::Bolt12Invoice
				public class InvoiceError: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					/// Set to false to suppress an individual type's deinit log statements.
					/// Only applicable when log threshold is set to `.Debug`.
					public static var enableDeinitLogging = true

					/// Set to true to suspend the freeing of this type's associated Rust memory.
					/// Should only ever be used for debugging purposes, and will likely be
					/// deprecated soon.
					public static var suspendFreedom = false

					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKInvoiceError?

					internal init(cType: LDKInvoiceError, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKInvoiceError, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKInvoiceError, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the InvoiceError, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = InvoiceError_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The field in the [`InvoiceRequest`] or the [`Bolt12Invoice`] that contained an error.
					/// 
					/// [`InvoiceRequest`]: crate::offers::invoice_request::InvoiceRequest
					/// [`Bolt12Invoice`]: crate::offers::invoice::Bolt12Invoice
					/// 
					/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func getErroneousField() -> ErroneousField? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKInvoiceError>) in
				InvoiceError_get_erroneous_field(thisPtrPointer)
						}
				

						// cleanup
						
				// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
				// Type group: RustStruct
				// Type: LDKErroneousField
			
					if nativeCallResult.inner == nil {
						return nil
					}

					let pointerValue = UInt(bitPattern: nativeCallResult.inner)
					if pointerValue == 0 {
						return nil
					}
				

						
						// return value (do some wrapping)
						let returnValue = ErroneousField(cType: nativeCallResult, instantiationContext: "InvoiceError.swift::\(#function):\(#line)", anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// The field in the [`InvoiceRequest`] or the [`Bolt12Invoice`] that contained an error.
					/// 
					/// [`InvoiceRequest`]: crate::offers::invoice_request::InvoiceRequest
					/// [`Bolt12Invoice`]: crate::offers::invoice::Bolt12Invoice
					/// 
					/// Note that val (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func setErroneousField(val: ErroneousField) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKInvoiceError>) in
				InvoiceError_set_erroneous_field(thisPtrPointer, val.dynamicallyDangledClone().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// An explanation of the error.
					public func getMessage() -> UntrustedString {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKInvoiceError>) in
				InvoiceError_get_message(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = UntrustedString(cType: nativeCallResult, instantiationContext: "InvoiceError.swift::\(#function):\(#line)", anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// An explanation of the error.
					public func setMessage(val: UntrustedString) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKInvoiceError>) in
				InvoiceError_set_message(thisPtrPointer, val.dynamicallyDangledClone().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new InvoiceError given each field
					/// 
					/// Note that erroneous_field_arg (or a relevant inner pointer) may be NULL or all-0s to represent None
					public init(erroneousFieldArg: ErroneousField, messageArg: UntrustedString) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = InvoiceError_new(erroneousFieldArg.dynamicallyDangledClone().cType!, messageArg.dynamicallyDangledClone().cType!)

						// cleanup
						
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = InvoiceError(cType: nativeCallResult, instantiationContext: "InvoiceError.swift::\(#function):\(#line)")
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0, instantiationContext: "InvoiceError.swift::\(#function):\(#line)")
				
			
					}
		
					/// Creates a copy of the InvoiceError
					internal func clone() -> InvoiceError {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKInvoiceError>) in
				InvoiceError_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = InvoiceError(cType: nativeCallResult, instantiationContext: "InvoiceError.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Serialize the InvoiceError object into a byte array which can be read by InvoiceError_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKInvoiceError>) in
				InvoiceError_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, instantiationContext: "InvoiceError.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a InvoiceError from a byte array, created by InvoiceError_write
					public class func read(ser: [UInt8]) -> Result_InvoiceErrorDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser, instantiationContext: "InvoiceError.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = InvoiceError_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_InvoiceErrorDecodeErrorZ(cType: nativeCallResult, instantiationContext: "InvoiceError.swift::\(#function):\(#line)")
						

						return returnValue
					}
		

					
					/// Indicates that this is the only struct which contains the same pointer.
					/// Rust functions which take ownership of an object provided via an argument require
					/// this to be true and invalidate the object pointed to by inner.
					public func isOwned() -> Bool {
						// return value (do some wrapping)
						let returnValue = self.cType!.is_owned

						return returnValue;
					}
		

					
					internal func danglingClone() -> InvoiceError {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> InvoiceError {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> InvoiceError {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> InvoiceError {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing InvoiceError \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing InvoiceError \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

				}

				
			}
		
		