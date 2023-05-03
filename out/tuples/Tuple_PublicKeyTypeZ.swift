
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A tuple of 2 elements. See the individual fields for the types contained.
			internal typealias Tuple_PublicKeyTypeZ = Bindings.Tuple_PublicKeyTypeZ

			extension Bindings {

				/// A tuple of 2 elements. See the individual fields for the types contained.
				internal class Tuple_PublicKeyTypeZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKC2Tuple_PublicKeyTypeZ?

					internal init(cType: LDKC2Tuple_PublicKeyTypeZ, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKC2Tuple_PublicKeyTypeZ, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					internal convenience init(tuple: ([UInt8], BindingsType), instantiationContext: String) {
						self.init(a: tuple.0, b: tuple.1, instantiationContext: instantiationContext)
					}

					
					/// Creates a new tuple which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Tuple_PublicKeyTypeZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKC2Tuple_PublicKeyTypeZ>) in
				C2Tuple_PublicKeyTypeZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Tuple_PublicKeyTypeZ(cType: nativeCallResult, instantiationContext: "Tuple_PublicKeyTypeZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Creates a new C2Tuple_PublicKeyTypeZ from the contained elements.
					public init(a: [UInt8], b: BindingsType, instantiationContext: String) {
						// native call variable prep
						
						let aPrimitiveWrapper = PublicKey(value: a, instantiationContext: "Tuple_PublicKeyTypeZ.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = C2Tuple_PublicKeyTypeZ_new(aPrimitiveWrapper.cType!, b.activate().cType!)

						// cleanup
						
						// for elided types, we need this
						aPrimitiveWrapper.noOpRetain()
				

						/*
						// return value (do some wrapping)
						let returnValue = Tuple_PublicKeyTypeZ(cType: nativeCallResult, instantiationContext: "Tuple_PublicKeyTypeZ.swift::\(#function):\(#line)")
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				
			
					}
		
					/// Frees any resources used by the C2Tuple_PublicKeyTypeZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = C2Tuple_PublicKeyTypeZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					public func getValue() -> ([UInt8], BindingsType) {
						return (self.getA(), self.getB())
					}

					
					/// The element at position 0
					public func getA() -> [UInt8] {
						// return value (do some wrapping)
						let returnValue = PublicKey(cType: self.cType!.a, instantiationContext: "Tuple_PublicKeyTypeZ.swift::\(#function):\(#line)", anchor: self).dangle().getValue()

						return returnValue;
					}
		
					/// The element at position 1
					public func getB() -> BindingsType {
						// return value (do some wrapping)
						let returnValue = NativelyImplementedBindingsType(cType: self.cType!.b, instantiationContext: "Tuple_PublicKeyTypeZ.swift::\(#function):\(#line)", anchor: self).dangle()

						return returnValue;
					}
		

					internal func dangle(_ shouldDangle: Bool = true) -> Tuple_PublicKeyTypeZ {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Tuple_PublicKeyTypeZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Tuple_PublicKeyTypeZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Tuple_PublicKeyTypeZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}
			}
		