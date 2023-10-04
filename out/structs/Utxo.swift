
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// An unspent transaction output that is available to spend resulting from a successful
			/// [`CoinSelection`] attempt.
			public typealias Utxo = Bindings.Utxo

			extension Bindings {
		

				/// An unspent transaction output that is available to spend resulting from a successful
				/// [`CoinSelection`] attempt.
				public class Utxo: NativeTypeWrapper {

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

					internal var cType: LDKUtxo?

					internal init(cType: LDKUtxo, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKUtxo, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKUtxo, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the Utxo, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Utxo_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The unique identifier of the output.
					public func getOutpoint() -> OutPoint {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUtxo>) in
				Utxo_get_outpoint(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = OutPoint(cType: nativeCallResult, instantiationContext: "Utxo.swift::\(#function):\(#line)", anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// The unique identifier of the output.
					public func setOutpoint(val: OutPoint) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUtxo>) in
				Utxo_set_outpoint(thisPtrPointer, val.dynamicallyDangledClone().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The output to spend.
					public func getOutput() -> TxOut {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUtxo>) in
				Utxo_get_output(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = TxOut(cType: nativeCallResult, instantiationContext: "Utxo.swift::\(#function):\(#line)", anchor: self)
						

						return returnValue
					}
		
					/// The output to spend.
					public func setOutput(val: TxOut) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUtxo>) in
				Utxo_set_output(thisPtrPointer, val.danglingClone().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The upper-bound weight consumed by the input's full [`TxIn::script_sig`] and [`TxIn::witness`], each
					/// with their lengths included, required to satisfy the output's script. The weight consumed by
					/// the input's `script_sig` must account for [`WITNESS_SCALE_FACTOR`].
					public func getSatisfactionWeight() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKUtxo>) in
				Utxo_get_satisfaction_weight(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The upper-bound weight consumed by the input's full [`TxIn::script_sig`] and [`TxIn::witness`], each
					/// with their lengths included, required to satisfy the output's script. The weight consumed by
					/// the input's `script_sig` must account for [`WITNESS_SCALE_FACTOR`].
					public func setSatisfactionWeight(val: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKUtxo>) in
				Utxo_set_satisfaction_weight(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new Utxo given each field
					public init(outpointArg: OutPoint, outputArg: TxOut, satisfactionWeightArg: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Utxo_new(outpointArg.dynamicallyDangledClone().cType!, outputArg.danglingClone().cType!, satisfactionWeightArg)

						// cleanup
						
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = Utxo(cType: nativeCallResult, instantiationContext: "Utxo.swift::\(#function):\(#line)")
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0, instantiationContext: "Utxo.swift::\(#function):\(#line)")
				
			
					}
		
					/// Creates a copy of the Utxo
					internal func clone() -> Utxo {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKUtxo>) in
				Utxo_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Utxo(cType: nativeCallResult, instantiationContext: "Utxo.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Generates a non-cryptographic 64-bit hash of the Utxo.
					public func hash() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKUtxo>) in
				Utxo_hash(oPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if two Utxos contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public class func eq(a: Utxo, b: Utxo) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKUtxo>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKUtxo>) in
				Utxo_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Returns a `Utxo` with the `satisfaction_weight` estimate for a legacy P2PKH output.
					public class func initWithP2pkh(outpoint: OutPoint, value: UInt64, pubkeyHash: [UInt8]) -> Utxo {
						// native call variable prep
						
						let tupledPubkeyHash = Bindings.arrayToUInt8Tuple20(array: pubkeyHash)
					

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: tupledPubkeyHash) { (tupledPubkeyHashPointer: UnsafePointer<UInt8Tuple20>) in
				Utxo_new_p2pkh(outpoint.dynamicallyDangledClone().cType!, value, tupledPubkeyHashPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Utxo(cType: nativeCallResult, instantiationContext: "Utxo.swift::\(#function):\(#line)")
						

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
		

					
					internal func danglingClone() -> Utxo {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> Utxo {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> Utxo {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> Utxo {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing Utxo \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing Utxo \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

				}

				
			}
		
		