
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Features used within a `node_announcement` message.
			public typealias NodeFeatures = Bindings.NodeFeatures

			extension Bindings {
		

				/// Features used within a `node_announcement` message.
				public class NodeFeatures: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKNodeFeatures?

					internal init(cType: LDKNodeFeatures) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKNodeFeatures, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Checks if two NodeFeaturess contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public class func eq(a: NodeFeatures, b: NodeFeatures) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKNodeFeatures>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKNodeFeatures>) in
				NodeFeatures_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Creates a copy of the NodeFeatures
					internal func clone() -> NodeFeatures {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKNodeFeatures>) in
				NodeFeatures_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = NodeFeatures(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Frees any resources used by the NodeFeatures, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = NodeFeatures_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Create a blank Features with no features set
					public class func initWithEmpty() -> NodeFeatures {
						// native call variable prep
						

						// native method call
						let nativeCallResult = NodeFeatures_empty()

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = NodeFeatures(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Returns true if this `Features` object contains unknown feature flags which are set as
					/// \"required\".
					public func requiresUnknownBits() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNodeFeatures>) in
				NodeFeatures_requires_unknown_bits(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Serialize the NodeFeatures object into a byte array which can be read by NodeFeatures_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKNodeFeatures>) in
				NodeFeatures_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a NodeFeatures from a byte array, created by NodeFeatures_write
					public class func read(ser: [UInt8]) -> Result_NodeFeaturesDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = NodeFeatures_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_NodeFeaturesDecodeErrorZ(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Set this feature as optional.
					public func setDataLossProtectOptional() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKNodeFeatures>) in
				NodeFeatures_set_data_loss_protect_optional(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Set this feature as required.
					public func setDataLossProtectRequired() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKNodeFeatures>) in
				NodeFeatures_set_data_loss_protect_required(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if this feature is supported.
					public func supportsDataLossProtect() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNodeFeatures>) in
				NodeFeatures_supports_data_loss_protect(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if this feature is required.
					public func requiresDataLossProtect() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNodeFeatures>) in
				NodeFeatures_requires_data_loss_protect(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Set this feature as optional.
					public func setUpfrontShutdownScriptOptional() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKNodeFeatures>) in
				NodeFeatures_set_upfront_shutdown_script_optional(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Set this feature as required.
					public func setUpfrontShutdownScriptRequired() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKNodeFeatures>) in
				NodeFeatures_set_upfront_shutdown_script_required(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if this feature is supported.
					public func supportsUpfrontShutdownScript() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNodeFeatures>) in
				NodeFeatures_supports_upfront_shutdown_script(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if this feature is required.
					public func requiresUpfrontShutdownScript() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNodeFeatures>) in
				NodeFeatures_requires_upfront_shutdown_script(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Set this feature as optional.
					public func setGossipQueriesOptional() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKNodeFeatures>) in
				NodeFeatures_set_gossip_queries_optional(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Set this feature as required.
					public func setGossipQueriesRequired() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKNodeFeatures>) in
				NodeFeatures_set_gossip_queries_required(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if this feature is supported.
					public func supportsGossipQueries() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNodeFeatures>) in
				NodeFeatures_supports_gossip_queries(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if this feature is required.
					public func requiresGossipQueries() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNodeFeatures>) in
				NodeFeatures_requires_gossip_queries(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Set this feature as optional.
					public func setVariableLengthOnionOptional() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKNodeFeatures>) in
				NodeFeatures_set_variable_length_onion_optional(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Set this feature as required.
					public func setVariableLengthOnionRequired() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKNodeFeatures>) in
				NodeFeatures_set_variable_length_onion_required(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if this feature is supported.
					public func supportsVariableLengthOnion() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNodeFeatures>) in
				NodeFeatures_supports_variable_length_onion(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if this feature is required.
					public func requiresVariableLengthOnion() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNodeFeatures>) in
				NodeFeatures_requires_variable_length_onion(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Set this feature as optional.
					public func setStaticRemoteKeyOptional() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKNodeFeatures>) in
				NodeFeatures_set_static_remote_key_optional(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Set this feature as required.
					public func setStaticRemoteKeyRequired() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKNodeFeatures>) in
				NodeFeatures_set_static_remote_key_required(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if this feature is supported.
					public func supportsStaticRemoteKey() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNodeFeatures>) in
				NodeFeatures_supports_static_remote_key(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if this feature is required.
					public func requiresStaticRemoteKey() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNodeFeatures>) in
				NodeFeatures_requires_static_remote_key(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Set this feature as optional.
					public func setPaymentSecretOptional() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKNodeFeatures>) in
				NodeFeatures_set_payment_secret_optional(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Set this feature as required.
					public func setPaymentSecretRequired() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKNodeFeatures>) in
				NodeFeatures_set_payment_secret_required(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if this feature is supported.
					public func supportsPaymentSecret() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNodeFeatures>) in
				NodeFeatures_supports_payment_secret(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if this feature is required.
					public func requiresPaymentSecret() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNodeFeatures>) in
				NodeFeatures_requires_payment_secret(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Set this feature as optional.
					public func setBasicMppOptional() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKNodeFeatures>) in
				NodeFeatures_set_basic_mpp_optional(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Set this feature as required.
					public func setBasicMppRequired() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKNodeFeatures>) in
				NodeFeatures_set_basic_mpp_required(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if this feature is supported.
					public func supportsBasicMpp() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNodeFeatures>) in
				NodeFeatures_supports_basic_mpp(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if this feature is required.
					public func requiresBasicMpp() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNodeFeatures>) in
				NodeFeatures_requires_basic_mpp(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Set this feature as optional.
					public func setWumboOptional() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKNodeFeatures>) in
				NodeFeatures_set_wumbo_optional(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Set this feature as required.
					public func setWumboRequired() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKNodeFeatures>) in
				NodeFeatures_set_wumbo_required(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if this feature is supported.
					public func supportsWumbo() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNodeFeatures>) in
				NodeFeatures_supports_wumbo(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if this feature is required.
					public func requiresWumbo() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNodeFeatures>) in
				NodeFeatures_requires_wumbo(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Set this feature as optional.
					public func setShutdownAnySegwitOptional() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKNodeFeatures>) in
				NodeFeatures_set_shutdown_any_segwit_optional(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Set this feature as required.
					public func setShutdownAnySegwitRequired() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKNodeFeatures>) in
				NodeFeatures_set_shutdown_any_segwit_required(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if this feature is supported.
					public func supportsShutdownAnysegwit() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNodeFeatures>) in
				NodeFeatures_supports_shutdown_anysegwit(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if this feature is required.
					public func requiresShutdownAnysegwit() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNodeFeatures>) in
				NodeFeatures_requires_shutdown_anysegwit(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Set this feature as optional.
					public func setOnionMessagesOptional() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKNodeFeatures>) in
				NodeFeatures_set_onion_messages_optional(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Set this feature as required.
					public func setOnionMessagesRequired() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKNodeFeatures>) in
				NodeFeatures_set_onion_messages_required(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if this feature is supported.
					public func supportsOnionMessages() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNodeFeatures>) in
				NodeFeatures_supports_onion_messages(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if this feature is required.
					public func requiresOnionMessages() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNodeFeatures>) in
				NodeFeatures_requires_onion_messages(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Set this feature as optional.
					public func setChannelTypeOptional() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKNodeFeatures>) in
				NodeFeatures_set_channel_type_optional(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Set this feature as required.
					public func setChannelTypeRequired() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKNodeFeatures>) in
				NodeFeatures_set_channel_type_required(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if this feature is supported.
					public func supportsChannelType() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNodeFeatures>) in
				NodeFeatures_supports_channel_type(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if this feature is required.
					public func requiresChannelType() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNodeFeatures>) in
				NodeFeatures_requires_channel_type(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Set this feature as optional.
					public func setScidPrivacyOptional() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKNodeFeatures>) in
				NodeFeatures_set_scid_privacy_optional(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Set this feature as required.
					public func setScidPrivacyRequired() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKNodeFeatures>) in
				NodeFeatures_set_scid_privacy_required(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if this feature is supported.
					public func supportsScidPrivacy() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNodeFeatures>) in
				NodeFeatures_supports_scid_privacy(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if this feature is required.
					public func requiresScidPrivacy() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNodeFeatures>) in
				NodeFeatures_requires_scid_privacy(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Set this feature as optional.
					public func setZeroConfOptional() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKNodeFeatures>) in
				NodeFeatures_set_zero_conf_optional(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Set this feature as required.
					public func setZeroConfRequired() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKNodeFeatures>) in
				NodeFeatures_set_zero_conf_required(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if this feature is supported.
					public func supportsZeroConf() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNodeFeatures>) in
				NodeFeatures_supports_zero_conf(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if this feature is required.
					public func requiresZeroConf() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNodeFeatures>) in
				NodeFeatures_requires_zero_conf(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Set this feature as optional.
					public func setKeysendOptional() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKNodeFeatures>) in
				NodeFeatures_set_keysend_optional(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Set this feature as required.
					public func setKeysendRequired() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisArgPointer: UnsafeMutablePointer<LDKNodeFeatures>) in
				NodeFeatures_set_keysend_required(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if this feature is supported.
					public func supportsKeysend() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNodeFeatures>) in
				NodeFeatures_supports_keysend(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Checks if this feature is required.
					public func requiresKeysend() -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisArgPointer: UnsafePointer<LDKNodeFeatures>) in
				NodeFeatures_requires_keysend(thisArgPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> NodeFeatures {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> NodeFeatures {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> NodeFeatures {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> NodeFeatures {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> NodeFeatures {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing NodeFeatures \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing NodeFeatures \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		