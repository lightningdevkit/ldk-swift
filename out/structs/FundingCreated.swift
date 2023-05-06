
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A [`funding_created`] message to be sent to or received from a peer.
			/// 
			/// [`funding_created`]: https://github.com/lightning/bolts/blob/master/02-peer-protocol.md#the-funding_created-message
			public typealias FundingCreated = Bindings.FundingCreated

			extension Bindings {
		

				/// A [`funding_created`] message to be sent to or received from a peer.
				/// 
				/// [`funding_created`]: https://github.com/lightning/bolts/blob/master/02-peer-protocol.md#the-funding_created-message
				public class FundingCreated: NativeTypeWrapper {

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

					internal var cType: LDKFundingCreated?

					internal init(cType: LDKFundingCreated, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKFundingCreated, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKFundingCreated, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the FundingCreated, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = FundingCreated_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// A temporary channel ID, until the funding is established
					public func getTemporaryChannelId() -> [UInt8]? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKFundingCreated>) in
				FundingCreated_get_temporary_channel_id(thisPtrPointer)
						}
				

						// cleanup
						
						guard let nativeCallResult = nativeCallResult else {
							return nil
						}
			

						
						// return value (do some wrapping)
						let returnValue = Bindings.UInt8Tuple32ToArray(tuple: nativeCallResult.pointee)
						

						return returnValue
					}
		
					/// A temporary channel ID, until the funding is established
					public func setTemporaryChannelId(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = ThirtyTwoBytes(value: val, instantiationContext: "FundingCreated.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKFundingCreated>) in
				FundingCreated_set_temporary_channel_id(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The funding transaction ID
					public func getFundingTxid() -> [UInt8]? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKFundingCreated>) in
				FundingCreated_get_funding_txid(thisPtrPointer)
						}
				

						// cleanup
						
						guard let nativeCallResult = nativeCallResult else {
							return nil
						}
			

						
						// return value (do some wrapping)
						let returnValue = Bindings.UInt8Tuple32ToArray(tuple: nativeCallResult.pointee)
						

						return returnValue
					}
		
					/// The funding transaction ID
					public func setFundingTxid(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = ThirtyTwoBytes(value: val, instantiationContext: "FundingCreated.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKFundingCreated>) in
				FundingCreated_set_funding_txid(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The specific output index funding this channel
					public func getFundingOutputIndex() -> UInt16 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKFundingCreated>) in
				FundingCreated_get_funding_output_index(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The specific output index funding this channel
					public func setFundingOutputIndex(val: UInt16) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKFundingCreated>) in
				FundingCreated_set_funding_output_index(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The signature of the channel initiator (funder) on the initial commitment transaction
					public func getSignature() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKFundingCreated>) in
				FundingCreated_get_signature(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Signature(cType: nativeCallResult, instantiationContext: "FundingCreated.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// The signature of the channel initiator (funder) on the initial commitment transaction
					public func setSignature(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = Signature(value: val, instantiationContext: "FundingCreated.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKFundingCreated>) in
				FundingCreated_set_signature(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new FundingCreated given each field
					public init(temporaryChannelIdArg: [UInt8], fundingTxidArg: [UInt8], fundingOutputIndexArg: UInt16, signatureArg: [UInt8]) {
						// native call variable prep
						
						let temporaryChannelIdArgPrimitiveWrapper = ThirtyTwoBytes(value: temporaryChannelIdArg, instantiationContext: "FundingCreated.swift::\(#function):\(#line)")
				
						let fundingTxidArgPrimitiveWrapper = ThirtyTwoBytes(value: fundingTxidArg, instantiationContext: "FundingCreated.swift::\(#function):\(#line)")
				
						let signatureArgPrimitiveWrapper = Signature(value: signatureArg, instantiationContext: "FundingCreated.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = FundingCreated_new(temporaryChannelIdArgPrimitiveWrapper.cType!, fundingTxidArgPrimitiveWrapper.cType!, fundingOutputIndexArg, signatureArgPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						temporaryChannelIdArgPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						fundingTxidArgPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						signatureArgPrimitiveWrapper.noOpRetain()
				
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = FundingCreated(cType: nativeCallResult, instantiationContext: "FundingCreated.swift::\(#function):\(#line)")
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0, instantiationContext: "FundingCreated.swift::\(#function):\(#line)")
				
			
					}
		
					/// Creates a copy of the FundingCreated
					internal func clone() -> FundingCreated {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKFundingCreated>) in
				FundingCreated_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = FundingCreated(cType: nativeCallResult, instantiationContext: "FundingCreated.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Checks if two FundingCreateds contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public class func eq(a: FundingCreated, b: FundingCreated) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKFundingCreated>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKFundingCreated>) in
				FundingCreated_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Serialize the FundingCreated object into a byte array which can be read by FundingCreated_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKFundingCreated>) in
				FundingCreated_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, instantiationContext: "FundingCreated.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a FundingCreated from a byte array, created by FundingCreated_write
					public class func read(ser: [UInt8]) -> Result_FundingCreatedDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser, instantiationContext: "FundingCreated.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = FundingCreated_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_FundingCreatedDecodeErrorZ(cType: nativeCallResult, instantiationContext: "FundingCreated.swift::\(#function):\(#line)")
						

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> FundingCreated {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> FundingCreated {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> FundingCreated {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> FundingCreated {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> FundingCreated {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing FundingCreated \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing FundingCreated \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

				}

				
			}
		
		