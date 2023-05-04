
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A [`gossip_timestamp_filter`] message is used by a node to request
			/// gossip relay for messages in the requested time range when the
			/// `gossip_queries` feature has been negotiated.
			/// 
			/// [`gossip_timestamp_filter`]: https://github.com/lightning/bolts/blob/master/07-routing-gossip.md#the-gossip_timestamp_filter-message
			public typealias GossipTimestampFilter = Bindings.GossipTimestampFilter

			extension Bindings {
		

				/// A [`gossip_timestamp_filter`] message is used by a node to request
				/// gossip relay for messages in the requested time range when the
				/// `gossip_queries` feature has been negotiated.
				/// 
				/// [`gossip_timestamp_filter`]: https://github.com/lightning/bolts/blob/master/07-routing-gossip.md#the-gossip_timestamp_filter-message
				public class GossipTimestampFilter: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					public static var enableDeinitLogging = true
					public static var suspendFreedom = false
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKGossipTimestampFilter?

					internal init(cType: LDKGossipTimestampFilter, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKGossipTimestampFilter, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the GossipTimestampFilter, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = GossipTimestampFilter_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The genesis hash of the blockchain for channel and node information
					public func getChainHash() -> [UInt8]? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKGossipTimestampFilter>) in
				GossipTimestampFilter_get_chain_hash(thisPtrPointer)
						}
				

						// cleanup
						
						guard let nativeCallResult = nativeCallResult else {
							return nil
						}
			

						
						// return value (do some wrapping)
						let returnValue = Bindings.UInt8Tuple32ToArray(tuple: nativeCallResult.pointee)
						

						return returnValue
					}
		
					/// The genesis hash of the blockchain for channel and node information
					public func setChainHash(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = ThirtyTwoBytes(value: val, instantiationContext: "GossipTimestampFilter.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKGossipTimestampFilter>) in
				GossipTimestampFilter_set_chain_hash(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The starting unix timestamp
					public func getFirstTimestamp() -> UInt32 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKGossipTimestampFilter>) in
				GossipTimestampFilter_get_first_timestamp(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The starting unix timestamp
					public func setFirstTimestamp(val: UInt32) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKGossipTimestampFilter>) in
				GossipTimestampFilter_set_first_timestamp(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The range of information in seconds
					public func getTimestampRange() -> UInt32 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKGossipTimestampFilter>) in
				GossipTimestampFilter_get_timestamp_range(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The range of information in seconds
					public func setTimestampRange(val: UInt32) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKGossipTimestampFilter>) in
				GossipTimestampFilter_set_timestamp_range(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new GossipTimestampFilter given each field
					public init(chainHashArg: [UInt8], firstTimestampArg: UInt32, timestampRangeArg: UInt32) {
						// native call variable prep
						
						let chainHashArgPrimitiveWrapper = ThirtyTwoBytes(value: chainHashArg, instantiationContext: "GossipTimestampFilter.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = GossipTimestampFilter_new(chainHashArgPrimitiveWrapper.cType!, firstTimestampArg, timestampRangeArg)

						// cleanup
						
						// for elided types, we need this
						chainHashArgPrimitiveWrapper.noOpRetain()
				
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = GossipTimestampFilter(cType: nativeCallResult, instantiationContext: "GossipTimestampFilter.swift::\(#function):\(#line)")
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0, instantiationContext: "GossipTimestampFilter.swift::\(#function):\(#line)")
				
			
					}
		
					/// Creates a copy of the GossipTimestampFilter
					internal func clone() -> GossipTimestampFilter {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKGossipTimestampFilter>) in
				GossipTimestampFilter_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = GossipTimestampFilter(cType: nativeCallResult, instantiationContext: "GossipTimestampFilter.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Checks if two GossipTimestampFilters contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public class func eq(a: GossipTimestampFilter, b: GossipTimestampFilter) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKGossipTimestampFilter>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKGossipTimestampFilter>) in
				GossipTimestampFilter_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Serialize the GossipTimestampFilter object into a byte array which can be read by GossipTimestampFilter_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKGossipTimestampFilter>) in
				GossipTimestampFilter_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, instantiationContext: "GossipTimestampFilter.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a GossipTimestampFilter from a byte array, created by GossipTimestampFilter_write
					public class func read(ser: [UInt8]) -> Result_GossipTimestampFilterDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser, instantiationContext: "GossipTimestampFilter.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = GossipTimestampFilter_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_GossipTimestampFilterDecodeErrorZ(cType: nativeCallResult, instantiationContext: "GossipTimestampFilter.swift::\(#function):\(#line)")
						

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> GossipTimestampFilter {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> GossipTimestampFilter {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> GossipTimestampFilter {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> GossipTimestampFilter {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> GossipTimestampFilter {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing GossipTimestampFilter \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing GossipTimestampFilter \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

				}

				
			}
		
		