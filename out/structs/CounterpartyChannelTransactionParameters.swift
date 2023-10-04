
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Late-bound per-channel counterparty data used to build transactions.
			public typealias CounterpartyChannelTransactionParameters = Bindings.CounterpartyChannelTransactionParameters

			extension Bindings {
		

				/// Late-bound per-channel counterparty data used to build transactions.
				public class CounterpartyChannelTransactionParameters: NativeTypeWrapper {

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

					internal var cType: LDKCounterpartyChannelTransactionParameters?

					internal init(cType: LDKCounterpartyChannelTransactionParameters, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCounterpartyChannelTransactionParameters, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKCounterpartyChannelTransactionParameters, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the CounterpartyChannelTransactionParameters, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CounterpartyChannelTransactionParameters_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Counter-party public keys
					public func getPubkeys() -> ChannelPublicKeys {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCounterpartyChannelTransactionParameters>) in
				CounterpartyChannelTransactionParameters_get_pubkeys(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ChannelPublicKeys(cType: nativeCallResult, instantiationContext: "CounterpartyChannelTransactionParameters.swift::\(#function):\(#line)", anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// Counter-party public keys
					public func setPubkeys(val: ChannelPublicKeys) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKCounterpartyChannelTransactionParameters>) in
				CounterpartyChannelTransactionParameters_set_pubkeys(thisPtrPointer, val.dynamicallyDangledClone().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The contest delay selected by the counterparty, which applies to holder-broadcast transactions
					public func getSelectedContestDelay() -> UInt16 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCounterpartyChannelTransactionParameters>) in
				CounterpartyChannelTransactionParameters_get_selected_contest_delay(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The contest delay selected by the counterparty, which applies to holder-broadcast transactions
					public func setSelectedContestDelay(val: UInt16) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKCounterpartyChannelTransactionParameters>) in
				CounterpartyChannelTransactionParameters_set_selected_contest_delay(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new CounterpartyChannelTransactionParameters given each field
					public init(pubkeysArg: ChannelPublicKeys, selectedContestDelayArg: UInt16) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CounterpartyChannelTransactionParameters_new(pubkeysArg.dynamicallyDangledClone().cType!, selectedContestDelayArg)

						// cleanup
						
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = CounterpartyChannelTransactionParameters(cType: nativeCallResult, instantiationContext: "CounterpartyChannelTransactionParameters.swift::\(#function):\(#line)")
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0, instantiationContext: "CounterpartyChannelTransactionParameters.swift::\(#function):\(#line)")
				
			
					}
		
					/// Creates a copy of the CounterpartyChannelTransactionParameters
					internal func clone() -> CounterpartyChannelTransactionParameters {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCounterpartyChannelTransactionParameters>) in
				CounterpartyChannelTransactionParameters_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = CounterpartyChannelTransactionParameters(cType: nativeCallResult, instantiationContext: "CounterpartyChannelTransactionParameters.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Generates a non-cryptographic 64-bit hash of the CounterpartyChannelTransactionParameters.
					public func hash() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKCounterpartyChannelTransactionParameters>) in
				CounterpartyChannelTransactionParameters_hash(oPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if two CounterpartyChannelTransactionParameterss contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public class func eq(a: CounterpartyChannelTransactionParameters, b: CounterpartyChannelTransactionParameters) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKCounterpartyChannelTransactionParameters>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKCounterpartyChannelTransactionParameters>) in
				CounterpartyChannelTransactionParameters_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Serialize the CounterpartyChannelTransactionParameters object into a byte array which can be read by CounterpartyChannelTransactionParameters_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKCounterpartyChannelTransactionParameters>) in
				CounterpartyChannelTransactionParameters_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, instantiationContext: "CounterpartyChannelTransactionParameters.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a CounterpartyChannelTransactionParameters from a byte array, created by CounterpartyChannelTransactionParameters_write
					public class func read(ser: [UInt8]) -> Result_CounterpartyChannelTransactionParametersDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser, instantiationContext: "CounterpartyChannelTransactionParameters.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = CounterpartyChannelTransactionParameters_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_CounterpartyChannelTransactionParametersDecodeErrorZ(cType: nativeCallResult, instantiationContext: "CounterpartyChannelTransactionParameters.swift::\(#function):\(#line)")
						

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
		

					
					internal func danglingClone() -> CounterpartyChannelTransactionParameters {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> CounterpartyChannelTransactionParameters {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> CounterpartyChannelTransactionParameters {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> CounterpartyChannelTransactionParameters {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing CounterpartyChannelTransactionParameters \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing CounterpartyChannelTransactionParameters \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

				}

				
			}
		
		