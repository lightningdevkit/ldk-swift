
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A tuple of 2 elements. See the individual fields for the types contained.
			internal typealias Tuple_SignatureCVec_SignatureZZ = Bindings.Tuple_SignatureCVec_SignatureZZ

			extension Bindings {

				/// A tuple of 2 elements. See the individual fields for the types contained.
				internal class Tuple_SignatureCVec_SignatureZZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKC2Tuple_SignatureCVec_SignatureZZ?

					internal init(cType: LDKC2Tuple_SignatureCVec_SignatureZZ, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKC2Tuple_SignatureCVec_SignatureZZ, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					internal convenience init(tuple: ([UInt8], [[UInt8]]), instantiationContext: String) {
						self.init(a: tuple.0, b: tuple.1, instantiationContext: instantiationContext)
					}

					
					/// Creates a new tuple which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Tuple_SignatureCVec_SignatureZZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKC2Tuple_SignatureCVec_SignatureZZ>) in
				C2Tuple_SignatureCVec_SignatureZZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Tuple_SignatureCVec_SignatureZZ(cType: nativeCallResult, instantiationContext: "Tuple_SignatureCVec_SignatureZZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Creates a new C2Tuple_SignatureCVec_SignatureZZ from the contained elements.
					public init(a: [UInt8], b: [[UInt8]], instantiationContext: String) {
						// native call variable prep
						
						let aPrimitiveWrapper = Signature(value: a, instantiationContext: "Tuple_SignatureCVec_SignatureZZ.swift::\(#function):\(#line)")
				
						let bVector = Vec_SignatureZ(array: b, instantiationContext: "Tuple_SignatureCVec_SignatureZZ.swift::\(#function):\(#line)").dangle()
				

						// native method call
						let nativeCallResult = C2Tuple_SignatureCVec_SignatureZZ_new(aPrimitiveWrapper.cType!, bVector.cType!)

						// cleanup
						
						// for elided types, we need this
						aPrimitiveWrapper.noOpRetain()
				
						// bVector.noOpRetain()
				

						/*
						// return value (do some wrapping)
						let returnValue = Tuple_SignatureCVec_SignatureZZ(cType: nativeCallResult, instantiationContext: "Tuple_SignatureCVec_SignatureZZ.swift::\(#function):\(#line)")
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				
			
					}
		
					/// Frees any resources used by the C2Tuple_SignatureCVec_SignatureZZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = C2Tuple_SignatureCVec_SignatureZZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					public func getValue() -> ([UInt8], [[UInt8]]) {
						return (self.getA(), self.getB())
					}

					
					/// The element at position 0
					public func getA() -> [UInt8] {
						// return value (do some wrapping)
						let returnValue = Signature(cType: self.cType!.a, instantiationContext: "Tuple_SignatureCVec_SignatureZZ.swift::\(#function):\(#line)", anchor: self).dangle().getValue()

						return returnValue;
					}
		
					/// The element at position 1
					public func getB() -> [[UInt8]] {
						// return value (do some wrapping)
						let returnValue = Vec_SignatureZ(cType: self.cType!.b, instantiationContext: "Tuple_SignatureCVec_SignatureZZ.swift::\(#function):\(#line)", anchor: self).dangle().getValue()

						return returnValue;
					}
		

					internal func dangle(_ shouldDangle: Bool = true) -> Tuple_SignatureCVec_SignatureZZ {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Tuple_SignatureCVec_SignatureZZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Tuple_SignatureCVec_SignatureZZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Tuple_SignatureCVec_SignatureZZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}
			}
		