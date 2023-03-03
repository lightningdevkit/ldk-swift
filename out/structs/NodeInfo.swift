
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Details about a node in the network, known from the network announcement.
			public typealias NodeInfo = Bindings.NodeInfo

			extension Bindings {
		

				/// Details about a node in the network, known from the network announcement.
				public class NodeInfo: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKNodeInfo?

					internal init(cType: LDKNodeInfo) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKNodeInfo, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the NodeInfo, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = NodeInfo_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// All valid channels a node has announced
					/// 
					/// Returns a copy of the field.
					public func getChannels() -> [UInt64] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKNodeInfo>) in
				NodeInfo_get_channels(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u64Z(cType: nativeCallResult, anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// All valid channels a node has announced
					public func setChannels(val: [UInt64]) {
						// native call variable prep
						
						let valVector = Vec_u64Z(array: val).dangle()
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKNodeInfo>) in
				NodeInfo_set_channels(thisPtrPointer, valVector.cType!)
						}
				

						// cleanup
						
						// valVector.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// More information about a node from node_announcement.
					/// Optional because we store a Node entry after learning about it from
					/// a channel announcement, but before receiving a node announcement.
					/// 
					/// Note that the return value (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func getAnnouncementInfo() -> NodeAnnouncementInfo? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKNodeInfo>) in
				NodeInfo_get_announcement_info(thisPtrPointer)
						}
				

						// cleanup
						
				// COMMENT-DEDUCED OPTIONAL INFERENCE AND HANDLING:
				// Type group: RustStruct
				// Type: LDKNodeAnnouncementInfo
			
					if nativeCallResult.inner == nil {
						return nil
					}

					let pointerValue = UInt(bitPattern: nativeCallResult.inner)
					if pointerValue == 0 {
						return nil
					}
				

						
						// return value (do some wrapping)
						let returnValue = NodeAnnouncementInfo(cType: nativeCallResult, anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// More information about a node from node_announcement.
					/// Optional because we store a Node entry after learning about it from
					/// a channel announcement, but before receiving a node announcement.
					/// 
					/// Note that val (or a relevant inner pointer) may be NULL or all-0s to represent None
					public func setAnnouncementInfo(val: NodeAnnouncementInfo) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKNodeInfo>) in
				NodeInfo_set_announcement_info(thisPtrPointer, val.dynamicallyDangledClone().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new NodeInfo given each field
					public init(channelsArg: [UInt64], announcementInfoArg: NodeAnnouncementInfo) {
						// native call variable prep
						
						let channelsArgVector = Vec_u64Z(array: channelsArg).dangle()
				

						// native method call
						let nativeCallResult = NodeInfo_new(channelsArgVector.cType!, announcementInfoArg.dynamicallyDangledClone().cType!)

						// cleanup
						
						// channelsArgVector.noOpRetain()
				
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = NodeInfo(cType: nativeCallResult)
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		
					/// Creates a copy of the NodeInfo
					internal func clone() -> NodeInfo {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKNodeInfo>) in
				NodeInfo_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = NodeInfo(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Checks if two NodeInfos contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public class func eq(a: NodeInfo, b: NodeInfo) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKNodeInfo>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKNodeInfo>) in
				NodeInfo_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Serialize the NodeInfo object into a byte array which can be read by NodeInfo_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKNodeInfo>) in
				NodeInfo_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a NodeInfo from a byte array, created by NodeInfo_write
					public class func read(ser: [UInt8]) -> Result_NodeInfoDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = NodeInfo_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_NodeInfoDecodeErrorZ(cType: nativeCallResult)
						

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> NodeInfo {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> NodeInfo {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> NodeInfo {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> NodeInfo {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> NodeInfo {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing NodeInfo \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing NodeInfo \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		