
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// An error occurring when converting from [`Script`] to [`ShutdownScript`].
			public typealias InvalidShutdownScript = Bindings.InvalidShutdownScript

			extension Bindings {
		

				/// An error occurring when converting from [`Script`] to [`ShutdownScript`].
				public class InvalidShutdownScript: NativeTypeWrapper {

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

					internal var cType: LDKInvalidShutdownScript?

					internal init(cType: LDKInvalidShutdownScript, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKInvalidShutdownScript, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKInvalidShutdownScript, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the InvalidShutdownScript, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = InvalidShutdownScript_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The script that did not meet the requirements from [BOLT #2].
					/// 
					/// [BOLT #2]: https://github.com/lightning/bolts/blob/master/02-peer-protocol.md
					public func getScript() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKInvalidShutdownScript>) in
				InvalidShutdownScript_get_script(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = u8slice(cType: nativeCallResult, instantiationContext: "InvalidShutdownScript.swift::\(#function):\(#line)", anchor: self).dangle().getValue()
						

						return returnValue
					}
		
					/// The script that did not meet the requirements from [BOLT #2].
					/// 
					/// [BOLT #2]: https://github.com/lightning/bolts/blob/master/02-peer-protocol.md
					public func setScript(val: [UInt8]) {
						// native call variable prep
						
						let valVector = Vec_u8Z(array: val, instantiationContext: "InvalidShutdownScript.swift::\(#function):\(#line)").dangle()
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKInvalidShutdownScript>) in
				InvalidShutdownScript_set_script(thisPtrPointer, valVector.cType!)
						}
				

						// cleanup
						
						// valVector.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new InvalidShutdownScript given each field
					public init(scriptArg: [UInt8]) {
						// native call variable prep
						
						let scriptArgVector = Vec_u8Z(array: scriptArg, instantiationContext: "InvalidShutdownScript.swift::\(#function):\(#line)").dangle()
				

						// native method call
						let nativeCallResult = InvalidShutdownScript_new(scriptArgVector.cType!)

						// cleanup
						
						// scriptArgVector.noOpRetain()
				
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = InvalidShutdownScript(cType: nativeCallResult, instantiationContext: "InvalidShutdownScript.swift::\(#function):\(#line)")
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0, instantiationContext: "InvalidShutdownScript.swift::\(#function):\(#line)")
				
			
					}
		
					/// Creates a copy of the InvalidShutdownScript
					internal func clone() -> InvalidShutdownScript {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKInvalidShutdownScript>) in
				InvalidShutdownScript_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = InvalidShutdownScript(cType: nativeCallResult, instantiationContext: "InvalidShutdownScript.swift::\(#function):\(#line)")
						

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> InvalidShutdownScript {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> InvalidShutdownScript {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> InvalidShutdownScript {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> InvalidShutdownScript {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> InvalidShutdownScript {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing InvalidShutdownScript \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing InvalidShutdownScript \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

				}

				
			}
		
		