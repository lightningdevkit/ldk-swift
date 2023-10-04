
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			/// 
			public typealias MaxDustHTLCExposure = Bindings.MaxDustHTLCExposure

			extension Bindings {

				/// Options for how to set the max dust HTLC exposure allowed on a channel. See
				/// [`ChannelConfig::max_dust_htlc_exposure`] for details.
				public class MaxDustHTLCExposure: NativeTypeWrapper {

					
					/// Set to false to suppress an individual type's deinit log statements.
					/// Only applicable when log threshold is set to `.Debug`.
					public static var enableDeinitLogging = true

					/// Set to true to suspend the freeing of this type's associated Rust memory.
					/// Should only ever be used for debugging purposes, and will likely be
					/// deprecated soon.
					public static var suspendFreedom = false

					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKMaxDustHTLCExposure?

					internal init(cType: LDKMaxDustHTLCExposure, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKMaxDustHTLCExposure, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKMaxDustHTLCExposure, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					public enum MaxDustHTLCExposureType {
						
						/// This sets a fixed limit on the total dust exposure in millisatoshis. Setting this too low
						/// may prevent the sending or receipt of low-value HTLCs on high-traffic nodes, however this
						/// limit is very important to prevent stealing of large amounts of dust HTLCs by miners
						/// through [fee griefing
						/// attacks](https://lists.linuxfoundation.org/pipermail/lightning-dev/2020-May/002714.html).
						/// 
						/// Note that if the feerate increases significantly, without a manual increase
						/// to this maximum the channel may be unable to send/receive HTLCs between the maximum dust
						/// exposure and the new minimum value for HTLCs to be economically viable to claim.
						case FixedLimitMsat
			
						/// This sets a multiplier on the estimated high priority feerate (sats/KW, as obtained from
						/// [`FeeEstimator`]) to determine the maximum allowed dust exposure. If this variant is used
						/// then the maximum dust exposure in millisatoshis is calculated as:
						/// `high_priority_feerate_per_kw * value`. For example, with our default value
						/// `FeeRateMultiplier(5000)`:
						/// 
						/// - For the minimum fee rate of 1 sat/vByte (250 sat/KW, although the minimum
						/// defaults to 253 sats/KW for rounding, see [`FeeEstimator`]), the max dust exposure would
						/// be 253 * 5000 = 1,265,000 msats.
						/// - For a fee rate of 30 sat/vByte (7500 sat/KW), the max dust exposure would be
						/// 7500 * 5000 = 37,500,000 msats.
						/// 
						/// This allows the maximum dust exposure to automatically scale with fee rate changes.
						/// 
						/// Note, if you're using a third-party fee estimator, this may leave you more exposed to a
						/// fee griefing attack, where your fee estimator may purposely overestimate the fee rate,
						/// causing you to accept more dust HTLCs than you would otherwise.
						/// 
						/// This variant is primarily meant to serve pre-anchor channels, as HTLC fees being included
						/// on HTLC outputs means your channel may be subject to more dust exposure in the event of
						/// increases in fee rate.
						/// 
						/// # Backwards Compatibility
						/// This variant only became available in LDK 0.0.116, so if you downgrade to a prior version
						/// by default this will be set to a [`Self::FixedLimitMsat`] of 5,000,000 msat.
						/// 
						/// [`FeeEstimator`]: crate::chain::chaininterface::FeeEstimator
						case FeeRateMultiplier
			
					}

					public func getValueType() -> MaxDustHTLCExposureType {
						switch self.cType!.tag {
							case LDKMaxDustHTLCExposure_FixedLimitMsat:
								return .FixedLimitMsat
			
							case LDKMaxDustHTLCExposure_FeeRateMultiplier:
								return .FeeRateMultiplier
			
							default:
								Bindings.print("Error: Invalid value type for MaxDustHTLCExposure! Aborting.", severity: .ERROR)
								abort()
						}
		
					}

					
					/// Frees any resources used by the MaxDustHTLCExposure
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = MaxDustHTLCExposure_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the MaxDustHTLCExposure
					internal func clone() -> MaxDustHTLCExposure {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKMaxDustHTLCExposure>) in
				MaxDustHTLCExposure_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = MaxDustHTLCExposure(cType: nativeCallResult, instantiationContext: "MaxDustHTLCExposure.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new FixedLimitMsat-variant MaxDustHTLCExposure
					public class func initWithFixedLimitMsat(a: UInt64) -> MaxDustHTLCExposure {
						// native call variable prep
						

						// native method call
						let nativeCallResult = MaxDustHTLCExposure_fixed_limit_msat(a)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = MaxDustHTLCExposure(cType: nativeCallResult, instantiationContext: "MaxDustHTLCExposure.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new FeeRateMultiplier-variant MaxDustHTLCExposure
					public class func initWithFeeRateMultiplier(a: UInt64) -> MaxDustHTLCExposure {
						// native call variable prep
						

						// native method call
						let nativeCallResult = MaxDustHTLCExposure_fee_rate_multiplier(a)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = MaxDustHTLCExposure(cType: nativeCallResult, instantiationContext: "MaxDustHTLCExposure.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Checks if two MaxDustHTLCExposures contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					public class func eq(a: MaxDustHTLCExposure, b: MaxDustHTLCExposure) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKMaxDustHTLCExposure>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKMaxDustHTLCExposure>) in
				MaxDustHTLCExposure_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Serialize the MaxDustHTLCExposure object into a byte array which can be read by MaxDustHTLCExposure_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKMaxDustHTLCExposure>) in
				MaxDustHTLCExposure_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, instantiationContext: "MaxDustHTLCExposure.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a MaxDustHTLCExposure from a byte array, created by MaxDustHTLCExposure_write
					public class func read(ser: [UInt8]) -> Result_MaxDustHTLCExposureDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser, instantiationContext: "MaxDustHTLCExposure.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = MaxDustHTLCExposure_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_MaxDustHTLCExposureDecodeErrorZ(cType: nativeCallResult, instantiationContext: "MaxDustHTLCExposure.swift::\(#function):\(#line)")
						

						return returnValue
					}
		

					
					public func getValueAsFixedLimitMsat() -> UInt64? {
						if self.cType?.tag != LDKMaxDustHTLCExposure_FixedLimitMsat {
							return nil
						}

						return self.cType!.fixed_limit_msat
					}
			
					public func getValueAsFeeRateMultiplier() -> UInt64? {
						if self.cType?.tag != LDKMaxDustHTLCExposure_FeeRateMultiplier {
							return nil
						}

						return self.cType!.fee_rate_multiplier
					}
			

					
					internal func danglingClone() -> MaxDustHTLCExposure {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing MaxDustHTLCExposure \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing MaxDustHTLCExposure \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

					

				}

			}
		