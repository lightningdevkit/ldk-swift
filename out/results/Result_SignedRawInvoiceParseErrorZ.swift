
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_SignedRawInvoiceParseErrorZ represents the result of a fallible operation,
			/// containing a crate::lightning_invoice::SignedRawInvoice on success and a crate::lightning_invoice::ParseError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_SignedRawInvoiceParseErrorZ = Bindings.Result_SignedRawInvoiceParseErrorZ

			extension Bindings {

				/// A CResult_SignedRawInvoiceParseErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning_invoice::SignedRawInvoice on success and a crate::lightning_invoice::ParseError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_SignedRawInvoiceParseErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_SignedRawInvoiceParseErrorZ?

					internal init(cType: LDKCResult_SignedRawInvoiceParseErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKCResult_SignedRawInvoiceParseErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_SignedRawInvoiceParseErrorZ in the success state.
					public class func initWithOk(o: SignedRawInvoice) -> Result_SignedRawInvoiceParseErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_SignedRawInvoiceParseErrorZ_ok(o.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_SignedRawInvoiceParseErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new CResult_SignedRawInvoiceParseErrorZ in the error state.
					public class func initWithErr(e: ParseError) -> Result_SignedRawInvoiceParseErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_SignedRawInvoiceParseErrorZ_err(e.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_SignedRawInvoiceParseErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_SignedRawInvoiceParseErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_SignedRawInvoiceParseErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_SignedRawInvoiceParseErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_SignedRawInvoiceParseErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_SignedRawInvoiceParseErrorZ>) in
				CResult_SignedRawInvoiceParseErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_SignedRawInvoiceParseErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					
					public func getError() -> ParseError? {
						if self.cType?.result_ok == false {
							return ParseError(cType: self.cType!.contents.err.pointee, anchor: self)
						}
						return nil
					}
					

					
					public func getValue() -> SignedRawInvoice? {
						if self.cType?.result_ok == true {
							return SignedRawInvoice(cType: self.cType!.contents.result.pointee, anchor: self)
						}
						return nil
					}
					

					internal func dangle(_ shouldDangle: Bool = true) -> Result_SignedRawInvoiceParseErrorZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Result_SignedRawInvoiceParseErrorZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Result_SignedRawInvoiceParseErrorZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Result_SignedRawInvoiceParseErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		