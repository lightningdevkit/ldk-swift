
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A [`channel_announcement`] message to be sent to or received from a peer.
			/// 
			/// [`channel_announcement`]: https://github.com/lightning/bolts/blob/master/07-routing-gossip.md#the-channel_announcement-message
			public typealias ChannelAnnouncement = Bindings.ChannelAnnouncement

			extension Bindings {
		

				/// A [`channel_announcement`] message to be sent to or received from a peer.
				/// 
				/// [`channel_announcement`]: https://github.com/lightning/bolts/blob/master/07-routing-gossip.md#the-channel_announcement-message
				public class ChannelAnnouncement: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKChannelAnnouncement?

					internal init(cType: LDKChannelAnnouncement) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKChannelAnnouncement, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the ChannelAnnouncement, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ChannelAnnouncement_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Authentication of the announcement by the first public node
					public func getNodeSignature1() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelAnnouncement>) in
				ChannelAnnouncement_get_node_signature_1(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Signature(cType: nativeCallResult, anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Authentication of the announcement by the first public node
					public func setNodeSignature1(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = Signature(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelAnnouncement>) in
				ChannelAnnouncement_set_node_signature_1(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Authentication of the announcement by the second public node
					public func getNodeSignature2() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelAnnouncement>) in
				ChannelAnnouncement_get_node_signature_2(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Signature(cType: nativeCallResult, anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Authentication of the announcement by the second public node
					public func setNodeSignature2(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = Signature(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelAnnouncement>) in
				ChannelAnnouncement_set_node_signature_2(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Proof of funding UTXO ownership by the first public node
					public func getBitcoinSignature1() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelAnnouncement>) in
				ChannelAnnouncement_get_bitcoin_signature_1(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Signature(cType: nativeCallResult, anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Proof of funding UTXO ownership by the first public node
					public func setBitcoinSignature1(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = Signature(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelAnnouncement>) in
				ChannelAnnouncement_set_bitcoin_signature_1(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Proof of funding UTXO ownership by the second public node
					public func getBitcoinSignature2() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelAnnouncement>) in
				ChannelAnnouncement_get_bitcoin_signature_2(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Signature(cType: nativeCallResult, anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Proof of funding UTXO ownership by the second public node
					public func setBitcoinSignature2(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = Signature(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelAnnouncement>) in
				ChannelAnnouncement_set_bitcoin_signature_2(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The actual announcement
					public func getContents() -> UnsignedChannelAnnouncement {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelAnnouncement>) in
				ChannelAnnouncement_get_contents(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = UnsignedChannelAnnouncement(cType: nativeCallResult, anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// The actual announcement
					public func setContents(val: UnsignedChannelAnnouncement) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelAnnouncement>) in
				ChannelAnnouncement_set_contents(thisPtrPointer, val.dynamicallyDangledClone().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new ChannelAnnouncement given each field
					public init(nodeSignature1Arg: [UInt8], nodeSignature2Arg: [UInt8], bitcoinSignature1Arg: [UInt8], bitcoinSignature2Arg: [UInt8], contentsArg: UnsignedChannelAnnouncement) {
						// native call variable prep
						
						let nodeSignature1ArgPrimitiveWrapper = Signature(value: nodeSignature1Arg)
				
						let nodeSignature2ArgPrimitiveWrapper = Signature(value: nodeSignature2Arg)
				
						let bitcoinSignature1ArgPrimitiveWrapper = Signature(value: bitcoinSignature1Arg)
				
						let bitcoinSignature2ArgPrimitiveWrapper = Signature(value: bitcoinSignature2Arg)
				

						// native method call
						let nativeCallResult = ChannelAnnouncement_new(nodeSignature1ArgPrimitiveWrapper.cType!, nodeSignature2ArgPrimitiveWrapper.cType!, bitcoinSignature1ArgPrimitiveWrapper.cType!, bitcoinSignature2ArgPrimitiveWrapper.cType!, contentsArg.dynamicallyDangledClone().cType!)

						// cleanup
						
						// for elided types, we need this
						nodeSignature1ArgPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						nodeSignature2ArgPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						bitcoinSignature1ArgPrimitiveWrapper.noOpRetain()
				
						// for elided types, we need this
						bitcoinSignature2ArgPrimitiveWrapper.noOpRetain()
				
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = ChannelAnnouncement(cType: nativeCallResult)
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		
					/// Creates a copy of the ChannelAnnouncement
					internal func clone() -> ChannelAnnouncement {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKChannelAnnouncement>) in
				ChannelAnnouncement_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ChannelAnnouncement(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Checks if two ChannelAnnouncements contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public class func eq(a: ChannelAnnouncement, b: ChannelAnnouncement) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKChannelAnnouncement>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKChannelAnnouncement>) in
				ChannelAnnouncement_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Serialize the ChannelAnnouncement object into a byte array which can be read by ChannelAnnouncement_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKChannelAnnouncement>) in
				ChannelAnnouncement_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a ChannelAnnouncement from a byte array, created by ChannelAnnouncement_write
					public class func read(ser: [UInt8]) -> Result_ChannelAnnouncementDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = ChannelAnnouncement_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_ChannelAnnouncementDecodeErrorZ(cType: nativeCallResult)
						

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> ChannelAnnouncement {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> ChannelAnnouncement {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> ChannelAnnouncement {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> ChannelAnnouncement {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> ChannelAnnouncement {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing ChannelAnnouncement \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing ChannelAnnouncement \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		