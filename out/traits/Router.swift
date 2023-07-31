// necessary for abort() calls
import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


/// A trait defining behavior for routing a payment.
public typealias Router = Bindings.Router

extension Bindings {

	/// A trait defining behavior for routing a payment.
	open class Router: NativeTraitWrapper {


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKRouter?

		internal init(cType: LDKRouter, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKRouter, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(cType: LDKRouter, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		public init() {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super.init(conflictAvoidingVariableName: 0, instantiationContext: "Router.swift::\(#function):\(#line)")

			let thisArg = Bindings.instanceToPointer(instance: self)


			func findRouteLambda(
				this_arg: UnsafeRawPointer?, payer: LDKPublicKey, route_params: UnsafePointer<LDKRouteParameters>,
				first_hops: UnsafeMutablePointer<LDKCVec_ChannelDetailsZ>?, inflight_htlcs: LDKInFlightHtlcs
			) -> LDKCResult_RouteLightningErrorZ {
				let instance: Router = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "Router::findRouteLambda")

				// Swift callback variable prep

				var first_hopsPointee: [ChannelDetails]? = nil
				if let first_hopsUnwrapped = first_hops {
					first_hopsPointee = Vec_ChannelDetailsZ(
						cType: first_hopsUnwrapped.pointee,
						instantiationContext: "Router.swift::init()::\(#function):\(#line)"
					)
					.dangle().getValue()
				}


				// Swift callback call
				let swiftCallbackResult = instance.findRoute(
					payer: PublicKey(cType: payer, instantiationContext: "Router.swift::init()::\(#function):\(#line)")
						.getValue(),
					routeParams: RouteParameters(
						cType: route_params.pointee, instantiationContext: "Router.swift::init()::\(#function):\(#line)"
					)
					.dangle().clone(), firstHops: first_hopsPointee,
					inflightHtlcs: InFlightHtlcs(
						cType: inflight_htlcs, instantiationContext: "Router.swift::init()::\(#function):\(#line)"))

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult.danglingClone().cType!

				return returnValue
			}

			func findRouteWithIdLambda(
				this_arg: UnsafeRawPointer?, payer: LDKPublicKey, route_params: UnsafePointer<LDKRouteParameters>,
				first_hops: UnsafeMutablePointer<LDKCVec_ChannelDetailsZ>?, inflight_htlcs: LDKInFlightHtlcs,
				_payment_hash: LDKThirtyTwoBytes, _payment_id: LDKThirtyTwoBytes
			) -> LDKCResult_RouteLightningErrorZ {
				let instance: Router = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "Router::findRouteWithIdLambda")

				// Swift callback variable prep

				var first_hopsPointee: [ChannelDetails]? = nil
				if let first_hopsUnwrapped = first_hops {
					first_hopsPointee = Vec_ChannelDetailsZ(
						cType: first_hopsUnwrapped.pointee,
						instantiationContext: "Router.swift::init()::\(#function):\(#line)"
					)
					.dangle().getValue()
				}


				// Swift callback call
				let swiftCallbackResult = instance.findRouteWithId(
					payer: PublicKey(cType: payer, instantiationContext: "Router.swift::init()::\(#function):\(#line)")
						.getValue(),
					routeParams: RouteParameters(
						cType: route_params.pointee, instantiationContext: "Router.swift::init()::\(#function):\(#line)"
					)
					.dangle().clone(), firstHops: first_hopsPointee,
					inflightHtlcs: InFlightHtlcs(
						cType: inflight_htlcs, instantiationContext: "Router.swift::init()::\(#function):\(#line)"),
					paymentHash: ThirtyTwoBytes(
						cType: _payment_hash, instantiationContext: "Router.swift::init()::\(#function):\(#line)"
					)
					.getValue(),
					paymentId: ThirtyTwoBytes(
						cType: _payment_id, instantiationContext: "Router.swift::init()::\(#function):\(#line)"
					)
					.getValue())

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult.danglingClone().cType!

				return returnValue
			}

			func freeLambda(this_arg: UnsafeMutableRawPointer?) {
				let instance: Router = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "Router::freeLambda")

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
				free: freeLambda
			)
		}


		/// Finds a [`Route`] for a payment between the given `payer` and a payee.
		///
		/// The `payee` and the payment's value are given in [`RouteParameters::payment_params`]
		/// and [`RouteParameters::final_value_msat`], respectively.
		///
		/// Note that first_hops (or a relevant inner pointer) may be NULL or all-0s to represent None
		open func findRoute(
			payer: [UInt8], routeParams: RouteParameters, firstHops: [ChannelDetails]?, inflightHtlcs: InFlightHtlcs
		) -> Result_RouteLightningErrorZ {

			Bindings.print(
				"Error: Router::findRoute MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Finds a [`Route`] for a payment between the given `payer` and a payee.
		///
		/// The `payee` and the payment's value are given in [`RouteParameters::payment_params`]
		/// and [`RouteParameters::final_value_msat`], respectively.
		///
		/// Includes a [`PaymentHash`] and a [`PaymentId`] to be able to correlate the request with a specific
		/// payment.
		///
		/// Note that first_hops (or a relevant inner pointer) may be NULL or all-0s to represent None
		open func findRouteWithId(
			payer: [UInt8], routeParams: RouteParameters, firstHops: [ChannelDetails]?, inflightHtlcs: InFlightHtlcs,
			paymentHash: [UInt8], paymentId: [UInt8]
		) -> Result_RouteLightningErrorZ {

			Bindings.print(
				"Error: Router::findRouteWithId MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Frees any resources associated with this object given its this_arg pointer.
		/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
		internal func free() {

			// TODO: figure out something smarter
			return ()  // the empty tuple (aka Void) is necessary because Swift is whitespace-agnostic

			Bindings.print(
				"Error: Router::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}


		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print("Freeing Router \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}
				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing Router \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
			}
		}
	}

	internal class NativelyImplementedRouter: Router {

		/// Finds a [`Route`] for a payment between the given `payer` and a payee.
		///
		/// The `payee` and the payment's value are given in [`RouteParameters::payment_params`]
		/// and [`RouteParameters::final_value_msat`], respectively.
		///
		/// Note that first_hops (or a relevant inner pointer) may be NULL or all-0s to represent None
		public override func findRoute(
			payer: [UInt8], routeParams: RouteParameters, firstHops: [ChannelDetails]?, inflightHtlcs: InFlightHtlcs
		) -> Result_RouteLightningErrorZ {
			// native call variable prep

			let payerPrimitiveWrapper = PublicKey(
				value: payer, instantiationContext: "Router.swift::\(#function):\(#line)")

			var firstHopsVectorPointer: UnsafeMutablePointer<LDKCVec_ChannelDetailsZ>? = nil
			if let firstHops = firstHops {

				let firstHopsVector = Vec_ChannelDetailsZ(
					array: firstHops, instantiationContext: "Router.swift::\(#function):\(#line)")

				firstHopsVectorPointer = UnsafeMutablePointer<LDKCVec_ChannelDetailsZ>.allocate(capacity: 1)
				firstHopsVectorPointer!.initialize(to: firstHopsVector.cType!)
			}


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: routeParams.cType!) { (routeParamsPointer: UnsafePointer<LDKRouteParameters>) in
					self.cType!
						.find_route(
							self.cType!.this_arg, payerPrimitiveWrapper.cType!, routeParamsPointer,
							firstHopsVectorPointer, inflightHtlcs.dynamicallyDangledClone().cType!)
				}


			// cleanup

			// for elided types, we need this
			payerPrimitiveWrapper.noOpRetain()

			// firstHopsVector.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_RouteLightningErrorZ(
				cType: nativeCallResult, instantiationContext: "Router.swift::\(#function):\(#line)")

			return returnValue
		}

		/// Finds a [`Route`] for a payment between the given `payer` and a payee.
		///
		/// The `payee` and the payment's value are given in [`RouteParameters::payment_params`]
		/// and [`RouteParameters::final_value_msat`], respectively.
		///
		/// Includes a [`PaymentHash`] and a [`PaymentId`] to be able to correlate the request with a specific
		/// payment.
		///
		/// Note that first_hops (or a relevant inner pointer) may be NULL or all-0s to represent None
		public override func findRouteWithId(
			payer: [UInt8], routeParams: RouteParameters, firstHops: [ChannelDetails]?, inflightHtlcs: InFlightHtlcs,
			paymentHash: [UInt8], paymentId: [UInt8]
		) -> Result_RouteLightningErrorZ {
			// native call variable prep

			let payerPrimitiveWrapper = PublicKey(
				value: payer, instantiationContext: "Router.swift::\(#function):\(#line)")

			var firstHopsVectorPointer: UnsafeMutablePointer<LDKCVec_ChannelDetailsZ>? = nil
			if let firstHops = firstHops {

				let firstHopsVector = Vec_ChannelDetailsZ(
					array: firstHops, instantiationContext: "Router.swift::\(#function):\(#line)")

				firstHopsVectorPointer = UnsafeMutablePointer<LDKCVec_ChannelDetailsZ>.allocate(capacity: 1)
				firstHopsVectorPointer!.initialize(to: firstHopsVector.cType!)
			}

			let paymentHashPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentHash, instantiationContext: "Router.swift::\(#function):\(#line)")

			let paymentIdPrimitiveWrapper = ThirtyTwoBytes(
				value: paymentId, instantiationContext: "Router.swift::\(#function):\(#line)")


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: routeParams.cType!) { (routeParamsPointer: UnsafePointer<LDKRouteParameters>) in
					self.cType!
						.find_route_with_id(
							self.cType!.this_arg, payerPrimitiveWrapper.cType!, routeParamsPointer,
							firstHopsVectorPointer, inflightHtlcs.dynamicallyDangledClone().cType!,
							paymentHashPrimitiveWrapper.cType!, paymentIdPrimitiveWrapper.cType!)
				}


			// cleanup

			// for elided types, we need this
			payerPrimitiveWrapper.noOpRetain()

			// firstHopsVector.noOpRetain()

			// for elided types, we need this
			paymentHashPrimitiveWrapper.noOpRetain()

			// for elided types, we need this
			paymentIdPrimitiveWrapper.noOpRetain()


			// return value (do some wrapping)
			let returnValue = Result_RouteLightningErrorZ(
				cType: nativeCallResult, instantiationContext: "Router.swift::\(#function):\(#line)")

			return returnValue
		}

		/// Frees any resources associated with this object given its this_arg pointer.
		/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
		public override func free() {
			// native call variable prep


			// natively wrapped traits may not necessarily be properly initialized
			// for now just don't free these things
			// self.cType?.free(self.cType?.this_arg)
			return


			// native method call
			let nativeCallResult = self.cType!.free(self.cType!.this_arg)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult

			return returnValue
		}

	}

}
