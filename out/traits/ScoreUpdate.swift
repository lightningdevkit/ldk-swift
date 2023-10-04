
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			// necessary for abort() calls
			import Foundation

			/// `ScoreUpdate` is used to update the scorer's internal state after a payment attempt.
			public typealias ScoreUpdate = Bindings.ScoreUpdate

			extension Bindings {

				/// `ScoreUpdate` is used to update the scorer's internal state after a payment attempt.
				open class ScoreUpdate: NativeTraitWrapper {

					
					/// Set to false to suppress an individual type's deinit log statements.
					/// Only applicable when log threshold is set to `.Debug`.
					public static var enableDeinitLogging = true

					/// Set to true to suspend the freeing of this type's associated Rust memory.
					/// Should only ever be used for debugging purposes, and will likely be
					/// deprecated soon.
					public static var suspendFreedom = false

					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKScoreUpdate?

					internal init(cType: LDKScoreUpdate, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKScoreUpdate, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKScoreUpdate, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
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
						super.init(conflictAvoidingVariableName: 0, instantiationContext: "ScoreUpdate.swift::\(#function):\(#line)")

						let thisArg = Bindings.instanceToPointer(instance: self)

						

						
						func paymentPathFailedLambda(this_arg: UnsafeMutableRawPointer?, path: UnsafePointer<LDKPath>, short_channel_id: UInt64) -> Void {
							let instance: ScoreUpdate = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "ScoreUpdate::paymentPathFailedLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.paymentPathFailed(path: Path(cType: path.pointee, instantiationContext: "ScoreUpdate.swift::init()::\(#function):\(#line)").dangle().clone(), shortChannelId: short_channel_id)

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func paymentPathSuccessfulLambda(this_arg: UnsafeMutableRawPointer?, path: UnsafePointer<LDKPath>) -> Void {
							let instance: ScoreUpdate = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "ScoreUpdate::paymentPathSuccessfulLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.paymentPathSuccessful(path: Path(cType: path.pointee, instantiationContext: "ScoreUpdate.swift::init()::\(#function):\(#line)").dangle().clone())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func probeFailedLambda(this_arg: UnsafeMutableRawPointer?, path: UnsafePointer<LDKPath>, short_channel_id: UInt64) -> Void {
							let instance: ScoreUpdate = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "ScoreUpdate::probeFailedLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.probeFailed(path: Path(cType: path.pointee, instantiationContext: "ScoreUpdate.swift::init()::\(#function):\(#line)").dangle().clone(), shortChannelId: short_channel_id)

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func probeSuccessfulLambda(this_arg: UnsafeMutableRawPointer?, path: UnsafePointer<LDKPath>) -> Void {
							let instance: ScoreUpdate = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "ScoreUpdate::probeSuccessfulLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.probeSuccessful(path: Path(cType: path.pointee, instantiationContext: "ScoreUpdate.swift::init()::\(#function):\(#line)").dangle().clone())

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func freeLambda(this_arg: UnsafeMutableRawPointer?) -> Void {
							let instance: ScoreUpdate = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "ScoreUpdate::freeLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.free()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		

						self.cType = LDKScoreUpdate(							
							this_arg: thisArg,
							payment_path_failed: paymentPathFailedLambda,
							payment_path_successful: paymentPathSuccessfulLambda,
							probe_failed: probeFailedLambda,
							probe_successful: probeSuccessfulLambda,
							free: freeLambda
						)
					}

					
			/// Handles updating channel penalties after failing to route through a channel.
			open func paymentPathFailed(path: Path, shortChannelId: UInt64) -> Void {
				
				Bindings.print("Error: ScoreUpdate::paymentPathFailed MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
				abort()
			}
		
			/// Handles updating channel penalties after successfully routing along a path.
			open func paymentPathSuccessful(path: Path) -> Void {
				
				Bindings.print("Error: ScoreUpdate::paymentPathSuccessful MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
				abort()
			}
		
			/// Handles updating channel penalties after a probe over the given path failed.
			open func probeFailed(path: Path, shortChannelId: UInt64) -> Void {
				
				Bindings.print("Error: ScoreUpdate::probeFailed MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
				abort()
			}
		
			/// Handles updating channel penalties after a probe over the given path succeeded.
			open func probeSuccessful(path: Path) -> Void {
				
				Bindings.print("Error: ScoreUpdate::probeSuccessful MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
				abort()
			}
		
			/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
			internal func free() -> Void {
				
				// TODO: figure out something smarter
				return () // the empty tuple (aka Void) is necessary because Swift is whitespace-agnostic
			
				Bindings.print("Error: ScoreUpdate::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
				abort()
			}
		

					

					

					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing ScoreUpdate \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing ScoreUpdate \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
				}

				internal class NativelyImplementedScoreUpdate: ScoreUpdate {
					
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
		