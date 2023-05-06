
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A tuple of 3 elements. See the individual fields for the types contained.
			internal typealias Tuple_RawInvoice_u832InvoiceSignatureZ = Bindings.Tuple_RawInvoice_u832InvoiceSignatureZ

			extension Bindings {

				/// A tuple of 3 elements. See the individual fields for the types contained.
				internal class Tuple_RawInvoice_u832InvoiceSignatureZ: NativeTypeWrapper {

					
					/// Set to false to suppress an individual type's deinit log statements.
					/// Only applicable when log threshold is set to `.Debug`.
					public static var enableDeinitLogging = true

					/// Set to true to suspend the freeing of this type's associated Rust memory.
					/// Should only ever be used for debugging purposes, and will likely be
					/// deprecated soon.
					public static var suspendFreedom = false

					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKC3Tuple_RawInvoice_u832InvoiceSignatureZ?

					internal init(cType: LDKC3Tuple_RawInvoice_u832InvoiceSignatureZ, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKC3Tuple_RawInvoice_u832InvoiceSignatureZ, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKC3Tuple_RawInvoice_u832InvoiceSignatureZ, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					internal convenience init(tuple: (RawInvoice, [UInt8], InvoiceSignature), instantiationContext: String) {
						self.init(a: tuple.0, b: tuple.1, c: tuple.2, instantiationContext: instantiationContext)
					}

					
					/// Creates a new tuple which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Tuple_RawInvoice_u832InvoiceSignatureZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKC3Tuple_RawInvoice_u832InvoiceSignatureZ>) in
				C3Tuple_RawInvoice_u832InvoiceSignatureZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Tuple_RawInvoice_u832InvoiceSignatureZ(cType: nativeCallResult, instantiationContext: "Tuple_RawInvoice_u832InvoiceSignatureZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Creates a new C3Tuple_RawInvoice_u832InvoiceSignatureZ from the contained elements.
					public init(a: RawInvoice, b: [UInt8], c: InvoiceSignature, instantiationContext: String) {
						// native call variable prep
						
						let bPrimitiveWrapper = ThirtyTwoBytes(value: b, instantiationContext: "Tuple_RawInvoice_u832InvoiceSignatureZ.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = C3Tuple_RawInvoice_u832InvoiceSignatureZ_new(a.dynamicallyDangledClone().cType!, bPrimitiveWrapper.cType!, c.dynamicallyDangledClone().cType!)

						// cleanup
						
						// for elided types, we need this
						bPrimitiveWrapper.noOpRetain()
				

						/*
						// return value (do some wrapping)
						let returnValue = Tuple_RawInvoice_u832InvoiceSignatureZ(cType: nativeCallResult, instantiationContext: "Tuple_RawInvoice_u832InvoiceSignatureZ.swift::\(#function):\(#line)")
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				
			
					}
		
					/// Frees any resources used by the C3Tuple_RawInvoice_u832InvoiceSignatureZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = C3Tuple_RawInvoice_u832InvoiceSignatureZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					public func getValue() -> (RawInvoice, [UInt8], InvoiceSignature) {
						return (self.getA(), self.getB(), self.getC())
					}

					
					/// The element at position 0
					public func getA() -> RawInvoice {
						// return value (do some wrapping)
						let returnValue = RawInvoice(cType: self.cType!.a, instantiationContext: "Tuple_RawInvoice_u832InvoiceSignatureZ.swift::\(#function):\(#line)", anchor: self).dangle()

						return returnValue;
					}
		
					/// The element at position 1
					public func getB() -> [UInt8] {
						// return value (do some wrapping)
						let returnValue = ThirtyTwoBytes(cType: self.cType!.b, instantiationContext: "Tuple_RawInvoice_u832InvoiceSignatureZ.swift::\(#function):\(#line)", anchor: self).dangle().getValue()

						return returnValue;
					}
		
					/// The element at position 2
					public func getC() -> InvoiceSignature {
						// return value (do some wrapping)
						let returnValue = InvoiceSignature(cType: self.cType!.c, instantiationContext: "Tuple_RawInvoice_u832InvoiceSignatureZ.swift::\(#function):\(#line)", anchor: self).dangle()

						return returnValue;
					}
		

					internal func dangle(_ shouldDangle: Bool = true) -> Tuple_RawInvoice_u832InvoiceSignatureZ {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Tuple_RawInvoice_u832InvoiceSignatureZ {
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
								Bindings.print("Freeing Tuple_RawInvoice_u832InvoiceSignatureZ \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing Tuple_RawInvoice_u832InvoiceSignatureZ \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

				}
			}
		