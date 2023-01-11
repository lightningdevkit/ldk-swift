
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Features used within an `invoice_request`.
			public typealias InvoiceRequestFeatures = Bindings.InvoiceRequestFeatures

			extension Bindings {
		

				/// Features used within an `invoice_request`.
				public class InvoiceRequestFeatures: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKInvoiceRequestFeatures?

					internal init(cType: LDKInvoiceRequestFeatures) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKInvoiceRequestFeatures, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Checks if two InvoiceRequestFeaturess contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public class func eq(a: InvoiceRequestFeatures, b: InvoiceRequestFeatures) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKInvoiceRequestFeatures>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKInvoiceRequestFeatures>) in
				InvoiceRequestFeatures_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the InvoiceRequestFeatures
					internal func clone() -> InvoiceRequestFeatures {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKInvoiceRequestFeatures>) in
				InvoiceRequestFeatures_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = InvoiceRequestFeatures(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the InvoiceRequestFeatures, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = InvoiceRequestFeatures_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Create a blank Features with no features set
					public class func initWithEmpty() -> InvoiceRequestFeatures {
						// native call variable prep
						

						// native method call
						let nativeCallResult = InvoiceRequestFeatures_empty()

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = InvoiceRequestFeatures(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Returns true if this `Features` object contains unknown feature flags which are set as
					/// \"required\".
					public func requiresUnknownBits() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKInvoiceRequestFeatures>) in
				InvoiceRequestFeatures_requires_unknown_bits(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Serialize the InvoiceRequestFeatures object into a byte array which can be read by InvoiceRequestFeatures_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKInvoiceRequestFeatures>) in
				InvoiceRequestFeatures_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a InvoiceRequestFeatures from a byte array, created by InvoiceRequestFeatures_write
					public class func read(ser: [UInt8]) -> Result_InvoiceRequestFeaturesDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = InvoiceRequestFeatures_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_InvoiceRequestFeaturesDecodeErrorZ(cType: nativeCallResult)
						

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> InvoiceRequestFeatures {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> InvoiceRequestFeatures {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> InvoiceRequestFeatures {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> InvoiceRequestFeatures {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> InvoiceRequestFeatures {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing InvoiceRequestFeatures \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing InvoiceRequestFeatures \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		