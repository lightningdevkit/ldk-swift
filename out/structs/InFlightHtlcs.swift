
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A data structure for tracking in-flight HTLCs. May be used during pathfinding to account for
			/// in-use channel liquidity.
			public typealias InFlightHtlcs = Bindings.InFlightHtlcs

			extension Bindings {
		

				/// A data structure for tracking in-flight HTLCs. May be used during pathfinding to account for
				/// in-use channel liquidity.
				public class InFlightHtlcs: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKInFlightHtlcs?

					internal init(cType: LDKInFlightHtlcs) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKInFlightHtlcs, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the InFlightHtlcs, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = InFlightHtlcs_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the InFlightHtlcs
					internal func clone() -> InFlightHtlcs {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKInFlightHtlcs>) in
				InFlightHtlcs_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = InFlightHtlcs(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Constructs an empty `InFlightHtlcs`.
					public init() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = InFlightHtlcs_new()

						// cleanup
						
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = InFlightHtlcs(cType: nativeCallResult)
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
				
			
					}
		
					/// Takes in a path with payer's node id and adds the path's details to `InFlightHtlcs`.
					public func processPath(path: Path, payerNodeId: [UInt8]) {
						// native call variable prep
						
						let payerNodeIdPrimitiveWrapper = PublicKey(value: payerNodeId)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKInFlightHtlcs>) in
				
						withUnsafePointer(to: path.cType!) { (pathPointer: UnsafePointer<LDKPath>) in
				InFlightHtlcs_process_path(thisArgPointer, pathPointer, payerNodeIdPrimitiveWrapper.cType!)
						}
				
						}
				

						// cleanup
						
						// for elided types, we need this
						payerNodeIdPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Returns liquidity in msat given the public key of the HTLC source, target, and short channel
					/// id.
					public func usedLiquidityMsat(source: NodeId, target: NodeId, channelScid: UInt64) -> UInt64? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKInFlightHtlcs>) in
				
						withUnsafePointer(to: source.cType!) { (sourcePointer: UnsafePointer<LDKNodeId>) in
				
						withUnsafePointer(to: target.cType!) { (targetPointer: UnsafePointer<LDKNodeId>) in
				InFlightHtlcs_used_liquidity_msat(thisArgPointer, sourcePointer, targetPointer, channelScid)
						}
				
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Option_u64Z(cType: nativeCallResult, anchor: self).getValue()
						

						return returnValue
					}
		
					/// Serialize the InFlightHtlcs object into a byte array which can be read by InFlightHtlcs_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKInFlightHtlcs>) in
				InFlightHtlcs_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a InFlightHtlcs from a byte array, created by InFlightHtlcs_write
					public class func read(ser: [UInt8]) -> Result_InFlightHtlcsDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = InFlightHtlcs_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_InFlightHtlcsDecodeErrorZ(cType: nativeCallResult)
						

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> InFlightHtlcs {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> InFlightHtlcs {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> InFlightHtlcs {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> InFlightHtlcs {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> InFlightHtlcs {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing InFlightHtlcs \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing InFlightHtlcs \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		