
				
			#if SWIFT_PACKAGE
			import LDKHeaders
			#endif

			/// A read-only reference to a current ChannelMonitor.
			/// 
			/// Note that this holds a mutex in [`ChainMonitor`] and may block other events until it is
			/// released.
			public typealias LockedChannelMonitor = Bindings.LockedChannelMonitor

			extension Bindings {
		

				/// A read-only reference to a current ChannelMonitor.
				/// 
				/// Note that this holds a mutex in [`ChainMonitor`] and may block other events until it is
				/// released.
				public class LockedChannelMonitor: NativeTypeWrapper {

					let initialCFreeability: Bool

					
					private static var instanceCounter: UInt = 0
					internal let instanceNumber: UInt

					internal var cType: LDKLockedChannelMonitor?

					internal init(cType: LDKLockedChannelMonitor) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
					}

					internal init(cType: LDKLockedChannelMonitor, anchor: NativeTypeWrapper) {
						Self.instanceCounter += 1
						self.instanceNumber = Self.instanceCounter
						self.cType = cType
						self.initialCFreeability = self.cType!.is_owned
						super.init(conflictAvoidingVariableName: 0)
						self.dangling = true
						try! self.addAnchor(anchor: anchor)
					}
		

					
					/// Frees any resources used by the LockedChannelMonitor, if is_owned is set and inner is non-NULL.
					internal func free() {
						// native call variable prep
						

						// native method call
						let nativeCallResult = LockedChannelMonitor_free(self.cType!)

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
		

					internal func dangle(_ shouldDangle: Bool = true) -> LockedChannelMonitor {
						self.dangling = shouldDangle
						return self
					}

					
					internal func setCFreeability(freeable: Bool) -> LockedChannelMonitor {
						self.cType!.is_owned = freeable
						return self
					}

					internal func dynamicDangle() -> LockedChannelMonitor {
						self.dangling = self.cType!.is_owned
						return self
					}
			
					deinit {
						if Bindings.suspendFreedom {
							return
						}

						if !self.dangling {
							Bindings.print("Freeing LockedChannelMonitor \(self.instanceNumber).")
							
							self.free()
						} else {
							Bindings.print("Not freeing LockedChannelMonitor \(self.instanceNumber) due to dangle.")
						}
					}
			

				}

				
			}
		
		