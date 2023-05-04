
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A tuple of 3 elements. See the individual fields for the types contained.
			internal typealias Tuple_OutPointCVec_MonitorEventZPublicKeyZ = Bindings.Tuple_OutPointCVec_MonitorEventZPublicKeyZ

			extension Bindings {

				/// A tuple of 3 elements. See the individual fields for the types contained.
				internal class Tuple_OutPointCVec_MonitorEventZPublicKeyZ: NativeTypeWrapper {

					
					public static var enableDeinitLogging = true
					public static var suspendFreedom = false
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKC3Tuple_OutPointCVec_MonitorEventZPublicKeyZ?

					internal init(cType: LDKC3Tuple_OutPointCVec_MonitorEventZPublicKeyZ, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKC3Tuple_OutPointCVec_MonitorEventZPublicKeyZ, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					internal convenience init(tuple: (OutPoint, [MonitorEvent], [UInt8]), instantiationContext: String) {
						self.init(a: tuple.0, b: tuple.1, c: tuple.2, instantiationContext: instantiationContext)
					}

					
					/// Creates a new tuple which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Tuple_OutPointCVec_MonitorEventZPublicKeyZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKC3Tuple_OutPointCVec_MonitorEventZPublicKeyZ>) in
				C3Tuple_OutPointCVec_MonitorEventZPublicKeyZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Tuple_OutPointCVec_MonitorEventZPublicKeyZ(cType: nativeCallResult, instantiationContext: "Tuple_OutPointCVec_MonitorEventZPublicKeyZ.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Creates a new C3Tuple_OutPointCVec_MonitorEventZPublicKeyZ from the contained elements.
					public init(a: OutPoint, b: [MonitorEvent], c: [UInt8], instantiationContext: String) {
						// native call variable prep
						
						let bVector = Vec_MonitorEventZ(array: b, instantiationContext: "Tuple_OutPointCVec_MonitorEventZPublicKeyZ.swift::\(#function):\(#line)").dangle()
				
						let cPrimitiveWrapper = PublicKey(value: c, instantiationContext: "Tuple_OutPointCVec_MonitorEventZPublicKeyZ.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = C3Tuple_OutPointCVec_MonitorEventZPublicKeyZ_new(a.dynamicallyDangledClone().cType!, bVector.cType!, cPrimitiveWrapper.cType!)

						// cleanup
						
						// bVector.noOpRetain()
				
						// for elided types, we need this
						cPrimitiveWrapper.noOpRetain()
				

						/*
						// return value (do some wrapping)
						let returnValue = Tuple_OutPointCVec_MonitorEventZPublicKeyZ(cType: nativeCallResult, instantiationContext: "Tuple_OutPointCVec_MonitorEventZPublicKeyZ.swift::\(#function):\(#line)")
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				
			
					}
		
					/// Frees any resources used by the C3Tuple_OutPointCVec_MonitorEventZPublicKeyZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = C3Tuple_OutPointCVec_MonitorEventZPublicKeyZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					public func getValue() -> (OutPoint, [MonitorEvent], [UInt8]) {
						return (self.getA(), self.getB(), self.getC())
					}

					
					/// The element at position 0
					public func getA() -> OutPoint {
						// return value (do some wrapping)
						let returnValue = OutPoint(cType: self.cType!.a, instantiationContext: "Tuple_OutPointCVec_MonitorEventZPublicKeyZ.swift::\(#function):\(#line)", anchor: self).dangle()

						return returnValue;
					}
		
					/// The element at position 1
					public func getB() -> [MonitorEvent] {
						// return value (do some wrapping)
						let returnValue = Vec_MonitorEventZ(cType: self.cType!.b, instantiationContext: "Tuple_OutPointCVec_MonitorEventZPublicKeyZ.swift::\(#function):\(#line)", anchor: self).dangle().getValue()

						return returnValue;
					}
		
					/// The element at position 2
					public func getC() -> [UInt8] {
						// return value (do some wrapping)
						let returnValue = PublicKey(cType: self.cType!.c, instantiationContext: "Tuple_OutPointCVec_MonitorEventZPublicKeyZ.swift::\(#function):\(#line)", anchor: self).dangle().getValue()

						return returnValue;
					}
		

					internal func dangle(_ shouldDangle: Bool = true) -> Tuple_OutPointCVec_MonitorEventZPublicKeyZ {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Tuple_OutPointCVec_MonitorEventZPublicKeyZ {
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
								Bindings.print("Freeing Tuple_OutPointCVec_MonitorEventZPublicKeyZ \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing Tuple_OutPointCVec_MonitorEventZPublicKeyZ \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

				}
			}
		