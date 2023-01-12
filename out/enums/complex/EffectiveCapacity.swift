
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			/// 
			public typealias EffectiveCapacity = Bindings.EffectiveCapacity

			extension Bindings {

				/// The effective capacity of a channel for routing purposes.
				/// 
				/// While this may be smaller than the actual channel capacity, amounts greater than
				/// [`Self::as_msat`] should not be routed through the channel.
				public class EffectiveCapacity: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKEffectiveCapacity?

					internal init(cType: LDKEffectiveCapacity) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKEffectiveCapacity, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public enum EffectiveCapacityType {
						
						/// The available liquidity in the channel known from being a channel counterparty, and thus a
						/// direct hop.
						case ExactLiquidity
			
						/// The maximum HTLC amount in one direction as advertised on the gossip network.
						case MaximumHTLC
			
						/// The total capacity of the channel as determined by the funding transaction.
						case Total
			
						/// A capacity sufficient to route any payment, typically used for private channels provided by
						/// an invoice.
						case Infinite
			
						/// A capacity that is unknown possibly because either the chain state is unavailable to know
						/// the total capacity or the `htlc_maximum_msat` was not advertised on the gossip network.
						case Unknown
			
					}

					public func getValueType() -> EffectiveCapacityType {
						switch self.cType!.tag {
							case LDKEffectiveCapacity_ExactLiquidity:
								return .ExactLiquidity
			
							case LDKEffectiveCapacity_MaximumHTLC:
								return .MaximumHTLC
			
							case LDKEffectiveCapacity_Total:
								return .Total
			
							case LDKEffectiveCapacity_Infinite:
								return .Infinite
			
							case LDKEffectiveCapacity_Unknown:
								return .Unknown
			
							default:
								Bindings.print("Error: Invalid value type for EffectiveCapacity! Aborting.", severity: .ERROR)
								abort()
						}
		
					}

					
					/// Frees any resources used by the EffectiveCapacity
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = EffectiveCapacity_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the EffectiveCapacity
					internal func clone() -> EffectiveCapacity {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKEffectiveCapacity>) in
				EffectiveCapacity_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = EffectiveCapacity(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new ExactLiquidity-variant EffectiveCapacity
					public class func initWithExactLiquidity(liquidityMsat: UInt64) -> EffectiveCapacity {
						// native call variable prep
						

						// native method call
						let nativeCallResult = EffectiveCapacity_exact_liquidity(liquidityMsat)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = EffectiveCapacity(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new MaximumHTLC-variant EffectiveCapacity
					public class func initWithMaximumHtlc(amountMsat: UInt64) -> EffectiveCapacity {
						// native call variable prep
						

						// native method call
						let nativeCallResult = EffectiveCapacity_maximum_htlc(amountMsat)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = EffectiveCapacity(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new Total-variant EffectiveCapacity
					public class func initWithTotal(capacityMsat: UInt64, htlcMaximumMsat: UInt64) -> EffectiveCapacity {
						// native call variable prep
						

						// native method call
						let nativeCallResult = EffectiveCapacity_total(capacityMsat, htlcMaximumMsat)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = EffectiveCapacity(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new Infinite-variant EffectiveCapacity
					public class func initWithInfinite() -> EffectiveCapacity {
						// native call variable prep
						

						// native method call
						let nativeCallResult = EffectiveCapacity_infinite()

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = EffectiveCapacity(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Utility method to constructs a new Unknown-variant EffectiveCapacity
					public class func initWithUnknown() -> EffectiveCapacity {
						// native call variable prep
						

						// native method call
						let nativeCallResult = EffectiveCapacity_unknown()

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = EffectiveCapacity(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Returns the effective capacity denominated in millisatoshi.
					public func asMsat() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKEffectiveCapacity>) in
				EffectiveCapacity_as_msat(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		

					
					public func getValueAsExactLiquidity() -> ExactLiquidity? {
						if self.cType?.tag != LDKEffectiveCapacity_ExactLiquidity {
							return nil
						}

						return EffectiveCapacity_LDKExactLiquidity_Body(cType: self.cType!.exact_liquidity, anchor: self)
					}
			
					public func getValueAsMaximumHtlc() -> MaximumHTLC? {
						if self.cType?.tag != LDKEffectiveCapacity_MaximumHTLC {
							return nil
						}

						return EffectiveCapacity_LDKMaximumHTLC_Body(cType: self.cType!.maximum_htlc, anchor: self)
					}
			
					public func getValueAsTotal() -> Total? {
						if self.cType?.tag != LDKEffectiveCapacity_Total {
							return nil
						}

						return EffectiveCapacity_LDKTotal_Body(cType: self.cType!.total, anchor: self)
					}
			

					internal func dangle(_ shouldDangle: Bool = true) -> EffectiveCapacity {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> EffectiveCapacity {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing EffectiveCapacity \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing EffectiveCapacity \(self.instanceNumber) due to dangle.")
						}
					}
			

					
					
					/// 
					internal typealias EffectiveCapacity_LDKExactLiquidity_Body = ExactLiquidity
			

					/// 
					public class ExactLiquidity: NativeTypeWrapper {

						

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKEffectiveCapacity_LDKExactLiquidity_Body?

						internal init(cType: LDKEffectiveCapacity_LDKExactLiquidity_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
						}

						internal init(cType: LDKEffectiveCapacity_LDKExactLiquidity_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// Either the inbound or outbound liquidity depending on the direction, denominated in
						/// millisatoshi.
						public func getLiquidityMsat() -> UInt64 {
							// return value (do some wrapping)
							let returnValue = self.cType!.liquidity_msat

							return returnValue;
						}
		

						internal func dangle(_ shouldDangle: Bool = true) -> ExactLiquidity {
							self.dangling = shouldDangle
							return self
						}

											

					}

					
		
					
					/// 
					internal typealias EffectiveCapacity_LDKMaximumHTLC_Body = MaximumHTLC
			

					/// 
					public class MaximumHTLC: NativeTypeWrapper {

						

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKEffectiveCapacity_LDKMaximumHTLC_Body?

						internal init(cType: LDKEffectiveCapacity_LDKMaximumHTLC_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
						}

						internal init(cType: LDKEffectiveCapacity_LDKMaximumHTLC_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The maximum HTLC amount denominated in millisatoshi.
						public func getAmountMsat() -> UInt64 {
							// return value (do some wrapping)
							let returnValue = self.cType!.amount_msat

							return returnValue;
						}
		

						internal func dangle(_ shouldDangle: Bool = true) -> MaximumHTLC {
							self.dangling = shouldDangle
							return self
						}

											

					}

					
		
					
					/// 
					internal typealias EffectiveCapacity_LDKTotal_Body = Total
			

					/// 
					public class Total: NativeTypeWrapper {

						

						
						private static var instanceCounter: UInt = 0
						internal let instanceNumber: UInt

						internal var cType: LDKEffectiveCapacity_LDKTotal_Body?

						internal init(cType: LDKEffectiveCapacity_LDKTotal_Body) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
						}

						internal init(cType: LDKEffectiveCapacity_LDKTotal_Body, anchor: NativeTypeWrapper) {
							Self.instanceCounter += 1
							self.instanceNumber = Self.instanceCounter
							self.cType = cType
							
							super.init(conflictAvoidingVariableName: 0)
							self.dangling = true
							try! self.addAnchor(anchor: anchor)
						}
		

						

						
						/// The funding amount denominated in millisatoshi.
						public func getCapacityMsat() -> UInt64 {
							// return value (do some wrapping)
							let returnValue = self.cType!.capacity_msat

							return returnValue;
						}
		
						/// The maximum HTLC amount denominated in millisatoshi.
						public func getHtlcMaximumMsat() -> UInt64 {
							// return value (do some wrapping)
							let returnValue = self.cType!.htlc_maximum_msat

							return returnValue;
						}
		

						internal func dangle(_ shouldDangle: Bool = true) -> Total {
							self.dangling = shouldDangle
							return self
						}

											

					}

					
		

				}

			}
		