
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A tuple of 2 elements. See the individual fields for the types contained.
			internal typealias Tuple_PaymentHashPaymentIdZ = Bindings.Tuple_PaymentHashPaymentIdZ

			extension Bindings {

				/// A tuple of 2 elements. See the individual fields for the types contained.
				internal class Tuple_PaymentHashPaymentIdZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKC2Tuple_PaymentHashPaymentIdZ?

					internal init(cType: LDKC2Tuple_PaymentHashPaymentIdZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKC2Tuple_PaymentHashPaymentIdZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					internal convenience init(tuple: ([UInt8], [UInt8])) {
						self.init(a: tuple.0, b: tuple.1)
					}

					
					/// Creates a new tuple which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Tuple_PaymentHashPaymentIdZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKC2Tuple_PaymentHashPaymentIdZ>) in
				C2Tuple_PaymentHashPaymentIdZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Tuple_PaymentHashPaymentIdZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new C2Tuple_PaymentHashPaymentIdZ from the contained elements.
					public init(a: [UInt8], b: [UInt8]) {
						// native call variable prep
						
						let aPrimitiveWrapper = ThirtyTwoBytes(value: a)
				
						let bPrimitiveWrapper = ThirtyTwoBytes(value: b)
				

						// native method call
						let nativeCallResult = C2Tuple_PaymentHashPaymentIdZ_new(aPrimitiveWrapper.cType!, bPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						aPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						bPrimitiveWrapper.noOpRetain()
				

						/*
						// return value (do some wrapping)
						let returnValue = Tuple_PaymentHashPaymentIdZ(cType: nativeCallResult)
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		
					/// Frees any resources used by the C2Tuple_PaymentHashPaymentIdZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = C2Tuple_PaymentHashPaymentIdZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					public func getValue() -> ([UInt8], [UInt8]) {
						return (self.getA(), self.getB())
					}

					
					/// The element at position 0
					public func getA() -> [UInt8] {
						// return value (do some wrapping)
						let returnValue = ThirtyTwoBytes(cType: self.cType!.a, anchor: self).dangle().getValue()

						return returnValue;
					}
		
					/// The element at position 1
					public func getB() -> [UInt8] {
						// return value (do some wrapping)
						let returnValue = ThirtyTwoBytes(cType: self.cType!.b, anchor: self).dangle().getValue()

						return returnValue;
					}
		

					internal func dangle(_ shouldDangle: Bool = true) -> Tuple_PaymentHashPaymentIdZ {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Tuple_PaymentHashPaymentIdZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Tuple_PaymentHashPaymentIdZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Tuple_PaymentHashPaymentIdZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}
			}
		