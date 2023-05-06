
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Parameters needed to find a [`Route`].
			/// 
			/// Passed to [`find_route`] and [`build_route_from_hops`], but also provided in
			/// [`Event::PaymentPathFailed`].
			/// 
			/// [`Event::PaymentPathFailed`]: crate::util::events::Event::PaymentPathFailed
			public typealias RouteParameters = Bindings.RouteParameters

			extension Bindings {
		

				/// Parameters needed to find a [`Route`].
				/// 
				/// Passed to [`find_route`] and [`build_route_from_hops`], but also provided in
				/// [`Event::PaymentPathFailed`].
				/// 
				/// [`Event::PaymentPathFailed`]: crate::util::events::Event::PaymentPathFailed
				public class RouteParameters: NativeTypeWrapper {

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

					internal var cType: LDKRouteParameters?

					internal init(cType: LDKRouteParameters, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKRouteParameters, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKRouteParameters, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the RouteParameters, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = RouteParameters_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The parameters of the failed payment path.
					public func getPaymentParams() -> PaymentParameters {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKRouteParameters>) in
				RouteParameters_get_payment_params(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = PaymentParameters(cType: nativeCallResult, instantiationContext: "RouteParameters.swift::\(#function):\(#line)", anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// The parameters of the failed payment path.
					public func setPaymentParams(val: PaymentParameters) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKRouteParameters>) in
				RouteParameters_set_payment_params(thisPtrPointer, val.dynamicallyDangledClone().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The amount in msats sent on the failed payment path.
					public func getFinalValueMsat() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKRouteParameters>) in
				RouteParameters_get_final_value_msat(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The amount in msats sent on the failed payment path.
					public func setFinalValueMsat(val: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKRouteParameters>) in
				RouteParameters_set_final_value_msat(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new RouteParameters given each field
					public init(paymentParamsArg: PaymentParameters, finalValueMsatArg: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = RouteParameters_new(paymentParamsArg.dynamicallyDangledClone().cType!, finalValueMsatArg)

						// cleanup
						
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = RouteParameters(cType: nativeCallResult, instantiationContext: "RouteParameters.swift::\(#function):\(#line)")
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0, instantiationContext: "RouteParameters.swift::\(#function):\(#line)")
				
			
					}
		
					/// Creates a copy of the RouteParameters
					internal func clone() -> RouteParameters {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKRouteParameters>) in
				RouteParameters_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = RouteParameters(cType: nativeCallResult, instantiationContext: "RouteParameters.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Checks if two RouteParameterss contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public class func eq(a: RouteParameters, b: RouteParameters) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKRouteParameters>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKRouteParameters>) in
				RouteParameters_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Serialize the RouteParameters object into a byte array which can be read by RouteParameters_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKRouteParameters>) in
				RouteParameters_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, instantiationContext: "RouteParameters.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a RouteParameters from a byte array, created by RouteParameters_write
					public class func read(ser: [UInt8]) -> Result_RouteParametersDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser, instantiationContext: "RouteParameters.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = RouteParameters_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_RouteParametersDecodeErrorZ(cType: nativeCallResult, instantiationContext: "RouteParameters.swift::\(#function):\(#line)")
						

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> RouteParameters {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> RouteParameters {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> RouteParameters {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> RouteParameters {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> RouteParameters {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing RouteParameters \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing RouteParameters \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

				}

				
			}
		
		