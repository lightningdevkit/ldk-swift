
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			// necessary for abort() calls
			import Foundation

			/// An interface used to score payment channels for path finding.
			/// 
			/// `ScoreLookUp` is used to determine the penalty for a given channel.
			/// 
			/// Scoring is in terms of fees willing to be paid in order to avoid routing through a channel.
			public typealias ScoreLookUp = Bindings.ScoreLookUp

			extension Bindings {

				/// An interface used to score payment channels for path finding.
				/// 
				/// `ScoreLookUp` is used to determine the penalty for a given channel.
				/// 
				/// Scoring is in terms of fees willing to be paid in order to avoid routing through a channel.
				open class ScoreLookUp: NativeTraitWrapper {

					
					/// Set to false to suppress an individual type's deinit log statements.
					/// Only applicable when log threshold is set to `.Debug`.
					public static var enableDeinitLogging = true

					/// Set to true to suspend the freeing of this type's associated Rust memory.
					/// Should only ever be used for debugging purposes, and will likely be
					/// deprecated soon.
					public static var suspendFreedom = false

					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKScoreLookUp?

					internal init(cType: LDKScoreLookUp, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKScoreLookUp, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKScoreLookUp, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
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
						super.init(conflictAvoidingVariableName: 0, instantiationContext: "ScoreLookUp.swift::\(#function):\(#line)")

						let thisArg = Bindings.instanceToPointer(instance: self)

						

						
						func channelPenaltyMsatLambda(this_arg: UnsafeRawPointer?, short_channel_id: UInt64, source: UnsafePointer<LDKNodeId>, target: UnsafePointer<LDKNodeId>, usage: LDKChannelUsage, score_params: UnsafePointer<LDKProbabilisticScoringFeeParameters>) -> UInt64 {
							let instance: ScoreLookUp = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "ScoreLookUp::channelPenaltyMsatLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.channelPenaltyMsat(shortChannelId: short_channel_id, source: NodeId(cType: source.pointee, instantiationContext: "ScoreLookUp.swift::init()::\(#function):\(#line)").dangle().clone(), target: NodeId(cType: target.pointee, instantiationContext: "ScoreLookUp.swift::init()::\(#function):\(#line)").dangle().clone(), usage: ChannelUsage(cType: usage, instantiationContext: "ScoreLookUp.swift::init()::\(#function):\(#line)"), scoreParams: ProbabilisticScoringFeeParameters(cType: score_params.pointee, instantiationContext: "ScoreLookUp.swift::init()::\(#function):\(#line)").dangle().clone())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func freeLambda(this_arg: UnsafeMutableRawPointer?) -> Void {
							let instance: ScoreLookUp = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "ScoreLookUp::freeLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.free()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		

						self.cType = LDKScoreLookUp(							
							this_arg: thisArg,
							channel_penalty_msat: channelPenaltyMsatLambda,
							free: freeLambda
						)
					}

					
			/// Returns the fee in msats willing to be paid to avoid routing `send_amt_msat` through the
					/// given channel in the direction from `source` to `target`.
					/// 
					/// The channel's capacity (less any other MPP parts that are also being considered for use in
					/// the same payment) is given by `capacity_msat`. It may be determined from various sources
					/// such as a chain data, network gossip, or invoice hints. For invoice hints, a capacity near
					/// [`u64::max_value`] is given to indicate sufficient capacity for the invoice's full amount.
					/// Thus, implementations should be overflow-safe.
			open func channelPenaltyMsat(shortChannelId: UInt64, source: NodeId, target: NodeId, usage: ChannelUsage, scoreParams: ProbabilisticScoringFeeParameters) -> UInt64 {
				
				Bindings.print("Error: ScoreLookUp::channelPenaltyMsat MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
				abort()
			}
		
			/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
			internal func free() -> Void {
				
				// TODO: figure out something smarter
				return () // the empty tuple (aka Void) is necessary because Swift is whitespace-agnostic
			
				Bindings.print("Error: ScoreLookUp::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
				abort()
			}
		

					

					

					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing ScoreLookUp \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing ScoreLookUp \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
				}

				internal class NativelyImplementedScoreLookUp: ScoreLookUp {
					
			/// Returns the fee in msats willing to be paid to avoid routing `send_amt_msat` through the
					/// given channel in the direction from `source` to `target`.
					/// 
					/// The channel's capacity (less any other MPP parts that are also being considered for use in
					/// the same payment) is given by `capacity_msat`. It may be determined from various sources
					/// such as a chain data, network gossip, or invoice hints. For invoice hints, a capacity near
					/// [`u64::max_value`] is given to indicate sufficient capacity for the invoice's full amount.
					/// Thus, implementations should be overflow-safe.
			public override func channelPenaltyMsat(shortChannelId: UInt64, source: NodeId, target: NodeId, usage: ChannelUsage, scoreParams: ProbabilisticScoringFeeParameters) -> UInt64 {
				// native call variable prep
				

				

				// native method call
				let nativeCallResult = 
						withUnsafePointer(to: source.cType!) { (sourcePointer: UnsafePointer<LDKNodeId>) in
				
						withUnsafePointer(to: target.cType!) { (targetPointer: UnsafePointer<LDKNodeId>) in
				
						withUnsafePointer(to: scoreParams.cType!) { (scoreParamsPointer: UnsafePointer<LDKProbabilisticScoringFeeParameters>) in
				self.cType!.channel_penalty_msat(self.cType!.this_arg, shortChannelId, sourcePointer, targetPointer, usage.dynamicallyDangledClone().cType!, scoreParamsPointer)
						}
				
						}
				
						}
				

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
		