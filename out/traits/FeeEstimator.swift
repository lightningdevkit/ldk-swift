// necessary for abort() calls
import Foundation

#if SWIFT_PACKAGE
	import LDKHeaders
#endif


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


		/// Set to false to suppress an individual type's deinit log statements.
		/// Only applicable when log threshold is set to `.Debug`.
		public static var enableDeinitLogging = true

		/// Set to true to suspend the freeing of this type's associated Rust memory.
		/// Should only ever be used for debugging purposes, and will likely be
		/// deprecated soon.
		public static var suspendFreedom = false

		private static var instanceCounter: UInt = 0
		internal let instanceNumber: UInt

		internal var cType: LDKFeeEstimator?

		internal init(cType: LDKFeeEstimator, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(cType: LDKFeeEstimator, instantiationContext: String, anchor: NativeTypeWrapper) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType

			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKFeeEstimator, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false
		) {
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
			super
				.init(
					conflictAvoidingVariableName: 0, instantiationContext: "FeeEstimator.swift::\(#function):\(#line)")

			let thisArg = Bindings.instanceToPointer(instance: self)


			func getEstSatPer1000WeightLambda(this_arg: UnsafeRawPointer?, confirmation_target: LDKConfirmationTarget)
				-> UInt32
			{
				let instance: FeeEstimator = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "FeeEstimator::getEstSatPer1000WeightLambda")

				// Swift callback variable prep


				// Swift callback call
				let swiftCallbackResult = instance.getEstSatPer1000Weight(
					confirmationTarget: ConfirmationTarget(value: confirmation_target))

				// cleanup


				// return value (do some wrapping)
				let returnValue = swiftCallbackResult

				return returnValue
			}

			func freeLambda(this_arg: UnsafeMutableRawPointer?) {
				let instance: FeeEstimator = Bindings.pointerToInstance(
					pointer: this_arg!, sourceMarker: "FeeEstimator::freeLambda")

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

			Bindings.print(
				"Error: FeeEstimator::getEstSatPer1000Weight MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}

		/// Frees any resources associated with this object given its this_arg pointer.
		/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
		internal func free() {

			// TODO: figure out something smarter
			return ()  // the empty tuple (aka Void) is necessary because Swift is whitespace-agnostic

			Bindings.print(
				"Error: FeeEstimator::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.",
				severity: .ERROR)
			abort()
		}


		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print(
						"Freeing FeeEstimator \(self.instanceNumber). (Origin: \(self.instantiationContext))")
				}
				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing FeeEstimator \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
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
			let nativeCallResult = self.cType!
				.get_est_sat_per_1000_weight(self.cType!.this_arg, confirmationTarget.getCValue())

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
