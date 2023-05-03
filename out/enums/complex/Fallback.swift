
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			/// 
			public typealias Fallback = Bindings.Fallback

			extension Bindings {

				/// Fallback address in case no LN payment is possible
				public class Fallback: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKFallback?

					internal init(cType: LDKFallback) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKFallback, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public enum FallbackType {
						
						/// 
						case SegWitProgram
			
						/// 
						case PubKeyHash
			
						/// 
						case ScriptHash
			
					}

					public func getValueType() -> FallbackType {
						switch self.cType!.tag {
							case LDKFallback_SegWitProgram:
								return .SegWitProgram
			
							case LDKFallback_PubKeyHash:
								return .PubKeyHash
			
							case LDKFallback_ScriptHash:
								return .ScriptHash
			
							default:
								Bindings.print("Error: Invalid value type for Fallback! Aborting.", severity: .ERROR)
								abort()
						}
		
					}

					
					/// Frees any resources used by the Fallback
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Fallback_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the Fallback
					internal func clone() -> Fallback {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKFallback>) in
				Fallback_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Fallback(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new SegWitProgram-variant Fallback
					public class func initWithSegWitProgram(version: UInt8, program: [UInt8]) -> Fallback {
						// native call variable prep
						
						let versionPrimitiveWrapper = WitnessVersion(value: version)
				
						let programVector = Vec_u8Z(array: program).dangle()
				

						// native method call
						let nativeCallResult = Fallback_seg_wit_program(versionPrimitiveWrapper.cType!, programVector.cType!)

						// cleanup
						
						// for elided types, we need this
						versionPrimitiveWrapper.noOpRetain()
				
						// programVector.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Fallback(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new PubKeyHash-variant Fallback
					public class func initWithPubKeyHash(a: [UInt8]) -> Fallback {
						// native call variable prep
						
						let aPrimitiveWrapper = TwentyBytes(value: a)
				

						// native method call
						let nativeCallResult = Fallback_pub_key_hash(aPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						aPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Fallback(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new ScriptHash-variant Fallback
					public class func initWithScriptHash(a: [UInt8]) -> Fallback {
						// native call variable prep
						
						let aPrimitiveWrapper = TwentyBytes(value: a)
				

						// native method call
						let nativeCallResult = Fallback_script_hash(aPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						aPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Fallback(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Generates a non-cryptographic 64-bit hash of the Fallback.
					public func hash() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKFallback>) in
				Fallback_hash(oPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if two Fallbacks contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					public class func eq(a: Fallback, b: Fallback) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKFallback>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKFallback>) in
				Fallback_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					
					public func getValueAsSegWitProgram() -> SegWitProgram? {
						if self.cType?.tag != LDKFallback_SegWitProgram {
							return nil
						}

						return Fallback_LDKSegWitProgram_Body(cType: self.cType!.seg_wit_program, anchor: self)
					}
			
					public func getValueAsPubKeyHash() -> [UInt8]? {
						if self.cType?.tag != LDKFallback_PubKeyHash {
							return nil
						}

						return TwentyBytes(cType: self.cType!.pub_key_hash, anchor: self).getValue()
					}
			
					public func getValueAsScriptHash() -> [UInt8]? {
						if self.cType?.tag != LDKFallback_ScriptHash {
							return nil
						}

						return TwentyBytes(cType: self.cType!.script_hash, anchor: self).getValue()
					}
			

					internal func dangle(_ shouldDangle: Bool = true) -> Fallback {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Fallback {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Fallback \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Fallback \(self.instanceNumber) due to dangle.")
						}
					}
			

					
					
					/// 
					internal typealias Fallback_LDKSegWitProgram_Body = SegWitProgram
			

					/// 
					public class SegWitProgram: NativeTypeWrapper {

						

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKFallback_LDKSegWitProgram_Body?

						internal init(cType: LDKFallback_LDKSegWitProgram_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
						}

						internal init(cType: LDKFallback_LDKSegWitProgram_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// 
						public func getVersion() -> UInt8 {
							// return value (do some wrapping)
							let returnValue = WitnessVersion(cType: self.cType!.version, anchor: self).getValue()

							return returnValue;
						}
		
						/// 
						public func getProgram() -> [UInt8] {
							// return value (do some wrapping)
							let returnValue = Vec_u8Z(cType: self.cType!.program, anchor: self).getValue()

							return returnValue;
						}
		

						internal func dangle(_ shouldDangle: Bool = true) -> SegWitProgram {
							self.dangling = shouldDangle
							return self
						}

											

					}

					
		

				}

			}
		