
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A [`commitment_signed`] message to be sent to or received from a peer.
			/// 
			/// [`commitment_signed`]: https://github.com/lightning/bolts/blob/master/02-peer-protocol.md#committing-updates-so-far-commitment_signed
			public typealias CommitmentSigned = Bindings.CommitmentSigned

			extension Bindings {
		

				/// A [`commitment_signed`] message to be sent to or received from a peer.
				/// 
				/// [`commitment_signed`]: https://github.com/lightning/bolts/blob/master/02-peer-protocol.md#committing-updates-so-far-commitment_signed
				public class CommitmentSigned: NativeTypeWrapper {

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

					internal var cType: LDKCommitmentSigned?

					internal init(cType: LDKCommitmentSigned, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCommitmentSigned, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKCommitmentSigned, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the CommitmentSigned, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CommitmentSigned_free(self.cType!)

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
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCommitmentSigned>) in
				CommitmentSigned_get_channel_id(thisPtrPointer)
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
						
						let valPrimitiveWrapper = ThirtyTwoBytes(value: val, instantiationContext: "CommitmentSigned.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKCommitmentSigned>) in
				CommitmentSigned_set_channel_id(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// A signature on the commitment transaction
					public func getSignature() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCommitmentSigned>) in
				CommitmentSigned_get_signature(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Signature(cType: nativeCallResult, instantiationContext: "CommitmentSigned.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// A signature on the commitment transaction
					public func setSignature(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = Signature(value: val, instantiationContext: "CommitmentSigned.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKCommitmentSigned>) in
				CommitmentSigned_set_signature(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Signatures on the HTLC transactions
					/// 
					/// Returns a copy of the field.
					public func getHtlcSignatures() -> [[UInt8]] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCommitmentSigned>) in
				CommitmentSigned_get_htlc_signatures(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_SignatureZ(cType: nativeCallResult, instantiationContext: "CommitmentSigned.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Signatures on the HTLC transactions
					public func setHtlcSignatures(val: [[UInt8]]) {
						// native call variable prep
						
						let valVector = Vec_SignatureZ(array: val, instantiationContext: "CommitmentSigned.swift::\(#function):\(#line)").dangle()
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKCommitmentSigned>) in
				CommitmentSigned_set_htlc_signatures(thisPtrPointer, valVector.cType!)
						}
				

						// cleanup
						
						// valVector.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new CommitmentSigned given each field
					public init(channelIdArg: [UInt8], signatureArg: [UInt8], htlcSignaturesArg: [[UInt8]]) {
						// native call variable prep
						
						let channelIdArgPrimitiveWrapper = ThirtyTwoBytes(value: channelIdArg, instantiationContext: "CommitmentSigned.swift::\(#function):\(#line)")
				
						let signatureArgPrimitiveWrapper = Signature(value: signatureArg, instantiationContext: "CommitmentSigned.swift::\(#function):\(#line)")
				
						let htlcSignaturesArgVector = Vec_SignatureZ(array: htlcSignaturesArg, instantiationContext: "CommitmentSigned.swift::\(#function):\(#line)").dangle()
				

						// native method call
						let nativeCallResult = CommitmentSigned_new(channelIdArgPrimitiveWrapper.cType!, signatureArgPrimitiveWrapper.cType!, htlcSignaturesArgVector.cType!)

						// cleanup
						
						// for elided types, we need this
						channelIdArgPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						signatureArgPrimitiveWrapper.noOpRetain()
				
						// htlcSignaturesArgVector.noOpRetain()
				
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = CommitmentSigned(cType: nativeCallResult, instantiationContext: "CommitmentSigned.swift::\(#function):\(#line)")
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0, instantiationContext: "CommitmentSigned.swift::\(#function):\(#line)")
				
			
					}
		
					/// Creates a copy of the CommitmentSigned
					internal func clone() -> CommitmentSigned {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCommitmentSigned>) in
				CommitmentSigned_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = CommitmentSigned(cType: nativeCallResult, instantiationContext: "CommitmentSigned.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Checks if two CommitmentSigneds contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public class func eq(a: CommitmentSigned, b: CommitmentSigned) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKCommitmentSigned>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKCommitmentSigned>) in
				CommitmentSigned_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Serialize the CommitmentSigned object into a byte array which can be read by CommitmentSigned_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKCommitmentSigned>) in
				CommitmentSigned_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, instantiationContext: "CommitmentSigned.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a CommitmentSigned from a byte array, created by CommitmentSigned_write
					public class func read(ser: [UInt8]) -> Result_CommitmentSignedDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser, instantiationContext: "CommitmentSigned.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = CommitmentSigned_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_CommitmentSignedDecodeErrorZ(cType: nativeCallResult, instantiationContext: "CommitmentSigned.swift::\(#function):\(#line)")
						

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> CommitmentSigned {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> CommitmentSigned {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> CommitmentSigned {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> CommitmentSigned {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> CommitmentSigned {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing CommitmentSigned \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing CommitmentSigned \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

				}

				
			}
		
		