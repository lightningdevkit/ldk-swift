
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// An [`init`] message to be sent to or received from a peer.
			/// 
			/// [`init`]: https://github.com/lightning/bolts/blob/master/01-messaging.md#the-init-message
			public typealias BindingsInit = Bindings.BindingsInit

			extension Bindings {
		

				/// An [`init`] message to be sent to or received from a peer.
				/// 
				/// [`init`]: https://github.com/lightning/bolts/blob/master/01-messaging.md#the-init-message
				public class BindingsInit: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKInit?

					internal init(cType: LDKInit) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKInit, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the Init, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Init_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The relevant features which the sender supports.
					public func getFeatures() -> InitFeatures {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKInit>) in
				Init_get_features(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = InitFeatures(cType: nativeCallResult, anchor: self).dangle(false)
						

						return returnValue
					}
		
					/// The relevant features which the sender supports.
					public func setFeatures(val: InitFeatures) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKInit>) in
				Init_set_features(thisPtrPointer, val.dynamicallyDangledClone().cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The receipient's network address.
					/// 
					/// This adds the option to report a remote IP address back to a connecting peer using the init
					/// message. A node can decide to use that information to discover a potential update to its
					/// public IPv4 address (NAT) and use that for a [`NodeAnnouncement`] update message containing
					/// the new address.
					public func getRemoteNetworkAddress() -> NetAddress? {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKInit>) in
				Init_get_remote_network_address(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Option_NetAddressZ(cType: nativeCallResult, anchor: self).getValue()
						

						return returnValue
					}
		
					/// The receipient's network address.
					/// 
					/// This adds the option to report a remote IP address back to a connecting peer using the init
					/// message. A node can decide to use that information to discover a potential update to its
					/// public IPv4 address (NAT) and use that for a [`NodeAnnouncement`] update message containing
					/// the new address.
					public func setRemoteNetworkAddress(val: NetAddress?) {
						// native call variable prep
						
						let valOption = Option_NetAddressZ(some: val).danglingClone()
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKInit>) in
				Init_set_remote_network_address(thisPtrPointer, valOption.cType!)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new Init given each field
					public init(featuresArg: InitFeatures, remoteNetworkAddressArg: NetAddress?) {
						// native call variable prep
						
						let remoteNetworkAddressArgOption = Option_NetAddressZ(some: remoteNetworkAddressArg).danglingClone()
				

						// native method call
						let nativeCallResult = Init_new(featuresArg.dynamicallyDangledClone().cType!, remoteNetworkAddressArgOption.cType!)

						// cleanup
						
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = BindingsInit(cType: nativeCallResult)
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
				
			
					}
		
					/// Creates a copy of the Init
					internal func clone() -> BindingsInit {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKInit>) in
				Init_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = BindingsInit(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Checks if two Inits contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public class func eq(a: BindingsInit, b: BindingsInit) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKInit>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKInit>) in
				Init_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Serialize the Init object into a byte array which can be read by Init_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKInit>) in
				Init_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a Init from a byte array, created by Init_write
					public class func read(ser: [UInt8]) -> Result_InitDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = Init_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_InitDecodeErrorZ(cType: nativeCallResult)
						

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> BindingsInit {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> BindingsInit {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> BindingsInit {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> BindingsInit {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> BindingsInit {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing BindingsInit \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing BindingsInit \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		