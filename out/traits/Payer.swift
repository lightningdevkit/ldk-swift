
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			// necessary for abort() calls
			import Foundation

			/// A trait defining behavior of an [`Invoice`] payer.
			/// 
			/// While the behavior of [`InvoicePayer`] provides idempotency of duplicate `send_*payment` calls
			/// with the same [`PaymentHash`], it is up to the `Payer` to provide idempotency across restarts.
			/// 
			/// [`ChannelManager`] provides idempotency for duplicate payments with the same [`PaymentId`].
			/// 
			/// In order to trivially ensure idempotency for payments, the default `Payer` implementation
			/// reuses the [`PaymentHash`] bytes as the [`PaymentId`]. Custom implementations wishing to
			/// provide payment idempotency with a different idempotency key (i.e. [`PaymentId`]) should map
			/// the [`Invoice`] or spontaneous payment target pubkey to their own idempotency key.
			/// 
			/// [`ChannelManager`]: lightning::ln::channelmanager::ChannelManager
			public typealias Payer = Bindings.Payer

			extension Bindings {

				/// A trait defining behavior of an [`Invoice`] payer.
				/// 
				/// While the behavior of [`InvoicePayer`] provides idempotency of duplicate `send_*payment` calls
				/// with the same [`PaymentHash`], it is up to the `Payer` to provide idempotency across restarts.
				/// 
				/// [`ChannelManager`] provides idempotency for duplicate payments with the same [`PaymentId`].
				/// 
				/// In order to trivially ensure idempotency for payments, the default `Payer` implementation
				/// reuses the [`PaymentHash`] bytes as the [`PaymentId`]. Custom implementations wishing to
				/// provide payment idempotency with a different idempotency key (i.e. [`PaymentId`]) should map
				/// the [`Invoice`] or spontaneous payment target pubkey to their own idempotency key.
				/// 
				/// [`ChannelManager`]: lightning::ln::channelmanager::ChannelManager
				open class Payer: NativeTraitWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKPayer?

					internal init(cType: LDKPayer) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKPayer, anchor: NativeTypeWrapper) {
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

						

						
						func nodeIdLambda(this_arg: UnsafeRawPointer?) -> LDKPublicKey {
							let instance: Payer = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Payer::nodeIdLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.nodeId()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = PublicKey(value: swiftCallbackResult).dangle().cType!

							return returnValue
						}
		
						func firstHopsLambda(this_arg: UnsafeRawPointer?) -> LDKCVec_ChannelDetailsZ {
							let instance: Payer = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Payer::firstHopsLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.firstHops()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = Vec_ChannelDetailsZ(array: swiftCallbackResult).dangle().cType!

							return returnValue
						}
		
						func sendPaymentLambda(this_arg: UnsafeRawPointer?, route: UnsafePointer<LDKRoute>, payment_hash: LDKThirtyTwoBytes, payment_secret: LDKThirtyTwoBytes, payment_id: LDKThirtyTwoBytes) -> LDKCResult_NonePaymentSendFailureZ {
							let instance: Payer = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Payer::sendPaymentLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.sendPayment(route: Route(cType: route.pointee).dangle().clone(), paymentHash: ThirtyTwoBytes(cType: payment_hash).getValue(), paymentSecret: ThirtyTwoBytes(cType: payment_secret).getValue(), paymentId: ThirtyTwoBytes(cType: payment_id).getValue())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func sendSpontaneousPaymentLambda(this_arg: UnsafeRawPointer?, route: UnsafePointer<LDKRoute>, payment_preimage: LDKThirtyTwoBytes, payment_id: LDKThirtyTwoBytes) -> LDKCResult_NonePaymentSendFailureZ {
							let instance: Payer = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Payer::sendSpontaneousPaymentLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.sendSpontaneousPayment(route: Route(cType: route.pointee).dangle().clone(), paymentPreimage: ThirtyTwoBytes(cType: payment_preimage).getValue(), paymentId: ThirtyTwoBytes(cType: payment_id).getValue())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func retryPaymentLambda(this_arg: UnsafeRawPointer?, route: UnsafePointer<LDKRoute>, payment_id: LDKThirtyTwoBytes) -> LDKCResult_NonePaymentSendFailureZ {
							let instance: Payer = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Payer::retryPaymentLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.retryPayment(route: Route(cType: route.pointee).dangle().clone(), paymentId: ThirtyTwoBytes(cType: payment_id).getValue())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func abandonPaymentLambda(this_arg: UnsafeRawPointer?, payment_id: LDKThirtyTwoBytes) -> Void {
							let instance: Payer = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Payer::abandonPaymentLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.abandonPayment(paymentId: ThirtyTwoBytes(cType: payment_id).getValue())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func inflightHtlcsLambda(this_arg: UnsafeRawPointer?) -> LDKInFlightHtlcs {
							let instance: Payer = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Payer::inflightHtlcsLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.inflightHtlcs()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult.cType!

							return returnValue
						}
		
						func freeLambda(this_arg: UnsafeMutableRawPointer?) -> Void {
							let instance: Payer = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Payer::freeLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.free()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		

						self.cType = LDKPayer(							
							this_arg: thisArg,
							node_id: nodeIdLambda,
							first_hops: firstHopsLambda,
							send_payment: sendPaymentLambda,
							send_spontaneous_payment: sendSpontaneousPaymentLambda,
							retry_payment: retryPaymentLambda,
							abandon_payment: abandonPaymentLambda,
							inflight_htlcs: inflightHtlcsLambda,
							free: freeLambda
						)
					}

					
					/// Returns the payer's node id.
					open func nodeId() -> [UInt8] {
						
						Bindings.print("Error: Payer::nodeId MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Returns the payer's channels.
					open func firstHops() -> [ChannelDetails] {
						
						Bindings.print("Error: Payer::firstHops MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Sends a payment over the Lightning Network using the given [`Route`].
					/// 
					/// Note that payment_secret (or a relevant inner pointer) may be NULL or all-0s to represent None
					open func sendPayment(route: Route, paymentHash: [UInt8], paymentSecret: [UInt8], paymentId: [UInt8]) -> Result_NonePaymentSendFailureZ {
						
						Bindings.print("Error: Payer::sendPayment MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Sends a spontaneous payment over the Lightning Network using the given [`Route`].
					open func sendSpontaneousPayment(route: Route, paymentPreimage: [UInt8], paymentId: [UInt8]) -> Result_NonePaymentSendFailureZ {
						
						Bindings.print("Error: Payer::sendSpontaneousPayment MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Retries a failed payment path for the [`PaymentId`] using the given [`Route`].
					open func retryPayment(route: Route, paymentId: [UInt8]) -> Result_NonePaymentSendFailureZ {
						
						Bindings.print("Error: Payer::retryPayment MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Signals that no further retries for the given payment will occur.
					open func abandonPayment(paymentId: [UInt8]) -> Void {
						
						Bindings.print("Error: Payer::abandonPayment MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Construct an [`InFlightHtlcs`] containing information about currently used up liquidity
					/// across payments.
					open func inflightHtlcs() -> InFlightHtlcs {
						
						Bindings.print("Error: Payer::inflightHtlcs MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
					internal func free() -> Void {
						
				// TODO: figure out something smarter
				return; // the semicolon is necessary because Swift is whitespace-agnostic
			
						Bindings.print("Error: Payer::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		

					

					

					internal func dangle(_ shouldDangle: Bool = true) -> Payer {
        				self.dangling = shouldDangle
						return self
					}

					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Payer \(self.instanceNumber).")
							self.free()
						} else {
							Bindings.print("Not freeing Payer \(self.instanceNumber) due to dangle.")
						}
					}
				}

				internal class NativelyImplementedPayer: Payer {
					
					/// Returns the payer's node id.
					public override func nodeId() -> [UInt8] {
						// native call variable prep
						

						

						// native method call
						let nativeCallResult = self.cType!.node_id(self.cType!.this_arg)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = PublicKey(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// Returns the payer's channels.
					public override func firstHops() -> [ChannelDetails] {
						// native call variable prep
						

						

						// native method call
						let nativeCallResult = self.cType!.first_hops(self.cType!.this_arg)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Vec_ChannelDetailsZ(cType: nativeCallResult).getValue()

						return returnValue
					}
		
					/// Sends a payment over the Lightning Network using the given [`Route`].
					/// 
					/// Note that payment_secret (or a relevant inner pointer) may be NULL or all-0s to represent None
					public override func sendPayment(route: Route, paymentHash: [UInt8], paymentSecret: [UInt8], paymentId: [UInt8]) -> Result_NonePaymentSendFailureZ {
						// native call variable prep
						
						let paymentHashPrimitiveWrapper = ThirtyTwoBytes(value: paymentHash)
				
						let paymentSecretPrimitiveWrapper = ThirtyTwoBytes(value: paymentSecret)
				
						let paymentIdPrimitiveWrapper = ThirtyTwoBytes(value: paymentId)
				

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: route.cType!) { (routePointer: UnsafePointer<LDKRoute>) in
				self.cType!.send_payment(self.cType!.this_arg, routePointer, paymentHashPrimitiveWrapper.cType!, paymentSecretPrimitiveWrapper.cType!, paymentIdPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						paymentHashPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						paymentSecretPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						paymentIdPrimitiveWrapper.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = Result_NonePaymentSendFailureZ(cType: nativeCallResult)

						return returnValue
					}
		
					/// Sends a spontaneous payment over the Lightning Network using the given [`Route`].
					public override func sendSpontaneousPayment(route: Route, paymentPreimage: [UInt8], paymentId: [UInt8]) -> Result_NonePaymentSendFailureZ {
						// native call variable prep
						
						let paymentPreimagePrimitiveWrapper = ThirtyTwoBytes(value: paymentPreimage)
				
						let paymentIdPrimitiveWrapper = ThirtyTwoBytes(value: paymentId)
				

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: route.cType!) { (routePointer: UnsafePointer<LDKRoute>) in
				self.cType!.send_spontaneous_payment(self.cType!.this_arg, routePointer, paymentPreimagePrimitiveWrapper.cType!, paymentIdPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						paymentPreimagePrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						paymentIdPrimitiveWrapper.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = Result_NonePaymentSendFailureZ(cType: nativeCallResult)

						return returnValue
					}
		
					/// Retries a failed payment path for the [`PaymentId`] using the given [`Route`].
					public override func retryPayment(route: Route, paymentId: [UInt8]) -> Result_NonePaymentSendFailureZ {
						// native call variable prep
						
						let paymentIdPrimitiveWrapper = ThirtyTwoBytes(value: paymentId)
				

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: route.cType!) { (routePointer: UnsafePointer<LDKRoute>) in
				self.cType!.retry_payment(self.cType!.this_arg, routePointer, paymentIdPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						paymentIdPrimitiveWrapper.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = Result_NonePaymentSendFailureZ(cType: nativeCallResult)

						return returnValue
					}
		
					/// Signals that no further retries for the given payment will occur.
					public override func abandonPayment(paymentId: [UInt8]) {
						// native call variable prep
						
						let paymentIdPrimitiveWrapper = ThirtyTwoBytes(value: paymentId)
				

						

						// native method call
						let nativeCallResult = self.cType!.abandon_payment(self.cType!.this_arg, paymentIdPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						paymentIdPrimitiveWrapper.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Construct an [`InFlightHtlcs`] containing information about currently used up liquidity
					/// across payments.
					public override func inflightHtlcs() -> InFlightHtlcs {
						// native call variable prep
						

						

						// native method call
						let nativeCallResult = self.cType!.inflight_htlcs(self.cType!.this_arg)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = InFlightHtlcs(cType: nativeCallResult)

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
		