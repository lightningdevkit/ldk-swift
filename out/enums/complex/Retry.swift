
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			/// 
			public typealias Retry = Bindings.Retry

			extension Bindings {

				/// Strategies available to retry payment path failures.
				public class Retry: NativeTypeWrapper {

					
					public static var enableDeinitLogging = true
					public static var suspendFreedom = false
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKRetry?

					internal init(cType: LDKRetry, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKRetry, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public enum RetryType {
						
						/// Max number of attempts to retry payment.
						/// 
						/// Each attempt may be multiple HTLCs along multiple paths if the router decides to split up a
						/// retry, and may retry multiple failed HTLCs at once if they failed around the same time and
						/// were retried along a route from a single call to [`Router::find_route_with_id`].
						case Attempts
			
						/// Time elapsed before abandoning retries for a payment. At least one attempt at payment is made;
						/// see [`PaymentParameters::expiry_time`] to avoid any attempt at payment after a specific time.
						/// 
						/// [`PaymentParameters::expiry_time`]: crate::routing::router::PaymentParameters::expiry_time
						case Timeout
			
					}

					public func getValueType() -> RetryType {
						switch self.cType!.tag {
							case LDKRetry_Attempts:
								return .Attempts
			
							case LDKRetry_Timeout:
								return .Timeout
			
							default:
								Bindings.print("Error: Invalid value type for Retry! Aborting.", severity: .ERROR)
								abort()
						}
		
					}

					
					/// Frees any resources used by the Retry
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Retry_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the Retry
					internal func clone() -> Retry {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKRetry>) in
				Retry_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Retry(cType: nativeCallResult, instantiationContext: "Retry.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new Attempts-variant Retry
					public class func initWithAttempts(a: UInt) -> Retry {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Retry_attempts(a)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Retry(cType: nativeCallResult, instantiationContext: "Retry.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new Timeout-variant Retry
					public class func initWithTimeout(a: UInt64) -> Retry {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Retry_timeout(a)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Retry(cType: nativeCallResult, instantiationContext: "Retry.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Checks if two Retrys contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					public class func eq(a: Retry, b: Retry) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKRetry>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKRetry>) in
				Retry_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if two Retrys contain equal inner contents.
					public func hash() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKRetry>) in
				Retry_hash(oPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					
					public func getValueAsAttempts() -> UInt? {
						if self.cType?.tag != LDKRetry_Attempts {
							return nil
						}

						return self.cType!.attempts
					}
			
					public func getValueAsTimeout() -> UInt64? {
						if self.cType?.tag != LDKRetry_Timeout {
							return nil
						}

						return self.cType!.timeout
					}
			

					internal func dangle(_ shouldDangle: Bool = true) -> Retry {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Retry {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing Retry \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing Retry \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

					

				}

			}
		