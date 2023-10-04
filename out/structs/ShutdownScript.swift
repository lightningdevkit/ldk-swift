
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A script pubkey for shutting down a channel as defined by [BOLT #2].
			/// 
			/// [BOLT #2]: https://github.com/lightning/bolts/blob/master/02-peer-protocol.md
			public typealias ShutdownScript = Bindings.ShutdownScript

			extension Bindings {
		

				/// A script pubkey for shutting down a channel as defined by [BOLT #2].
				/// 
				/// [BOLT #2]: https://github.com/lightning/bolts/blob/master/02-peer-protocol.md
				public class ShutdownScript: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					/// Set to false to suppress an individual type's deinit log statements.
					/// Only applicable when log threshold is set to `.Debug`.
					public static var enableDeinitLogging = true

					/// Set to true to suspend the freeing of this type's associated Rust memory.
					/// Should only ever be used for debugging purposes, and will likely be
					/// deprecated soon.
					public static var suspendFreedom = false

					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKShutdownScript?

					internal init(cType: LDKShutdownScript, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKShutdownScript, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKShutdownScript, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the ShutdownScript, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ShutdownScript_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the ShutdownScript
					internal func clone() -> ShutdownScript {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKShutdownScript>) in
				ShutdownScript_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ShutdownScript(cType: nativeCallResult, instantiationContext: "ShutdownScript.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Checks if two ShutdownScripts contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public class func eq(a: ShutdownScript, b: ShutdownScript) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKShutdownScript>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKShutdownScript>) in
				ShutdownScript_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Serialize the ShutdownScript object into a byte array which can be read by ShutdownScript_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKShutdownScript>) in
				ShutdownScript_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, instantiationContext: "ShutdownScript.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a ShutdownScript from a byte array, created by ShutdownScript_write
					public class func read(ser: [UInt8]) -> Result_ShutdownScriptDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser, instantiationContext: "ShutdownScript.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = ShutdownScript_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_ShutdownScriptDecodeErrorZ(cType: nativeCallResult, instantiationContext: "ShutdownScript.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Generates a P2WPKH script pubkey from the given [`WPubkeyHash`].
					public class func initWithP2wpkh(pubkeyHash: [UInt8]) -> ShutdownScript {
						// native call variable prep
						
						let tupledPubkeyHash = Bindings.arrayToUInt8Tuple20(array: pubkeyHash)
					

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: tupledPubkeyHash) { (tupledPubkeyHashPointer: UnsafePointer<UInt8Tuple20>) in
				ShutdownScript_new_p2wpkh(tupledPubkeyHashPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ShutdownScript(cType: nativeCallResult, instantiationContext: "ShutdownScript.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Generates a P2WSH script pubkey from the given [`WScriptHash`].
					public class func initWithP2wsh(scriptHash: [UInt8]) -> ShutdownScript {
						// native call variable prep
						
						let tupledScriptHash = Bindings.arrayToUInt8Tuple32(array: scriptHash)
					

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: tupledScriptHash) { (tupledScriptHashPointer: UnsafePointer<UInt8Tuple32>) in
				ShutdownScript_new_p2wsh(tupledScriptHashPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ShutdownScript(cType: nativeCallResult, instantiationContext: "ShutdownScript.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Generates a witness script pubkey from the given segwit version and program.
					/// 
					/// Note for version-zero witness scripts you must use [`ShutdownScript::new_p2wpkh`] or
					/// [`ShutdownScript::new_p2wsh`] instead.
					/// 
					/// # Errors
					/// 
					/// This function may return an error if `program` is invalid for the segwit `version`.
					public class func newWitnessProgram(version: UInt8, program: [UInt8]) -> Result_ShutdownScriptInvalidShutdownScriptZ {
						// native call variable prep
						
						let versionPrimitiveWrapper = WitnessVersion(value: version, instantiationContext: "ShutdownScript.swift::\(#function):\(#line)")
				
						let programPrimitiveWrapper = u8slice(value: program, instantiationContext: "ShutdownScript.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = ShutdownScript_new_witness_program(versionPrimitiveWrapper.cType!, programPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						versionPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						programPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_ShutdownScriptInvalidShutdownScriptZ(cType: nativeCallResult, instantiationContext: "ShutdownScript.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Converts the shutdown script into the underlying [`Script`].
					public func intoInner() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ShutdownScript_into_inner(self.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, instantiationContext: "ShutdownScript.swift::\(#function):\(#line)").getValue()
						

						return returnValue
					}
		
					/// Returns the [`PublicKey`] used for a P2WPKH shutdown script if constructed directly from it.
					/// 
					/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func asLegacyPubkey() -> [UInt8]? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKShutdownScript>) in
				ShutdownScript_as_legacy_pubkey(thisArgPointer)
						}
				

						// cleanup
						
				// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
				// Type group: RustPrimitiveWrapper
				// Type: LDKPublicKey
			
						if nativeCallResult.compressed_form == Bindings.arrayToUInt8Tuple33(array: [UInt8](repeating: 0, count: 33)) {
							return nil
            			}
					

						
						// return value (do some wrapping)
						let returnValue = PublicKey(cType: nativeCallResult, instantiationContext: "ShutdownScript.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Returns whether the shutdown script is compatible with the features as defined by BOLT #2.
					/// 
					/// Specifically, checks for compliance with feature `option_shutdown_anysegwit`.
					public func isCompatible(features: InitFeatures) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKShutdownScript>) in
				
						withUnsafePointer(to: features.cType!) { (featuresPointer: UnsafePointer<LDKInitFeatures>) in
				ShutdownScript_is_compatible(thisArgPointer, featuresPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					
					/// Indicates that this is the only struct which contains the same pointer.
					/// Rust functions which take ownership of an object provided via an argument require
					/// this to be true and invalidate the object pointed to by inner.
					public func isOwned() -> Bool {
						// return value (do some wrapping)
						let returnValue = self.cType!.is_owned

						return returnValue;
					}
		

					
					internal func danglingClone() -> ShutdownScript {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> ShutdownScript {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> ShutdownScript {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> ShutdownScript {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing ShutdownScript \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing ShutdownScript \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

				}

				
			}
		
		