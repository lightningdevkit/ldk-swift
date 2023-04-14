
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A tuple of 2 elements. See the individual fields for the types contained.
			internal typealias Tuple_BlockHashChannelMonitorZ = Bindings.Tuple_BlockHashChannelMonitorZ

			extension Bindings {

				/// A tuple of 2 elements. See the individual fields for the types contained.
				internal class Tuple_BlockHashChannelMonitorZ: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKC2Tuple_BlockHashChannelMonitorZ?

					internal init(cType: LDKC2Tuple_BlockHashChannelMonitorZ) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKC2Tuple_BlockHashChannelMonitorZ, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					internal convenience init(tuple: ([UInt8], ChannelMonitor)) {
						self.init(a: tuple.0, b: tuple.1)
					}

					
					/// Creates a new tuple which has the same data as `orig`
					/// but with all dynamically-allocated buffers duplicated in new buffers.
					internal func clone() -> Tuple_BlockHashChannelMonitorZ {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKC2Tuple_BlockHashChannelMonitorZ>) in
				C2Tuple_BlockHashChannelMonitorZ_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Tuple_BlockHashChannelMonitorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new C2Tuple_BlockHashChannelMonitorZ from the contained elements.
					public init(a: [UInt8], b: ChannelMonitor) {
						// native call variable prep
						
						let aPrimitiveWrapper = ThirtyTwoBytes(value: a)
				

						// native method call
						let nativeCallResult = C2Tuple_BlockHashChannelMonitorZ_new(aPrimitiveWrapper.cType!, b.setCFreeability(freeable: false).cType!)

						// cleanup
						
						// for elided types, we need this
						aPrimitiveWrapper.noOpRetain()
				
							b.cType!.is_owned = b.initialCFreeability
						

						/*
						// return value (do some wrapping)
						let returnValue = Tuple_BlockHashChannelMonitorZ(cType: nativeCallResult)
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
				
			
					}
		
					/// Frees any resources used by the C2Tuple_BlockHashChannelMonitorZ.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = C2Tuple_BlockHashChannelMonitorZ_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Read a C2Tuple_BlockHashChannelMonitorZ from a byte array, created by C2Tuple_BlockHashChannelMonitorZ_write
					public class func read(ser: [UInt8], argA: EntropySource, argB: SignerProvider) -> Result_C2Tuple_BlockHashChannelMonitorZDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: argA.activate().cType!) { (argAPointer: UnsafePointer<LDKEntropySource>) in
				
						withUnsafePointer(to: argB.activate().cType!) { (argBPointer: UnsafePointer<LDKSignerProvider>) in
				C2Tuple_BlockHashChannelMonitorZ_read(serPrimitiveWrapper.cType!, argAPointer, argBPointer)
						}
				
						}
				

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_C2Tuple_BlockHashChannelMonitorZDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		

					public func getValue() -> ([UInt8], ChannelMonitor) {
						return (self.getA(), self.getB())
					}

					
					/// The element at position 0
					public func getA() -> [UInt8] {
						// return value (do some wrapping)
						let returnValue = ThirtyTwoBytes(cType: self.cType!.a, anchor: self).dangle().getValue()

						return returnValue;
					}
		
					/// The element at position 1
					public func getB() -> ChannelMonitor {
						// return value (do some wrapping)
						let returnValue = ChannelMonitor(cType: self.cType!.b, anchor: self).dangle()

						return returnValue;
					}
		

					internal func dangle(_ shouldDangle: Bool = true) -> Tuple_BlockHashChannelMonitorZ {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Tuple_BlockHashChannelMonitorZ {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Tuple_BlockHashChannelMonitorZ \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Tuple_BlockHashChannelMonitorZ \(self.instanceNumber) due to dangle.")
						}
					}
			

				}
			}
		