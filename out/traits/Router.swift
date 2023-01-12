
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			// necessary for abort() calls
			import Foundation

			/// A trait defining behavior for routing a payment.
			public typealias Router = Bindings.Router

			extension Bindings {

				/// A trait defining behavior for routing a payment.
				open class Router: NativeTraitWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKRouter?

					internal init(cType: LDKRouter) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKRouter, anchor: NativeTypeWrapper) {
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

						

						
						func findRouteLambda(this_arg: UnsafeRawPointer?, payer: LDKPublicKey, route_params: UnsafePointer<LDKRouteParameters>, first_hops: UnsafeMutablePointer<LDKCVec_ChannelDetailsZ>?, inflight_htlcs: LDKInFlightHtlcs) -> LDKCResult_RouteLightningErrorZ {
							let instance: Router = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Router::findRouteLambda")

							// Swift callback variable prep
							
							var first_hopsPointee: [ChannelDetails]? = nil
							if let first_hopsUnwrapped = first_hops {
								first_hopsPointee = Vec_ChannelDetailsZ(cType: first_hopsUnwrapped.pointee).dangle().getValue()
							}
						

							// Swift callback call
							let swiftCallbackResult = instance.findRoute(payer: PublicKey(cType: payer).getValue(), routeParams: RouteParameters(cType: route_params.pointee).dangle().clone(), firstHops: first_hopsPointee, inflightHtlcs: InFlightHtlcs(cType: inflight_htlcs))

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func findRouteWithIdLambda(this_arg: UnsafeRawPointer?, payer: LDKPublicKey, route_params: UnsafePointer<LDKRouteParameters>, first_hops: UnsafeMutablePointer<LDKCVec_ChannelDetailsZ>?, inflight_htlcs: LDKInFlightHtlcs, _payment_hash: LDKThirtyTwoBytes, _payment_id: LDKThirtyTwoBytes) -> LDKCResult_RouteLightningErrorZ {
							let instance: Router = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Router::findRouteWithIdLambda")

							// Swift callback variable prep
							
							var first_hopsPointee: [ChannelDetails]? = nil
							if let first_hopsUnwrapped = first_hops {
								first_hopsPointee = Vec_ChannelDetailsZ(cType: first_hopsUnwrapped.pointee).dangle().getValue()
							}
						

							// Swift callback call
							let swiftCallbackResult = instance.findRouteWithId(payer: PublicKey(cType: payer).getValue(), routeParams: RouteParameters(cType: route_params.pointee).dangle().clone(), firstHops: first_hopsPointee, inflightHtlcs: InFlightHtlcs(cType: inflight_htlcs), PaymentHash: ThirtyTwoBytes(cType: _payment_hash).getValue(), PaymentId: ThirtyTwoBytes(cType: _payment_id).getValue())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func notifyPaymentPathFailedLambda(this_arg: UnsafeRawPointer?, path: LDKCVec_RouteHopZ, short_channel_id: UInt64) -> Void {
							let instance: Router = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Router::notifyPaymentPathFailedLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.notifyPaymentPathFailed(path: Vec_RouteHopZ(cType: path).getValue(), shortChannelId: short_channel_id)

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func notifyPaymentPathSuccessfulLambda(this_arg: UnsafeRawPointer?, path: LDKCVec_RouteHopZ) -> Void {
							let instance: Router = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Router::notifyPaymentPathSuccessfulLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.notifyPaymentPathSuccessful(path: Vec_RouteHopZ(cType: path).getValue())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func notifyPaymentProbeSuccessfulLambda(this_arg: UnsafeRawPointer?, path: LDKCVec_RouteHopZ) -> Void {
							let instance: Router = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Router::notifyPaymentProbeSuccessfulLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.notifyPaymentProbeSuccessful(path: Vec_RouteHopZ(cType: path).getValue())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func notifyPaymentProbeFailedLambda(this_arg: UnsafeRawPointer?, path: LDKCVec_RouteHopZ, short_channel_id: UInt64) -> Void {
							let instance: Router = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Router::notifyPaymentProbeFailedLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.notifyPaymentProbeFailed(path: Vec_RouteHopZ(cType: path).getValue(), shortChannelId: short_channel_id)

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func freeLambda(this_arg: UnsafeMutableRawPointer?) -> Void {
							let instance: Router = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Router::freeLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.free()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		

						self.cType = LDKRouter(							
							this_arg: thisArg,
							find_route: findRouteLambda,
							find_route_with_id: findRouteWithIdLambda,
							notify_payment_path_failed: notifyPaymentPathFailedLambda,
							notify_payment_path_successful: notifyPaymentPathSuccessfulLambda,
							notify_payment_probe_successful: notifyPaymentProbeSuccessfulLambda,
							notify_payment_probe_failed: notifyPaymentProbeFailedLambda,
							free: freeLambda
						)
					}

					
					/// Finds a [`Route`] between `payer` and `payee` for a payment with the given values.
					/// 
					/// Note that first_hops (or a relevant inner pointer) may be NULL or all-0s to represent None
					open func findRoute(payer: [UInt8], routeParams: RouteParameters, firstHops: [ChannelDetails]?, inflightHtlcs: InFlightHtlcs) -> Result_RouteLightningErrorZ {
						
						Bindings.print("Error: Router::findRoute MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Finds a [`Route`] between `payer` and `payee` for a payment with the given values. Includes
					/// `PaymentHash` and `PaymentId` to be able to correlate the request with a specific payment.
					/// 
					/// Note that first_hops (or a relevant inner pointer) may be NULL or all-0s to represent None
					open func findRouteWithId(payer: [UInt8], routeParams: RouteParameters, firstHops: [ChannelDetails]?, inflightHtlcs: InFlightHtlcs, PaymentHash: [UInt8], PaymentId: [UInt8]) -> Result_RouteLightningErrorZ {
						
						Bindings.print("Error: Router::findRouteWithId MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Lets the router know that payment through a specific path has failed.
					open func notifyPaymentPathFailed(path: [RouteHop], shortChannelId: UInt64) -> Void {
						
						Bindings.print("Error: Router::notifyPaymentPathFailed MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Lets the router know that payment through a specific path was successful.
					open func notifyPaymentPathSuccessful(path: [RouteHop]) -> Void {
						
						Bindings.print("Error: Router::notifyPaymentPathSuccessful MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Lets the router know that a payment probe was successful.
					open func notifyPaymentProbeSuccessful(path: [RouteHop]) -> Void {
						
						Bindings.print("Error: Router::notifyPaymentProbeSuccessful MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Lets the router know that a payment probe failed.
					open func notifyPaymentProbeFailed(path: [RouteHop], shortChannelId: UInt64) -> Void {
						
						Bindings.print("Error: Router::notifyPaymentProbeFailed MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
					internal func free() -> Void {
						
				// TODO: figure out something smarter
				return; // the semicolon is necessary because Swift is whitespace-agnostic
			
						Bindings.print("Error: Router::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		

					

					

					internal func dangle(_ shouldDangle: Bool = true) -> Router {
        				self.dangling = shouldDangle
						return self
					}

					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Router \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Router \(self.instanceNumber) due to dangle.")
						}
					}
				}

				internal class NativelyImplementedRouter: Router {
					
					/// Finds a [`Route`] between `payer` and `payee` for a payment with the given values.
					/// 
					/// Note that first_hops (or a relevant inner pointer) may be NULL or all-0s to represent None
					public override func findRoute(payer: [UInt8], routeParams: RouteParameters, firstHops: [ChannelDetails]?, inflightHtlcs: InFlightHtlcs) -> Result_RouteLightningErrorZ {
						// native call variable prep
						
						let payerPrimitiveWrapper = PublicKey(value: payer)
				
					var firstHopsVectorPointer: UnsafeMutablePointer<LDKCVec_ChannelDetailsZ>? = nil
					if let firstHops = firstHops {
						
						let firstHopsVector = Vec_ChannelDetailsZ(array: firstHops)
				
						firstHopsVectorPointer = UnsafeMutablePointer<LDKCVec_ChannelDetailsZ>.allocate(capacity: 1)
						firstHopsVectorPointer!.initialize(to: firstHopsVector.cType!)
					}
				

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: routeParams.cType!) { (routeParamsPointer: UnsafePointer<LDKRouteParameters>) in
				self.cType!.find_route(self.cType!.this_arg, payerPrimitiveWrapper.cType!, routeParamsPointer, firstHopsVectorPointer, inflightHtlcs.dynamicallyDangledClone().cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						payerPrimitiveWrapper.noOpRetain()
				
						// firstHopsVector.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = Result_RouteLightningErrorZ(cType: nativeCallResult)

						return returnValue
					}
		
					/// Finds a [`Route`] between `payer` and `payee` for a payment with the given values. Includes
					/// `PaymentHash` and `PaymentId` to be able to correlate the request with a specific payment.
					/// 
					/// Note that first_hops (or a relevant inner pointer) may be NULL or all-0s to represent None
					public override func findRouteWithId(payer: [UInt8], routeParams: RouteParameters, firstHops: [ChannelDetails]?, inflightHtlcs: InFlightHtlcs, PaymentHash: [UInt8], PaymentId: [UInt8]) -> Result_RouteLightningErrorZ {
						// native call variable prep
						
						let payerPrimitiveWrapper = PublicKey(value: payer)
				
					var firstHopsVectorPointer: UnsafeMutablePointer<LDKCVec_ChannelDetailsZ>? = nil
					if let firstHops = firstHops {
						
						let firstHopsVector = Vec_ChannelDetailsZ(array: firstHops)
				
						firstHopsVectorPointer = UnsafeMutablePointer<LDKCVec_ChannelDetailsZ>.allocate(capacity: 1)
						firstHopsVectorPointer!.initialize(to: firstHopsVector.cType!)
					}
				
						let PaymentHashPrimitiveWrapper = ThirtyTwoBytes(value: PaymentHash)
				
						let PaymentIdPrimitiveWrapper = ThirtyTwoBytes(value: PaymentId)
				

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: routeParams.cType!) { (routeParamsPointer: UnsafePointer<LDKRouteParameters>) in
				self.cType!.find_route_with_id(self.cType!.this_arg, payerPrimitiveWrapper.cType!, routeParamsPointer, firstHopsVectorPointer, inflightHtlcs.dynamicallyDangledClone().cType!, PaymentHashPrimitiveWrapper.cType!, PaymentIdPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						payerPrimitiveWrapper.noOpRetain()
				
						// firstHopsVector.noOpRetain()
				
						// for elided types, we need this
						PaymentHashPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						PaymentIdPrimitiveWrapper.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = Result_RouteLightningErrorZ(cType: nativeCallResult)

						return returnValue
					}
		
					/// Lets the router know that payment through a specific path has failed.
					public override func notifyPaymentPathFailed(path: [RouteHop], shortChannelId: UInt64) {
						// native call variable prep
						
						let pathVector = Vec_RouteHopZ(array: path).dangle()
				

						

						// native method call
						let nativeCallResult = self.cType!.notify_payment_path_failed(self.cType!.this_arg, pathVector.cType!, shortChannelId)

						// cleanup
						
						// pathVector.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Lets the router know that payment through a specific path was successful.
					public override func notifyPaymentPathSuccessful(path: [RouteHop]) {
						// native call variable prep
						
						let pathVector = Vec_RouteHopZ(array: path).dangle()
				

						

						// native method call
						let nativeCallResult = self.cType!.notify_payment_path_successful(self.cType!.this_arg, pathVector.cType!)

						// cleanup
						
						// pathVector.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Lets the router know that a payment probe was successful.
					public override func notifyPaymentProbeSuccessful(path: [RouteHop]) {
						// native call variable prep
						
						let pathVector = Vec_RouteHopZ(array: path).dangle()
				

						

						// native method call
						let nativeCallResult = self.cType!.notify_payment_probe_successful(self.cType!.this_arg, pathVector.cType!)

						// cleanup
						
						// pathVector.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Lets the router know that a payment probe failed.
					public override func notifyPaymentProbeFailed(path: [RouteHop], shortChannelId: UInt64) {
						// native call variable prep
						
						let pathVector = Vec_RouteHopZ(array: path).dangle()
				

						

						// native method call
						let nativeCallResult = self.cType!.notify_payment_probe_failed(self.cType!.this_arg, pathVector.cType!, shortChannelId)

						// cleanup
						
						// pathVector.noOpRetain()
				

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
		