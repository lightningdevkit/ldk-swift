
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Data to construct a [`BlindedHop`] for receiving a payment. This payload is custom to LDK and
			/// may not be valid if received by another lightning implementation.
			public typealias ReceiveTlvs = Bindings.ReceiveTlvs

			extension Bindings {
		

				/// Data to construct a [`BlindedHop`] for receiving a payment. This payload is custom to LDK and
				/// may not be valid if received by another lightning implementation.
				public class ReceiveTlvs: NativeTypeWrapper {

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

					internal var cType: LDKReceiveTlvs?

					internal init(cType: LDKReceiveTlvs, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKReceiveTlvs, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKReceiveTlvs, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the ReceiveTlvs, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ReceiveTlvs_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Used to authenticate the sender of a payment to the receiver and tie MPP HTLCs together.
					public func getPaymentSecret() -> [UInt8]? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKReceiveTlvs>) in
				ReceiveTlvs_get_payment_secret(thisPtrPointer)
						}
				

						// cleanup
						
						guard let nativeCallResult = nativeCallResult else {
							return nil
						}
			

						
						// return value (do some wrapping)
						let returnValue = Bindings.UInt8Tuple32ToArray(tuple: nativeCallResult.pointee)
						

						return returnValue
					}
		
					/// Used to authenticate the sender of a payment to the receiver and tie MPP HTLCs together.
					public func setPaymentSecret(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = ThirtyTwoBytes(value: val, instantiationContext: "ReceiveTlvs.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKReceiveTlvs>) in
				ReceiveTlvs_set_payment_secret(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constraints for the receiver of this payment.
					public func getPaymentConstraints() -> PaymentConstraints {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKReceiveTlvs>) in
				ReceiveTlvs_get_payment_constraints(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = PaymentConstraints(cType: nativeCallResult, instantiationContext: "ReceiveTlvs.swift::\(#function):\(#line)", anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// Constraints for the receiver of this payment.
					public func setPaymentConstraints(val: PaymentConstraints) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKReceiveTlvs>) in
				ReceiveTlvs_set_payment_constraints(thisPtrPointer, val.dynamicallyDangledClone().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new ReceiveTlvs given each field
					public init(paymentSecretArg: [UInt8], paymentConstraintsArg: PaymentConstraints) {
						// native call variable prep
						
						let paymentSecretArgPrimitiveWrapper = ThirtyTwoBytes(value: paymentSecretArg, instantiationContext: "ReceiveTlvs.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = ReceiveTlvs_new(paymentSecretArgPrimitiveWrapper.cType!, paymentConstraintsArg.dynamicallyDangledClone().cType!)

						// cleanup
						
						// for elided types, we need this
						paymentSecretArgPrimitiveWrapper.noOpRetain()
				
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = ReceiveTlvs(cType: nativeCallResult, instantiationContext: "ReceiveTlvs.swift::\(#function):\(#line)")
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0, instantiationContext: "ReceiveTlvs.swift::\(#function):\(#line)")
				
			
					}
		
					/// Creates a copy of the ReceiveTlvs
					internal func clone() -> ReceiveTlvs {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKReceiveTlvs>) in
				ReceiveTlvs_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ReceiveTlvs(cType: nativeCallResult, instantiationContext: "ReceiveTlvs.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Serialize the ReceiveTlvs object into a byte array which can be read by ReceiveTlvs_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKReceiveTlvs>) in
				ReceiveTlvs_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, instantiationContext: "ReceiveTlvs.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a ReceiveTlvs from a byte array, created by ReceiveTlvs_write
					public class func read(ser: [UInt8]) -> Result_ReceiveTlvsDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser, instantiationContext: "ReceiveTlvs.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = ReceiveTlvs_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_ReceiveTlvsDecodeErrorZ(cType: nativeCallResult, instantiationContext: "ReceiveTlvs.swift::\(#function):\(#line)")
						

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
		

					
					internal func danglingClone() -> ReceiveTlvs {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> ReceiveTlvs {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> ReceiveTlvs {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> ReceiveTlvs {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing ReceiveTlvs \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing ReceiveTlvs \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

				}

				
			}
		
		