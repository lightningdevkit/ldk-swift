
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A tuple of 2 elements. See the individual fields for the types contained.
			internal typealias Tuple_BlindedPayInfoBlindedPathZ = Bindings.Tuple_BlindedPayInfoBlindedPathZ

			extension Bindings {

				/// A tuple of 2 elements. See the individual fields for the types contained.
				internal class Tuple_BlindedPayInfoBlindedPathZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKC2Tuple_BlindedPayInfoBlindedPathZ?

					internal init(cType: LDKC2Tuple_BlindedPayInfoBlindedPathZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKC2Tuple_BlindedPayInfoBlindedPathZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					internal convenience init(tuple: (BlindedPayInfo, BlindedPath)) {
						self.init(a: tuple.0, b: tuple.1)
					}

					
					/// Creates a new tuple which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Tuple_BlindedPayInfoBlindedPathZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKC2Tuple_BlindedPayInfoBlindedPathZ>) in
				C2Tuple_BlindedPayInfoBlindedPathZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Tuple_BlindedPayInfoBlindedPathZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new C2Tuple_BlindedPayInfoBlindedPathZ from the contained elements.
					public init(a: BlindedPayInfo, b: BlindedPath) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = C2Tuple_BlindedPayInfoBlindedPathZ_new(a.dynamicallyDangledClone().cType!, b.dynamicallyDangledClone().cType!)

						// cleanup
						

						/*
						// return value (do some wrapping)
						let returnValue = Tuple_BlindedPayInfoBlindedPathZ(cType: nativeCallResult)
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
				
			
					}
		
					/// Frees any resources used by the C2Tuple_BlindedPayInfoBlindedPathZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = C2Tuple_BlindedPayInfoBlindedPathZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					public func getValue() -> (BlindedPayInfo, BlindedPath) {
						return (self.getA(), self.getB())
					}

					
					/// The element at position 0
					public func getA() -> BlindedPayInfo {
						// return value (do some wrapping)
						let returnValue = BlindedPayInfo(cType: self.cType!.a, anchor: self).dangle()

						return returnValue;
					}
		
					/// The element at position 1
					public func getB() -> BlindedPath {
						// return value (do some wrapping)
						let returnValue = BlindedPath(cType: self.cType!.b, anchor: self).dangle()

						return returnValue;
					}
		

					internal func dangle(_ shouldDangle: Bool = true) -> Tuple_BlindedPayInfoBlindedPathZ {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Tuple_BlindedPayInfoBlindedPathZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Tuple_BlindedPayInfoBlindedPathZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Tuple_BlindedPayInfoBlindedPathZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}
			}
		