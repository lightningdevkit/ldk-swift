
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			// necessary for abort() calls
			import Foundation

			/// An interface used to score payment channels for path finding.
			/// 
			/// \tScoring is in terms of fees willing to be paid in order to avoid routing through a channel.
			public typealias Score = Bindings.Score

			extension Bindings {

				/// An interface used to score payment channels for path finding.
				/// 
				/// \tScoring is in terms of fees willing to be paid in order to avoid routing through a channel.
				open class Score: NativeTraitWrapper {

					
					/// Set to false to suppress an individual type's deinit log statements.
					/// Only applicable when log threshold is set to `.Debug`.
					public static var enableDeinitLogging = true

					/// Set to true to suspend the freeing of this type's associated Rust memory.
					/// Should only ever be used for debugging purposes, and will likely be
					/// deprecated soon.
					public static var suspendFreedom = false

					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKScore?

					internal init(cType: LDKScore, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKScore, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKScore, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
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
						super.init(conflictAvoidingVariableName: 0, instantiationContext: "Score.swift::\(#function):\(#line)")

						let thisArg = Bindings.instanceToPointer(instance: self)

						

						
						func channelPenaltyMsatLambda(this_arg: UnsafeRawPointer?, short_channel_id: UInt64, source: UnsafePointer<LDKNodeId>, target: UnsafePointer<LDKNodeId>, usage: LDKChannelUsage) -> UInt64 {
							let instance: Score = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Score::channelPenaltyMsatLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.channelPenaltyMsat(shortChannelId: short_channel_id, source: NodeId(cType: source.pointee, instantiationContext: "Score.swift::init()::\(#function):\(#line)").dangle().clone(), target: NodeId(cType: target.pointee, instantiationContext: "Score.swift::init()::\(#function):\(#line)").dangle().clone(), usage: ChannelUsage(cType: usage, instantiationContext: "Score.swift::init()::\(#function):\(#line)"))

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func paymentPathFailedLambda(this_arg: UnsafeMutableRawPointer?, path: UnsafePointer<LDKPath>, short_channel_id: UInt64) -> Void {
							let instance: Score = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Score::paymentPathFailedLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.paymentPathFailed(path: Path(cType: path.pointee, instantiationContext: "Score.swift::init()::\(#function):\(#line)").dangle().clone(), shortChannelId: short_channel_id)

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func paymentPathSuccessfulLambda(this_arg: UnsafeMutableRawPointer?, path: UnsafePointer<LDKPath>) -> Void {
							let instance: Score = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Score::paymentPathSuccessfulLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.paymentPathSuccessful(path: Path(cType: path.pointee, instantiationContext: "Score.swift::init()::\(#function):\(#line)").dangle().clone())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func probeFailedLambda(this_arg: UnsafeMutableRawPointer?, path: UnsafePointer<LDKPath>, short_channel_id: UInt64) -> Void {
							let instance: Score = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Score::probeFailedLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.probeFailed(path: Path(cType: path.pointee, instantiationContext: "Score.swift::init()::\(#function):\(#line)").dangle().clone(), shortChannelId: short_channel_id)

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func probeSuccessfulLambda(this_arg: UnsafeMutableRawPointer?, path: UnsafePointer<LDKPath>) -> Void {
							let instance: Score = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Score::probeSuccessfulLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.probeSuccessful(path: Path(cType: path.pointee, instantiationContext: "Score.swift::init()::\(#function):\(#line)").dangle().clone())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func writeLambda(this_arg: UnsafeRawPointer?) -> LDKCVec_u8Z {
							let instance: Score = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Score::writeLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.write()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = Vec_u8Z(array: swiftCallbackResult, instantiationContext: "Score.swift::init()::\(#function):\(#line)").dangle().cType!

							return returnValue
						}
		
						func freeLambda(this_arg: UnsafeMutableRawPointer?) -> Void {
							let instance: Score = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "Score::freeLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.free()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		

						self.cType = LDKScore(							
							this_arg: thisArg,
							channel_penalty_msat: channelPenaltyMsatLambda,
							payment_path_failed: paymentPathFailedLambda,
							payment_path_successful: paymentPathSuccessfulLambda,
							probe_failed: probeFailedLambda,
							probe_successful: probeSuccessfulLambda,
							write: writeLambda,
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
					open func channelPenaltyMsat(shortChannelId: UInt64, source: NodeId, target: NodeId, usage: ChannelUsage) -> UInt64 {
						
						Bindings.print("Error: Score::channelPenaltyMsat MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Handles updating channel penalties after failing to route through a channel.
					open func paymentPathFailed(path: Path, shortChannelId: UInt64) -> Void {
						
						Bindings.print("Error: Score::paymentPathFailed MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Handles updating channel penalties after successfully routing along a path.
					open func paymentPathSuccessful(path: Path) -> Void {
						
						Bindings.print("Error: Score::paymentPathSuccessful MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Handles updating channel penalties after a probe over the given path failed.
					open func probeFailed(path: Path, shortChannelId: UInt64) -> Void {
						
						Bindings.print("Error: Score::probeFailed MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Handles updating channel penalties after a probe over the given path succeeded.
					open func probeSuccessful(path: Path) -> Void {
						
						Bindings.print("Error: Score::probeSuccessful MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Serialize the object into a byte array
					open func write() -> [UInt8] {
						
						Bindings.print("Error: Score::write MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
					internal func free() -> Void {
						
				// TODO: figure out something smarter
				return; // the semicolon is necessary because Swift is whitespace-agnostic
			
						Bindings.print("Error: Score::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		

					

					

					internal func dangle(_ shouldDangle: Bool = true) -> Score {
        				self.dangling = shouldDangle
						return self
					}

					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing Score \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing Score \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
				}

				internal class NativelyImplementedScore: Score {
					
					/// Returns the fee in msats willing to be paid to avoid routing `send_amt_msat` through the
					/// given channel in the direction from `source` to `target`.
					/// 
					/// The channel's capacity (less any other MPP parts that are also being considered for use in
					/// the same payment) is given by `capacity_msat`. It may be determined from various sources
					/// such as a chain data, network gossip, or invoice hints. For invoice hints, a capacity near
					/// [`u64::max_value`] is given to indicate sufficient capacity for the invoice's full amount.
					/// Thus, implementations should be overflow-safe.
					public override func channelPenaltyMsat(shortChannelId: UInt64, source: NodeId, target: NodeId, usage: ChannelUsage) -> UInt64 {
						// native call variable prep
						

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: source.cType!) { (sourcePointer: UnsafePointer<LDKNodeId>) in
				
						withUnsafePointer(to: target.cType!) { (targetPointer: UnsafePointer<LDKNodeId>) in
				self.cType!.channel_penalty_msat(self.cType!.this_arg, shortChannelId, sourcePointer, targetPointer, usage.dynamicallyDangledClone().cType!)
						}
				
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Handles updating channel penalties after failing to route through a channel.
					public override func paymentPathFailed(path: Path, shortChannelId: UInt64) {
						// native call variable prep
						

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: path.cType!) { (pathPointer: UnsafePointer<LDKPath>) in
				self.cType!.payment_path_failed(self.cType!.this_arg, pathPointer, shortChannelId)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Handles updating channel penalties after successfully routing along a path.
					public override func paymentPathSuccessful(path: Path) {
						// native call variable prep
						

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: path.cType!) { (pathPointer: UnsafePointer<LDKPath>) in
				self.cType!.payment_path_successful(self.cType!.this_arg, pathPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Handles updating channel penalties after a probe over the given path failed.
					public override func probeFailed(path: Path, shortChannelId: UInt64) {
						// native call variable prep
						

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: path.cType!) { (pathPointer: UnsafePointer<LDKPath>) in
				self.cType!.probe_failed(self.cType!.this_arg, pathPointer, shortChannelId)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Handles updating channel penalties after a probe over the given path succeeded.
					public override func probeSuccessful(path: Path) {
						// native call variable prep
						

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: path.cType!) { (pathPointer: UnsafePointer<LDKPath>) in
				self.cType!.probe_successful(self.cType!.this_arg, pathPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Serialize the object into a byte array
					public override func write() -> [UInt8] {
						// native call variable prep
						

						

						// native method call
						let nativeCallResult = self.cType!.write(self.cType!.this_arg)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, instantiationContext: "Score.swift::\(#function):\(#line)").getValue()

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
		