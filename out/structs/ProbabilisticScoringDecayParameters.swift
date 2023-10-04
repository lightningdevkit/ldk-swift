#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// Parameters for configuring [`ProbabilisticScorer`].
///
/// Used to configure decay parameters that are static throughout the lifetime of the scorer.
/// these decay parameters affect the score of the channel penalty and are not changed on a
/// per-route penalty cost call.
public typealias ProbabilisticScoringDecayParameters = Bindings.ProbabilisticScoringDecayParameters

extension Bindings {


	/// Parameters for configuring [`ProbabilisticScorer`].
	///
	/// Used to configure decay parameters that are static throughout the lifetime of the scorer.
	/// these decay parameters affect the score of the channel penalty and are not changed on a
	/// per-route penalty cost call.
	public class ProbabilisticScoringDecayParameters: NativeTypeWrapper {

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

		internal var cType: LDKProbabilisticScoringDecayParameters?

		internal init(cType: LDKProbabilisticScoringDecayParameters, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(
			cType: LDKProbabilisticScoringDecayParameters, instantiationContext: String, anchor: NativeTypeWrapper
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = true
			try! self.addAnchor(anchor: anchor)
		}

		internal init(
			cType: LDKProbabilisticScoringDecayParameters, instantiationContext: String, anchor: NativeTypeWrapper,
			dangle: Bool = false
		) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
			self.dangling = dangle
			try! self.addAnchor(anchor: anchor)
		}


		/// Frees any resources used by the ProbabilisticScoringDecayParameters, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = ProbabilisticScoringDecayParameters_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// If we aren't learning any new datapoints for a channel, the historical liquidity bounds
		/// tracking can simply live on with increasingly stale data. Instead, when a channel has not
		/// seen a liquidity estimate update for this amount of time, the historical datapoints are
		/// decayed by half.
		/// For an example of historical_no_updates_half_life being used see [`historical_estimated_channel_liquidity_probabilities`]
		///
		/// Note that after 16 or more half lives all historical data will be completely gone.
		///
		/// Default value: 14 days
		///
		/// [`historical_estimated_channel_liquidity_probabilities`]: ProbabilisticScorerUsingTime::historical_estimated_channel_liquidity_probabilities
		public func getHistoricalNoUpdatesHalfLife() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) {
					(thisPtrPointer: UnsafePointer<LDKProbabilisticScoringDecayParameters>) in
					ProbabilisticScoringDecayParameters_get_historical_no_updates_half_life(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// If we aren't learning any new datapoints for a channel, the historical liquidity bounds
		/// tracking can simply live on with increasingly stale data. Instead, when a channel has not
		/// seen a liquidity estimate update for this amount of time, the historical datapoints are
		/// decayed by half.
		/// For an example of historical_no_updates_half_life being used see [`historical_estimated_channel_liquidity_probabilities`]
		///
		/// Note that after 16 or more half lives all historical data will be completely gone.
		///
		/// Default value: 14 days
		///
		/// [`historical_estimated_channel_liquidity_probabilities`]: ProbabilisticScorerUsingTime::historical_estimated_channel_liquidity_probabilities
		public func setHistoricalNoUpdatesHalfLife(val: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKProbabilisticScoringDecayParameters>) in
					ProbabilisticScoringDecayParameters_set_historical_no_updates_half_life(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Whenever this amount of time elapses since the last update to a channel's liquidity bounds,
		/// the distance from the bounds to \"zero\" is cut in half. In other words, the lower-bound on
		/// the available liquidity is halved and the upper-bound moves half-way to the channel's total
		/// capacity.
		///
		/// Because halving the liquidity bounds grows the uncertainty on the channel's liquidity,
		/// the penalty for an amount within the new bounds may change. See the [`ProbabilisticScorer`]
		/// struct documentation for more info on the way the liquidity bounds are used.
		///
		/// For example, if the channel's capacity is 1 million sats, and the current upper and lower
		/// liquidity bounds are 200,000 sats and 600,000 sats, after this amount of time the upper
		/// and lower liquidity bounds will be decayed to 100,000 and 800,000 sats.
		///
		/// Default value: 6 hours
		///
		/// # Note
		///
		/// When built with the `no-std` feature, time will never elapse. Therefore, the channel
		/// liquidity knowledge will never decay except when the bounds cross.
		public func getLiquidityOffsetHalfLife() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) {
					(thisPtrPointer: UnsafePointer<LDKProbabilisticScoringDecayParameters>) in
					ProbabilisticScoringDecayParameters_get_liquidity_offset_half_life(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Whenever this amount of time elapses since the last update to a channel's liquidity bounds,
		/// the distance from the bounds to \"zero\" is cut in half. In other words, the lower-bound on
		/// the available liquidity is halved and the upper-bound moves half-way to the channel's total
		/// capacity.
		///
		/// Because halving the liquidity bounds grows the uncertainty on the channel's liquidity,
		/// the penalty for an amount within the new bounds may change. See the [`ProbabilisticScorer`]
		/// struct documentation for more info on the way the liquidity bounds are used.
		///
		/// For example, if the channel's capacity is 1 million sats, and the current upper and lower
		/// liquidity bounds are 200,000 sats and 600,000 sats, after this amount of time the upper
		/// and lower liquidity bounds will be decayed to 100,000 and 800,000 sats.
		///
		/// Default value: 6 hours
		///
		/// # Note
		///
		/// When built with the `no-std` feature, time will never elapse. Therefore, the channel
		/// liquidity knowledge will never decay except when the bounds cross.
		public func setLiquidityOffsetHalfLife(val: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKProbabilisticScoringDecayParameters>) in
					ProbabilisticScoringDecayParameters_set_liquidity_offset_half_life(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Constructs a new ProbabilisticScoringDecayParameters given each field
		public init(historicalNoUpdatesHalfLifeArg: UInt64, liquidityOffsetHalfLifeArg: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult = ProbabilisticScoringDecayParameters_new(
				historicalNoUpdatesHalfLifeArg, liquidityOffsetHalfLifeArg)

			// cleanup

			self.initialCFreeability = nativeCallResult.is_owned


			/*
						// return value (do some wrapping)
						let returnValue = ProbabilisticScoringDecayParameters(cType: nativeCallResult, instantiationContext: "ProbabilisticScoringDecayParameters.swift::\(#function):\(#line)")
						*/


			self.cType = nativeCallResult

			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			super
				.init(
					conflictAvoidingVariableName: 0,
					instantiationContext: "ProbabilisticScoringDecayParameters.swift::\(#function):\(#line)")


		}

		/// Creates a copy of the ProbabilisticScoringDecayParameters
		internal func clone() -> ProbabilisticScoringDecayParameters {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) {
					(origPointer: UnsafePointer<LDKProbabilisticScoringDecayParameters>) in
					ProbabilisticScoringDecayParameters_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ProbabilisticScoringDecayParameters(
				cType: nativeCallResult,
				instantiationContext: "ProbabilisticScoringDecayParameters.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Creates a "default" ProbabilisticScoringDecayParameters. See struct and individual field documentaiton for details on which values are used.
		public class func initWithDefault() -> ProbabilisticScoringDecayParameters {
			// native call variable prep


			// native method call
			let nativeCallResult = ProbabilisticScoringDecayParameters_default()

			// cleanup


			// return value (do some wrapping)
			let returnValue = ProbabilisticScoringDecayParameters(
				cType: nativeCallResult,
				instantiationContext: "ProbabilisticScoringDecayParameters.swift::\(#function):\(#line)")


			return returnValue
		}


		/// Indicates that this is the only struct which contains the same pointer.
		/// Rust functions which take ownership of an object provided via an argument require
		/// this to be true and invalidate the object pointed to by inner.
		public func isOwned() -> Bool {
			// return value (do some wrapping)
			let returnValue = self.cType!.is_owned

			return returnValue
		}


		internal func danglingClone() -> ProbabilisticScoringDecayParameters {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> ProbabilisticScoringDecayParameters {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> ProbabilisticScoringDecayParameters {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> ProbabilisticScoringDecayParameters {
			self.dangling = self.cType!.is_owned
			return self
		}

		deinit {
			if Bindings.suspendFreedom || Self.suspendFreedom {
				return
			}

			if !self.dangling {
				if Self.enableDeinitLogging {
					Bindings.print(
						"Freeing ProbabilisticScoringDecayParameters \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing ProbabilisticScoringDecayParameters \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

