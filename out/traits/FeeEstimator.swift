
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			// necessary for abort() calls
			import Foundation

			/// A trait which should be implemented to provide feerate information on a number of time
			/// horizons.
			/// 
			/// Note that all of the functions implemented here *must* be reentrant-safe (obviously - they're
			/// called from inside the library in response to chain events, P2P events, or timer events).
			public typealias FeeEstimator = Bindings.FeeEstimator

			extension Bindings {

				/// A trait which should be implemented to provide feerate information on a number of time
				/// horizons.
				/// 
				/// Note that all of the functions implemented here *must* be reentrant-safe (obviously - they're
				/// called from inside the library in response to chain events, P2P events, or timer events).
				open class FeeEstimator: NativeTraitWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKFeeEstimator?

					internal init(cType: LDKFeeEstimator) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKFeeEstimator, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init() {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						super.init(conflictAvoidingVariableName: 0)

						let thisArg = Bindings.instanceToPointer(instance: self)

						

						
						func getEstSatPer1000WeightLambda(this_arg: UnsafeRawPointer?, confirmation_target: LDKConfirmationTarget) -> UInt32 {
							let instance: FeeEstimator = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "FeeEstimator::getEstSatPer1000WeightLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.getEstSatPer1000Weight(confirmationTarget: ConfirmationTarget(value: confirmation_target))

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func freeLambda(this_arg: UnsafeMutableRawPointer?) -> Void {
							let instance: FeeEstimator = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "FeeEstimator::freeLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.free()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		

						self.cType = LDKFeeEstimator(							
							this_arg: thisArg,
							get_est_sat_per_1000_weight: getEstSatPer1000WeightLambda,
							free: freeLambda
						)
					}

					
					/// Gets estimated satoshis of fee required per 1000 Weight-Units.
					/// 
					/// LDK will wrap this method and ensure that the value returned is no smaller than 253
					/// (ie 1 satoshi-per-byte rounded up to ensure later round-downs don't put us below 1 satoshi-per-byte).
					/// 
					/// The following unit conversions can be used to convert to sats/KW:
					/// * satoshis-per-byte * 250
					/// * satoshis-per-kbyte / 4
					open func getEstSatPer1000Weight(confirmationTarget: ConfirmationTarget) -> UInt32 {
						
						Bindings.print("Error: FeeEstimator::getEstSatPer1000Weight MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
					internal func free() -> Void {
						
				// TODO: figure out something smarter
				return; // the semicolon is necessary because Swift is whitespace-agnostic
			
						Bindings.print("Error: FeeEstimator::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		

					

					

					internal func dangle(_ shouldDangle: Bool = true) -> FeeEstimator {
        				self.dangling = shouldDangle
						return self
					}

					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing FeeEstimator \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing FeeEstimator \(self.instanceNumber) due to dangle.")
						}
					}
				}

				internal class NativelyImplementedFeeEstimator: FeeEstimator {
					
					/// Gets estimated satoshis of fee required per 1000 Weight-Units.
					/// 
					/// LDK will wrap this method and ensure that the value returned is no smaller than 253
					/// (ie 1 satoshi-per-byte rounded up to ensure later round-downs don't put us below 1 satoshi-per-byte).
					/// 
					/// The following unit conversions can be used to convert to sats/KW:
					/// * satoshis-per-byte * 250
					/// * satoshis-per-kbyte / 4
					public override func getEstSatPer1000Weight(confirmationTarget: ConfirmationTarget) -> UInt32 {
						// native call variable prep
						

						

						// native method call
						let nativeCallResult = self.cType!.get_est_sat_per_1000_weight(self.cType!.this_arg, confirmationTarget.getCValue())

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
					public override func free() {
						// native call variable prep
						

						
				// natively wrapped traits may not necessarily be properly initialized
				// for now just don't free these things
				// self.cType?.free(self.cType?.this_arg)
				return;
			

						// native method call
						let nativeCallResult = self.cType!.free(self.cType!.this_arg)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
				}

			}
		