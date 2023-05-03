
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			import Foundation

			/// 
			public typealias UtxoResult = Bindings.UtxoResult

			extension Bindings {

				/// The result of a [`UtxoLookup::get_utxo`] call. A call may resolve either synchronously,
				/// returning the `Sync` variant, or asynchronously, returning an [`UtxoFuture`] in the `Async`
				/// variant.
				public class UtxoResult: NativeTypeWrapper {

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKUtxoResult?

					internal init(cType: LDKUtxoResult, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKUtxoResult, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public enum UtxoResultType {
						
						/// A result which was resolved synchronously. It either includes a [`TxOut`] for the output
						/// requested or a [`UtxoLookupError`].
						case Sync
			
						/// A result which will be resolved asynchronously. It includes a [`UtxoFuture`], a `clone` of
						/// which you must keep locally and call [`UtxoFuture::resolve`] on once the lookup completes.
						/// 
						/// Note that in order to avoid runaway memory usage, the number of parallel checks is limited,
						/// but only fairly loosely. Because a pending checks block all message processing, leaving
						/// checks pending for an extended time may cause DoS of other functions. It is recommended you
						/// keep a tight timeout on lookups, on the order of a few seconds.
						case Async
			
					}

					public func getValueType() -> UtxoResultType {
						switch self.cType!.tag {
							case LDKUtxoResult_Sync:
								return .Sync
			
							case LDKUtxoResult_Async:
								return .Async
			
							default:
								Bindings.print("Error: Invalid value type for UtxoResult! Aborting.", severity: .ERROR)
								abort()
						}
		
					}

					
					/// Frees any resources used by the UtxoResult
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = UtxoResult_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the UtxoResult
					internal func clone() -> UtxoResult {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKUtxoResult>) in
				UtxoResult_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = UtxoResult(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new Sync-variant UtxoResult
					public class func initWithSync(a: Result_TxOutUtxoLookupErrorZ) -> UtxoResult {
						// native call variable prep
						

						// native method call
						let nativeCallResult = UtxoResult_sync(a.danglingClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = UtxoResult(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Utility method to constructs a new Async-variant UtxoResult
					public class func initWithAsync(a: Bindings.UtxoFuture) -> UtxoResult {
						// native call variable prep
						

						// native method call
						let nativeCallResult = UtxoResult_async(a.dynamicallyDangledClone().cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = UtxoResult(cType: nativeCallResult, instantiationContext: "#{swift_class_name}::\(#function):\(#line)")
						

						return returnValue
					}
		

					
					public func getValueAsSync() -> Result_TxOutUtxoLookupErrorZ? {
						if self.cType?.tag != LDKUtxoResult_Sync {
							return nil
						}

						return Result_TxOutUtxoLookupErrorZ(cType: self.cType!.sync, instantiationContext: "#{swift_class_name}::\(#function):\(#line)", anchor: self)
					}
			
					public func getValueAsAsync() -> Bindings.UtxoFuture? {
						if self.cType?.tag != LDKUtxoResult_Async {
							return nil
						}

						return UtxoFuture(cType: self.cType!.async, instantiationContext: "#{swift_class_name}::\(#function):\(#line)", anchor: self)
					}
			

					internal func dangle(_ shouldDangle: Bool = true) -> UtxoResult {
        				self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> UtxoResult {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing UtxoResult \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing UtxoResult \(self.instanceNumber) due to dangle.")
						}
					}
			

					

				}

			}
		