#if SWIFT_PACKAGE
	import LDKHeaders
#endif

/// Parameters for configuring [`ProbabilisticScorer`].
///
/// Used to configure base, liquidity, and amount penalties, the sum of which comprises the channel
/// penalty (i.e., the amount in msats willing to be paid to avoid routing through the channel).
///
/// The penalty applied to any channel by the [`ProbabilisticScorer`] is the sum of each of the
/// parameters here.
public typealias ProbabilisticScoringFeeParameters = Bindings.ProbabilisticScoringFeeParameters

extension Bindings {


	/// Parameters for configuring [`ProbabilisticScorer`].
	///
	/// Used to configure base, liquidity, and amount penalties, the sum of which comprises the channel
	/// penalty (i.e., the amount in msats willing to be paid to avoid routing through the channel).
	///
	/// The penalty applied to any channel by the [`ProbabilisticScorer`] is the sum of each of the
	/// parameters here.
	public class ProbabilisticScoringFeeParameters: NativeTypeWrapper {

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

		internal var cType: LDKProbabilisticScoringFeeParameters?

		internal init(cType: LDKProbabilisticScoringFeeParameters, instantiationContext: String) {
			Self.instanceCounter += 1
			self.instanceNumber = Self.instanceCounter
			self.cType = cType
			self.initialCFreeability = self.cType!.is_owned
			super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
		}

		internal init(
			cType: LDKProbabilisticScoringFeeParameters, instantiationContext: String, anchor: NativeTypeWrapper
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
			cType: LDKProbabilisticScoringFeeParameters, instantiationContext: String, anchor: NativeTypeWrapper,
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


		/// Frees any resources used by the ProbabilisticScoringFeeParameters, if is_owned is set and inner is non-NULL.
		internal func free() {
			// native call variable prep


			// native method call
			let nativeCallResult = ProbabilisticScoringFeeParameters_free(self.cType!)

			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// A fixed penalty in msats to apply to each channel.
		///
		/// Default value: 500 msat
		public func getBasePenaltyMsat() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) {
					(thisPtrPointer: UnsafePointer<LDKProbabilisticScoringFeeParameters>) in
					ProbabilisticScoringFeeParameters_get_base_penalty_msat(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// A fixed penalty in msats to apply to each channel.
		///
		/// Default value: 500 msat
		public func setBasePenaltyMsat(val: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKProbabilisticScoringFeeParameters>) in
					ProbabilisticScoringFeeParameters_set_base_penalty_msat(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// A multiplier used with the payment amount to calculate a fixed penalty applied to each
		/// channel, in excess of the [`base_penalty_msat`].
		///
		/// The purpose of the amount penalty is to avoid having fees dominate the channel cost (i.e.,
		/// fees plus penalty) for large payments. The penalty is computed as the product of this
		/// multiplier and `2^30`ths of the payment amount.
		///
		/// ie `base_penalty_amount_multiplier_msat * amount_msat / 2^30`
		///
		/// Default value: 8,192 msat
		///
		/// [`base_penalty_msat`]: Self::base_penalty_msat
		public func getBasePenaltyAmountMultiplierMsat() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) {
					(thisPtrPointer: UnsafePointer<LDKProbabilisticScoringFeeParameters>) in
					ProbabilisticScoringFeeParameters_get_base_penalty_amount_multiplier_msat(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// A multiplier used with the payment amount to calculate a fixed penalty applied to each
		/// channel, in excess of the [`base_penalty_msat`].
		///
		/// The purpose of the amount penalty is to avoid having fees dominate the channel cost (i.e.,
		/// fees plus penalty) for large payments. The penalty is computed as the product of this
		/// multiplier and `2^30`ths of the payment amount.
		///
		/// ie `base_penalty_amount_multiplier_msat * amount_msat / 2^30`
		///
		/// Default value: 8,192 msat
		///
		/// [`base_penalty_msat`]: Self::base_penalty_msat
		public func setBasePenaltyAmountMultiplierMsat(val: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKProbabilisticScoringFeeParameters>) in
					ProbabilisticScoringFeeParameters_set_base_penalty_amount_multiplier_msat(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// A multiplier used in conjunction with the negative `log10` of the channel's success
		/// probability for a payment, as determined by our latest estimates of the channel's
		/// liquidity, to determine the liquidity penalty.
		///
		/// The penalty is based in part on the knowledge learned from prior successful and unsuccessful
		/// payments. This knowledge is decayed over time based on [`liquidity_offset_half_life`]. The
		/// penalty is effectively limited to `2 * liquidity_penalty_multiplier_msat` (corresponding to
		/// lower bounding the success probability to `0.01`) when the amount falls within the
		/// uncertainty bounds of the channel liquidity balance. Amounts above the upper bound will
		/// result in a `u64::max_value` penalty, however.
		///
		/// `-log10(success_probability) * liquidity_penalty_multiplier_msat`
		///
		/// Default value: 30,000 msat
		///
		/// [`liquidity_offset_half_life`]: ProbabilisticScoringDecayParameters::liquidity_offset_half_life
		public func getLiquidityPenaltyMultiplierMsat() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) {
					(thisPtrPointer: UnsafePointer<LDKProbabilisticScoringFeeParameters>) in
					ProbabilisticScoringFeeParameters_get_liquidity_penalty_multiplier_msat(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// A multiplier used in conjunction with the negative `log10` of the channel's success
		/// probability for a payment, as determined by our latest estimates of the channel's
		/// liquidity, to determine the liquidity penalty.
		///
		/// The penalty is based in part on the knowledge learned from prior successful and unsuccessful
		/// payments. This knowledge is decayed over time based on [`liquidity_offset_half_life`]. The
		/// penalty is effectively limited to `2 * liquidity_penalty_multiplier_msat` (corresponding to
		/// lower bounding the success probability to `0.01`) when the amount falls within the
		/// uncertainty bounds of the channel liquidity balance. Amounts above the upper bound will
		/// result in a `u64::max_value` penalty, however.
		///
		/// `-log10(success_probability) * liquidity_penalty_multiplier_msat`
		///
		/// Default value: 30,000 msat
		///
		/// [`liquidity_offset_half_life`]: ProbabilisticScoringDecayParameters::liquidity_offset_half_life
		public func setLiquidityPenaltyMultiplierMsat(val: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKProbabilisticScoringFeeParameters>) in
					ProbabilisticScoringFeeParameters_set_liquidity_penalty_multiplier_msat(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// A multiplier used in conjunction with a payment amount and the negative `log10` of the
		/// channel's success probability for the payment, as determined by our latest estimates of the
		/// channel's liquidity, to determine the amount penalty.
		///
		/// The purpose of the amount penalty is to avoid having fees dominate the channel cost (i.e.,
		/// fees plus penalty) for large payments. The penalty is computed as the product of this
		/// multiplier and `2^20`ths of the payment amount, weighted by the negative `log10` of the
		/// success probability.
		///
		/// `-log10(success_probability) * liquidity_penalty_amount_multiplier_msat * amount_msat / 2^20`
		///
		/// In practice, this means for 0.1 success probability (`-log10(0.1) == 1`) each `2^20`th of
		/// the amount will result in a penalty of the multiplier. And, as the success probability
		/// decreases, the negative `log10` weighting will increase dramatically. For higher success
		/// probabilities, the multiplier will have a decreasing effect as the negative `log10` will
		/// fall below `1`.
		///
		/// Default value: 192 msat
		public func getLiquidityPenaltyAmountMultiplierMsat() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) {
					(thisPtrPointer: UnsafePointer<LDKProbabilisticScoringFeeParameters>) in
					ProbabilisticScoringFeeParameters_get_liquidity_penalty_amount_multiplier_msat(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// A multiplier used in conjunction with a payment amount and the negative `log10` of the
		/// channel's success probability for the payment, as determined by our latest estimates of the
		/// channel's liquidity, to determine the amount penalty.
		///
		/// The purpose of the amount penalty is to avoid having fees dominate the channel cost (i.e.,
		/// fees plus penalty) for large payments. The penalty is computed as the product of this
		/// multiplier and `2^20`ths of the payment amount, weighted by the negative `log10` of the
		/// success probability.
		///
		/// `-log10(success_probability) * liquidity_penalty_amount_multiplier_msat * amount_msat / 2^20`
		///
		/// In practice, this means for 0.1 success probability (`-log10(0.1) == 1`) each `2^20`th of
		/// the amount will result in a penalty of the multiplier. And, as the success probability
		/// decreases, the negative `log10` weighting will increase dramatically. For higher success
		/// probabilities, the multiplier will have a decreasing effect as the negative `log10` will
		/// fall below `1`.
		///
		/// Default value: 192 msat
		public func setLiquidityPenaltyAmountMultiplierMsat(val: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKProbabilisticScoringFeeParameters>) in
					ProbabilisticScoringFeeParameters_set_liquidity_penalty_amount_multiplier_msat(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// A multiplier used in conjunction with the negative `log10` of the channel's success
		/// probability for the payment, as determined based on the history of our estimates of the
		/// channel's available liquidity, to determine a penalty.
		///
		/// This penalty is similar to [`liquidity_penalty_multiplier_msat`], however, instead of using
		/// only our latest estimate for the current liquidity available in the channel, it estimates
		/// success probability based on the estimated liquidity available in the channel through
		/// history. Specifically, every time we update our liquidity bounds on a given channel, we
		/// track which of several buckets those bounds fall into, exponentially decaying the
		/// probability of each bucket as new samples are added.
		///
		/// Default value: 10,000 msat
		///
		/// [`liquidity_penalty_multiplier_msat`]: Self::liquidity_penalty_multiplier_msat
		public func getHistoricalLiquidityPenaltyMultiplierMsat() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) {
					(thisPtrPointer: UnsafePointer<LDKProbabilisticScoringFeeParameters>) in
					ProbabilisticScoringFeeParameters_get_historical_liquidity_penalty_multiplier_msat(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// A multiplier used in conjunction with the negative `log10` of the channel's success
		/// probability for the payment, as determined based on the history of our estimates of the
		/// channel's available liquidity, to determine a penalty.
		///
		/// This penalty is similar to [`liquidity_penalty_multiplier_msat`], however, instead of using
		/// only our latest estimate for the current liquidity available in the channel, it estimates
		/// success probability based on the estimated liquidity available in the channel through
		/// history. Specifically, every time we update our liquidity bounds on a given channel, we
		/// track which of several buckets those bounds fall into, exponentially decaying the
		/// probability of each bucket as new samples are added.
		///
		/// Default value: 10,000 msat
		///
		/// [`liquidity_penalty_multiplier_msat`]: Self::liquidity_penalty_multiplier_msat
		public func setHistoricalLiquidityPenaltyMultiplierMsat(val: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKProbabilisticScoringFeeParameters>) in
					ProbabilisticScoringFeeParameters_set_historical_liquidity_penalty_multiplier_msat(
						thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// A multiplier used in conjunction with the payment amount and the negative `log10` of the
		/// channel's success probability for the payment, as determined based on the history of our
		/// estimates of the channel's available liquidity, to determine a penalty.
		///
		/// The purpose of the amount penalty is to avoid having fees dominate the channel cost for
		/// large payments. The penalty is computed as the product of this multiplier and the `2^20`ths
		/// of the payment amount, weighted by the negative `log10` of the success probability.
		///
		/// This penalty is similar to [`liquidity_penalty_amount_multiplier_msat`], however, instead
		/// of using only our latest estimate for the current liquidity available in the channel, it
		/// estimates success probability based on the estimated liquidity available in the channel
		/// through history. Specifically, every time we update our liquidity bounds on a given
		/// channel, we track which of several buckets those bounds fall into, exponentially decaying
		/// the probability of each bucket as new samples are added.
		///
		/// Default value: 64 msat
		///
		/// [`liquidity_penalty_amount_multiplier_msat`]: Self::liquidity_penalty_amount_multiplier_msat
		public func getHistoricalLiquidityPenaltyAmountMultiplierMsat() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) {
					(thisPtrPointer: UnsafePointer<LDKProbabilisticScoringFeeParameters>) in
					ProbabilisticScoringFeeParameters_get_historical_liquidity_penalty_amount_multiplier_msat(
						thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// A multiplier used in conjunction with the payment amount and the negative `log10` of the
		/// channel's success probability for the payment, as determined based on the history of our
		/// estimates of the channel's available liquidity, to determine a penalty.
		///
		/// The purpose of the amount penalty is to avoid having fees dominate the channel cost for
		/// large payments. The penalty is computed as the product of this multiplier and the `2^20`ths
		/// of the payment amount, weighted by the negative `log10` of the success probability.
		///
		/// This penalty is similar to [`liquidity_penalty_amount_multiplier_msat`], however, instead
		/// of using only our latest estimate for the current liquidity available in the channel, it
		/// estimates success probability based on the estimated liquidity available in the channel
		/// through history. Specifically, every time we update our liquidity bounds on a given
		/// channel, we track which of several buckets those bounds fall into, exponentially decaying
		/// the probability of each bucket as new samples are added.
		///
		/// Default value: 64 msat
		///
		/// [`liquidity_penalty_amount_multiplier_msat`]: Self::liquidity_penalty_amount_multiplier_msat
		public func setHistoricalLiquidityPenaltyAmountMultiplierMsat(val: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKProbabilisticScoringFeeParameters>) in
					ProbabilisticScoringFeeParameters_set_historical_liquidity_penalty_amount_multiplier_msat(
						thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// This penalty is applied when `htlc_maximum_msat` is equal to or larger than half of the
		/// channel's capacity, (ie. htlc_maximum_msat >= 0.5 * channel_capacity) which makes us
		/// prefer nodes with a smaller `htlc_maximum_msat`. We treat such nodes preferentially
		/// as this makes balance discovery attacks harder to execute, thereby creating an incentive
		/// to restrict `htlc_maximum_msat` and improve privacy.
		///
		/// Default value: 250 msat
		public func getAntiProbingPenaltyMsat() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) {
					(thisPtrPointer: UnsafePointer<LDKProbabilisticScoringFeeParameters>) in
					ProbabilisticScoringFeeParameters_get_anti_probing_penalty_msat(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// This penalty is applied when `htlc_maximum_msat` is equal to or larger than half of the
		/// channel's capacity, (ie. htlc_maximum_msat >= 0.5 * channel_capacity) which makes us
		/// prefer nodes with a smaller `htlc_maximum_msat`. We treat such nodes preferentially
		/// as this makes balance discovery attacks harder to execute, thereby creating an incentive
		/// to restrict `htlc_maximum_msat` and improve privacy.
		///
		/// Default value: 250 msat
		public func setAntiProbingPenaltyMsat(val: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKProbabilisticScoringFeeParameters>) in
					ProbabilisticScoringFeeParameters_set_anti_probing_penalty_msat(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// This penalty is applied when the amount we're attempting to send over a channel exceeds our
		/// current estimate of the channel's available liquidity.
		///
		/// Note that in this case all other penalties, including the
		/// [`liquidity_penalty_multiplier_msat`] and [`liquidity_penalty_amount_multiplier_msat`]-based
		/// penalties, as well as the [`base_penalty_msat`] and the [`anti_probing_penalty_msat`], if
		/// applicable, are still included in the overall penalty.
		///
		/// If you wish to avoid creating paths with such channels entirely, setting this to a value of
		/// `u64::max_value()` will guarantee that.
		///
		/// Default value: 1_0000_0000_000 msat (1 Bitcoin)
		///
		/// [`liquidity_penalty_multiplier_msat`]: Self::liquidity_penalty_multiplier_msat
		/// [`liquidity_penalty_amount_multiplier_msat`]: Self::liquidity_penalty_amount_multiplier_msat
		/// [`base_penalty_msat`]: Self::base_penalty_msat
		/// [`anti_probing_penalty_msat`]: Self::anti_probing_penalty_msat
		public func getConsideredImpossiblePenaltyMsat() -> UInt64 {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) {
					(thisPtrPointer: UnsafePointer<LDKProbabilisticScoringFeeParameters>) in
					ProbabilisticScoringFeeParameters_get_considered_impossible_penalty_msat(thisPtrPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// This penalty is applied when the amount we're attempting to send over a channel exceeds our
		/// current estimate of the channel's available liquidity.
		///
		/// Note that in this case all other penalties, including the
		/// [`liquidity_penalty_multiplier_msat`] and [`liquidity_penalty_amount_multiplier_msat`]-based
		/// penalties, as well as the [`base_penalty_msat`] and the [`anti_probing_penalty_msat`], if
		/// applicable, are still included in the overall penalty.
		///
		/// If you wish to avoid creating paths with such channels entirely, setting this to a value of
		/// `u64::max_value()` will guarantee that.
		///
		/// Default value: 1_0000_0000_000 msat (1 Bitcoin)
		///
		/// [`liquidity_penalty_multiplier_msat`]: Self::liquidity_penalty_multiplier_msat
		/// [`liquidity_penalty_amount_multiplier_msat`]: Self::liquidity_penalty_amount_multiplier_msat
		/// [`base_penalty_msat`]: Self::base_penalty_msat
		/// [`anti_probing_penalty_msat`]: Self::anti_probing_penalty_msat
		public func setConsideredImpossiblePenaltyMsat(val: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisPtrPointer: UnsafeMutablePointer<LDKProbabilisticScoringFeeParameters>) in
					ProbabilisticScoringFeeParameters_set_considered_impossible_penalty_msat(thisPtrPointer, val)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Creates a copy of the ProbabilisticScoringFeeParameters
		internal func clone() -> ProbabilisticScoringFeeParameters {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafePointer(to: self.cType!) {
					(origPointer: UnsafePointer<LDKProbabilisticScoringFeeParameters>) in
					ProbabilisticScoringFeeParameters_clone(origPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = ProbabilisticScoringFeeParameters(
				cType: nativeCallResult,
				instantiationContext: "ProbabilisticScoringFeeParameters.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Creates a "default" ProbabilisticScoringFeeParameters. See struct and individual field documentaiton for details on which values are used.
		public class func initWithDefault() -> ProbabilisticScoringFeeParameters {
			// native call variable prep


			// native method call
			let nativeCallResult = ProbabilisticScoringFeeParameters_default()

			// cleanup


			// return value (do some wrapping)
			let returnValue = ProbabilisticScoringFeeParameters(
				cType: nativeCallResult,
				instantiationContext: "ProbabilisticScoringFeeParameters.swift::\(#function):\(#line)")


			return returnValue
		}

		/// Marks the node with the given `node_id` as banned,
		/// i.e it will be avoided during path finding.
		public func addBanned(nodeId: NodeId) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisArgPointer: UnsafeMutablePointer<LDKProbabilisticScoringFeeParameters>) in

					withUnsafePointer(to: nodeId.cType!) { (nodeIdPointer: UnsafePointer<LDKNodeId>) in
						ProbabilisticScoringFeeParameters_add_banned(thisArgPointer, nodeIdPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Marks all nodes in the given list as banned, i.e.,
		/// they will be avoided during path finding.
		public func addBannedFromList(nodeIds: [NodeId]) {
			// native call variable prep

			let nodeIdsVector = Vec_NodeIdZ(
				array: nodeIds, instantiationContext: "ProbabilisticScoringFeeParameters.swift::\(#function):\(#line)"
			)
			.dangle()


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisArgPointer: UnsafeMutablePointer<LDKProbabilisticScoringFeeParameters>) in
					ProbabilisticScoringFeeParameters_add_banned_from_list(thisArgPointer, nodeIdsVector.cType!)
				}


			// cleanup

			// nodeIdsVector.noOpRetain()


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Removes the node with the given `node_id` from the list of nodes to avoid.
		public func removeBanned(nodeId: NodeId) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisArgPointer: UnsafeMutablePointer<LDKProbabilisticScoringFeeParameters>) in

					withUnsafePointer(to: nodeId.cType!) { (nodeIdPointer: UnsafePointer<LDKNodeId>) in
						ProbabilisticScoringFeeParameters_remove_banned(thisArgPointer, nodeIdPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Sets a manual penalty for the given node.
		public func setManualPenalty(nodeId: NodeId, penalty: UInt64) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisArgPointer: UnsafeMutablePointer<LDKProbabilisticScoringFeeParameters>) in

					withUnsafePointer(to: nodeId.cType!) { (nodeIdPointer: UnsafePointer<LDKNodeId>) in
						ProbabilisticScoringFeeParameters_set_manual_penalty(thisArgPointer, nodeIdPointer, penalty)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Removes the node with the given `node_id` from the list of manual penalties.
		public func removeManualPenalty(nodeId: NodeId) {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisArgPointer: UnsafeMutablePointer<LDKProbabilisticScoringFeeParameters>) in

					withUnsafePointer(to: nodeId.cType!) { (nodeIdPointer: UnsafePointer<LDKNodeId>) in
						ProbabilisticScoringFeeParameters_remove_manual_penalty(thisArgPointer, nodeIdPointer)
					}

				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


			return returnValue
		}

		/// Clears the list of manual penalties that are applied during path finding.
		public func clearManualPenalties() {
			// native call variable prep


			// native method call
			let nativeCallResult =
				withUnsafeMutablePointer(to: &self.cType!) {
					(thisArgPointer: UnsafeMutablePointer<LDKProbabilisticScoringFeeParameters>) in
					ProbabilisticScoringFeeParameters_clear_manual_penalties(thisArgPointer)
				}


			// cleanup


			// return value (do some wrapping)
			let returnValue = nativeCallResult


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


		internal func danglingClone() -> ProbabilisticScoringFeeParameters {
			let dangledClone = self.clone()
			dangledClone.dangling = true
			return dangledClone
		}

		internal func dynamicallyDangledClone() -> ProbabilisticScoringFeeParameters {
			let dangledClone = self.clone()
			// if it's owned, i. e. controlled by Rust, it should dangle on our end
			dangledClone.dangling = dangledClone.cType!.is_owned
			return dangledClone
		}

		internal func setCFreeability(freeable: Bool) -> ProbabilisticScoringFeeParameters {
			self.cType!.is_owned = freeable
			return self
		}

		internal func dynamicDangle() -> ProbabilisticScoringFeeParameters {
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
						"Freeing ProbabilisticScoringFeeParameters \(self.instanceNumber). (Origin: \(self.instantiationContext))"
					)
				}

				self.free()
			} else if Self.enableDeinitLogging {
				Bindings.print(
					"Not freeing ProbabilisticScoringFeeParameters \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))"
				)
			}
		}


	}


}

