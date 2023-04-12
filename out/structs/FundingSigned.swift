
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A [`funding_signed`] message to be sent to or received from a peer.
			/// 
			/// [`funding_signed`]: https://github.com/lightning/bolts/blob/master/02-peer-protocol.md#the-funding_signed-message
			public typealias FundingSigned = Bindings.FundingSigned

			extension Bindings {
		

				/// A [`funding_signed`] message to be sent to or received from a peer.
				/// 
				/// [`funding_signed`]: https://github.com/lightning/bolts/blob/master/02-peer-protocol.md#the-funding_signed-message
				public class FundingSigned: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKFundingSigned?

					internal init(cType: LDKFundingSigned) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKFundingSigned, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the FundingSigned, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = FundingSigned_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The channel ID
					public func getChannelId() -> [UInt8]? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKFundingSigned>) in
				FundingSigned_get_channel_id(thisPtrPointer)
						}
				

						// cleanup
						
						guard let nativeCallResult = nativeCallResult else {
							return nil
						}
			

						
						// return value (do some wrapping)
						let returnValue = Bindings.UInt8Tuple32ToArray(tuple: nativeCallResult.pointee)
						

						return returnValue
					}
		
					/// The channel ID
					public func setChannelId(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = ThirtyTwoBytes(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKFundingSigned>) in
				FundingSigned_set_channel_id(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The signature of the channel acceptor (fundee) on the initial commitment transaction
					public func getSignature() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKFundingSigned>) in
				FundingSigned_get_signature(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Signature(cType: nativeCallResult, anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// The signature of the channel acceptor (fundee) on the initial commitment transaction
					public func setSignature(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = Signature(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKFundingSigned>) in
				FundingSigned_set_signature(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new FundingSigned given each field
					public init(channelIdArg: [UInt8], signatureArg: [UInt8]) {
						// native call variable prep
						
						let channelIdArgPrimitiveWrapper = ThirtyTwoBytes(value: channelIdArg)
				
						let signatureArgPrimitiveWrapper = Signature(value: signatureArg)
				

						// native method call
						let nativeCallResult = FundingSigned_new(channelIdArgPrimitiveWrapper.cType!, signatureArgPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						channelIdArgPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						signatureArgPrimitiveWrapper.noOpRetain()
				
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = FundingSigned(cType: nativeCallResult)
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
				
			
					}
		
					/// Creates a copy of the FundingSigned
					internal func clone() -> FundingSigned {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKFundingSigned>) in
				FundingSigned_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = FundingSigned(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Checks if two FundingSigneds contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public class func eq(a: FundingSigned, b: FundingSigned) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKFundingSigned>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKFundingSigned>) in
				FundingSigned_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Serialize the FundingSigned object into a byte array which can be read by FundingSigned_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKFundingSigned>) in
				FundingSigned_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a FundingSigned from a byte array, created by FundingSigned_write
					public class func read(ser: [UInt8]) -> Result_FundingSignedDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = FundingSigned_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_FundingSignedDecodeErrorZ(cType: nativeCallResult)
						

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> FundingSigned {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> FundingSigned {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> FundingSigned {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> FundingSigned {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> FundingSigned {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing FundingSigned \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing FundingSigned \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		