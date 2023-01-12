
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A wrapper on ClosingTransaction indicating that the built bitcoin
			/// transaction is trusted.
			/// 
			/// See trust() and verify() functions on CommitmentTransaction.
			/// 
			/// This structure implements Deref.
			public typealias TrustedClosingTransaction = Bindings.TrustedClosingTransaction

			extension Bindings {
		

				/// A wrapper on ClosingTransaction indicating that the built bitcoin
				/// transaction is trusted.
				/// 
				/// See trust() and verify() functions on CommitmentTransaction.
				/// 
				/// This structure implements Deref.
				public class TrustedClosingTransaction: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKTrustedClosingTransaction?

					internal init(cType: LDKTrustedClosingTransaction) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKTrustedClosingTransaction, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the TrustedClosingTransaction, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = TrustedClosingTransaction_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The pre-built Bitcoin commitment transaction
					public func builtTransaction() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKTrustedClosingTransaction>) in
				TrustedClosingTransaction_built_transaction(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Transaction(cType: nativeCallResult, anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Get the SIGHASH_ALL sighash value of the transaction.
					/// 
					/// This can be used to verify a signature.
					public func getSighashAll(fundingRedeemscript: [UInt8], channelValueSatoshis: UInt64) -> [UInt8] {
						// native call variable prep
						
						let fundingRedeemscriptPrimitiveWrapper = u8slice(value: fundingRedeemscript)
				

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKTrustedClosingTransaction>) in
				TrustedClosingTransaction_get_sighash_all(thisArgPointer, fundingRedeemscriptPrimitiveWrapper.cType!, channelValueSatoshis)
						}
				

						// cleanup
						
						// for elided types, we need this
						fundingRedeemscriptPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = ThirtyTwoBytes(cType: nativeCallResult, anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Sign a transaction, either because we are counter-signing the counterparty's transaction or
					/// because we are about to broadcast a holder transaction.
					public func sign(fundingKey: [UInt8], fundingRedeemscript: [UInt8], channelValueSatoshis: UInt64) -> [UInt8] {
						// native call variable prep
						
						let tupledFundingKey = Bindings.arrayToUInt8Tuple32(array: fundingKey)
					
						let fundingRedeemscriptPrimitiveWrapper = u8slice(value: fundingRedeemscript)
				

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKTrustedClosingTransaction>) in
				
						withUnsafePointer(to: tupledFundingKey) { (tupledFundingKeyPointer: UnsafePointer<UInt8Tuple32>) in
				TrustedClosingTransaction_sign(thisArgPointer, tupledFundingKeyPointer, fundingRedeemscriptPrimitiveWrapper.cType!, channelValueSatoshis)
						}
				
						}
				

						// cleanup
						
						// for elided types, we need this
						fundingRedeemscriptPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Signature(cType: nativeCallResult, anchor: self).dangle(false).getValue()
						

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> TrustedClosingTransaction {
						self.dangling = shouldDangle
						return self
					}

					
					internal func setCFreeability(freeable: Bool) -> TrustedClosingTransaction {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> TrustedClosingTransaction {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing TrustedClosingTransaction \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing TrustedClosingTransaction \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		