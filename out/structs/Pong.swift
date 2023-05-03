
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A [`pong`] message to be sent to or received from a peer.
			/// 
			/// [`pong`]: https://github.com/lightning/bolts/blob/master/01-messaging.md#the-ping-and-pong-messages
			public typealias Pong = Bindings.Pong

			extension Bindings {
		

				/// A [`pong`] message to be sent to or received from a peer.
				/// 
				/// [`pong`]: https://github.com/lightning/bolts/blob/master/01-messaging.md#the-ping-and-pong-messages
				public class Pong: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKPong?

					internal init(cType: LDKPong, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKPong, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the Pong, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Pong_free(self.cType!)

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The pong packet size.
					/// 
					/// This field is not sent on the wire. byteslen zeros are sent.
					public func getByteslen() -> UInt16 {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (thisPtrPointer: UnsafePointer<LDKPong>) in
				Pong_get_byteslen(thisPtrPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// The pong packet size.
					/// 
					/// This field is not sent on the wire. byteslen zeros are sent.
					public func setByteslen(val: UInt16) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafeMutablePointer(to: &self.cType!) { (thisPtrPointer: UnsafeMutablePointer<LDKPong>) in
				Pong_set_byteslen(thisPtrPointer, val)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Constructs a new Pong given each field
					public init(byteslenArg: UInt16) {
						// native call variable prep
						

						// native method call
						let nativeCallResult = Pong_new(byteslenArg)

						// cleanup
						
				self.initialCFreeability = nativeCallResult.is_owned
			

						/*
						// return value (do some wrapping)
						let returnValue = Pong(cType: nativeCallResult, instantiationContext: "Pong.swift::\(#function):\(#line)")
						*/

						
				self.cType = nativeCallResult

				Self.instanceCounter += 1
				self.instanceNumber = Self.instanceCounter
				super.init(conflictAvoidingVariableName: 0, instantiationContext: "Pong.swift::\(#function):\(#line)")
				
			
					}
		
					/// Creates a copy of the Pong
					internal func clone() -> Pong {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKPong>) in
				Pong_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Pong(cType: nativeCallResult, instantiationContext: "Pong.swift::\(#function):\(#line)")
						

						return returnValue
					}
		
					/// Checks if two Pongs contain equal inner contents.
					/// This ignores pointers and is_owned flags and looks at the values in fields.
					/// Two objects with NULL inner values will be considered "equal" here.
					public class func eq(a: Pong, b: Pong) -> Bool {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: a.cType!) { (aPointer: UnsafePointer<LDKPong>) in
				
						withUnsafePointer(to: b.cType!) { (bPointer: UnsafePointer<LDKPong>) in
				Pong_eq(aPointer, bPointer)
						}
				
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = nativeCallResult
						

						return returnValue
					}
		
					/// Serialize the Pong object into a byte array which can be read by Pong_read
					public func write() -> [UInt8] {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (objPointer: UnsafePointer<LDKPong>) in
				Pong_write(objPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = Vec_u8Z(cType: nativeCallResult, instantiationContext: "Pong.swift::\(#function):\(#line)", anchor: self).dangle(false).getValue()
						

						return returnValue
					}
		
					/// Read a Pong from a byte array, created by Pong_write
					public class func read(ser: [UInt8]) -> Result_PongDecodeErrorZ {
						// native call variable prep
						
						let serPrimitiveWrapper = u8slice(value: ser, instantiationContext: "Pong.swift::\(#function):\(#line)")
				

						// native method call
						let nativeCallResult = Pong_read(serPrimitiveWrapper.cType!)

						// cleanup
						
						// for elided types, we need this
						serPrimitiveWrapper.noOpRetain()
				

						
						// return value (do some wrapping)
						let returnValue = Result_PongDecodeErrorZ(cType: nativeCallResult, instantiationContext: "Pong.swift::\(#function):\(#line)")
						

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> Pong {
						self.dangling = shouldDangle
						return self
					}

					
					internal func danglingClone() -> Pong {
						let dangledClone = self.clone()
						dangledClone.dangling = true
						return dangledClone
					}
			
						internal func dynamicallyDangledClone() -> Pong {
							let dangledClone = self.clone()
							// if it's owned, i. e. controlled by Rust, it should dangle on our end
							dangledClone.dangling = dangledClone.cType!.is_owned
							return dangledClone
						}
					
					internal func setCFreeability(freeable: Bool) -> Pong {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> Pong {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing Pong \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing Pong \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		