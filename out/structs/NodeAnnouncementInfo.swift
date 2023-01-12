
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Information received in the latest node_announcement from this node.
			public typealias NodeAnnouncementInfo = Bindings.NodeAnnouncementInfo

			extension Bindings {
		

				/// Information received in the latest node_announcement from this node.
				public class NodeAnnouncementInfo: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKNodeAnnouncementInfo?

					internal init(cType: LDKNodeAnnouncementInfo) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKNodeAnnouncementInfo, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the NodeAnnouncementInfo, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = NodeAnnouncementInfo_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Protocol features the node announced support for
					public func getFeatures() -> NodeFeatures {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKNodeAnnouncementInfo>) in
				NodeAnnouncementInfo_get_features(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = NodeFeatures(cType: nativeCallResult, anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// Protocol features the node announced support for
					public func setFeatures(val: NodeFeatures) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKNodeAnnouncementInfo>) in
				NodeAnnouncementInfo_set_features(thisPtrPointer, val.dynamicallyDangledClone().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// When the last known update to the node state was issued.
					/// Value is opaque, as set in the announcement.
					public func getLastUpdate() -> UInt32 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKNodeAnnouncementInfo>) in
				NodeAnnouncementInfo_get_last_update(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// When the last known update to the node state was issued.
					/// Value is opaque, as set in the announcement.
					public func setLastUpdate(val: UInt32) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKNodeAnnouncementInfo>) in
				NodeAnnouncementInfo_set_last_update(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Color assigned to the node
					public func getRgb() -> [UInt8]? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKNodeAnnouncementInfo>) in
				NodeAnnouncementInfo_get_rgb(thisPtrPointer)
						}
				

						// cleanup
						
						guard let nativeCallResult = nativeCallResult else {
							return nil
						}
			

						
						// return value (do some wrapping)
						let returnValue = Bindings.UInt8Tuple3ToArray(tuple: nativeCallResult.pointee)
						

						return returnValue
					}
		
					/// Color assigned to the node
					public func setRgb(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = ThreeBytes(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKNodeAnnouncementInfo>) in
				NodeAnnouncementInfo_set_rgb(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Moniker assigned to the node.
					/// May be invalid or malicious (eg control chars),
					/// should not be exposed to the user.
					public func getAlias() -> NodeAlias {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKNodeAnnouncementInfo>) in
				NodeAnnouncementInfo_get_alias(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = NodeAlias(cType: nativeCallResult, anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// Moniker assigned to the node.
					/// May be invalid or malicious (eg control chars),
					/// should not be exposed to the user.
					public func setAlias(val: NodeAlias) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKNodeAnnouncementInfo>) in
				NodeAnnouncementInfo_set_alias(thisPtrPointer, val.dynamicallyDangledClone().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Internet-level addresses via which one can connect to the node
					/// 
					/// Returns a copy of the field.
					public func getAddresses() -> [NetAddress] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKNodeAnnouncementInfo>) in
				NodeAnnouncementInfo_get_addresses(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_NetAddressZ(cType: nativeCallResult, anchor: self).getValue()
						

						return returnValue
					}
		
					/// Internet-level addresses via which one can connect to the node
					public func setAddresses(val: [NetAddress]) {
						// native call variable prep
						
						let valVector = Vec_NetAddressZ(array: val).dangle()
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKNodeAnnouncementInfo>) in
				NodeAnnouncementInfo_set_addresses(thisPtrPointer, valVector.cType!)
						}
				

						// cleanup
						
						// valVector.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// An initial announcement of the node
					/// Mostly redundant with the data we store in fields explicitly.
					/// Everything else is useful only for sending out for initial routing sync.
					/// Not stored if contains excess data to prevent DoS.
					/// 
					/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func getAnnouncementMessage() -> NodeAnnouncement? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKNodeAnnouncementInfo>) in
				NodeAnnouncementInfo_get_announcement_message(thisPtrPointer)
						}
				

						// cleanup
						
				// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
				// Type group: RustStruct
				// Type: LDKNodeAnnouncement
			
					if nativeCallResult.inner == nil {
						return nil
					}

					let pointerValue = UInt(bitPattern: nativeCallResult.inner)
					if pointerValue == 0 {
						return nil
					}
				

						
						// return value (do some wrapping)
						let returnValue = NodeAnnouncement(cType: nativeCallResult, anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// An initial announcement of the node
					/// Mostly redundant with the data we store in fields explicitly.
					/// Everything else is useful only for sending out for initial routing sync.
					/// Not stored if contains excess data to prevent DoS.
					/// 
					/// Note that val (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func setAnnouncementMessage(val: NodeAnnouncement) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKNodeAnnouncementInfo>) in
				NodeAnnouncementInfo_set_announcement_message(thisPtrPointer, val.dynamicallyDangledClone().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new NodeAnnouncementInfo given each field
					public init(featuresArg: NodeFeatures, lastUpdateArg: UInt32, rgbArg: [UInt8], aliasArg: NodeAlias, addressesArg: [NetAddress], announcementMessageArg: NodeAnnouncement) {
						// native call variable prep
						
						let rgbArgPrimitiveWrapper = ThreeBytes(value: rgbArg)
				
						let addressesArgVector = Vec_NetAddressZ(array: addressesArg).dangle()
				

						// native method call
						let nativeCallResult = NodeAnnouncementInfo_new(featuresArg.dynamicallyDangledClone().cType!, lastUpdateArg, rgbArgPrimitiveWrapper.cType!, aliasArg.dynamicallyDangledClone().cType!, addressesArgVector.cType!, announcementMessageArg.dynamicallyDangledClone().cType!)

						// cleanup
						
						// for elided types, we need this
						rgbArgPrimitiveWrapper.noOpRetain()
				
						// addressesArgVector.noOpRetain()
				
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = NodeAnnouncementInfo(cType: nativeCallResult)
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		
					/// Creates a copy of the NodeAnnouncementInfo
					internal func clone() -> NodeAnnouncementInfo {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKNodeAnnouncementInfo>) in
				NodeAnnouncementInfo_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = NodeAnnouncementInfo(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Checks if two NodeAnnouncementInfos contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public class func eq(a: NodeAnnouncementInfo, b: NodeAnnouncementInfo) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKNodeAnnouncementInfo>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKNodeAnnouncementInfo>) in
				NodeAnnouncementInfo_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Serialize the NodeAnnouncementInfo object into a byte array which can be read by NodeAnnouncementInfo_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKNodeAnnouncementInfo>) in
				NodeAnnouncementInfo_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a NodeAnnouncementInfo from a byte array, created by NodeAnnouncementInfo_write
					public class func read(ser: [UInt8]) -> Result_NodeAnnouncementInfoDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = NodeAnnouncementInfo_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_NodeAnnouncementInfoDecodeErrorZ(cType: nativeCallResult)
						

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> NodeAnnouncementInfo {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> NodeAnnouncementInfo {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> NodeAnnouncementInfo {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> NodeAnnouncementInfo {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> NodeAnnouncementInfo {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing NodeAnnouncementInfo \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing NodeAnnouncementInfo \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		