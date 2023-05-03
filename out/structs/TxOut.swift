
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A transaction output including a scriptPubKey and value.
			/// This type *does* own its own memory, so must be free'd appropriately.
			public typealias TxOut = Bindings.TxOut

			extension Bindings {
		

				/// A transaction output including a scriptPubKey and value.
				/// This type *does* own its own memory, so must be free'd appropriately.
				public class TxOut: NativeTypeWrapper {

					

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKTxOut?

					internal init(cType: LDKTxOut, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKTxOut, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Convenience function for constructing a new TxOut
					public init(scriptPubkey: [UInt8], value: UInt64) {
						// native call variable prep
						
						let scriptPubkeyVector = Vec_u8Z(array: scriptPubkey).dangle()
				

						// native method call
						let nativeCallResult = TxOut_new(scriptPubkeyVector.cType!, value)

						// cleanup
						
						// scriptPubkeyVector.noOpRetain()
				

						/*
						// return value (do some wrapping)
						let returnValue = TxOut(cType: nativeCallResult, instantiationContext: "TxOut.swift::\(#function):\(#line)")
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0, instantiationContext: "TxOut.swift::\(#function):\(#line)")
				
			
					}
		
					/// Frees the data pointed to by script_pubkey.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = TxOut_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new TxOut which has the same data as `orig` but with a new script buffer.
					internal func clone() -> TxOut {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKTxOut>) in
				TxOut_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = TxOut(cType: nativeCallResult, instantiationContext: "TxOut.swift::\(#function):\(#line)")
						

						return returnValue
					}
		

					
					/// The script_pubkey in this output
					public func getScriptPubkey() -> [UInt8] {
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: self.cType!.script_pubkey, instantiationContext: "TxOut.swift::\(#function):\(#line)", anchor: self).getValue()

						return returnValue;
					}
		
					/// The value, in satoshis, of this output
					public func getValue() -> UInt64 {
						// return value (do some wrapping)
						let returnValue = self.cType!.value

						return returnValue;
					}
		

					internal func dangle(_ shouldDangle: Bool = true) -> TxOut {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> TxOut {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing TxOut \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing TxOut \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		