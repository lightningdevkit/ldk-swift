
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A CResult_InvoiceSignOrCreationErrorZ represents the result of a fallible operation,
			/// containing a crate::lightning_invoice::Invoice on success and a crate::lightning_invoice::SignOrCreationError on failure.
			/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
			public typealias Result_InvoiceSignOrCreationErrorZ = Bindings.Result_InvoiceSignOrCreationErrorZ

			extension Bindings {

				/// A CResult_InvoiceSignOrCreationErrorZ represents the result of a fallible operation,
				/// containing a crate::lightning_invoice::Invoice on success and a crate::lightning_invoice::SignOrCreationError on failure.
				/// `result_ok` indicates the overall state, and the contents are provided via `contents`.
				public class Result_InvoiceSignOrCreationErrorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCResult_InvoiceSignOrCreationErrorZ?

					internal init(cType: LDKCResult_InvoiceSignOrCreationErrorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKCResult_InvoiceSignOrCreationErrorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Creates a new CResult_InvoiceSignOrCreationErrorZ in the success state.
					public class func initWithOk(o: Invoice) -> Result_InvoiceSignOrCreationErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_InvoiceSignOrCreationErrorZ_ok(o.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_InvoiceSignOrCreationErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new CResult_InvoiceSignOrCreationErrorZ in the error state.
					public class func initWithErr(e: SignOrCreationError) -> Result_InvoiceSignOrCreationErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_InvoiceSignOrCreationErrorZ_err(e.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_InvoiceSignOrCreationErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the CResult_InvoiceSignOrCreationErrorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CResult_InvoiceSignOrCreationErrorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new CResult_InvoiceSignOrCreationErrorZ which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Result_InvoiceSignOrCreationErrorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCResult_InvoiceSignOrCreationErrorZ>) in
				CResult_InvoiceSignOrCreationErrorZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Result_InvoiceSignOrCreationErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		

					public func isOk() -> Bool {
						return self.cType?.result_ok == true
					}

					
					public func getError() -> SignOrCreationError? {
						if self.cType?.result_ok == false {
							return SignOrCreationError(cType: self.cType!.contents.err.pointee, anchor: self)
						}
						return nil
					}
					

					
					public func getValue() -> Invoice? {
						if self.cType?.result_ok == true {
							return Invoice(cType: self.cType!.contents.result.pointee, anchor: self)
						}
						return nil
					}
					

					internal func dangle(_ shouldDangle: Bool = true) -> Result_InvoiceSignOrCreationErrorZ {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Result_InvoiceSignOrCreationErrorZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Result_InvoiceSignOrCreationErrorZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Result_InvoiceSignOrCreationErrorZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

			}
		