
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A tuple of 2 elements. See the individual fields for the types contained.
			internal typealias Tuple__u168_u168Z = Bindings.Tuple__u168_u168Z

			extension Bindings {

				/// A tuple of 2 elements. See the individual fields for the types contained.
				internal class Tuple__u168_u168Z: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKC2Tuple__u168_u168Z?

					internal init(cType: LDKC2Tuple__u168_u168Z, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKC2Tuple__u168_u168Z, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					internal convenience init(tuple: ([UInt16], [UInt16]), instantiationContext: String) {
						self.init(a: tuple.0, b: tuple.1, instantiationContext: instantiationContext)
					}

					
					/// Creates a new tuple which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Tuple__u168_u168Z {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKC2Tuple__u168_u168Z>) in
				C2Tuple__u168_u168Z_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Tuple__u168_u168Z(cType: nativeCallResult, instantiationContext: "Tuple__u168_u168Z.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Creates a new C2Tuple__u168_u168Z from the contained elements.
					public init(a: [UInt16], b: [UInt16], instantiationContext: String) {
						// native call variable prep
						
						let aPrimitiveWrapper = EightU16s(value: a, instantiationContext: "Tuple__u168_u168Z.swift::\(#function):\(#line)")
				
						let bPrimitiveWrapper = EightU16s(value: b, instantiationContext: "Tuple__u168_u168Z.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = C2Tuple__u168_u168Z_new(aPrimitiveWrapper.cType!, bPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						aPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						bPrimitiveWrapper.noOpRetain()
				

						/*
						// return value (do some wrapping)
						let returnValue = Tuple__u168_u168Z(cType: nativeCallResult, instantiationContext: "Tuple__u168_u168Z.swift::\(#function):\(#line)")
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				
			
					}
		
					/// Frees any resources used by the C2Tuple__u168_u168Z.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = C2Tuple__u168_u168Z_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					public func getValue() -> ([UInt16], [UInt16]) {
						return (self.getA(), self.getB())
					}

					
					/// The element at position 0
					public func getA() -> [UInt16] {
						// return value (do some wrapping)
						let returnValue = EightU16s(cType: self.cType!.a, instantiationContext: "Tuple__u168_u168Z.swift::\(#function):\(#line)", anchor: self).dangle().getValue()

						return returnValue;
					}
		
					/// The element at position 1
					public func getB() -> [UInt16] {
						// return value (do some wrapping)
						let returnValue = EightU16s(cType: self.cType!.b, instantiationContext: "Tuple__u168_u168Z.swift::\(#function):\(#line)", anchor: self).dangle().getValue()

						return returnValue;
					}
		

					internal func dangle(_ shouldDangle: Bool = true) -> Tuple__u168_u168Z {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Tuple__u168_u168Z {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Tuple__u168_u168Z \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Tuple__u168_u168Z \(self.instanceNumber) due to dangle.")
						}
					}
			

				}
			}
		