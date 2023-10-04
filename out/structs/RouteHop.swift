
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A hop in a route, and additional metadata about it. \"Hop\" is defined as a node and the channel
			/// that leads to it.
			public typealias RouteHop = Bindings.RouteHop

			extension Bindings {
		

				/// A hop in a route, and additional metadata about it. \"Hop\" is defined as a node and the channel
				/// that leads to it.
				public class RouteHop: NativeTypeWrapper {

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

					internal var cType: LDKRouteHop?

					internal init(cType: LDKRouteHop, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKRouteHop, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}

					internal init(cType: LDKRouteHop, instantiationContext: String, anchor: NativeTypeWrapper, dangle: Bool = false) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = dangle
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the RouteHop, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = RouteHop_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The node_id of the node at this hop.
					public func getPubkey() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKRouteHop>) in
				RouteHop_get_pubkey(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = PublicKey(cType: nativeCallResult, instantiationContext: "RouteHop.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// The node_id of the node at this hop.
					public func setPubkey(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = PublicKey(value: val, instantiationContext: "RouteHop.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKRouteHop>) in
				RouteHop_set_pubkey(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The node_announcement features of the node at this hop. For the last hop, these may be
					/// amended to match the features present in the invoice this node generated.
					public func getNodeFeatures() -> NodeFeatures {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKRouteHop>) in
				RouteHop_get_node_features(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = NodeFeatures(cType: nativeCallResult, instantiationContext: "RouteHop.swift::\(#function):\(#line)", anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// The node_announcement features of the node at this hop. For the last hop, these may be
					/// amended to match the features present in the invoice this node generated.
					public func setNodeFeatures(val: NodeFeatures) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKRouteHop>) in
				RouteHop_set_node_features(thisPtrPointer, val.dynamicallyDangledClone().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The channel that should be used from the previous hop to reach this node.
					public func getShortChannelId() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKRouteHop>) in
				RouteHop_get_short_channel_id(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The channel that should be used from the previous hop to reach this node.
					public func setShortChannelId(val: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKRouteHop>) in
				RouteHop_set_short_channel_id(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The channel_announcement features of the channel that should be used from the previous hop
					/// to reach this node.
					public func getChannelFeatures() -> ChannelFeatures {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKRouteHop>) in
				RouteHop_get_channel_features(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ChannelFeatures(cType: nativeCallResult, instantiationContext: "RouteHop.swift::\(#function):\(#line)", anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// The channel_announcement features of the channel that should be used from the previous hop
					/// to reach this node.
					public func setChannelFeatures(val: ChannelFeatures) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKRouteHop>) in
				RouteHop_set_channel_features(thisPtrPointer, val.dynamicallyDangledClone().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The fee taken on this hop (for paying for the use of the *next* channel in the path).
					/// If this is the last hop in [`Path::hops`]:
					/// * if we're sending to a [`BlindedPath`], this is the fee paid for use of the entire blinded path
					/// * otherwise, this is the full value of this [`Path`]'s part of the payment
					/// 
					/// [`BlindedPath`]: crate::blinded_path::BlindedPath
					public func getFeeMsat() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKRouteHop>) in
				RouteHop_get_fee_msat(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The fee taken on this hop (for paying for the use of the *next* channel in the path).
					/// If this is the last hop in [`Path::hops`]:
					/// * if we're sending to a [`BlindedPath`], this is the fee paid for use of the entire blinded path
					/// * otherwise, this is the full value of this [`Path`]'s part of the payment
					/// 
					/// [`BlindedPath`]: crate::blinded_path::BlindedPath
					public func setFeeMsat(val: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKRouteHop>) in
				RouteHop_set_fee_msat(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The CLTV delta added for this hop.
					/// If this is the last hop in [`Path::hops`]:
					/// * if we're sending to a [`BlindedPath`], this is the CLTV delta for the entire blinded path
					/// * otherwise, this is the CLTV delta expected at the destination
					/// 
					/// [`BlindedPath`]: crate::blinded_path::BlindedPath
					public func getCltvExpiryDelta() -> UInt32 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKRouteHop>) in
				RouteHop_get_cltv_expiry_delta(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The CLTV delta added for this hop.
					/// If this is the last hop in [`Path::hops`]:
					/// * if we're sending to a [`BlindedPath`], this is the CLTV delta for the entire blinded path
					/// * otherwise, this is the CLTV delta expected at the destination
					/// 
					/// [`BlindedPath`]: crate::blinded_path::BlindedPath
					public func setCltvExpiryDelta(val: UInt32) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKRouteHop>) in
				RouteHop_set_cltv_expiry_delta(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Indicates whether this hop is possibly announced in the public network graph.
					/// 
					/// Will be `true` if there is a possibility that the channel is publicly known, i.e., if we
					/// either know for sure it's announced in the public graph, or if any public channels exist
					/// for which the given `short_channel_id` could be an alias for. Will be `false` if we believe
					/// the channel to be unannounced.
					/// 
					/// Will be `true` for objects serialized with LDK version 0.0.116 and before.
					public func getMaybeAnnouncedChannel() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKRouteHop>) in
				RouteHop_get_maybe_announced_channel(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Indicates whether this hop is possibly announced in the public network graph.
					/// 
					/// Will be `true` if there is a possibility that the channel is publicly known, i.e., if we
					/// either know for sure it's announced in the public graph, or if any public channels exist
					/// for which the given `short_channel_id` could be an alias for. Will be `false` if we believe
					/// the channel to be unannounced.
					/// 
					/// Will be `true` for objects serialized with LDK version 0.0.116 and before.
					public func setMaybeAnnouncedChannel(val: Bool) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKRouteHop>) in
				RouteHop_set_maybe_announced_channel(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new RouteHop given each field
					public init(pubkeyArg: [UInt8], nodeFeaturesArg: NodeFeatures, shortChannelIdArg: UInt64, channelFeaturesArg: ChannelFeatures, feeMsatArg: UInt64, cltvExpiryDeltaArg: UInt32, maybeAnnouncedChannelArg: Bool) {
						// native call variable prep
						
						let pubkeyArgPrimitiveWrapper = PublicKey(value: pubkeyArg, instantiationContext: "RouteHop.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = RouteHop_new(pubkeyArgPrimitiveWrapper.cType!, nodeFeaturesArg.dynamicallyDangledClone().cType!, shortChannelIdArg, channelFeaturesArg.dynamicallyDangledClone().cType!, feeMsatArg, cltvExpiryDeltaArg, maybeAnnouncedChannelArg)

						// cleanup
						
						// for elided types, we need this
						pubkeyArgPrimitiveWrapper.noOpRetain()
				
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = RouteHop(cType: nativeCallResult, instantiationContext: "RouteHop.swift::\(#function):\(#line)")
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0, instantiationContext: "RouteHop.swift::\(#function):\(#line)")
				
			
					}
		
					/// Creates a copy of the RouteHop
					internal func clone() -> RouteHop {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKRouteHop>) in
				RouteHop_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = RouteHop(cType: nativeCallResult, instantiationContext: "RouteHop.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Generates a non-cryptographic 64-bit hash of the RouteHop.
					public func hash() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (oPointer: UnsafePointer<LDKRouteHop>) in
				RouteHop_hash(oPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if two RouteHops contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public class func eq(a: RouteHop, b: RouteHop) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKRouteHop>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKRouteHop>) in
				RouteHop_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Serialize the RouteHop object into a byte array which can be read by RouteHop_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKRouteHop>) in
				RouteHop_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, instantiationContext: "RouteHop.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a RouteHop from a byte array, created by RouteHop_write
					public class func read(ser: [UInt8]) -> Result_RouteHopDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser, instantiationContext: "RouteHop.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = RouteHop_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_RouteHopDecodeErrorZ(cType: nativeCallResult, instantiationContext: "RouteHop.swift::\(#function):\(#line)")
						

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
		

					
					internal func danglingClone() -> RouteHop {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> RouteHop {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> RouteHop {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> RouteHop {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing RouteHop \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing RouteHop \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
			

				}

				
			}
		
		