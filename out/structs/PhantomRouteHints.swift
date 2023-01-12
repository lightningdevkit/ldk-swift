
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// Route hints used in constructing invoices for [phantom node payents].
			/// 
			/// [phantom node payments]: crate::chain::keysinterface::PhantomKeysManager
			public typealias PhantomRouteHints = Bindings.PhantomRouteHints

			extension Bindings {
		

				/// Route hints used in constructing invoices for [phantom node payents].
				/// 
				/// [phantom node payments]: crate::chain::keysinterface::PhantomKeysManager
				public class PhantomRouteHints: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKPhantomRouteHints?

					internal init(cType: LDKPhantomRouteHints) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKPhantomRouteHints, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the PhantomRouteHints, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = PhantomRouteHints_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The list of channels to be included in the invoice route hints.
					public func getChannels() -> [ChannelDetails] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKPhantomRouteHints>) in
				PhantomRouteHints_get_channels(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_ChannelDetailsZ(cType: nativeCallResult, anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// The list of channels to be included in the invoice route hints.
					public func setChannels(val: [ChannelDetails]) {
						// native call variable prep
						
						let valVector = Vec_ChannelDetailsZ(array: val).dangle()
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKPhantomRouteHints>) in
				PhantomRouteHints_set_channels(thisPtrPointer, valVector.cType!)
						}
				

						// cleanup
						
						// valVector.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// A fake scid used for representing the phantom node's fake channel in generating the invoice
					/// route hints.
					public func getPhantomScid() -> UInt64 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKPhantomRouteHints>) in
				PhantomRouteHints_get_phantom_scid(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// A fake scid used for representing the phantom node's fake channel in generating the invoice
					/// route hints.
					public func setPhantomScid(val: UInt64) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKPhantomRouteHints>) in
				PhantomRouteHints_set_phantom_scid(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The pubkey of the real backing node that would ultimately receive the payment.
					public func getRealNodePubkey() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKPhantomRouteHints>) in
				PhantomRouteHints_get_real_node_pubkey(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = PublicKey(cType: nativeCallResult, anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// The pubkey of the real backing node that would ultimately receive the payment.
					public func setRealNodePubkey(val: [UInt8]) {
						// native call variable prep
						
						let valPrimitiveWrapper = PublicKey(value: val)
				

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKPhantomRouteHints>) in
				PhantomRouteHints_set_real_node_pubkey(thisPtrPointer, valPrimitiveWrapper.cType!)
						}
				

						// cleanup
						
						// for elided types, we need this
						valPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new PhantomRouteHints given each field
					public init(channelsArg: [ChannelDetails], phantomScidArg: UInt64, realNodePubkeyArg: [UInt8]) {
						// native call variable prep
						
						let channelsArgVector = Vec_ChannelDetailsZ(array: channelsArg).dangle()
				
						let realNodePubkeyArgPrimitiveWrapper = PublicKey(value: realNodePubkeyArg)
				

						// native method call
						let nativeCallResult = PhantomRouteHints_new(channelsArgVector.cType!, phantomScidArg, realNodePubkeyArgPrimitiveWrapper.cType!)

						// cleanup
						
						// channelsArgVector.noOpRetain()
				
						// for elided types, we need this
						realNodePubkeyArgPrimitiveWrapper.noOpRetain()
				
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = PhantomRouteHints(cType: nativeCallResult)
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0)
			
					}
		
					/// Creates a copy of the PhantomRouteHints
					internal func clone() -> PhantomRouteHints {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKPhantomRouteHints>) in
				PhantomRouteHints_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = PhantomRouteHints(cType: nativeCallResult)
						

						return returnValue
					}
		
					/// Serialize the PhantomRouteHints object into a byte array which can be read by PhantomRouteHints_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKPhantomRouteHints>) in
				PhantomRouteHints_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a PhantomRouteHints from a byte array, created by PhantomRouteHints_write
					public class func read(ser: [UInt8]) -> Result_PhantomRouteHintsDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser)
				

						// native method call
						let nativeCallResult = PhantomRouteHints_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_PhantomRouteHintsDecodeErrorZ(cType: nativeCallResult)
						

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> PhantomRouteHints {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> PhantomRouteHints {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> PhantomRouteHints {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> PhantomRouteHints {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> PhantomRouteHints {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing PhantomRouteHints \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing PhantomRouteHints \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		