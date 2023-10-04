
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// The result of a successful coin selection attempt for a transaction requiring additional UTXOs
			/// to cover its fees.
			public typealias CoinSelection = Bindings.CoinSelection

			extension Bindings {
		

				/// The result of a successful coin selection attempt for a transaction requiring additional UTXOs
				/// to cover its fees.
				public class CoinSelection: NativeTypeWrapper {

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

					internal var cType: LDKCoinSelection?

					internal init(cType: LDKCoinSelection, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKCoinSelection, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKCoinSelection, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the CoinSelection, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = CoinSelection_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The set of UTXOs (with at least 1 confirmation) to spend and use within a transaction
					/// requiring additional fees.
					public func getConfirmedUtxos() -> [Utxo] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCoinSelection>) in
				CoinSelection_get_confirmed_utxos(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_UtxoZ(cType: nativeCallResult, instantiationContext: "CoinSelection.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// The set of UTXOs (with at least 1 confirmation) to spend and use within a transaction
					/// requiring additional fees.
					public func setConfirmedUtxos(val: [Utxo]) {
						// native call variable prep
						
						let valVector = Vec_UtxoZ(array: val, instantiationContext: "CoinSelection.swift::\(#function):\(#line)").dangle()
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKCoinSelection>) in
				CoinSelection_set_confirmed_utxos(thisPtrPointer, valVector.cType!)
						}
				

						// cleanup
						
						// valVector.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// An additional output tracking whether any change remained after coin selection. This output
					/// should always have a value above dust for its given `script_pubkey`. It should not be
					/// spent until the transaction it belongs to confirms to ensure mempool descendant limits are
					/// not met. This implies no other party should be able to spend it except us.
					public func getChangeOutput() -> TxOut? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKCoinSelection>) in
				CoinSelection_get_change_output(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Option_TxOutZ(cType: nativeCallResult, instantiationContext: "CoinSelection.swift::\(#function):\(#line)", anchor: self).getValue()
						

						return returnValue
					}
		
					/// An additional output tracking whether any change remained after coin selection. This output
					/// should always have a value above dust for its given `script_pubkey`. It should not be
					/// spent until the transaction it belongs to confirms to ensure mempool descendant limits are
					/// not met. This implies no other party should be able to spend it except us.
					public func setChangeOutput(val: TxOut?) {
						// native call variable prep
						
						let valOption = Option_TxOutZ(some: val, instantiationContext: "CoinSelection.swift::\(#function):\(#line)").danglingClone()
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKCoinSelection>) in
				CoinSelection_set_change_output(thisPtrPointer, valOption.cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new CoinSelection given each field
					public init(confirmedUtxosArg: [Utxo], changeOutputArg: TxOut?) {
						// native call variable prep
						
						let confirmedUtxosArgVector = Vec_UtxoZ(array: confirmedUtxosArg, instantiationContext: "CoinSelection.swift::\(#function):\(#line)").dangle()
				
						let changeOutputArgOption = Option_TxOutZ(some: changeOutputArg, instantiationContext: "CoinSelection.swift::\(#function):\(#line)").danglingClone()
				

						// native method call
						let nativeCallResult = CoinSelection_new(confirmedUtxosArgVector.cType!, changeOutputArgOption.cType!)

						// cleanup
						
						// confirmedUtxosArgVector.noOpRetain()
				
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = CoinSelection(cType: nativeCallResult, instantiationContext: "CoinSelection.swift::\(#function):\(#line)")
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0, instantiationContext: "CoinSelection.swift::\(#function):\(#line)")
				
			
					}
		
					/// Creates a copy of the CoinSelection
					internal func clone() -> CoinSelection {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKCoinSelection>) in
				CoinSelection_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = CoinSelection(cType: nativeCallResult, instantiationContext: "CoinSelection.swift::\(#function):\(#line)")
						

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
		

					
					internal func danglingClone() -> CoinSelection {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> CoinSelection {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> CoinSelection {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> CoinSelection {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing CoinSelection \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing CoinSelection \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

				}

				
			}
		
		