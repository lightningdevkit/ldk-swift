
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// [`Score`] implementation using channel success probability distributions.
			/// 
			/// Channels are tracked with upper and lower liquidity bounds - when an HTLC fails at a channel,
			/// we learn that the upper-bound on the available liquidity is lower than the amount of the HTLC.
			/// When a payment is forwarded through a channel (but fails later in the route), we learn the
			/// lower-bound on the channel's available liquidity must be at least the value of the HTLC.
			/// 
			/// These bounds are then used to determine a success probability using the formula from
			/// *Optimally Reliable & Cheap Payment Flows on the Lightning Network* by Rene Pickhardt
			/// and Stefan Richter [[1]] (i.e. `(upper_bound - payment_amount) / (upper_bound - lower_bound)`).
			/// 
			/// This probability is combined with the [`liquidity_penalty_multiplier_msat`] and
			/// [`liquidity_penalty_amount_multiplier_msat`] parameters to calculate a concrete penalty in
			/// milli-satoshis. The penalties, when added across all hops, have the property of being linear in
			/// terms of the entire path's success probability. This allows the router to directly compare
			/// penalties for different paths. See the documentation of those parameters for the exact formulas.
			/// 
			/// The liquidity bounds are decayed by halving them every [`liquidity_offset_half_life`].
			/// 
			/// Further, we track the history of our upper and lower liquidity bounds for each channel,
			/// allowing us to assign a second penalty (using [`historical_liquidity_penalty_multiplier_msat`]
			/// and [`historical_liquidity_penalty_amount_multiplier_msat`]) based on the same probability
			/// formula, but using the history of a channel rather than our latest estimates for the liquidity
			/// bounds.
			/// 
			/// # Note
			/// 
			/// Mixing the `no-std` feature between serialization and deserialization results in undefined
			/// behavior.
			/// 
			/// [1]: https://arxiv.org/abs/2107.05322
			/// [`liquidity_penalty_multiplier_msat`]: ProbabilisticScoringParameters::liquidity_penalty_multiplier_msat
			/// [`liquidity_penalty_amount_multiplier_msat`]: ProbabilisticScoringParameters::liquidity_penalty_amount_multiplier_msat
			/// [`liquidity_offset_half_life`]: ProbabilisticScoringParameters::liquidity_offset_half_life
			/// [`historical_liquidity_penalty_multiplier_msat`]: ProbabilisticScoringParameters::historical_liquidity_penalty_multiplier_msat
			/// [`historical_liquidity_penalty_amount_multiplier_msat`]: ProbabilisticScoringParameters::historical_liquidity_penalty_amount_multiplier_msat
			public typealias ProbabilisticScorer = Bindings.ProbabilisticScorer

			extension Bindings {
		

				/// [`Score`] implementation using channel success probability distributions.
				/// 
				/// Channels are tracked with upper and lower liquidity bounds - when an HTLC fails at a channel,
				/// we learn that the upper-bound on the available liquidity is lower than the amount of the HTLC.
				/// When a payment is forwarded through a channel (but fails later in the route), we learn the
				/// lower-bound on the channel's available liquidity must be at least the value of the HTLC.
				/// 
				/// These bounds are then used to determine a success probability using the formula from
				/// *Optimally Reliable & Cheap Payment Flows on the Lightning Network* by Rene Pickhardt
				/// and Stefan Richter [[1]] (i.e. `(upper_bound - payment_amount) / (upper_bound - lower_bound)`).
				/// 
				/// This probability is combined with the [`liquidity_penalty_multiplier_msat`] and
				/// [`liquidity_penalty_amount_multiplier_msat`] parameters to calculate a concrete penalty in
				/// milli-satoshis. The penalties, when added across all hops, have the property of being linear in
				/// terms of the entire path's success probability. This allows the router to directly compare
				/// penalties for different paths. See the documentation of those parameters for the exact formulas.
				/// 
				/// The liquidity bounds are decayed by halving them every [`liquidity_offset_half_life`].
				/// 
				/// Further, we track the history of our upper and lower liquidity bounds for each channel,
				/// allowing us to assign a second penalty (using [`historical_liquidity_penalty_multiplier_msat`]
				/// and [`historical_liquidity_penalty_amount_multiplier_msat`]) based on the same probability
				/// formula, but using the history of a channel rather than our latest estimates for the liquidity
				/// bounds.
				/// 
				/// # Note
				/// 
				/// Mixing the `no-std` feature between serialization and deserialization results in undefined
				/// behavior.
				/// 
				/// [1]: https://arxiv.org/abs/2107.05322
				/// [`liquidity_penalty_multiplier_msat`]: ProbabilisticScoringParameters::liquidity_penalty_multiplier_msat
				/// [`liquidity_penalty_amount_multiplier_msat`]: ProbabilisticScoringParameters::liquidity_penalty_amount_multiplier_msat
				/// [`liquidity_offset_half_life`]: ProbabilisticScoringParameters::liquidity_offset_half_life
				/// [`historical_liquidity_penalty_multiplier_msat`]: ProbabilisticScoringParameters::historical_liquidity_penalty_multiplier_msat
				/// [`historical_liquidity_penalty_amount_multiplier_msat`]: ProbabilisticScoringParameters::historical_liquidity_penalty_amount_multiplier_msat
				public class ProbabilisticScorer: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKProbabilisticScorer?

					internal init(cType: LDKProbabilisticScorer, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKProbabilisticScorer, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the ProbabilisticScorer, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ProbabilisticScorer_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a new scorer using the given scoring parameters for sending payments from a node
					/// through a network graph.
					public init(params: ProbabilisticScoringParameters, networkGraph: NetworkGraph, logger: Logger) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: networkGraph.cType!) { (networkGraphPointer: UnsafePointer<LDKNetworkGraph>) in
				ProbabilisticScorer_new(params.dynamicallyDangledClone().cType!, networkGraphPointer, logger.activate().cType!)
						}
				

						// cleanup
						
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = ProbabilisticScorer(cType: nativeCallResult, instantiationContext: "ProbabilisticScorer.swift::\(#function):\(#line)")
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0, instantiationContext: "ProbabilisticScorer.swift::\(#function):\(#line)")
				try! self.addAnchor(anchor: networkGraph)

			
					}
		
					/// Dump the contents of this scorer into the configured logger.
					/// 
					/// Note that this writes roughly one line per channel for which we have a liquidity estimate,
					/// which may be a substantial amount of log output.
					public func debugLogLiquidityStats() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKProbabilisticScorer>) in
				ProbabilisticScorer_debug_log_liquidity_stats(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Query the estimated minimum and maximum liquidity available for sending a payment over the
					/// channel with `scid` towards the given `target` node.
					public func estimatedChannelLiquidityRange(scid: UInt64, target: NodeId) -> (UInt64, UInt64)? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKProbabilisticScorer>) in
				
						withUnsafePointer(to: target.cType!) { (targetPointer: UnsafePointer<LDKNodeId>) in
				ProbabilisticScorer_estimated_channel_liquidity_range(thisArgPointer, scid, targetPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Option_C2Tuple_u64u64ZZ(cType: nativeCallResult, instantiationContext: "ProbabilisticScorer.swift::\(#function):\(#line)", anchor: self).getValue()
						

						return returnValue
					}
		
					/// Query the historical estimated minimum and maximum liquidity available for sending a
					/// payment over the channel with `scid` towards the given `target` node.
					/// 
					/// Returns two sets of 8 buckets. The first set describes the octiles for lower-bound
					/// liquidity estimates, the second set describes the octiles for upper-bound liquidity
					/// estimates. Each bucket describes the relative frequency at which we've seen a liquidity
					/// bound in the octile relative to the channel's total capacity, on an arbitrary scale.
					/// Because the values are slowly decayed, more recent data points are weighted more heavily
					/// than older datapoints.
					/// 
					/// When scoring, the estimated probability that an upper-/lower-bound lies in a given octile
					/// relative to the channel's total capacity is calculated by dividing that bucket's value with
					/// the total of all buckets for the given bound.
					/// 
					/// For example, a value of `[0, 0, 0, 0, 0, 0, 32]` indicates that we believe the probability
					/// of a bound being in the top octile to be 100%, and have never (recently) seen it in any
					/// other octiles. A value of `[31, 0, 0, 0, 0, 0, 0, 32]` indicates we've seen the bound being
					/// both in the top and bottom octile, and roughly with similar (recent) frequency.
					/// 
					/// Because the datapoints are decayed slowly over time, values will eventually return to
					/// `Some(([0; 8], [0; 8]))`.
					public func historicalEstimatedChannelLiquidityProbabilities(scid: UInt64, target: NodeId) -> ([UInt16], [UInt16])? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKProbabilisticScorer>) in
				
						withUnsafePointer(to: target.cType!) { (targetPointer: UnsafePointer<LDKNodeId>) in
				ProbabilisticScorer_historical_estimated_channel_liquidity_probabilities(thisArgPointer, scid, targetPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Option_C2Tuple_EightU16sEightU16sZZ(cType: nativeCallResult, instantiationContext: "ProbabilisticScorer.swift::\(#function):\(#line)", anchor: self).getValue()
						

						return returnValue
					}
		
					/// Marks the node with the given `node_id` as banned, i.e.,
					/// it will be avoided during path finding.
					public func addBanned(nodeId: NodeId) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKProbabilisticScorer>) in
				
						withUnsafePointer(to: nodeId.cType!) { (nodeIdPointer: UnsafePointer<LDKNodeId>) in
				ProbabilisticScorer_add_banned(thisArgPointer, nodeIdPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Removes the node with the given `node_id` from the list of nodes to avoid.
					public func removeBanned(nodeId: NodeId) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKProbabilisticScorer>) in
				
						withUnsafePointer(to: nodeId.cType!) { (nodeIdPointer: UnsafePointer<LDKNodeId>) in
				ProbabilisticScorer_remove_banned(thisArgPointer, nodeIdPointer)
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
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKProbabilisticScorer>) in
				
						withUnsafePointer(to: nodeId.cType!) { (nodeIdPointer: UnsafePointer<LDKNodeId>) in
				ProbabilisticScorer_set_manual_penalty(thisArgPointer, nodeIdPointer, penalty)
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
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKProbabilisticScorer>) in
				
						withUnsafePointer(to: nodeId.cType!) { (nodeIdPointer: UnsafePointer<LDKNodeId>) in
				ProbabilisticScorer_remove_manual_penalty(thisArgPointer, nodeIdPointer)
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
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKProbabilisticScorer>) in
				ProbabilisticScorer_clear_manual_penalties(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new Score which calls the relevant methods on this_arg.
					/// This copies the `inner` pointer in this_arg and thus the returned Score must be freed before this_arg is
					public func asScore() -> Score {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKProbabilisticScorer>) in
				ProbabilisticScorer_as_Score(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = NativelyImplementedScore(cType: nativeCallResult, instantiationContext: "ProbabilisticScorer.swift::\(#function):\(#line)", anchor: self)
						

						return returnValue
					}
		
					/// Serialize the ProbabilisticScorer object into a byte array which can be read by ProbabilisticScorer_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKProbabilisticScorer>) in
				ProbabilisticScorer_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, instantiationContext: "ProbabilisticScorer.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a ProbabilisticScorer from a byte array, created by ProbabilisticScorer_write
					public class func read(ser: [UInt8], argA: ProbabilisticScoringParameters, argB: NetworkGraph, argC: Logger) -> Result_ProbabilisticScorerDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser, instantiationContext: "ProbabilisticScorer.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: argB.cType!) { (argBPointer: UnsafePointer<LDKNetworkGraph>) in
				ProbabilisticScorer_read(serPrimitiveWrapper.cType!, argA.dynamicallyDangledClone().cType!, argBPointer, argC.activate().cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_ProbabilisticScorerDecodeErrorZ(cType: nativeCallResult, instantiationContext: "ProbabilisticScorer.swift::\(#function):\(#line)")
						

						try! returnValue.addAnchor(anchor: argB)
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
		

					internal func dangle(_ shouldDangle: Bool = true) -> ProbabilisticScorer {
						self.dangling = shouldDangle
						return self
					}

					
					internal func setCFreeability(freeable: Bool) -> ProbabilisticScorer {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> ProbabilisticScorer {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing ProbabilisticScorer \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing ProbabilisticScorer \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		