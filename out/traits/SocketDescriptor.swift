
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			// necessary for abort() calls
			import Foundation

			/// Provides an object which can be used to send data to and which uniquely identifies a connection
			/// to a remote host. You will need to be able to generate multiple of these which meet Eq and
			/// implement Hash to meet the PeerManager API.
			/// 
			/// For efficiency, Clone should be relatively cheap for this type.
			/// 
			/// Two descriptors may compare equal (by [`cmp::Eq`] and [`hash::Hash`]) as long as the original
			/// has been disconnected, the [`PeerManager`] has been informed of the disconnection (either by it
			/// having triggered the disconnection or a call to [`PeerManager::socket_disconnected`]), and no
			/// further calls to the [`PeerManager`] related to the original socket occur. This allows you to
			/// use a file descriptor for your SocketDescriptor directly, however for simplicity you may wish
			/// to simply use another value which is guaranteed to be globally unique instead.
			public typealias SocketDescriptor = Bindings.SocketDescriptor

			extension Bindings {

				/// Provides an object which can be used to send data to and which uniquely identifies a connection
				/// to a remote host. You will need to be able to generate multiple of these which meet Eq and
				/// implement Hash to meet the PeerManager API.
				/// 
				/// For efficiency, Clone should be relatively cheap for this type.
				/// 
				/// Two descriptors may compare equal (by [`cmp::Eq`] and [`hash::Hash`]) as long as the original
				/// has been disconnected, the [`PeerManager`] has been informed of the disconnection (either by it
				/// having triggered the disconnection or a call to [`PeerManager::socket_disconnected`]), and no
				/// further calls to the [`PeerManager`] related to the original socket occur. This allows you to
				/// use a file descriptor for your SocketDescriptor directly, however for simplicity you may wish
				/// to simply use another value which is guaranteed to be globally unique instead.
				open class SocketDescriptor: NativeTraitWrapper {

					
					public static var enableDeinitLogging = true
					public static var suspendFreedom = false
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKSocketDescriptor?

					internal init(cType: LDKSocketDescriptor, instantiationContext: String) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
					}

					internal init(cType: LDKSocketDescriptor, instantiationContext: String, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						
						super.init(conflictAvoidingVariableName: 0, instantiationContext: instantiationContext)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					public init() {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						super.init(conflictAvoidingVariableName: 0, instantiationContext: "SocketDescriptor.swift::\(#function):\(#line)")

						let thisArg = Bindings.instanceToPointer(instance: self)

						

						
						func sendDataLambda(this_arg: UnsafeMutableRawPointer?, data: LDKu8slice, resume_read: Bool) -> UInt {
							let instance: SocketDescriptor = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "SocketDescriptor::sendDataLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.sendData(data: u8slice(cType: data, instantiationContext: "SocketDescriptor.swift::init()::\(#function):\(#line)").dangle().getValue(), resumeRead: resume_read)

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func disconnectSocketLambda(this_arg: UnsafeMutableRawPointer?) -> Void {
							let instance: SocketDescriptor = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "SocketDescriptor::disconnectSocketLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.disconnectSocket()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func eqLambda(this_arg: UnsafeRawPointer?, other_arg: UnsafePointer<LDKSocketDescriptor>) -> Bool {
							let instance: SocketDescriptor = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "SocketDescriptor::eqLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.eq(otherArg: NativelyImplementedSocketDescriptor(cType: other_arg.pointee, instantiationContext: "SocketDescriptor.swift::init()::\(#function):\(#line)"))

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func hashLambda(this_arg: UnsafeRawPointer?) -> UInt64 {
							let instance: SocketDescriptor = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "SocketDescriptor::hashLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.hash()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		
						func freeLambda(this_arg: UnsafeMutableRawPointer?) -> Void {
							let instance: SocketDescriptor = Bindings.pointerToInstance(pointer: this_arg!, sourceMarker: "SocketDescriptor::freeLambda")

							// Swift callback variable prep
											

							// Swift callback call
							let swiftCallbackResult = instance.free()

							// cleanup
							

							// return value (do some wrapping)
							let returnValue = swiftCallbackResult

							return returnValue
						}
		

						self.cType = LDKSocketDescriptor(							
							this_arg: thisArg,
							send_data: sendDataLambda,
							disconnect_socket: disconnectSocketLambda,
							eq: eqLambda,
							hash: hashLambda,
							cloned: nil,
							free: freeLambda
						)
					}

					
					/// Attempts to send some data from the given slice to the peer.
					/// 
					/// Returns the amount of data which was sent, possibly 0 if the socket has since disconnected.
					/// Note that in the disconnected case, [`PeerManager::socket_disconnected`] must still be
					/// called and further write attempts may occur until that time.
					/// 
					/// If the returned size is smaller than `data.len()`, a
					/// [`PeerManager::write_buffer_space_avail`] call must be made the next time more data can be
					/// written. Additionally, until a `send_data` event completes fully, no further
					/// [`PeerManager::read_event`] calls should be made for the same peer! Because this is to
					/// prevent denial-of-service issues, you should not read or buffer any data from the socket
					/// until then.
					/// 
					/// If a [`PeerManager::read_event`] call on this descriptor had previously returned true
					/// (indicating that read events should be paused to prevent DoS in the send buffer),
					/// `resume_read` may be set indicating that read events on this descriptor should resume. A
					/// `resume_read` of false carries no meaning, and should not cause any action.
					open func sendData(data: [UInt8], resumeRead: Bool) -> UInt {
						
						Bindings.print("Error: SocketDescriptor::sendData MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Disconnect the socket pointed to by this SocketDescriptor.
					/// 
					/// You do *not* need to call [`PeerManager::socket_disconnected`] with this socket after this
					/// call (doing so is a noop).
					open func disconnectSocket() -> Void {
						
						Bindings.print("Error: SocketDescriptor::disconnectSocket MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Checks if two objects are equal given this object's this_arg pointer and another object.
					open func eq(otherArg: SocketDescriptor) -> Bool {
						
						Bindings.print("Error: SocketDescriptor::eq MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Calculate a succinct non-cryptographic hash for an object given its this_arg pointer.
					/// This is used, for example, for inclusion of this object in a hash map.
					open func hash() -> UInt64 {
						
						Bindings.print("Error: SocketDescriptor::hash MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		
					/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
					internal func free() -> Void {
						
				// TODO: figure out something smarter
				return; // the semicolon is necessary because Swift is whitespace-agnostic
			
						Bindings.print("Error: SocketDescriptor::free MUST be overridden! Offending class: \(String(describing: self)). Aborting.", severity: .ERROR)
						abort()
					}
		

					
					/// Creates a copy of a SocketDescriptor
					internal func clone() -> SocketDescriptor {
						// native call variable prep
						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (origPointer: UnsafePointer<LDKSocketDescriptor>) in
				SocketDescriptor_clone(origPointer)
						}
				

						// cleanup
						

						
						// return value (do some wrapping)
						let returnValue = NativelyImplementedSocketDescriptor(cType: nativeCallResult, instantiationContext: "SocketDescriptor.swift::\(#function):\(#line)")
						

						return returnValue
					}
		

					

					internal func dangle(_ shouldDangle: Bool = true) -> SocketDescriptor {
        				self.dangling = shouldDangle
						return self
					}

					deinit {
						if Bindings.suspendFreedom || Self.suspendFreedom {
							return
						}

						if !self.dangling {
							if Self.enableDeinitLogging {
								Bindings.print("Freeing SocketDescriptor \(self.instanceNumber). (Origin: \(self.instantiationContext))")
							}
							self.free()
						} else if Self.enableDeinitLogging {
							Bindings.print("Not freeing SocketDescriptor \(self.instanceNumber) due to dangle. (Origin: \(self.instantiationContext))")
						}
					}
				}

				internal class NativelyImplementedSocketDescriptor: SocketDescriptor {
					
					/// Attempts to send some data from the given slice to the peer.
					/// 
					/// Returns the amount of data which was sent, possibly 0 if the socket has since disconnected.
					/// Note that in the disconnected case, [`PeerManager::socket_disconnected`] must still be
					/// called and further write attempts may occur until that time.
					/// 
					/// If the returned size is smaller than `data.len()`, a
					/// [`PeerManager::write_buffer_space_avail`] call must be made the next time more data can be
					/// written. Additionally, until a `send_data` event completes fully, no further
					/// [`PeerManager::read_event`] calls should be made for the same peer! Because this is to
					/// prevent denial-of-service issues, you should not read or buffer any data from the socket
					/// until then.
					/// 
					/// If a [`PeerManager::read_event`] call on this descriptor had previously returned true
					/// (indicating that read events should be paused to prevent DoS in the send buffer),
					/// `resume_read` may be set indicating that read events on this descriptor should resume. A
					/// `resume_read` of false carries no meaning, and should not cause any action.
					public override func sendData(data: [UInt8], resumeRead: Bool) -> UInt {
						// native call variable prep
						
						let dataPrimitiveWrapper = u8slice(value: data, instantiationContext: "SocketDescriptor.swift::\(#function):\(#line)")
				

						

						// native method call
						let nativeCallResult = self.cType!.send_data(self.cType!.this_arg, dataPrimitiveWrapper.cType!, resumeRead)

						// cleanup
						
						// for elided types, we need this
						dataPrimitiveWrapper.noOpRetain()
				

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Disconnect the socket pointed to by this SocketDescriptor.
					/// 
					/// You do *not* need to call [`PeerManager::socket_disconnected`] with this socket after this
					/// call (doing so is a noop).
					public override func disconnectSocket() {
						// native call variable prep
						

						

						// native method call
						let nativeCallResult = self.cType!.disconnect_socket(self.cType!.this_arg)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Checks if two objects are equal given this object's this_arg pointer and another object.
					public override func eq(otherArg: SocketDescriptor) -> Bool {
						// native call variable prep
						

						

						// native method call
						let nativeCallResult = 
						withUnsafePointer(to: self.cType!) { (otherArgPointer: UnsafePointer<LDKSocketDescriptor>) in
				self.cType!.eq(self.cType!.this_arg, otherArgPointer)
						}
				

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Calculate a succinct non-cryptographic hash for an object given its this_arg pointer.
					/// This is used, for example, for inclusion of this object in a hash map.
					public override func hash() -> UInt64 {
						// native call variable prep
						

						

						// native method call
						let nativeCallResult = self.cType!.hash(self.cType!.this_arg)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
					/// Frees any resources associated with this object given its this_arg pointer.
					/// Does not need to free the outer struct containing function pointers and may be NULL is no resources need to be freed.
					public override func free() {
						// native call variable prep
						

						
				// natively wrapped traits may not necessarily be properly initialized
				// for now just don't free these things
				// self.cType?.free(self.cType?.this_arg)
				return;
			

						// native method call
						let nativeCallResult = self.cType!.free(self.cType!.this_arg)

						// cleanup
						

						// return value (do some wrapping)
						let returnValue = nativeCallResult

						return returnValue
					}
		
				}

			}
		