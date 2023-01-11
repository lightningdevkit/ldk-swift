
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Implements the per-commitment secret storage scheme from
			/// [BOLT 3](https://github.com/lightning/bolts/blob/dcbf8583976df087c79c3ce0b535311212e6812d/03-transactions.md#efficient-per-commitment-secret-storage).
			/// 
			/// Allows us to keep track of all of the revocation secrets of our counterparty in just 50*32 bytes
			/// or so.
			public typealias CounterpartyCommitmentSecrets = Bindings.CounterpartyCommitmentSecrets

			extension Bindings {
		

				/// Implements the per-commitment secret storage scheme from
				/// [BOLT 3](https://github.com/lightning/bolts/blob/dcbf8583976df087c79c3ce0b535311212e6812d/03-transactions.md#efficient-per-commitment-secret-storage).
				/// 
				/// Allows us to keep track of all of the revocation secrets of our counterparty in just 50*32 bytes
				/// or so.
				public class CounterpartyCommitmentSecrets: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKCounterpartyCommitmentSecrets?

					internal init(cType: LDKCounterpartyCommitmentSecrets) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKCounterpartyCommitmentSecrets, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the CounterpartyCommitmentSecrets, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CounterpartyCommitmentSecrets_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the CounterpartyCommitmentSecrets
					internal func clone() -> CounterpartyCommitmentSecrets {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCounterpartyCommitmentSecrets>) in
				CounterpartyCommitmentSecrets_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = CounterpartyCommitmentSecrets(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Creates a new empty `CounterpartyCommitmentSecrets` structure.
					public init() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CounterpartyCommitmentSecrets_new()

						// cleanup
						
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = CounterpartyCommitmentSecrets(cType: nativeCallResult)
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		
					/// Returns the minimum index of all stored secrets. Note that indexes start
					/// at 1 << 48 and get decremented by one for each new secret.
					public func getMinSeenSecret() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKCounterpartyCommitmentSecrets>) in
				CounterpartyCommitmentSecrets_get_min_seen_secret(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Inserts the `secret` at `idx`. Returns `Ok(())` if the secret
					/// was generated in accordance with BOLT 3 and is consistent with previous secrets.
					public func provideSecret(idx: UInt64, secret: [UInt8]) -> Result_NoneNoneZ {
						// native call variable prep
						
						let secretPrimitiveWrapper = ThirtyTwoBytes(value: secret)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKCounterpartyCommitmentSecrets>) in
				CounterpartyCommitmentSecrets_provide_secret(thisArgPointer, idx, secretPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						secretPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_NoneNoneZ(cType: nativeCallResult, anchor: self)
						

						return returnValue
					}
		
					/// Returns the secret at `idx`.
					/// Returns `None` if `idx` is < [`CounterpartyCommitmentSecrets::get_min_seen_secret`].
					/// 
					/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func getSecret(idx: UInt64) -> [UInt8]? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKCounterpartyCommitmentSecrets>) in
				CounterpartyCommitmentSecrets_get_secret(thisArgPointer, idx)
						}
				

						// cleanup
						
				// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
				// Type group: RustPrimitiveWrapper
				// Type: LDKThirtyTwoBytes
			
						if nativeCallResult.data == Bindings.arrayToUInt8Tuple32(array: [UInt8](repeating: 0, count: 32)) {
							return nil
            			}
					

						
						// return value (do some wrapping)
						let returnValue = ThirtyTwoBytes(cType: nativeCallResult, anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Serialize the CounterpartyCommitmentSecrets object into a byte array which can be read by CounterpartyCommitmentSecrets_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKCounterpartyCommitmentSecrets>) in
				CounterpartyCommitmentSecrets_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a CounterpartyCommitmentSecrets from a byte array, created by CounterpartyCommitmentSecrets_write
					public class func read(ser: [UInt8]) -> Result_CounterpartyCommitmentSecretsDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = CounterpartyCommitmentSecrets_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_CounterpartyCommitmentSecretsDecodeErrorZ(cType: nativeCallResult)
						

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> CounterpartyCommitmentSecrets {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> CounterpartyCommitmentSecrets {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> CounterpartyCommitmentSecrets {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> CounterpartyCommitmentSecrets {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> CounterpartyCommitmentSecrets {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing CounterpartyCommitmentSecrets \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing CounterpartyCommitmentSecrets \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		