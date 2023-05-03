
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A route directs a payment from the sender (us) to the recipient. If the recipient supports MPP,
			/// it can take multiple paths. Each path is composed of one or more hops through the network.
			public typealias Route = Bindings.Route

			extension Bindings {
		

				/// A route directs a payment from the sender (us) to the recipient. If the recipient supports MPP,
				/// it can take multiple paths. Each path is composed of one or more hops through the network.
				public class Route: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKRoute?

					internal init(cType: LDKRoute, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKRoute, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the Route, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Route_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The list of routes taken for a single (potentially-)multi-part payment. The pubkey of the
					/// last RouteHop in each path must be the same. Each entry represents a list of hops, NOT
					/// INCLUDING our own, where the last hop is the destination. Thus, this must always be at
					/// least length one. While the maximum length of any given path is variable, keeping the length
					/// of any path less or equal to 19 should currently ensure it is viable.
					public func getPaths() -> [[RouteHop]] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKRoute>) in
				Route_get_paths(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_CVec_RouteHopZZ(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// The list of routes taken for a single (potentially-)multi-part payment. The pubkey of the
					/// last RouteHop in each path must be the same. Each entry represents a list of hops, NOT
					/// INCLUDING our own, where the last hop is the destination. Thus, this must always be at
					/// least length one. While the maximum length of any given path is variable, keeping the length
					/// of any path less or equal to 19 should currently ensure it is viable.
					public func setPaths(val: [[RouteHop]]) {
						// native call variable prep
						
						let valVector = Vec_CVec_RouteHopZZ(array: val).dangle()
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKRoute>) in
				Route_set_paths(thisPtrPointer, valVector.cType!)
						}
				

						// cleanup
						
						// valVector.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The `payment_params` parameter passed to [`find_route`].
					/// This is used by `ChannelManager` to track information which may be required for retries,
					/// provided back to you via [`Event::PaymentPathFailed`].
					/// 
					/// [`Event::PaymentPathFailed`]: crate::util::events::Event::PaymentPathFailed
					/// 
					/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func getPaymentParams() -> PaymentParameters? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKRoute>) in
				Route_get_payment_params(thisPtrPointer)
						}
				

						// cleanup
						
				// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
				// Type group: RustStruct
				// Type: LDKPaymentParameters
			
					if nativeCallResult.inner == nil {
						return nil
					}

					let pointerValue = UInt(bitPattern: nativeCallResult.inner)
					if pointerValue == 0 {
						return nil
					}
				

						
						// return value (do some wrapping)
						let returnValue = PaymentParameters(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)", anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// The `payment_params` parameter passed to [`find_route`].
					/// This is used by `ChannelManager` to track information which may be required for retries,
					/// provided back to you via [`Event::PaymentPathFailed`].
					/// 
					/// [`Event::PaymentPathFailed`]: crate::util::events::Event::PaymentPathFailed
					/// 
					/// Note that val (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func setPaymentParams(val: PaymentParameters) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKRoute>) in
				Route_set_payment_params(thisPtrPointer, val.dynamicallyDangledClone().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new Route given each field
					public init(pathsArg: [[RouteHop]], paymentParamsArg: PaymentParameters) {
						// native call variable prep
						
						let pathsArgVector = Vec_CVec_RouteHopZZ(array: pathsArg).dangle()
				

						// native method call
						let nativeCallResult = Route_new(pathsArgVector.cType!, paymentParamsArg.dynamicallyDangledClone().cType!)

						// cleanup
						
						// pathsArgVector.noOpRetain()
				
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = Route(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)")
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0, instantiationContext: "#{swift_class_name}::\(#function):\(#line)")
				
			
					}
		
					/// Creates a copy of the Route
					internal func clone() -> Route {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKRoute>) in
				Route_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Route(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Checks if two Routes contain equal inner contents.
					public func hash() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKRoute>) in
				Route_hash(oPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if two Routes contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public class func eq(a: Route, b: Route) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKRoute>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKRoute>) in
				Route_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Returns the total amount of fees paid on this [`Route`].
					/// 
					/// This doesn't include any extra payment made to the recipient, which can happen in excess of
					/// the amount passed to [`find_route`]'s `params.final_value_msat`.
					public func getTotalFees() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRoute>) in
				Route_get_total_fees(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Returns the total amount paid on this [`Route`], excluding the fees.
					public func getTotalAmount() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKRoute>) in
				Route_get_total_amount(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Serialize the Route object into a byte array which can be read by Route_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKRoute>) in
				Route_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a Route from a byte array, created by Route_write
					public class func read(ser: [UInt8]) -> Result_RouteDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = Route_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_RouteDecodeErrorZ(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)")
						

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> Route {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Route {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> Route {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> Route {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> Route {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Route \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Route \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		