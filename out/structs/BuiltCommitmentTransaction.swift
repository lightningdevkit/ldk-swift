
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A pre-built Bitcoin commitment transaction and its txid.
			public typealias BuiltCommitmentTransaction = Bindings.BuiltCommitmentTransaction

			extension Bindings {
		

				/// A pre-built Bitcoin commitment transaction and its txid.
				public class BuiltCommitmentTransaction: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKBuiltCommitmentTransaction?

					internal init(cType: LDKBuiltCommitmentTransaction, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKBuiltCommitmentTransaction, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the BuiltCommitmentTransaction, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = BuiltCommitmentTransaction_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The commitment transaction
					public func getTransaction() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKBuiltCommitmentTransaction>) in
				BuiltCommitmentTransaction_get_transaction(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Transaction(cType: nativeCallResult, instantiationContext: "BuiltCommitmentTransaction.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// The commitment transaction
					public func setTransaction(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = Transaction(value: val, instantiationContext: "BuiltCommitmentTransaction.swift::\(#function):\(#line)").dangle()
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKBuiltCommitmentTransaction>) in
				BuiltCommitmentTransaction_set_transaction(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The txid for the commitment transaction.
					/// 
					/// This is provided as a performance optimization, instead of calling transaction.txid()
					/// multiple times.
					public func getTxid() -> [UInt8]? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKBuiltCommitmentTransaction>) in
				BuiltCommitmentTransaction_get_txid(thisPtrPointer)
						}
				

						// cleanup
						
						guard let nativeCallResult = nativeCallResult else {
							return nil
						}
			

						
						// return value (do some wrapping)
						let returnValue = Bindings.UInt8Tuple32ToArray(tuple: nativeCallResult.pointee)
						

						return returnValue
					}
		
					/// The txid for the commitment transaction.
					/// 
					/// This is provided as a performance optimization, instead of calling transaction.txid()
					/// multiple times.
					public func setTxid(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = ThirtyTwoBytes(value: val, instantiationContext: "BuiltCommitmentTransaction.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKBuiltCommitmentTransaction>) in
				BuiltCommitmentTransaction_set_txid(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new BuiltCommitmentTransaction given each field
					public init(transactionArg: [UInt8], txidArg: [UInt8]) {
						// native call variable prep
						
						let transactionArgPrimitiveWrapper = Transaction(value: transactionArg, instantiationContext: "BuiltCommitmentTransaction.swift::\(#function):\(#line)").dangle()
				
						let txidArgPrimitiveWrapper = ThirtyTwoBytes(value: txidArg, instantiationContext: "BuiltCommitmentTransaction.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = BuiltCommitmentTransaction_new(transactionArgPrimitiveWrapper.cType!, txidArgPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						transactionArgPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						txidArgPrimitiveWrapper.noOpRetain()
				
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = BuiltCommitmentTransaction(cType: nativeCallResult, instantiationContext: "BuiltCommitmentTransaction.swift::\(#function):\(#line)")
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0, instantiationContext: "BuiltCommitmentTransaction.swift::\(#function):\(#line)")
				
			
					}
		
					/// Creates a copy of the BuiltCommitmentTransaction
					internal func clone() -> BuiltCommitmentTransaction {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKBuiltCommitmentTransaction>) in
				BuiltCommitmentTransaction_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = BuiltCommitmentTransaction(cType: nativeCallResult, instantiationContext: "BuiltCommitmentTransaction.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Serialize the BuiltCommitmentTransaction object into a byte array which can be read by BuiltCommitmentTransaction_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKBuiltCommitmentTransaction>) in
				BuiltCommitmentTransaction_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, instantiationContext: "BuiltCommitmentTransaction.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a BuiltCommitmentTransaction from a byte array, created by BuiltCommitmentTransaction_write
					public class func read(ser: [UInt8]) -> Result_BuiltCommitmentTransactionDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser, instantiationContext: "BuiltCommitmentTransaction.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = BuiltCommitmentTransaction_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_BuiltCommitmentTransactionDecodeErrorZ(cType: nativeCallResult, instantiationContext: "BuiltCommitmentTransaction.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Get the SIGHASH_ALL sighash value of the transaction.
					/// 
					/// This can be used to verify a signature.
					public func getSighashAll(fundingRedeemscript: [UInt8], channelValueSatoshis: UInt64) -> [UInt8] {
						// native call variable prep
						
						let fundingRedeemscriptPrimitiveWrapper = u8slice(value: fundingRedeemscript, instantiationContext: "BuiltCommitmentTransaction.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBuiltCommitmentTransaction>) in
				BuiltCommitmentTransaction_get_sighash_all(thisArgPointer, fundingRedeemscriptPrimitiveWrapper.cType!, channelValueSatoshis)
						}
				

						// cleanup
						
						// for elided types, we need this
						fundingRedeemscriptPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = ThirtyTwoBytes(cType: nativeCallResult, instantiationContext: "BuiltCommitmentTransaction.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Sign a transaction, either because we are counter-signing the counterparty's transaction or
					/// because we are about to broadcast a holder transaction.
					public func sign(fundingKey: [UInt8], fundingRedeemscript: [UInt8], channelValueSatoshis: UInt64) -> [UInt8] {
						// native call variable prep
						
						let tupledFundingKey = Bindings.arrayToUInt8Tuple32(array: fundingKey)
					
						let fundingRedeemscriptPrimitiveWrapper = u8slice(value: fundingRedeemscript, instantiationContext: "BuiltCommitmentTransaction.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKBuiltCommitmentTransaction>) in
				
						withUnsafePointer(to: tupledFundingKey) { (tupledFundingKeyPointer: UnsafePointer<UInt8Tuple32>) in
				BuiltCommitmentTransaction_sign(thisArgPointer, tupledFundingKeyPointer, fundingRedeemscriptPrimitiveWrapper.cType!, channelValueSatoshis)
						}
				
						}
				

						// cleanup
						
						// for elided types, we need this
						fundingRedeemscriptPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Signature(cType: nativeCallResult, instantiationContext: "BuiltCommitmentTransaction.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> BuiltCommitmentTransaction {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> BuiltCommitmentTransaction {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> BuiltCommitmentTransaction {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> BuiltCommitmentTransaction {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> BuiltCommitmentTransaction {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing BuiltCommitmentTransaction \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing BuiltCommitmentTransaction \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		