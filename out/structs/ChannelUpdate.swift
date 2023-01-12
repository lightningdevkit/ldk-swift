
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A channel_update message to be sent or received from a peer
			public typealias ChannelUpdate = Bindings.ChannelUpdate

			extension Bindings {
		

				/// A channel_update message to be sent or received from a peer
				public class ChannelUpdate: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKChannelUpdate?

					internal init(cType: LDKChannelUpdate) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKChannelUpdate, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the ChannelUpdate, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = ChannelUpdate_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// A signature of the channel update
					public func getSignature() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelUpdate>) in
				ChannelUpdate_get_signature(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Signature(cType: nativeCallResult, anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// A signature of the channel update
					public func setSignature(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = Signature(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelUpdate>) in
				ChannelUpdate_set_signature(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The actual channel update
					public func getContents() -> UnsignedChannelUpdate {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKChannelUpdate>) in
				ChannelUpdate_get_contents(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = UnsignedChannelUpdate(cType: nativeCallResult, anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// The actual channel update
					public func setContents(val: UnsignedChannelUpdate) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKChannelUpdate>) in
				ChannelUpdate_set_contents(thisPtrPointer, val.dynamicallyDangledClone().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new ChannelUpdate given each field
					public init(signatureArg: [UInt8], contentsArg: UnsignedChannelUpdate) {
						// native call variable prep
						
						let signatureArgPrimitiveWrapper = Signature(value: signatureArg)
				

						// native method call
						let nativeCallResult = ChannelUpdate_new(signatureArgPrimitiveWrapper.cType!, contentsArg.dynamicallyDangledClone().cType!)

						// cleanup
						
						// for elided types, we need this
						signatureArgPrimitiveWrapper.noOpRetain()
				
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = ChannelUpdate(cType: nativeCallResult)
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		
					/// Creates a copy of the ChannelUpdate
					internal func clone() -> ChannelUpdate {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKChannelUpdate>) in
				ChannelUpdate_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = ChannelUpdate(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Checks if two ChannelUpdates contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public class func eq(a: ChannelUpdate, b: ChannelUpdate) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKChannelUpdate>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKChannelUpdate>) in
				ChannelUpdate_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Serialize the ChannelUpdate object into a byte array which can be read by ChannelUpdate_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKChannelUpdate>) in
				ChannelUpdate_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a ChannelUpdate from a byte array, created by ChannelUpdate_write
					public class func read(ser: [UInt8]) -> Result_ChannelUpdateDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = ChannelUpdate_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_ChannelUpdateDecodeErrorZ(cType: nativeCallResult)
						

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> ChannelUpdate {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> ChannelUpdate {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> ChannelUpdate {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> ChannelUpdate {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> ChannelUpdate {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing ChannelUpdate \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing ChannelUpdate \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		