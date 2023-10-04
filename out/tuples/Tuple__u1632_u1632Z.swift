
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A tuple of 2 elements. See the individual fields for the types contained.
			internal typealias Tuple__u1632_u1632Z = Bindings.Tuple__u1632_u1632Z

			extension Bindings {

				/// A tuple of 2 elements. See the individual fields for the types contained.
				internal class Tuple__u1632_u1632Z: NativeTypeWrapper {

					
					/// Set to false to suppress an individual type's deinit log statements.
					/// Only applicable when log threshold is set to `.Debug`.
					public static var enableDeinitLogging = true

					/// Set to true to suspend the freeing of this type's associated Rust memory.
					/// Should only ever be used for debugging purposes, and will likely be
					/// deprecated soon.
					public static var suspendFreedom = false

					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKC2Tuple__u1632_u1632Z?

					internal init(cType: LDKC2Tuple__u1632_u1632Z, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKC2Tuple__u1632_u1632Z, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKC2Tuple__u1632_u1632Z, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					internal convenience init(tuple: ([UInt16], [UInt16]), instantiationContext: String) {
						self.init(a: tuple.0, b: tuple.1, instantiationContext: instantiationContext)
					}

					
					/// Creates a new C2Tuple__u1632_u1632Z from the contained elements.
					public init(a: [UInt16], b: [UInt16], instantiationContext: String) {
						// native call variable prep
						
						let aPrimitiveWrapper = ThirtyTwoU16s(value: a, instantiationContext: "Tuple__u1632_u1632Z.swift::\(#function):\(#line)")
				
						let bPrimitiveWrapper = ThirtyTwoU16s(value: b, instantiationContext: "Tuple__u1632_u1632Z.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = C2Tuple__u1632_u1632Z_new(aPrimitiveWrapper.cType!, bPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						aPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						bPrimitiveWrapper.noOpRetain()
				

						/*
						// return value (do some wrapping)
						let returnValue = Tuple__u1632_u1632Z(cType: nativeCallResult, instantiationContext: "Tuple__u1632_u1632Z.swift::\(#function):\(#line)")
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
				
			
					}
		
					/// Frees any resources used by the C2Tuple__u1632_u1632Z.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = C2Tuple__u1632_u1632Z_free(self.cType!)

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
						let returnValue = ThirtyTwoU16s(cType: self.cType!.a, instantiationContext: "Tuple__u1632_u1632Z.swift::\(#function):\(#line)", anchor: self).dangle().getValue()

						return returnValue;
					}
		
					/// The element at position 1
					public func getB() -> [UInt16] {
						// return value (do some wrapping)
						let returnValue = ThirtyTwoU16s(cType: self.cType!.b, instantiationContext: "Tuple__u1632_u1632Z.swift::\(#function):\(#line)", anchor: self).dangle().getValue()

						return returnValue;
					}
		

					
					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing Tuple__u1632_u1632Z \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing Tuple__u1632_u1632Z \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

				}
			}
		